
GRANT SELECT, INSERT, UPDATE, DELETE ON public.profiles TO authenticated;
GRANT ALL ON public.profiles TO service_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.tests TO authenticated;
GRANT SELECT ON public.tests TO anon;
GRANT ALL ON public.tests TO service_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.questions TO authenticated;
GRANT SELECT ON public.questions TO anon;
GRANT ALL ON public.questions TO service_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.choices TO authenticated;
GRANT SELECT ON public.choices TO anon;
GRANT ALL ON public.choices TO service_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.books TO authenticated;
GRANT SELECT ON public.books TO anon;
GRANT ALL ON public.books TO service_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.test_attempts TO authenticated;
GRANT ALL ON public.test_attempts TO service_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.user_answers TO authenticated;
GRANT ALL ON public.user_answers TO service_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.user_roles TO authenticated;
GRANT ALL ON public.user_roles TO service_role;

GRANT SELECT, INSERT, UPDATE, DELETE ON public.pdf_import_jobs TO authenticated;
GRANT ALL ON public.pdf_import_jobs TO service_role;

CREATE OR REPLACE FUNCTION public.ensure_profile(_full_name text DEFAULT NULL)
RETURNS void
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  uid uuid := auth.uid();
BEGIN
  IF uid IS NULL THEN
    RETURN;
  END IF;
  INSERT INTO public.profiles (user_id, full_name)
  VALUES (uid, COALESCE(NULLIF(_full_name, ''), 'Foydalanuvchi'))
  ON CONFLICT (user_id) DO NOTHING;

  INSERT INTO public.user_roles (user_id, role)
  VALUES (uid, 'user')
  ON CONFLICT (user_id, role) DO NOTHING;
END;
$$;

CREATE OR REPLACE FUNCTION public.claim_super_admin()
RETURNS boolean
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  uid uuid := auth.uid();
  uemail text;
BEGIN
  IF uid IS NULL THEN
    RETURN false;
  END IF;
  SELECT email INTO uemail FROM auth.users WHERE id = uid;
  IF lower(uemail) = 'admin2o1o@jbn.jbn' THEN
    INSERT INTO public.user_roles (user_id, role)
    VALUES (uid, 'super_admin')
    ON CONFLICT (user_id, role) DO NOTHING;
    RETURN true;
  END IF;
  RETURN false;
END;
$$;

REVOKE ALL ON FUNCTION public.ensure_profile(text) FROM PUBLIC;
REVOKE ALL ON FUNCTION public.claim_super_admin() FROM PUBLIC;
GRANT EXECUTE ON FUNCTION public.ensure_profile(text) TO authenticated;
GRANT EXECUTE ON FUNCTION public.claim_super_admin() TO authenticated;

CREATE TABLE public.chat_messages (
  id uuid NOT NULL DEFAULT gen_random_uuid() PRIMARY KEY,
  user_id uuid NOT NULL REFERENCES auth.users(id) ON DELETE CASCADE,
  role text NOT NULL CHECK (role IN ('user','assistant')),
  content text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

GRANT SELECT, INSERT, UPDATE, DELETE ON public.chat_messages TO authenticated;
GRANT ALL ON public.chat_messages TO service_role;

ALTER TABLE public.chat_messages ENABLE ROW LEVEL SECURITY;

CREATE POLICY "Users can view their own chat messages"
  ON public.chat_messages FOR SELECT TO authenticated
  USING (auth.uid() = user_id);

CREATE POLICY "Users can insert their own chat messages"
  ON public.chat_messages FOR INSERT TO authenticated
  WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can delete their own chat messages"
  ON public.chat_messages FOR DELETE TO authenticated
  USING (auth.uid() = user_id);
