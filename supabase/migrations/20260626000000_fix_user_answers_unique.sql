-- Fix: Add unique constraint on (attempt_id, question_id) in user_answers
-- This is required for the ON CONFLICT (attempt_id, question_id) DO NOTHING clause
-- in submit_test_attempt to work correctly.

ALTER TABLE public.user_answers
  ADD CONSTRAINT user_answers_attempt_question_unique
  UNIQUE (attempt_id, question_id);
