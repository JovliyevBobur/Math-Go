-- 1. Add columns for free-input (no-choice) questions
ALTER TABLE public.questions ADD COLUMN IF NOT EXISTS correct_answer text;
ALTER TABLE public.user_answers ADD COLUMN IF NOT EXISTS text_answer text;

-- 2. get_test_questions: include correct_answer presence via empty choices (already returns choices). Add is_input flag.
CREATE OR REPLACE FUNCTION public.get_test_questions(p_test_id uuid)
 RETURNS jsonb
 LANGUAGE sql
 STABLE SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
  SELECT COALESCE(jsonb_agg(qrow ORDER BY qrow->>'order_index'), '[]'::jsonb)
  FROM (
    SELECT jsonb_build_object(
      'id', q.id,
      'question_text', q.question_text,
      'topic', q.topic,
      'order_index', q.order_index,
      'is_input', NOT EXISTS (SELECT 1 FROM public.choices c WHERE c.question_id = q.id),
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
$function$;

-- 3. submit_test_attempt: score both choice and free-input questions
CREATE OR REPLACE FUNCTION public.submit_test_attempt(p_attempt_id uuid, p_answers jsonb, p_time_spent integer DEFAULT 0)
 RETURNS jsonb
 LANGUAGE plpgsql
 SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
DECLARE
  v_user uuid := auth.uid();
  v_attempt public.test_attempts%ROWTYPE;
  v_score integer := 0;
  v_total integer := 0;
  v_pct numeric := 0;
  v_grade text;
BEGIN
  IF v_user IS NULL THEN RAISE EXCEPTION 'Not authenticated'; END IF;

  SELECT * INTO v_attempt FROM public.test_attempts WHERE id = p_attempt_id AND user_id = v_user;
  IF NOT FOUND THEN RAISE EXCEPTION 'Attempt not found'; END IF;
  IF v_attempt.completed_at IS NOT NULL THEN RAISE EXCEPTION 'Attempt already completed'; END IF;

  INSERT INTO public.user_answers (attempt_id, question_id, selected_choice_id, text_answer, is_correct)
  SELECT
    p_attempt_id,
    q.id,
    CASE WHEN hc.has_choices THEN (raw.raw)::uuid ELSE NULL END,
    CASE WHEN hc.has_choices THEN NULL ELSE raw.raw END,
    CASE
      WHEN hc.has_choices THEN
        CASE WHEN raw.raw IS NULL THEN NULL
          ELSE EXISTS (SELECT 1 FROM public.choices c WHERE c.id = (raw.raw)::uuid AND c.is_correct = true) END
      ELSE
        CASE WHEN raw.raw IS NULL THEN NULL
          ELSE lower(regexp_replace(raw.raw, '\s+', '', 'g')) = lower(regexp_replace(coalesce(q.correct_answer, ''), '\s+', '', 'g')) END
    END
  FROM public.questions q
  CROSS JOIN LATERAL (SELECT EXISTS(SELECT 1 FROM public.choices c WHERE c.question_id = q.id) AS has_choices) hc
  LEFT JOIN LATERAL (SELECT NULLIF(p_answers ->> q.id::text, '') AS raw) raw ON true
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
  SET completed_at = now(), score = v_score, total_questions = v_total,
      percentage = v_pct, grade = v_grade,
      time_spent_seconds = GREATEST(COALESCE(p_time_spent, 0), 0)
  WHERE id = p_attempt_id;

  RETURN jsonb_build_object('attempt_id', p_attempt_id, 'score', v_score, 'total', v_total, 'percentage', v_pct, 'grade', v_grade);
END;
$function$;

-- 4. get_attempt_review: include correct_answer and text_answer
CREATE OR REPLACE FUNCTION public.get_attempt_review(p_attempt_id uuid)
 RETURNS jsonb
 LANGUAGE plpgsql
 STABLE SECURITY DEFINER
 SET search_path TO 'public'
AS $function$
DECLARE
  v_user uuid := auth.uid();
  v_attempt public.test_attempts%ROWTYPE;
  v_result jsonb;
BEGIN
  IF v_user IS NULL THEN RAISE EXCEPTION 'Not authenticated'; END IF;

  SELECT * INTO v_attempt FROM public.test_attempts WHERE id = p_attempt_id;
  IF NOT FOUND THEN RAISE EXCEPTION 'Attempt not found'; END IF;
  IF v_attempt.user_id <> v_user AND NOT public.is_admin_or_super(v_user) THEN
    RAISE EXCEPTION 'Not authorized';
  END IF;

  SELECT jsonb_build_object(
    'attempt', jsonb_build_object(
      'id', v_attempt.id, 'score', v_attempt.score, 'total_questions', v_attempt.total_questions,
      'time_spent_seconds', v_attempt.time_spent_seconds, 'percentage', v_attempt.percentage, 'grade', v_attempt.grade
    ),
    'test', (SELECT jsonb_build_object('id', t.id, 'title', t.title, 'subject', t.subject) FROM public.tests t WHERE t.id = v_attempt.test_id),
    'questions', (
      SELECT COALESCE(jsonb_agg(
        jsonb_build_object(
          'id', q.id, 'question_text', q.question_text, 'topic', q.topic,
          'solution_text', q.solution_text, 'intermediate_steps', q.intermediate_steps,
          'correct_answer', q.correct_answer,
          'choices', (
            SELECT COALESCE(jsonb_agg(jsonb_build_object('id', c.id, 'choice_text', c.choice_text, 'is_correct', c.is_correct) ORDER BY c.order_index), '[]'::jsonb)
            FROM public.choices c WHERE c.question_id = q.id
          )
        ) ORDER BY q.order_index
      ), '[]'::jsonb)
      FROM public.questions q WHERE q.test_id = v_attempt.test_id
    ),
    'answers', (
      SELECT COALESCE(jsonb_agg(jsonb_build_object('question_id', ua.question_id, 'selected_choice_id', ua.selected_choice_id, 'text_answer', ua.text_answer, 'is_correct', ua.is_correct)), '[]'::jsonb)
      FROM public.user_answers ua WHERE ua.attempt_id = p_attempt_id
    )
  ) INTO v_result;

  RETURN v_result;
END;
$function$;

-- 5. Seed 10 published math tests, 10 questions each (8 multiple-choice + 2 free-input)
DO $seed$
DECLARE
  t int; q int;
  v_test uuid; v_q uuid;
  A int; B int; r int; C int; rhs int;
  qtext text; sol text; steps jsonb; bsign text; bstr text;
BEGIN
  FOR t IN 1..10 LOOP
    INSERT INTO public.tests (title, description, subject, duration_minutes, is_published)
    VALUES (
      'Algebra mashqlar to''plami ' || t,
      '10 ta chiziqli tenglama: 1-8 variantli, 9-10 javob kiritiladigan. Har bir savol bosqichma-bosqich yechim bilan.',
      'math', 30, true
    ) RETURNING id INTO v_test;

    FOR q IN 1..10 LOOP
      A := 2 + ((t + q) % 4);            -- 2..5
      r := ((t * 3 + q * 2) % 13) - 6;   -- -6..6
      B := ((t * 2 + q) % 11) - 5;       -- -5..5
      rhs := A * r + B;
      bsign := CASE WHEN B >= 0 THEN '+ ' ELSE '- ' END;
      bstr := bsign || abs(B)::text;
      C := rhs - B;

      qtext := 'Tenglamani yeching: \(' || A || 'x ' || bstr || ' = ' || rhs || '\)';
      sol := 'Berilgan: \(' || A || 'x ' || bstr || ' = ' || rhs || '\). '
          || 'Ozod hadni o''ng tomonga o''tkazamiz: \(' || A || 'x = ' || rhs || ' ' || (CASE WHEN B >= 0 THEN '- ' || abs(B) ELSE '+ ' || abs(B) END) || ' = ' || C || '\). '
          || 'Ikkala tomonni \(' || A || '\) ga bo''lamiz: \(x = \dfrac{' || C || '}{' || A || '} = ' || r || '\).';
      steps := jsonb_build_array(
        'Tenglama: \(' || A || 'x ' || bstr || ' = ' || rhs || '\)',
        'Ozod hadni o''tkazamiz: \(' || A || 'x = ' || C || '\)  (oraliq qiymat: ' || C || ')',
        'Bo''lamiz: \(x = ' || C || ' / ' || A || ' = ' || r || '\)'
      );

      INSERT INTO public.questions (test_id, question_text, topic, order_index, solution_text, intermediate_steps, correct_answer)
      VALUES (
        v_test, qtext, 'Chiziqli tenglamalar', q, sol, steps,
        CASE WHEN q IN (9, 10) THEN r::text ELSE NULL END
      ) RETURNING id INTO v_q;

      IF q < 9 THEN
        INSERT INTO public.choices (question_id, choice_text, is_correct, order_index) VALUES
          (v_q, r::text, true, 0),
          (v_q, (r + 1)::text, false, 1),
          (v_q, (r - 2)::text, false, 2),
          (v_q, (r + 3)::text, false, 3);
      END IF;
    END LOOP;
  END LOOP;
END $seed$;