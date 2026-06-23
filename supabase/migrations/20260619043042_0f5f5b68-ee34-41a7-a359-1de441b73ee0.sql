CREATE OR REPLACE FUNCTION public.get_test_id_by_code(p_code text)
RETURNS uuid
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT t.id FROM public.tests t
  WHERE t.is_published = true
    AND t.access_code = p_code
  LIMIT 1;
$$;

GRANT EXECUTE ON FUNCTION public.get_test_id_by_code(text) TO anon, authenticated;