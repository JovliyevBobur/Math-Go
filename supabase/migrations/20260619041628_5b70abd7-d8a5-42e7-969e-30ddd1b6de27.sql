GRANT EXECUTE ON FUNCTION public.has_role(uuid, app_role) TO authenticated, anon;
GRANT EXECUTE ON FUNCTION public.is_admin_or_super(uuid) TO authenticated, anon;
GRANT EXECUTE ON FUNCTION public.get_user_role(uuid) TO authenticated, anon;
GRANT EXECUTE ON FUNCTION public.ensure_profile(text) TO authenticated;
GRANT EXECUTE ON FUNCTION public.claim_super_admin() TO authenticated;