-- Clear existing data
DELETE FROM choices;
DELETE FROM user_answers;
DELETE FROM questions;
DELETE FROM test_attempts;
DELETE FROM tests;

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000001', 'Natural va butun sonlar - Variant 1', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000001', '00000000-0000-0000-0000-000000000001', '274·273 − 273·272 + 328·327 − 327·326 ni hisoblang.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000001', '00000000-0000-0000-0001-000000000001', 'A) 310', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000002', '00000000-0000-0000-0001-000000000001', 'B) 1200', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000003', '00000000-0000-0000-0001-000000000001', 'C) 600', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000004', '00000000-0000-0000-0001-000000000001', 'D) 450', false, 3);

