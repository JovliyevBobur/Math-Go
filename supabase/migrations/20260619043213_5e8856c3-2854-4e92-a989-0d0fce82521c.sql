CREATE OR REPLACE FUNCTION public.get_tests_admin()
RETURNS TABLE (
  id uuid,
  title text,
  description text,
  subject public.subject,
  duration_minutes integer,
  is_published boolean,
  access_code text
)
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT t.id, t.title, t.description, t.subject, t.duration_minutes, t.is_published, t.access_code
  FROM public.tests t
  WHERE public.is_admin_or_super(auth.uid())
  ORDER BY t.created_at DESC;
$$;

GRANT EXECUTE ON FUNCTION public.get_tests_admin() TO authenticated;