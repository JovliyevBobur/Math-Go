CREATE OR REPLACE FUNCTION public.get_leaderboard(p_subject subject DEFAULT NULL::subject, p_limit integer DEFAULT 10)
 RETURNS TABLE(user_id uuid, full_name text, avatar_url text, total_score bigint, tests_completed bigint, avg_score numeric)
 LANGUAGE plpgsql
 STABLE
 SET search_path TO 'public'
AS $function$
BEGIN
  IF p_limit IS NULL OR p_limit < 1 THEN
    p_limit := 10;
  END IF;
  IF p_limit > 100 THEN
    p_limit := 100;
  END IF;

  RETURN QUERY
  SELECT
    p.user_id,
    p.full_name,
    p.avatar_url,
    COALESCE(SUM(ta.score), 0)::bigint AS total_score,
    COUNT(ta.id)::bigint AS tests_completed,
    ROUND(COALESCE(AVG(ta.score::numeric / NULLIF(ta.total_questions, 0) * 100), 0), 1) AS avg_score
  FROM public.profiles p
  LEFT JOIN public.test_attempts ta ON ta.user_id = p.user_id AND ta.completed_at IS NOT NULL
  LEFT JOIN public.tests t ON t.id = ta.test_id
  WHERE (p_subject IS NULL OR t.subject = p_subject)
    AND NOT public.has_role(p.user_id, 'super_admin')
    AND NOT public.has_role(p.user_id, 'admin')
  GROUP BY p.user_id, p.full_name, p.avatar_url
  ORDER BY total_score DESC, avg_score DESC
  LIMIT p_limit;
END;
$function$;