CREATE OR REPLACE FUNCTION public.get_published_question_counts()
 RETURNS TABLE(test_id uuid, question_count bigint)
 LANGUAGE sql
 STABLE SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
  SELECT q.test_id, COUNT(*)::bigint
  FROM public.questions q
  JOIN public.tests t ON t.id = q.test_id
  WHERE t.is_published = true
  GROUP BY q.test_id;
$function$;

GRANT EXECUTE ON FUNCTION public.get_published_question_counts() TO anon, authenticated;