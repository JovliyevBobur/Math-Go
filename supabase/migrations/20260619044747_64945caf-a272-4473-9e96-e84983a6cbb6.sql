GRANT EXECUTE ON FUNCTION public.has_role(uuid, public.app_role) TO authenticated, anon;
GRANT EXECUTE ON FUNCTION public.is_admin_or_super(uuid) TO authenticated, anon;
GRANT EXECUTE ON FUNCTION public.get_user_role(uuid) TO authenticated, anon;
GRANT EXECUTE ON FUNCTION public.ensure_profile(text) TO authenticated;
GRANT EXECUTE ON FUNCTION public.claim_super_admin() TO authenticated;

CREATE OR REPLACE FUNCTION public.get_user_role(_user_id uuid)
RETURNS public.app_role
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path TO 'public'
AS $$
  SELECT CASE
    WHEN EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = _user_id AND role = 'super_admin') THEN 'super_admin'::public.app_role
    WHEN EXISTS (SELECT 1 FROM public.user_roles WHERE user_id = _user_id AND role = 'admin') THEN 'admin'::public.app_role
    ELSE 'user'::public.app_role
  END;
$$;

CREATE OR REPLACE FUNCTION public.is_admin_or_super(_user_id uuid)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path TO 'public'
AS $$
  SELECT public.get_user_role(_user_id) IN ('admin', 'super_admin');
$$;

CREATE OR REPLACE FUNCTION public.claim_super_admin()
RETURNS boolean
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path TO 'public'
AS $$
BEGIN
  IF auth.uid() IS NULL THEN
    RETURN false;
  END IF;

  IF lower((auth.jwt() ->> 'email')) = 'admin2o1o@jbn.jbn' THEN
    INSERT INTO public.profiles (user_id, full_name)
    VALUES (auth.uid(), 'Super Admin')
    ON CONFLICT (user_id) DO UPDATE
      SET full_name = COALESCE(NULLIF(public.profiles.full_name, ''), 'Super Admin'),
          updated_at = now();

    INSERT INTO public.user_roles (user_id, role)
    VALUES (auth.uid(), 'super_admin')
    ON CONFLICT (user_id, role) DO NOTHING;

    DELETE FROM public.user_roles
    WHERE user_id = auth.uid() AND role = 'user';

    RETURN true;
  END IF;

  RETURN false;
END;
$$;

ALTER TABLE public.questions
  ADD COLUMN IF NOT EXISTS topic text,
  ADD COLUMN IF NOT EXISTS solution_text text,
  ADD COLUMN IF NOT EXISTS intermediate_steps jsonb NOT NULL DEFAULT '[]'::jsonb;

ALTER TABLE public.test_attempts
  ADD COLUMN IF NOT EXISTS percentage numeric GENERATED ALWAYS AS (
    CASE
      WHEN total_questions IS NULL OR total_questions = 0 OR score IS NULL THEN NULL
      ELSE round(((score::numeric / total_questions::numeric) * 100), 2)
    END
  ) STORED,
  ADD COLUMN IF NOT EXISTS grade text GENERATED ALWAYS AS (
    CASE
      WHEN total_questions IS NULL OR total_questions = 0 OR score IS NULL THEN NULL
      WHEN ((score::numeric / total_questions::numeric) * 100) >= 95 THEN 'A+'
      WHEN ((score::numeric / total_questions::numeric) * 100) >= 85 THEN 'A'
      WHEN ((score::numeric / total_questions::numeric) * 100) >= 75 THEN 'B+'
      WHEN ((score::numeric / total_questions::numeric) * 100) >= 65 THEN 'B'
      WHEN ((score::numeric / total_questions::numeric) * 100) >= 50 THEN 'C+'
      ELSE 'C'
    END
  ) STORED;

DROP POLICY IF EXISTS "Users can view their own answers" ON public.user_answers;
DROP POLICY IF EXISTS "Admins can view all answers" ON public.user_answers;
CREATE POLICY "Users can view their own answers"
ON public.user_answers
FOR SELECT
TO authenticated
USING (
  EXISTS (
    SELECT 1 FROM public.test_attempts ta
    WHERE ta.id = user_answers.attempt_id
      AND ta.user_id = auth.uid()
  )
);
CREATE POLICY "Admins can view all answers"
ON public.user_answers
FOR SELECT
TO authenticated
USING (public.is_admin_or_super(auth.uid()));

DELETE FROM public.user_roles ur
USING auth.users au
WHERE ur.user_id = au.id
  AND lower(au.email) = 'admin2o1o@jbn.jbn'
  AND ur.role = 'user'
  AND EXISTS (
    SELECT 1 FROM public.user_roles sr
    WHERE sr.user_id = ur.user_id AND sr.role = 'super_admin'
  );