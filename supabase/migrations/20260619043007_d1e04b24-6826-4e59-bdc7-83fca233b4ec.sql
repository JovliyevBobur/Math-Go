-- 1. Restrict profile visibility to the owner and admins
DROP POLICY IF EXISTS "Authenticated users can view profiles" ON public.profiles;

CREATE POLICY "Users can view their own profile"
ON public.profiles
FOR SELECT
TO authenticated
USING (auth.uid() = user_id);

CREATE POLICY "Admins can view all profiles"
ON public.profiles
FOR SELECT
TO authenticated
USING (public.is_admin_or_super(auth.uid()));

-- 2. Public platform stats via a safe security-definer function
CREATE OR REPLACE FUNCTION public.get_platform_stats()
RETURNS TABLE (users bigint, questions bigint, tests bigint, attempts bigint)
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT
    (SELECT count(*) FROM public.profiles),
    (SELECT count(*) FROM public.questions),
    (SELECT count(*) FROM public.tests WHERE is_published = true),
    (SELECT count(*) FROM public.test_attempts WHERE completed_at IS NOT NULL);
$$;

GRANT EXECUTE ON FUNCTION public.get_platform_stats() TO anon, authenticated;

-- 3. Protect test access codes: hide the column, expose only a lock flag
ALTER TABLE public.tests
  ADD COLUMN IF NOT EXISTS is_locked boolean
  GENERATED ALWAYS AS (access_code IS NOT NULL AND access_code <> '') STORED;

REVOKE SELECT (access_code) ON public.tests FROM anon, authenticated;

CREATE OR REPLACE FUNCTION public.verify_test_access(p_test_id uuid, p_code text)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.tests t
    WHERE t.id = p_test_id
      AND t.is_published = true
      AND t.access_code = p_code
  );
$$;

GRANT EXECUTE ON FUNCTION public.verify_test_access(uuid, text) TO anon, authenticated;

-- 4. Enforce uniqueness on user roles to prevent duplicate/escalated rows
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint
    WHERE conname = 'user_roles_user_id_role_key'
  ) THEN
    ALTER TABLE public.user_roles
      ADD CONSTRAINT user_roles_user_id_role_key UNIQUE (user_id, role);
  END IF;
END $$;

-- 5. Lock down internal SECURITY DEFINER helpers (used only inside RLS)
REVOKE EXECUTE ON FUNCTION public.has_role(uuid, app_role) FROM anon, authenticated, public;
REVOKE EXECUTE ON FUNCTION public.is_admin_or_super(uuid) FROM anon, authenticated, public;

-- 6. Owner-scoped RLS policies on the private avatars storage bucket
CREATE POLICY "Users can view their own avatars"
ON storage.objects
FOR SELECT
TO authenticated
USING (bucket_id = 'avatars' AND auth.uid()::text = (storage.foldername(name))[1]);

CREATE POLICY "Users can upload their own avatars"
ON storage.objects
FOR INSERT
TO authenticated
WITH CHECK (bucket_id = 'avatars' AND auth.uid()::text = (storage.foldername(name))[1]);

CREATE POLICY "Users can update their own avatars"
ON storage.objects
FOR UPDATE
TO authenticated
USING (bucket_id = 'avatars' AND auth.uid()::text = (storage.foldername(name))[1])
WITH CHECK (bucket_id = 'avatars' AND auth.uid()::text = (storage.foldername(name))[1]);

CREATE POLICY "Users can delete their own avatars"
ON storage.objects
FOR DELETE
TO authenticated
USING (bucket_id = 'avatars' AND auth.uid()::text = (storage.foldername(name))[1]);