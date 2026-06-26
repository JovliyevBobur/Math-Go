-- ============================================================
-- MATH-GO: FIX submit_test_attempt function
-- Run this SQL in Supabase Dashboard → SQL Editor
-- Project: ekdkrysarlsbrnsgimsx
-- ============================================================

-- Step 1: Recreate the function WITHOUT touching generated columns
CREATE OR REPLACE FUNCTION public.submit_test_attempt(
  p_attempt_id uuid,
  p_answers jsonb,
  p_time_spent integer DEFAULT 0
)
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
  IF v_user IS NULL THEN
    RAISE EXCEPTION 'Not authenticated';
  END IF;

  SELECT * INTO v_attempt
  FROM public.test_attempts
  WHERE id = p_attempt_id AND user_id = v_user;

  IF NOT FOUND THEN RAISE EXCEPTION 'Attempt not found'; END IF;
  IF v_attempt.completed_at IS NOT NULL THEN RAISE EXCEPTION 'Attempt already completed'; END IF;

  -- Insert answers
  INSERT INTO public.user_answers (attempt_id, question_id, selected_choice_id, text_answer, is_correct)
  SELECT
    p_attempt_id,
    q.id,
    CASE WHEN hc.has_choices THEN (raw.raw)::uuid ELSE NULL END,
    CASE WHEN hc.has_choices THEN NULL ELSE raw.raw END,
    CASE
      WHEN hc.has_choices THEN
        CASE WHEN raw.raw IS NULL THEN NULL
          ELSE EXISTS (SELECT 1 FROM public.choices c WHERE c.id = (raw.raw)::uuid AND c.is_correct = true)
        END
      ELSE
        CASE WHEN raw.raw IS NULL THEN NULL
          ELSE lower(regexp_replace(raw.raw, '\s+', '', 'g')) =
               lower(regexp_replace(coalesce(q.correct_answer, ''), '\s+', '', 'g'))
        END
    END
  FROM public.questions q
  CROSS JOIN LATERAL (
    SELECT EXISTS(SELECT 1 FROM public.choices c WHERE c.question_id = q.id) AS has_choices
  ) hc
  LEFT JOIN LATERAL (
    SELECT NULLIF(p_answers ->> q.id::text, '') AS raw
  ) raw ON true
  WHERE q.test_id = v_attempt.test_id
  ON CONFLICT (attempt_id, question_id) DO NOTHING;

  -- Calculate score
  SELECT
    COUNT(*) FILTER (WHERE ua.is_correct = true),
    COALESCE(v_attempt.total_questions, COUNT(*))
  INTO v_score, v_total
  FROM public.user_answers ua
  WHERE ua.attempt_id = p_attempt_id;

  IF v_total IS NULL OR v_total = 0 THEN
    v_total := GREATEST(
      (SELECT COUNT(*) FROM public.questions q WHERE q.test_id = v_attempt.test_id),
      1
    );
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

  -- Update ONLY non-generated columns (do NOT touch percentage or grade - they are GENERATED ALWAYS)
  UPDATE public.test_attempts
  SET
    completed_at       = now(),
    score              = v_score,
    total_questions    = v_total,
    time_spent_seconds = GREATEST(COALESCE(p_time_spent, 0), 0)
  WHERE id = p_attempt_id;

  RETURN jsonb_build_object(
    'attempt_id', p_attempt_id,
    'score',      v_score,
    'total',      v_total,
    'percentage', v_pct,
    'grade',      v_grade
  );
END;
$function$;

-- Step 2: Add unique constraint if it doesn't exist yet
DO $$
BEGIN
  IF NOT EXISTS (
    SELECT 1 FROM pg_constraint 
    WHERE conname = 'user_answers_attempt_question_unique'
    AND conrelid = 'public.user_answers'::regclass
  ) THEN
    ALTER TABLE public.user_answers
      ADD CONSTRAINT user_answers_attempt_question_unique
      UNIQUE (attempt_id, question_id);
  END IF;
END $$;

-- Verify: Check current function body does NOT contain "percentage ="
SELECT 
  CASE 
    WHEN prosrc LIKE '%percentage =%' OR prosrc LIKE '%percentage=%' 
    THEN 'ERROR: Old function still exists with percentage update!'
    ELSE 'OK: Function is correct - does not update percentage column'
  END as status
FROM pg_proc 
WHERE proname = 'submit_test_attempt';
