-- 1. Remove public exposure of is_correct via the choices table
DROP POLICY IF EXISTS "Anyone can view choices of published tests" ON public.choices;

-- 2. Function to load questions + choices WITHOUT is_correct for taking a test
CREATE OR REPLACE FUNCTION public.get_test_questions(p_test_id uuid)
RETURNS jsonb
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT COALESCE(jsonb_agg(qrow ORDER BY qrow->>'order_index'), '[]'::jsonb)
  FROM (
    SELECT jsonb_build_object(
      'id', q.id,
      'question_text', q.question_text,
      'topic', q.topic,
      'order_index', q.order_index,
      'choices', (
        SELECT COALESCE(jsonb_agg(
          jsonb_build_object(
            'id', c.id,
            'choice_text', c.choice_text,
            'order_index', c.order_index
          ) ORDER BY c.order_index
        ), '[]'::jsonb)
        FROM public.choices c
        WHERE c.question_id = q.id
      )
    ) AS qrow
    FROM public.questions q
    JOIN public.tests t ON t.id = q.test_id
    WHERE q.test_id = p_test_id
      AND t.is_published = true
  ) sub;
$$;

-- 3. Function to score an attempt server-side
CREATE OR REPLACE FUNCTION public.submit_test_attempt(
  p_attempt_id uuid,
  p_answers jsonb,
  p_time_spent integer DEFAULT 0
)
RETURNS jsonb
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_user uuid := auth.uid();
  v_attempt public.test_attempts%ROWTYPE;
  v_score integer := 0;
  v_total integer := 0;
  v_pct numeric := 0;
  v_grade text;
BEGIN
  IF v_user IS NULL THEN
    RAISE EXCEPTION 'Not authenticated';
  END IF;

  SELECT * INTO v_attempt
  FROM public.test_attempts
  WHERE id = p_attempt_id AND user_id = v_user;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Attempt not found';
  END IF;

  IF v_attempt.completed_at IS NOT NULL THEN
    RAISE EXCEPTION 'Attempt already completed';
  END IF;

  -- Insert user answers, scoring against the server-held correct flag
  INSERT INTO public.user_answers (attempt_id, question_id, selected_choice_id, is_correct)
  SELECT
    p_attempt_id,
    q.id,
    sel.choice_id,
    CASE
      WHEN sel.choice_id IS NULL THEN NULL
      ELSE EXISTS (
        SELECT 1 FROM public.choices c
        WHERE c.id = sel.choice_id AND c.is_correct = true
      )
    END
  FROM public.questions q
  LEFT JOIN LATERAL (
    SELECT NULLIF(p_answers ->> q.id::text, '')::uuid AS choice_id
  ) sel ON true
  WHERE q.test_id = v_attempt.test_id;

  SELECT
    COUNT(*) FILTER (WHERE ua.is_correct = true),
    COALESCE(v_attempt.total_questions, COUNT(*))
  INTO v_score, v_total
  FROM public.user_answers ua
  WHERE ua.attempt_id = p_attempt_id;

  IF v_total IS NULL OR v_total = 0 THEN
    v_total := GREATEST((SELECT COUNT(*) FROM public.questions q WHERE q.test_id = v_attempt.test_id), 1);
  END IF;

  v_pct := ROUND((v_score::numeric / NULLIF(v_total, 0)) * 100, 1);

  v_grade := CASE
    WHEN v_pct >= 95 THEN 'A+'
    WHEN v_pct >= 85 THEN 'A'
    WHEN v_pct >= 75 THEN 'B+'
    WHEN v_pct >= 65 THEN 'B'
    WHEN v_pct >= 50 THEN 'C+'
    ELSE 'C'
  END;

  UPDATE public.test_attempts
  SET completed_at = now(),
      score = v_score,
      total_questions = v_total,
      percentage = v_pct,
      grade = v_grade,
      time_spent_seconds = GREATEST(COALESCE(p_time_spent, 0), 0)
  WHERE id = p_attempt_id;

  RETURN jsonb_build_object(
    'attempt_id', p_attempt_id,
    'score', v_score,
    'total', v_total,
    'percentage', v_pct,
    'grade', v_grade
  );
END;
$$;

-- 4. Function returning full review (incl. correct answers) only to attempt owner / admins
CREATE OR REPLACE FUNCTION public.get_attempt_review(p_attempt_id uuid)
RETURNS jsonb
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
DECLARE
  v_user uuid := auth.uid();
  v_attempt public.test_attempts%ROWTYPE;
  v_result jsonb;
BEGIN
  IF v_user IS NULL THEN
    RAISE EXCEPTION 'Not authenticated';
  END IF;

  SELECT * INTO v_attempt
  FROM public.test_attempts
  WHERE id = p_attempt_id;

  IF NOT FOUND THEN
    RAISE EXCEPTION 'Attempt not found';
  END IF;

  IF v_attempt.user_id <> v_user AND NOT public.is_admin_or_super(v_user) THEN
    RAISE EXCEPTION 'Not authorized';
  END IF;

  SELECT jsonb_build_object(
    'attempt', jsonb_build_object(
      'id', v_attempt.id,
      'score', v_attempt.score,
      'total_questions', v_attempt.total_questions,
      'time_spent_seconds', v_attempt.time_spent_seconds,
      'percentage', v_attempt.percentage,
      'grade', v_attempt.grade
    ),
    'test', (
      SELECT jsonb_build_object('id', t.id, 'title', t.title, 'subject', t.subject)
      FROM public.tests t WHERE t.id = v_attempt.test_id
    ),
    'questions', (
      SELECT COALESCE(jsonb_agg(
        jsonb_build_object(
          'id', q.id,
          'question_text', q.question_text,
          'topic', q.topic,
          'solution_text', q.solution_text,
          'intermediate_steps', q.intermediate_steps,
          'choices', (
            SELECT COALESCE(jsonb_agg(
              jsonb_build_object(
                'id', c.id,
                'choice_text', c.choice_text,
                'is_correct', c.is_correct
              ) ORDER BY c.order_index
            ), '[]'::jsonb)
            FROM public.choices c WHERE c.question_id = q.id
          )
        ) ORDER BY q.order_index
      ), '[]'::jsonb)
      FROM public.questions q WHERE q.test_id = v_attempt.test_id
    ),
    'answers', (
      SELECT COALESCE(jsonb_agg(
        jsonb_build_object(
          'question_id', ua.question_id,
          'selected_choice_id', ua.selected_choice_id,
          'is_correct', ua.is_correct
        )
      ), '[]'::jsonb)
      FROM public.user_answers ua WHERE ua.attempt_id = p_attempt_id
    )
  ) INTO v_result;

  RETURN v_result;
END;
$$;

-- 5. Grants
GRANT EXECUTE ON FUNCTION public.get_test_questions(uuid) TO authenticated;
GRANT EXECUTE ON FUNCTION public.submit_test_attempt(uuid, jsonb, integer) TO authenticated;
GRANT EXECUTE ON FUNCTION public.get_attempt_review(uuid) TO authenticated;