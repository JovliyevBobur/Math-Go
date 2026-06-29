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

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000002', '00000000-0000-0000-0000-000000000001', '467·251 + 123·502 − 231·753 ni hisoblang.', 'Mavzu A', 2, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000005', '00000000-0000-0000-0001-000000000002', 'A) 2510', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000006', '00000000-0000-0000-0001-000000000002', 'B) 5020', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000007', '00000000-0000-0000-0001-000000000002', 'C) 7530', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000008', '00000000-0000-0000-0001-000000000002', 'D) 3765', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000003', '00000000-0000-0000-0000-000000000001', '24·13 + 12·13 + 36·12 + 25·51 − 87·24 ni hisoblang.', 'Mavzu A', 3, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000009', '00000000-0000-0000-0001-000000000003', 'A) 87', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000010', '00000000-0000-0000-0001-000000000003', 'B) 154', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000011', '00000000-0000-0000-0001-000000000003', 'C) 178', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000012', '00000000-0000-0000-0001-000000000003', 'D) 89', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000004', '00000000-0000-0000-0000-000000000001', '8^5 + 8^5 + 8^5 + 8^5 yig''indini hisoblang.', 'Mavzu A', 4, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000013', '00000000-0000-0000-0001-000000000004', 'A) 8^{10}', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000014', '00000000-0000-0000-0001-000000000004', 'B) 4^{10}', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000015', '00000000-0000-0000-0001-000000000004', 'C) 16^4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000016', '00000000-0000-0000-0001-000000000004', 'D) 2^{17}', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000005', '00000000-0000-0000-0000-000000000001', '467·221 + 123·442 − 231·663 ni hisoblang.', 'Mavzu A', 5, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000017', '00000000-0000-0000-0001-000000000005', 'A) 2210', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000018', '00000000-0000-0000-0001-000000000005', 'B) 4420', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000019', '00000000-0000-0000-0001-000000000005', 'C) 6630', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000020', '00000000-0000-0000-0001-000000000005', 'D) 4670', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000006', '00000000-0000-0000-0000-000000000001', 'x va y natural sonlar uchun x + y = 13 tenglik o''rinli, x·y ko''paytmaning qabul qilishi mumkin bo''lgan eng katta va eng kichik qiymatlarini yig''indisini toping.', 'Mavzu B', 6, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000021', '00000000-0000-0000-0001-000000000006', 'A) 42', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000022', '00000000-0000-0000-0001-000000000006', 'B) 54', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000023', '00000000-0000-0000-0001-000000000006', 'C) 72', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000024', '00000000-0000-0000-0001-000000000006', 'D) 55', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000007', '00000000-0000-0000-0000-000000000001', '3 ga karrali dastlabki bir necha sonning yig''indisi o''zining oxirgi qo''shiluvchidan 13 marta katta. Yig''inda nechta had qatnashgan?', 'Mavzu B', 7, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000025', '00000000-0000-0000-0001-000000000007', 'A) 25', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000026', '00000000-0000-0000-0001-000000000007', 'B) 26', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000027', '00000000-0000-0000-0001-000000000007', 'C) 32', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000028', '00000000-0000-0000-0001-000000000007', 'D) 39', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000008', '00000000-0000-0000-0000-000000000001', 'a, b va c lar raqamni ifodalashga. 400a + 60b + c = 865 bo''lsa, a·b·c ko''paytmani hisoblang.', 'Mavzu B', 8, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000029', '00000000-0000-0000-0001-000000000008', 'A) 6', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000030', '00000000-0000-0000-0001-000000000008', 'B) 10', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000031', '00000000-0000-0000-0001-000000000008', 'C) 15', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000032', '00000000-0000-0000-0001-000000000008', 'D) 24', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000009', '00000000-0000-0000-0000-000000000001', '9562·7565 − 9560·7568 ni hisoblang.', 'Mavzu B', 9, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000033', '00000000-0000-0000-0001-000000000009', 'A) −13550', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000034', '00000000-0000-0000-0001-000000000009', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000035', '00000000-0000-0000-0001-000000000009', 'C) −2', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000036', '00000000-0000-0000-0001-000000000009', 'D) 15250', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000010', '00000000-0000-0000-0000-000000000001', '56 dan 145 gacha bo''lgan sonlarni ketma-ket yozib chiqilganda 4 raqami necha marta takrorlanadi?', 'Mavzu B', 10, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000037', '00000000-0000-0000-0001-000000000010', 'A) 25', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000038', '00000000-0000-0000-0001-000000000010', 'B) 15', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000039', '00000000-0000-0000-0001-000000000010', 'C) 24', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000040', '00000000-0000-0000-0001-000000000010', 'D) 14', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000011', '00000000-0000-0000-0000-000000000001', 'Yig''indining oxirgi raqamini toping: 2^{3215} + 9^{326} + 7^{425}', 'Mavzu C', 11, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000041', '00000000-0000-0000-0001-000000000011', 'A) 0', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000042', '00000000-0000-0000-0001-000000000011', 'B) 4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000043', '00000000-0000-0000-0001-000000000011', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000044', '00000000-0000-0000-0001-000000000011', 'D) 1', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000012', '00000000-0000-0000-0000-000000000001', '570 va 450 sonlarining tub bo''lmagan umumiy bo''luvchilari nechta?', 'Mavzu C', 12, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000045', '00000000-0000-0000-0001-000000000012', 'A) 5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000046', '00000000-0000-0000-0001-000000000012', 'B) 6', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000047', '00000000-0000-0000-0001-000000000012', 'C) 7', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000048', '00000000-0000-0000-0001-000000000012', 'D) 8', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000013', '00000000-0000-0000-0000-000000000001', '15·8·50·27·14·125 ko''paytma nechta nol bilan tugaydi?', 'Mavzu C', 13, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000049', '00000000-0000-0000-0001-000000000013', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000050', '00000000-0000-0000-0001-000000000013', 'B) 4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000051', '00000000-0000-0000-0001-000000000013', 'C) 5', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000052', '00000000-0000-0000-0001-000000000013', 'D) 6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000014', '00000000-0000-0000-0000-000000000001', '18 dan 102 gacha bo''lgan sonlar ko''paytmasi nechta nol bilan tugaydi?', 'Mavzu C', 14, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000053', '00000000-0000-0000-0001-000000000014', 'A) 20', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000054', '00000000-0000-0000-0001-000000000014', 'B) 17', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000055', '00000000-0000-0000-0001-000000000014', 'C) 21', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000056', '00000000-0000-0000-0001-000000000014', 'D) 24', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000015', '00000000-0000-0000-0000-000000000001', '2^{200} sonining oxirgi raqamini toping.', 'Mavzu C', 15, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000057', '00000000-0000-0000-0001-000000000015', 'A) 2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000058', '00000000-0000-0000-0001-000000000015', 'B) 4', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000059', '00000000-0000-0000-0001-000000000015', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000060', '00000000-0000-0000-0001-000000000015', 'D) 0', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000002', 'Natural va butun sonlar - Variant 2', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000016', '00000000-0000-0000-0000-000000000002', '28·25 − 25·25 + 25·32 − 32·22 − 56·3 ni hisoblang.', 'Mavzu A', 1, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000061', '00000000-0000-0000-0001-000000000016', 'A) 171', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000062', '00000000-0000-0000-0001-000000000016', 'B) 99', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000063', '00000000-0000-0000-0001-000000000016', 'C) 57', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000064', '00000000-0000-0000-0001-000000000016', 'D) 3', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000017', '00000000-0000-0000-0000-000000000002', 'Bir necha natural sonlarning yig''indisi 46 ga teng. Agar shu sonlarning har biriga 3 ni qo''shib hisoblansa, yig''indi 73 ga teng bo''ladi. Yig''indida nechta son ishtirok etgan?', 'Mavzu A', 2, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000065', '00000000-0000-0000-0001-000000000017', 'A) 16', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000066', '00000000-0000-0000-0001-000000000017', 'B) 8', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000067', '00000000-0000-0000-0001-000000000017', 'C) 9', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000068', '00000000-0000-0000-0001-000000000017', 'D) 14', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000018', '00000000-0000-0000-0000-000000000002', '2324252627...7172 sonining raqamlari yig''indisini toping.', 'Mavzu A', 3, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000069', '00000000-0000-0000-0001-000000000018', 'A) 431', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000070', '00000000-0000-0000-0001-000000000018', 'B) 440', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000071', '00000000-0000-0000-0001-000000000018', 'C) 462', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000072', '00000000-0000-0000-0001-000000000018', 'D) 423', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000019', '00000000-0000-0000-0000-000000000002', 'Ushbu 31323334.......7475 sonning raqamlari yig''indisini toping.', 'Mavzu A', 4, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000073', '00000000-0000-0000-0001-000000000019', 'A) 420', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000074', '00000000-0000-0000-0001-000000000019', 'B) 325', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000075', '00000000-0000-0000-0001-000000000019', 'C) 340', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000076', '00000000-0000-0000-0001-000000000019', 'D) 414', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000020', '00000000-0000-0000-0000-000000000002', '3637383940...8788 sonining raqamlari yig''indisi quyidagilardan qaysi biriga teng?', 'Mavzu A', 5, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000077', '00000000-0000-0000-0001-000000000020', 'A) 532', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000078', '00000000-0000-0000-0001-000000000020', 'B) 550', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000079', '00000000-0000-0000-0001-000000000020', 'C) 558', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000080', '00000000-0000-0000-0001-000000000020', 'D) 542', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000021', '00000000-0000-0000-0000-000000000002', 'x va y natural sonlar bo''lib, 7x + 4 juft bo''lsa, quyidagilardan qaysi biri juft?', 'Mavzu B', 6, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000081', '00000000-0000-0000-0001-000000000021', 'A) x+2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000082', '00000000-0000-0000-0001-000000000021', 'B) x^3+2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000083', '00000000-0000-0000-0001-000000000021', 'C) 3x+3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000084', '00000000-0000-0000-0001-000000000021', 'D) x^3+x', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000022', '00000000-0000-0000-0000-000000000002', 'n natural son bo''lsa, quyidagilardan qaysi biri doimo juft?', 'Mavzu B', 7, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000085', '00000000-0000-0000-0001-000000000022', 'A) 2011n+n^2−5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000086', '00000000-0000-0000-0001-000000000022', 'B) 2012n+n^5+2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000087', '00000000-0000-0000-0001-000000000022', 'C) 2015n^3+14n^2−n^2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000088', '00000000-0000-0000-0001-000000000022', 'D) 404n^5+202n^3−n^2', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000023', '00000000-0000-0000-0000-000000000002', 'abc va ab mos ravishda uch va ikki xonali sonlar. abc + ab = 1073 bo''lsa, a + b + c ning yig''indini hisoblang.', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000089', '00000000-0000-0000-0001-000000000023', 'A) 16', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000090', '00000000-0000-0000-0001-000000000023', 'B) 22', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000091', '00000000-0000-0000-0001-000000000023', 'C) 21', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000092', '00000000-0000-0000-0001-000000000023', 'D) aniqlab bo''lmaydi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000024', '00000000-0000-0000-0000-000000000002', 'Barcha ikki xonali sonlar ketma-ket yozib chiqilganda necha xonali son hosil bo''ladi?', 'Mavzu B', 9, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000093', '00000000-0000-0000-0001-000000000024', 'A) 198', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000094', '00000000-0000-0000-0001-000000000024', 'B) 200', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000095', '00000000-0000-0000-0001-000000000024', 'C) 178', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000096', '00000000-0000-0000-0001-000000000024', 'D) 180', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000025', '00000000-0000-0000-0000-000000000002', 'k, l va m raqamlar. klm + mlk = 746 bo''lsa, (m + k)·l ning qiymatini toping. (klm va mlk uch xonali sonlar)', 'Mavzu B', 10, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000097', '00000000-0000-0000-0001-000000000025', 'A) 24', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000098', '00000000-0000-0000-0001-000000000025', 'B) 56', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000099', '00000000-0000-0000-0001-000000000025', 'C) 21', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000100', '00000000-0000-0000-0001-000000000025', 'D) 42', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000026', '00000000-0000-0000-0000-000000000002', '1 dan 100 gacha yozib chiqilsa 4 raqami necha marta takrorlanadi?', 'Mavzu C', 11, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000101', '00000000-0000-0000-0001-000000000026', 'A) 10', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000102', '00000000-0000-0000-0001-000000000026', 'B) 11', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000103', '00000000-0000-0000-0001-000000000026', 'C) 20', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000104', '00000000-0000-0000-0001-000000000026', 'D) 19', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000027', '00000000-0000-0000-0000-000000000002', '23 dan 92 gacha bo''lgan natural sonlar ko''paytmasi nechta nol bilan tugaydi?', 'Mavzu C', 12, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000105', '00000000-0000-0000-0001-000000000027', 'A) 22', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000106', '00000000-0000-0000-0001-000000000027', 'B) 17', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000107', '00000000-0000-0000-0001-000000000027', 'C) 19', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000108', '00000000-0000-0000-0001-000000000027', 'D) 15', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000028', '00000000-0000-0000-0000-000000000002', '35·12·375·150·28 ko''paytma nechta nol bilan tugaydi?', 'Mavzu C', 13, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000109', '00000000-0000-0000-0001-000000000028', 'A) 6', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000110', '00000000-0000-0000-0001-000000000028', 'B) 8', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000111', '00000000-0000-0000-0001-000000000028', 'C) 5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000112', '00000000-0000-0000-0001-000000000028', 'D) 7', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000029', '00000000-0000-0000-0000-000000000002', '55000 ning natural bo''luvchilari sonini toping.', 'Mavzu C', 14, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000113', '00000000-0000-0000-0001-000000000029', 'A) 40', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000114', '00000000-0000-0000-0001-000000000029', 'B) 64', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000115', '00000000-0000-0000-0001-000000000029', 'C) 48', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000116', '00000000-0000-0000-0001-000000000029', 'D) 24', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000030', '00000000-0000-0000-0000-000000000002', '3^{200} sonining oxirgi raqamini toping.', 'Mavzu C', 15, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000117', '00000000-0000-0000-0001-000000000030', 'A) 9', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000118', '00000000-0000-0000-0001-000000000030', 'B) 7', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000119', '00000000-0000-0000-0001-000000000030', 'C) 1', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000120', '00000000-0000-0000-0001-000000000030', 'D) 3', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000003', 'Natural va butun sonlar - Variant 3', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000031', '00000000-0000-0000-0000-000000000003', '17·11 + 27·23 − 11·14 − 23·24 ni hisoblang.', 'Mavzu A', 1, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000121', '00000000-0000-0000-0001-000000000031', 'A) −66', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000122', '00000000-0000-0000-0001-000000000031', 'B) 78', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000123', '00000000-0000-0000-0001-000000000031', 'C) 96', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000124', '00000000-0000-0000-0001-000000000031', 'D) 102', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000032', '00000000-0000-0000-0000-000000000003', '17·15 + 17·18 − 33·34 + 24·18 + 18·9 ni hisoblang.', 'Mavzu A', 2, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000125', '00000000-0000-0000-0001-000000000032', 'A) 66', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000126', '00000000-0000-0000-0001-000000000032', 'B) 34', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000127', '00000000-0000-0000-0001-000000000032', 'C) 68', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000128', '00000000-0000-0000-0001-000000000032', 'D) 33', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000033', '00000000-0000-0000-0000-000000000003', '19·11 + 37·24 − 11·16 − 24·34 ni hisoblang.', 'Mavzu A', 3, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000129', '00000000-0000-0000-0001-000000000033', 'A) 90', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000130', '00000000-0000-0000-0001-000000000033', 'B) 105', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000131', '00000000-0000-0000-0001-000000000033', 'C) 100', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000132', '00000000-0000-0000-0001-000000000033', 'D) 110', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000034', '00000000-0000-0000-0000-000000000003', '37 + 41 + 45 + 49 + ... + 93 yig''indini hisoblang.', 'Mavzu A', 4, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000133', '00000000-0000-0000-0001-000000000034', 'A) 882', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000134', '00000000-0000-0000-0001-000000000034', 'B) 975', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000135', '00000000-0000-0000-0001-000000000034', 'C) 938', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000136', '00000000-0000-0000-0001-000000000034', 'D) 845', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000035', '00000000-0000-0000-0000-000000000003', '262728293031...72 sonining raqamlari yig''indisini toping.', 'Mavzu A', 5, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000137', '00000000-0000-0000-0001-000000000035', 'A) 415', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000138', '00000000-0000-0000-0001-000000000035', 'B) 420', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000139', '00000000-0000-0000-0001-000000000035', 'C) 422', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000140', '00000000-0000-0000-0001-000000000035', 'D) 430', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000036', '00000000-0000-0000-0000-000000000003', 'Ikki xonali sonning o''ng va chap tarafiga 1 raqami yozilsa, hosil bo''lgan son dastlabki sondan 23 marta katta bo''ladi. Berilgan ikki xonali sonning raqamlari yig''indisini toping.', 'Mavzu B', 6, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000141', '00000000-0000-0000-0001-000000000036', 'A) 15', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000142', '00000000-0000-0000-0001-000000000036', 'B) 13', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000143', '00000000-0000-0000-0001-000000000036', 'C) 14', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000144', '00000000-0000-0000-0001-000000000036', 'D) 17', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000037', '00000000-0000-0000-0000-000000000003', '9·8^{24}·625^{17} ko''paytma necha xonali son?', 'Mavzu B', 7, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000145', '00000000-0000-0000-0001-000000000037', 'A) 40', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000146', '00000000-0000-0000-0001-000000000037', 'B) 39', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000147', '00000000-0000-0000-0001-000000000037', 'C) 41', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000148', '00000000-0000-0000-0001-000000000037', 'D) 38', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000038', '00000000-0000-0000-0000-000000000003', 'Ushbu 33343536...7172 sonning raqamlari yig''indisini toping.', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000149', '00000000-0000-0000-0001-000000000038', 'A) 480', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000150', '00000000-0000-0000-0001-000000000038', 'B) 412', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000151', '00000000-0000-0000-0001-000000000038', 'C) 360', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000152', '00000000-0000-0000-0001-000000000038', 'D) 372', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000039', '00000000-0000-0000-0000-000000000003', '84858687...121122123 sonining raqamlari yig''indisini toping.', 'Mavzu B', 9, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000153', '00000000-0000-0000-0001-000000000039', 'A) 548', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000154', '00000000-0000-0000-0001-000000000039', 'B) 360', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000155', '00000000-0000-0000-0001-000000000039', 'C) 447', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000156', '00000000-0000-0000-0001-000000000039', 'D) 374', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000040', '00000000-0000-0000-0000-000000000003', '122123124125126...256 sonining raqamlari yig''indisini toping.', 'Mavzu B', 10, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000157', '00000000-0000-0000-0001-000000000040', 'A) 1248', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000158', '00000000-0000-0000-0001-000000000040', 'B) 1375', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000159', '00000000-0000-0000-0001-000000000040', 'C) 1401', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000160', '00000000-0000-0000-0001-000000000040', 'D) 1368', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000041', '00000000-0000-0000-0000-000000000003', '108 sonining nechta tub bo''lmagan natural bo''luvchilari mavjud?', 'Mavzu C', 11, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000161', '00000000-0000-0000-0001-000000000041', 'A) 6', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000162', '00000000-0000-0000-0001-000000000041', 'B) 10', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000163', '00000000-0000-0000-0001-000000000041', 'C) 12', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000164', '00000000-0000-0000-0001-000000000041', 'D) 8', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000042', '00000000-0000-0000-0000-000000000003', '12·34·55 ko''paytmaning natural bo''luvchilari soni nechta?', 'Mavzu C', 12, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000165', '00000000-0000-0000-0001-000000000042', 'A) 8', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000166', '00000000-0000-0000-0001-000000000042', 'B) 32', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000167', '00000000-0000-0000-0001-000000000042', 'C) 64', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000168', '00000000-0000-0000-0001-000000000042', 'D) 16', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000043', '00000000-0000-0000-0000-000000000003', '240 sonini murakkab bo''lmagan bo''luvchilar soni nechta?', 'Mavzu C', 13, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000169', '00000000-0000-0000-0001-000000000043', 'A) 3 ta', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000170', '00000000-0000-0000-0001-000000000043', 'B) 4 ta', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000171', '00000000-0000-0000-0001-000000000043', 'C) 5 ta', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000172', '00000000-0000-0000-0001-000000000043', 'D) 6 ta', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000044', '00000000-0000-0000-0000-000000000003', '26100 ning tub bo''luvchilari yig''indisini toping.', 'Mavzu C', 14, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000173', '00000000-0000-0000-0001-000000000044', 'A) 32', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000174', '00000000-0000-0000-0001-000000000044', 'B) 10', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000175', '00000000-0000-0000-0001-000000000044', 'C) 39', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000176', '00000000-0000-0000-0001-000000000044', 'D) 42', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000045', '00000000-0000-0000-0000-000000000003', '10! + 7! nechta nol bilan tugaydi?', 'Mavzu C', 15, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000177', '00000000-0000-0000-0001-000000000045', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000178', '00000000-0000-0000-0001-000000000045', 'B) 1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000179', '00000000-0000-0000-0001-000000000045', 'C) 2', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000180', '00000000-0000-0000-0001-000000000045', 'D) 5', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000004', 'Natural va butun sonlar - Variant 4', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000046', '00000000-0000-0000-0000-000000000004', '2345·2347 − 2344·2346 ni hisoblang.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000181', '00000000-0000-0000-0001-000000000046', 'A) 4691', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000182', '00000000-0000-0000-0001-000000000046', 'B) 4961', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000183', '00000000-0000-0000-0001-000000000046', 'C) 4945', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000184', '00000000-0000-0000-0001-000000000046', 'D) 4919', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000047', '00000000-0000-0000-0000-000000000004', '200002·199998 = ?', 'Mavzu A', 2, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000185', '00000000-0000-0000-0001-000000000047', 'A) 4·10^{10}−1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000186', '00000000-0000-0000-0001-000000000047', 'B) 2·10^8−2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000187', '00000000-0000-0000-0001-000000000047', 'C) 10^{10}−4', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000188', '00000000-0000-0000-0001-000000000047', 'D) 4(10^{10}−1)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000048', '00000000-0000-0000-0000-000000000004', '11 + 192 + 1993 + 19994 + 199995 + 1999996 + 19999997 + 199999998 + 1999999999 ni hisoblang.', 'Mavzu A', 3, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000189', '00000000-0000-0000-0001-000000000048', 'A) 222220175', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000190', '00000000-0000-0000-0001-000000000048', 'B) 2222222175', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000191', '00000000-0000-0000-0001-000000000048', 'C) 2222222220', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000192', '00000000-0000-0000-0001-000000000048', 'D) 222222222222', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000049', '00000000-0000-0000-0000-000000000004', '0,2,3,4 raqamlari yordamida, ularni takrorlamasdan yozilgan eng katta to''rt xonali va eng kichik to''rt xonali sonlar ayirmasini toping.', 'Mavzu A', 4, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000193', '00000000-0000-0000-0001-000000000049', 'A) 2286', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000194', '00000000-0000-0000-0001-000000000049', 'B) 2236', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000195', '00000000-0000-0000-0001-000000000049', 'C) 3326', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000196', '00000000-0000-0000-0001-000000000049', 'D) 3356', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000050', '00000000-0000-0000-0000-000000000004', '9 + 99 + 999 + 9999 + ... + 999...9 (n ta 9) yig''indini hisoblang.', 'Mavzu A', 5, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000197', '00000000-0000-0000-0001-000000000050', 'A) \frac{x^2-7x+5}{2x+y}', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000198', '00000000-0000-0000-0001-000000000050', 'B) \frac{10^{n+1}-9n-10}{9}', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000199', '00000000-0000-0000-0001-000000000050', 'C) \frac{10^{n+2}-10n-9}{10}\cdot9-n', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000200', '00000000-0000-0000-0001-000000000050', 'D) \frac{10^{n+2}-10n-9}{10}', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000051', '00000000-0000-0000-0000-000000000004', '565758596061...212 soni necha xonali?', 'Mavzu B', 6, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000201', '00000000-0000-0000-0001-000000000051', 'A) 425', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000202', '00000000-0000-0000-0001-000000000051', 'B) 427', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000203', '00000000-0000-0000-0001-000000000051', 'C) 422', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000204', '00000000-0000-0000-0001-000000000051', 'D) 424', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000052', '00000000-0000-0000-0000-000000000004', '2017^{2018}·2018^{2017} − 2016^{2018}·2015^{2019} sonlar xonasidagi raqamni toping.', 'Mavzu B', 7, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000205', '00000000-0000-0000-0001-000000000052', 'A) 2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000206', '00000000-0000-0000-0001-000000000052', 'B) 0', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000207', '00000000-0000-0000-0001-000000000052', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000208', '00000000-0000-0000-0001-000000000052', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000053', '00000000-0000-0000-0000-000000000004', '25^{2018} − 16^{2018} − 9^{2018} ning ishorasini aniqlang.', 'Mavzu B', 8, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000209', '00000000-0000-0000-0001-000000000053', 'A) 0 ga teng', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000210', '00000000-0000-0000-0001-000000000053', 'B) manfiy', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000211', '00000000-0000-0000-0001-000000000053', 'C) musbat', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000212', '00000000-0000-0000-0001-000000000053', 'D) aniqlab bo''lmaydi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000054', '00000000-0000-0000-0000-000000000004', '32^4·125^{13}·8^6 ko''paytma necha xonali son?', 'Mavzu B', 9, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000213', '00000000-0000-0000-0001-000000000054', 'A) 40', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000214', '00000000-0000-0000-0001-000000000054', 'B) 39', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000215', '00000000-0000-0000-0001-000000000054', 'C) 41', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000216', '00000000-0000-0000-0001-000000000054', 'D) 38', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000055', '00000000-0000-0000-0000-000000000004', 'Natural sonlar to''g''risida keltirilgan mulohazalardan qaysi biri noto''g''ri?', 'Mavzu B', 10, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000217', '00000000-0000-0000-0001-000000000055', 'A) Ikkita ikki xonali sonning yig''indisi uch xonali son bo''la oladi.', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000218', '00000000-0000-0000-0001-000000000055', 'B) Ikkita ikki xonali sonning ko''paytmasi doimo uch xonali son bo''ladi.', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000219', '00000000-0000-0000-0001-000000000055', 'C) Ikkita ikki xonali sonning ayirmasi bir xonali son bo''lishi mumkin.', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000220', '00000000-0000-0000-0001-000000000055', 'D) Ikkita ikki xonali sonning yig''indisi bir xonali son bo''lishi mumkin.', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000056', '00000000-0000-0000-0000-000000000004', '7777^{634} ni 5 ga bo''lganda necha qoldiq qoladi?', 'Mavzu C', 11, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000221', '00000000-0000-0000-0001-000000000056', 'A) 1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000222', '00000000-0000-0000-0001-000000000056', 'B) 2', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000223', '00000000-0000-0000-0001-000000000056', 'C) 3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000224', '00000000-0000-0000-0001-000000000056', 'D) 4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000057', '00000000-0000-0000-0000-000000000004', '6 ga bo''linganda qoldiq 2 chiqadigan dastlabki 20 ta sonning yig''indisini toping.', 'Mavzu C', 12, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000225', '00000000-0000-0000-0001-000000000057', 'A) 1260', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000226', '00000000-0000-0000-0001-000000000057', 'B) 1300', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000227', '00000000-0000-0000-0001-000000000057', 'C) 1180', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000228', '00000000-0000-0000-0001-000000000057', 'D) 1420', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000058', '00000000-0000-0000-0000-000000000004', '7^{32} sonini 9 ga bo''lingandagi qoldiqni toping.', 'Mavzu C', 13, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000229', '00000000-0000-0000-0001-000000000058', 'A) 7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000230', '00000000-0000-0000-0001-000000000058', 'B) 8', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000231', '00000000-0000-0000-0001-000000000058', 'C) 4', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000232', '00000000-0000-0000-0001-000000000058', 'D) 6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000059', '00000000-0000-0000-0000-000000000004', '54, 90 va 162 sonlari nechta umumiy natural bo''luvchiga ega?', 'Mavzu C', 14, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000233', '00000000-0000-0000-0001-000000000059', 'A) 4 ta', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000234', '00000000-0000-0000-0001-000000000059', 'B) 5 ta', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000235', '00000000-0000-0000-0001-000000000059', 'C) 6 ta', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000236', '00000000-0000-0000-0001-000000000059', 'D) 7 ta', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000060', '00000000-0000-0000-0000-000000000004', '55000 ning natural bo''luvchilari sonini toping.', 'Mavzu C', 15, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000237', '00000000-0000-0000-0001-000000000060', 'A) 40', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000238', '00000000-0000-0000-0001-000000000060', 'B) 64', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000239', '00000000-0000-0000-0001-000000000060', 'C) 48', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000240', '00000000-0000-0000-0001-000000000060', 'D) 24', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000005', 'Natural va butun sonlar - Variant 5', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000061', '00000000-0000-0000-0000-000000000005', '4717·3408 − 4714·3411 ni hisoblang.', 'Mavzu A', 1, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000241', '00000000-0000-0000-0001-000000000061', 'A) −3918', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000242', '00000000-0000-0000-0001-000000000061', 'B) −1306', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000243', '00000000-0000-0000-0001-000000000061', 'C) 3918', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000244', '00000000-0000-0000-0001-000000000061', 'D) 1306', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000062', '00000000-0000-0000-0000-000000000005', '17·22 + 45·18 − 80·30 + 17·23 + 35·35 ni hisoblang.', 'Mavzu A', 2, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000245', '00000000-0000-0000-0001-000000000062', 'A) 50', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000246', '00000000-0000-0000-0001-000000000062', 'B) 200', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000247', '00000000-0000-0000-0001-000000000062', 'C) 400', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000248', '00000000-0000-0000-0001-000000000062', 'D) 100', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000063', '00000000-0000-0000-0000-000000000005', '\frac{abc}{f} ayirish amali berilgan, a^f + (c+e)^b + d^0 = ?', 'Mavzu A', 3, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000249', '00000000-0000-0000-0001-000000000063', 'A) 10', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000250', '00000000-0000-0000-0001-000000000063', 'B) 11', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000251', '00000000-0000-0000-0001-000000000063', 'C) 12', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000252', '00000000-0000-0000-0001-000000000063', 'D) aniqlab bo''lmaydi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000064', '00000000-0000-0000-0000-000000000005', '65986·65982 − 65984·65983 ni hisoblang.', 'Mavzu A', 4, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000253', '00000000-0000-0000-0001-000000000064', 'A) 131958', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000254', '00000000-0000-0000-0001-000000000064', 'B) −2', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000255', '00000000-0000-0000-0001-000000000064', 'C) 65976', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000256', '00000000-0000-0000-0001-000000000064', 'D) 65980', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000065', '00000000-0000-0000-0000-000000000005', '35843·125010 ko''paytma necha xonali?', 'Mavzu A', 5, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000257', '00000000-0000-0000-0001-000000000065', 'A) 40', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000258', '00000000-0000-0000-0001-000000000065', 'B) 37', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000259', '00000000-0000-0000-0001-000000000065', 'C) 42', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000260', '00000000-0000-0000-0001-000000000065', 'D) 43', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000066', '00000000-0000-0000-0000-000000000005', 'n natural son bo''lsa, quyidagilardan qaysi biri doimo juft?', 'Mavzu B', 6, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000261', '00000000-0000-0000-0001-000000000066', 'A) 4957^n+4959·n', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000262', '00000000-0000-0000-0001-000000000066', 'B) 4957^n+n^{4958}−4955·n', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000263', '00000000-0000-0000-0001-000000000066', 'C) 3236^n+3240n+n^{2010}', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000264', '00000000-0000-0000-0001-000000000066', 'D) 2002^n+n^{3215}−1995n', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000067', '00000000-0000-0000-0000-000000000005', 'xyx uch xonali son 22 ga bo''linsa, y ning olishi mumkin bo''lgan barcha qiymatlarni yig''indisini toping.', 'Mavzu B', 7, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000265', '00000000-0000-0000-0001-000000000067', 'A) 18', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000266', '00000000-0000-0000-0001-000000000067', 'B) 16', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000267', '00000000-0000-0000-0001-000000000067', 'C) 15', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000268', '00000000-0000-0000-0001-000000000067', 'D) 12', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000068', '00000000-0000-0000-0000-000000000005', 'Quyidagilardan qaysilari bo''sh to''plam? 1){x|x∈N, 4≤x³<5}; 2){x|x∈R, x>7, x<5}; 3){x|x∈R, |x|=3}; 4){x|x∈N, |x²−3|=13}', 'Mavzu B', 8, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000269', '00000000-0000-0000-0001-000000000068', 'A) 3, 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000270', '00000000-0000-0000-0001-000000000068', 'B) 2, 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000271', '00000000-0000-0000-0001-000000000068', 'C) 1, 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000272', '00000000-0000-0000-0001-000000000068', 'D) 1, 2', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000069', '00000000-0000-0000-0000-000000000005', '1 idan 1000 gacha yozib chiqilganida, eng ko''p takrorlanadigan raqam qaysi?', 'Mavzu B', 9, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000273', '00000000-0000-0000-0001-000000000069', 'A) hammasi teng', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000274', '00000000-0000-0000-0001-000000000069', 'B) 1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000275', '00000000-0000-0000-0001-000000000069', 'C) 0', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000276', '00000000-0000-0000-0001-000000000069', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000070', '00000000-0000-0000-0000-000000000005', '16 + 19 + 22 + 25 + ... + 9n + 7 yig''indini hisoblang.', 'Mavzu B', 10, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000277', '00000000-0000-0000-0001-000000000070', 'A) \frac{(3n-2)(9n-23)}{2}', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000278', '00000000-0000-0000-0001-000000000070', 'B) (2n-6)(9n+23)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000279', '00000000-0000-0000-0001-000000000070', 'C) \frac{3(n-3)(5n-21)}{2}', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000280', '00000000-0000-0000-0001-000000000070', 'D) 3(n-1)(9n+23)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000071', '00000000-0000-0000-0000-000000000005', '5148 va 1170 sonlarini qanday bir songa bo''lganda bo''linmalar o''zaro tub sonlar bo''ladi?', 'Mavzu C', 11, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000281', '00000000-0000-0000-0001-000000000071', 'A) 78', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000282', '00000000-0000-0000-0001-000000000071', 'B) 234', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000283', '00000000-0000-0000-0001-000000000071', 'C) 156', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000284', '00000000-0000-0000-0001-000000000071', 'D) 396', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000072', '00000000-0000-0000-0000-000000000005', '560 soni qoldiqsiz bo''linadigan butun sonlar nechta?', 'Mavzu C', 12, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000285', '00000000-0000-0000-0001-000000000072', 'A) 40', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000286', '00000000-0000-0000-0001-000000000072', 'B) 20', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000287', '00000000-0000-0000-0001-000000000072', 'C) 24', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000288', '00000000-0000-0000-0001-000000000072', 'D) 48', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000073', '00000000-0000-0000-0000-000000000005', 'a ni b ga bo''lganda 2,5(3) bo''linma hosil bo''ladi. Agar a bo''luvchi va bo''linuvchi natural sonlar bo''lsa, ularning yig''indisini toping.', 'Mavzu C', 13, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000289', '00000000-0000-0000-0001-000000000073', 'A) 47', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000290', '00000000-0000-0000-0001-000000000073', 'B) 51', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000291', '00000000-0000-0000-0001-000000000073', 'C) 53', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000292', '00000000-0000-0000-0001-000000000073', 'D) 57', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000074', '00000000-0000-0000-0000-000000000005', '[1; 1000] kesmada 2 ga, 3 ga va 5 ga bo''linmaydigan natural sonlar nechta?', 'Mavzu C', 14, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000293', '00000000-0000-0000-0001-000000000074', 'A) 733', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000294', '00000000-0000-0000-0001-000000000074', 'B) 266', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000295', '00000000-0000-0000-0001-000000000074', 'C) 701', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000296', '00000000-0000-0000-0001-000000000074', 'D) 299', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000075', '00000000-0000-0000-0000-000000000005', '2·4·6·8·...·100 ko''paytmada nechta 0 bilan tugaydi?', 'Mavzu C', 15, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000297', '00000000-0000-0000-0001-000000000075', 'A) 12', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000298', '00000000-0000-0000-0001-000000000075', 'B) 11', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000299', '00000000-0000-0000-0001-000000000075', 'C) 10', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000300', '00000000-0000-0000-0001-000000000075', 'D) 14', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000006', 'Butun va ratsional sonlar - Variant 1', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000076', '00000000-0000-0000-0000-000000000006', '265² − 361 / 284 + 512 ni hisoblang.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000301', '00000000-0000-0000-0001-000000000076', 'A) 274', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000302', '00000000-0000-0000-0001-000000000076', 'B) 312', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000303', '00000000-0000-0000-0001-000000000076', 'C) 246', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000304', '00000000-0000-0000-0001-000000000076', 'D) 512', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000077', '00000000-0000-0000-0000-000000000006', 'a, b va c ratsional sonlar. abc + cba = 1453 bo''lsa, (a+c)·b ning qiymatini toping. (abc va cba uch xonali sonlar)', 'Mavzu A', 2, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000305', '00000000-0000-0000-0001-000000000077', 'A) 45', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000306', '00000000-0000-0000-0001-000000000077', 'B) 64', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000307', '00000000-0000-0000-0001-000000000077', 'C) 80', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000308', '00000000-0000-0000-0001-000000000077', 'D) 91', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000078', '00000000-0000-0000-0000-000000000006', '275^3 + 1200·275·125 + 125^3 / (275² + 250·275 + 125²) ni hisoblang.', 'Mavzu A', 3, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000309', '00000000-0000-0000-0001-000000000078', 'A) 400', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000310', '00000000-0000-0000-0001-000000000078', 'B) 1200', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000311', '00000000-0000-0000-0001-000000000078', 'C) 400²', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000312', '00000000-0000-0000-0001-000000000078', 'D) 800', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000079', '00000000-0000-0000-0000-000000000006', '(450·316 + 450·684):750 + (240·543 − 240·243):360 ni hisoblang.', 'Mavzu A', 4, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000313', '00000000-0000-0000-0001-000000000079', 'A) 800', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000314', '00000000-0000-0000-0001-000000000079', 'B) 300', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000315', '00000000-0000-0000-0001-000000000079', 'C) 700', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000316', '00000000-0000-0000-0001-000000000079', 'D) 1000', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000080', '00000000-0000-0000-0000-000000000006', '12·15 + 13·15 + 25·14 + 29·36 − 61·27 ni hisoblang.', 'Mavzu A', 5, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000317', '00000000-0000-0000-0001-000000000080', 'A) 122', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000318', '00000000-0000-0000-0001-000000000080', 'B) 61', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000319', '00000000-0000-0000-0001-000000000080', 'C) 66', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000320', '00000000-0000-0000-0001-000000000080', 'D) 132', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000081', '00000000-0000-0000-0000-000000000006', 'Sonning natural va butun ko''rsatkichli darajasi xossalarini qo''llab: 12·125^{13}·16^{10} + 27 soni necha xonali?', 'Mavzu B', 6, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000321', '00000000-0000-0000-0001-000000000081', 'A) 39', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000322', '00000000-0000-0000-0001-000000000081', 'B) 43', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000323', '00000000-0000-0000-0001-000000000081', 'C) 40', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000324', '00000000-0000-0000-0001-000000000081', 'D) 41', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000082', '00000000-0000-0000-0000-000000000006', 'sin3x + sin2x + sinx = 0 tenglama (0; 2π) oraliqda nechta ildizga ega?', 'Mavzu B', 7, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000325', '00000000-0000-0000-0001-000000000082', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000326', '00000000-0000-0000-0001-000000000082', 'B) 5', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000327', '00000000-0000-0000-0001-000000000082', 'C) 7', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000328', '00000000-0000-0000-0001-000000000082', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000083', '00000000-0000-0000-0000-000000000006', '27436² − 27432·27440 / (42529·42541 − 42535²) ni hisoblang.', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000329', '00000000-0000-0000-0001-000000000083', 'A) −4/9', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000330', '00000000-0000-0000-0001-000000000083', 'B) −2/3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000331', '00000000-0000-0000-0001-000000000083', 'C) 2/3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000332', '00000000-0000-0000-0001-000000000083', 'D) 4/9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000084', '00000000-0000-0000-0000-000000000006', 'a, b va c butun sonlar abc > 0, b > c, ab < ac. Quyidagilardan foydalanib a, b va c ning ishoralarini mos ravishda toping.', 'Mavzu B', 9, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000333', '00000000-0000-0000-0001-000000000084', 'A) −, +, −', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000334', '00000000-0000-0000-0001-000000000084', 'B) −, −, −', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000335', '00000000-0000-0000-0001-000000000084', 'C) +, −, −', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000336', '00000000-0000-0000-0001-000000000084', 'D) −, −, +', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000085', '00000000-0000-0000-0000-000000000006', 'Uch xonali sonning birlar xonasi 5 taga orttirildi, o''nlar xonasi 4 taga va birlar xonasi 3 taga kamaytirildi. Hosil bo''lgan yangi son qanday o''zgaradi?', 'Mavzu B', 10, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000337', '00000000-0000-0000-0001-000000000085', 'A) 457 ta ortadi', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000338', '00000000-0000-0000-0001-000000000085', 'B) 457 ta kamayadi', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000339', '00000000-0000-0000-0001-000000000085', 'C) 437 ta kamayadi', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000340', '00000000-0000-0000-0001-000000000085', 'D) 437 ta ortadi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000086', '00000000-0000-0000-0000-000000000006', '15599² − 15595·15603 / (9603² − 6·9603·9601 − 9601²) ni hisoblang.', 'Mavzu C', 11, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000341', '00000000-0000-0000-0001-000000000086', 'A) 0,5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000342', '00000000-0000-0000-0001-000000000086', 'B) 8', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000343', '00000000-0000-0000-0001-000000000086', 'C) 2', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000344', '00000000-0000-0000-0001-000000000086', 'D) 1', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000087', '00000000-0000-0000-0000-000000000006', 'x va y raqamlar. xxx va yyy uch xonali sonlar bo''lib, (xxx)² + (yyy)² = 61605 bo''lsa, x² + y² = ?', 'Mavzu C', 12, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000345', '00000000-0000-0000-0001-000000000087', 'A) 5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000346', '00000000-0000-0000-0001-000000000087', 'B) 425', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000347', '00000000-0000-0000-0001-000000000087', 'C) 15', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000348', '00000000-0000-0000-0001-000000000087', 'D) aniqlab bo''lmaydi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000088', '00000000-0000-0000-0000-000000000006', '3·6·9+9+18·27+15·30·45+18·36·54+24·48·72 / (1·2·3+3·6·9+5·10·15+6·12·18+8·16·24) ni hisoblang.', 'Mavzu C', 13, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000349', '00000000-0000-0000-0001-000000000088', 'A) 27', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000350', '00000000-0000-0000-0001-000000000088', 'B) 9', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000351', '00000000-0000-0000-0001-000000000088', 'C) 3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000352', '00000000-0000-0000-0001-000000000088', 'D) 54', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000089', '00000000-0000-0000-0000-000000000006', 'n ning nechta natural qiymatida n²+3n+2 / 3−n ifoda natural son bo''ladi?', 'Mavzu C', 14, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000353', '00000000-0000-0000-0001-000000000089', 'A) 4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000354', '00000000-0000-0000-0001-000000000089', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000355', '00000000-0000-0000-0001-000000000089', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000356', '00000000-0000-0000-0001-000000000089', 'D) 10', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000090', '00000000-0000-0000-0000-000000000006', 'n ning nechta butun qiymatida n+4 ta n−3 ifoda natural son bo''ladi?', 'Mavzu C', 15, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000357', '00000000-0000-0000-0001-000000000090', 'A) 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000358', '00000000-0000-0000-0001-000000000090', 'B) 6', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000359', '00000000-0000-0000-0001-000000000090', 'C) 8', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000360', '00000000-0000-0000-0001-000000000090', 'D) 10', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000007', 'Butun va ratsional sonlar - Variant 2', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000091', '00000000-0000-0000-0000-000000000007', '972² − 729 / 999 ni hisoblang.', 'Mavzu A', 1, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000361', '00000000-0000-0000-0001-000000000091', 'A) 981', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000362', '00000000-0000-0000-0001-000000000091', 'B) 949', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000363', '00000000-0000-0000-0001-000000000091', 'C) 977', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000364', '00000000-0000-0000-0001-000000000091', 'D) 945', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000092', '00000000-0000-0000-0000-000000000007', '62·14·22·65 + 25·18·14 yig''indini 8 ga bo''lgandagi qoldiqni toping.', 'Mavzu A', 2, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000365', '00000000-0000-0000-0001-000000000092', 'A) 0', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000366', '00000000-0000-0000-0001-000000000092', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000367', '00000000-0000-0000-0001-000000000092', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000368', '00000000-0000-0000-0001-000000000092', 'D) 4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000093', '00000000-0000-0000-0000-000000000007', 'Nechta butun x va y sonlar jufti x² − y² = 17 tenglikni qanoatlantiradi?', 'Mavzu A', 3, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000369', '00000000-0000-0000-0001-000000000093', 'A) 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000370', '00000000-0000-0000-0001-000000000093', 'B) 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000371', '00000000-0000-0000-0001-000000000093', 'C) 1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000372', '00000000-0000-0000-0001-000000000093', 'D) 2', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000094', '00000000-0000-0000-0000-000000000007', '62·14·22·65 + 25·16·14 yig''indini 6 ga bo''lgandagi qoldiqni toping.', 'Mavzu A', 4, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000373', '00000000-0000-0000-0001-000000000094', 'A) 1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000374', '00000000-0000-0000-0001-000000000094', 'B) 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000375', '00000000-0000-0000-0001-000000000094', 'C) 5', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000376', '00000000-0000-0000-0001-000000000094', 'D) 4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000095', '00000000-0000-0000-0000-000000000007', 'a·b > 0, b⁴·c³ < 0 va a·c² > 0 bo''lsa, a, b, c larning ishorasi mos ravishda javobda keltirilgan?', 'Mavzu A', 5, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000377', '00000000-0000-0000-0001-000000000095', 'A) −, +, −', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000378', '00000000-0000-0000-0001-000000000095', 'B) −, −, +', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000379', '00000000-0000-0000-0001-000000000095', 'C) +, −, −', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000380', '00000000-0000-0000-0001-000000000095', 'D) +, +, −', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000096', '00000000-0000-0000-0000-000000000007', '1·7 + 2·14 + 3·21 + ... + 20·140 yig''indida har bir qo''shiluvchining ikkinchi ko''paytuvchisi 3 tadan kamaytirilsa, bu yig''indi qanchaga kamayadi?', 'Mavzu B', 6, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000381', '00000000-0000-0000-0001-000000000096', 'A) 630', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000382', '00000000-0000-0000-0001-000000000096', 'B) 420', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000383', '00000000-0000-0000-0001-000000000096', 'C) 374', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000384', '00000000-0000-0000-0001-000000000096', 'D) 465', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000097', '00000000-0000-0000-0000-000000000007', 'n ning nechta butun qiymatida n³ − 26n + 24 / n ifoda butun son bo''ladi?', 'Mavzu B', 7, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000385', '00000000-0000-0000-0001-000000000097', 'A) 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000386', '00000000-0000-0000-0001-000000000097', 'B) 6', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000387', '00000000-0000-0000-0001-000000000097', 'C) 16', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000388', '00000000-0000-0000-0001-000000000097', 'D) 8', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000098', '00000000-0000-0000-0000-000000000007', 'n ning nechta natural qiymatida n²−10n+18 / n ifoda butun son bo''ladi?', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000389', '00000000-0000-0000-0001-000000000098', 'A) 4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000390', '00000000-0000-0000-0001-000000000098', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000391', '00000000-0000-0000-0001-000000000098', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000392', '00000000-0000-0000-0001-000000000098', 'D) 10', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000099', '00000000-0000-0000-0000-000000000007', 'a = 3/4; b = a,b (a va b − raqamlar) bo''lsa, a + b ni toping.', 'Mavzu B', 9, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000393', '00000000-0000-0000-0001-000000000099', 'A) 7', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000394', '00000000-0000-0000-0001-000000000099', 'B) 9', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000395', '00000000-0000-0000-0001-000000000099', 'C) 5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000396', '00000000-0000-0000-0001-000000000099', 'D) 11', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000100', '00000000-0000-0000-0000-000000000007', 'n ning nechta butun qiymatida 54−n⁶+5n⁵ / n³ kasr musbat butun son bo''ladi?', 'Mavzu B', 10, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000397', '00000000-0000-0000-0001-000000000100', 'A) 2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000398', '00000000-0000-0000-0001-000000000100', 'B) 3', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000399', '00000000-0000-0000-0001-000000000100', 'C) 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000400', '00000000-0000-0000-0001-000000000100', 'D) 5', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000101', '00000000-0000-0000-0000-000000000007', 'x ning nechta natural qiymatida x²+3x+14 / x+1 ifoda butun qiymatlarni qabul qiladi?', 'Mavzu C', 11, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000401', '00000000-0000-0000-0001-000000000101', 'A) 5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000402', '00000000-0000-0000-0001-000000000101', 'B) 6', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000403', '00000000-0000-0000-0001-000000000101', 'C) 12', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000404', '00000000-0000-0000-0001-000000000101', 'D) 10', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000102', '00000000-0000-0000-0000-000000000007', '2·1/4 + n soni eng katta uch xonali natural songa teng bo''lsa, n nechaga teng?', 'Mavzu C', 12, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000405', '00000000-0000-0000-0001-000000000102', 'A) 996,75', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000406', '00000000-0000-0000-0001-000000000102', 'B) 1001,25', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000407', '00000000-0000-0000-0001-000000000102', 'C) 997,25', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000408', '00000000-0000-0000-0001-000000000102', 'D) 1000,75', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000103', '00000000-0000-0000-0000-000000000007', 'n + 4 ta n − 4 ko''paytmasining n ning qanday natural qiymatlarida n ga bo''linishi mumkin?', 'Mavzu C', 13, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000409', '00000000-0000-0000-0001-000000000103', 'A) cheksiz ko''p', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000410', '00000000-0000-0000-0001-000000000103', 'B) 2 ta', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000411', '00000000-0000-0000-0001-000000000103', 'C) 1 ta', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000412', '00000000-0000-0000-0001-000000000103', 'D) hech qanday qiymatida', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000104', '00000000-0000-0000-0000-000000000007', '2n+2n³−4−n⁴ / n−2 ifoda natural son bo''ladi.', 'Mavzu C', 14, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000413', '00000000-0000-0000-0001-000000000104', 'A) cheksiz ko''p', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000414', '00000000-0000-0000-0001-000000000104', 'B) 2 ta', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000415', '00000000-0000-0000-0001-000000000104', 'C) 1 ta', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000416', '00000000-0000-0000-0001-000000000104', 'D) hech qanday qiymatida', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000105', '00000000-0000-0000-0000-000000000007', 'n/n+3 kasrning qisqartirilmagan holida surat va maxraj yig''indisi.', 'Mavzu C', 15, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000417', '00000000-0000-0000-0001-000000000105', 'A) 2n+3', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000418', '00000000-0000-0000-0001-000000000105', 'B) n+3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000419', '00000000-0000-0000-0001-000000000105', 'C) 2n+6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000420', '00000000-0000-0000-0001-000000000105', 'D) n+6', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000008', 'Butun va ratsional sonlar - Variant 3', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000106', '00000000-0000-0000-0000-000000000008', 'Hisoblang: 3·6·9+9+18·27 / 1·2·3+3·6+9 yig''indini.', 'Mavzu A', 1, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000421', '00000000-0000-0000-0001-000000000106', 'A) 27', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000422', '00000000-0000-0000-0001-000000000106', 'B) 9', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000423', '00000000-0000-0000-0001-000000000106', 'C) 3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000424', '00000000-0000-0000-0001-000000000106', 'D) 18', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000107', '00000000-0000-0000-0000-000000000008', '(2009 + 2007) − (2008 + 2005) ni hisoblang.', 'Mavzu A', 2, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000425', '00000000-0000-0000-0001-000000000107', 'A) 1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000426', '00000000-0000-0000-0001-000000000107', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000427', '00000000-0000-0000-0001-000000000107', 'C) 3', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000428', '00000000-0000-0000-0001-000000000107', 'D) 4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000108', '00000000-0000-0000-0000-000000000008', 'Uch xonali sonning yuzlar xonasi 5 taga orttirildi, o''nlar xonasi 4 taga va birlar xonasi 1 taga kamaytirildi. Hosil bo''lgan yangi son qanday o''zgaradi?', 'Mavzu A', 3, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000429', '00000000-0000-0000-0001-000000000108', 'A) 457 ta ortadi', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000430', '00000000-0000-0000-0001-000000000108', 'B) 457 ta kamayadi', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000431', '00000000-0000-0000-0001-000000000108', 'C) 437 ta kamayadi', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000432', '00000000-0000-0000-0001-000000000108', 'D) 437 ta ortadi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000109', '00000000-0000-0000-0000-000000000008', 'a, b va c ratsional. b/a = a,b bo''lsa, a + b ni toping.', 'Mavzu A', 4, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000433', '00000000-0000-0000-0001-000000000109', 'A) 7', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000434', '00000000-0000-0000-0001-000000000109', 'B) 9', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000435', '00000000-0000-0000-0001-000000000109', 'C) 5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000436', '00000000-0000-0000-0001-000000000109', 'D) 11', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000110', '00000000-0000-0000-0000-000000000008', '5n−1 / n+3 ifodaning n ning nechta butun qiymatida butun son bo''lishini aniqlang.', 'Mavzu A', 5, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000437', '00000000-0000-0000-0001-000000000110', 'A) 8', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000438', '00000000-0000-0000-0001-000000000110', 'B) 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000439', '00000000-0000-0000-0001-000000000110', 'C) 8', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000440', '00000000-0000-0000-0001-000000000110', 'D) 3', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000111', '00000000-0000-0000-0000-000000000008', 'Sonning natural va butun ko''rsatkichli darajasi. 4·27/31+75/41+144/51=a bo''lsa, 4/31+7/41+9/51=?', 'Mavzu B', 6, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000441', '00000000-0000-0000-0001-000000000111', 'A) 3−a', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000442', '00000000-0000-0000-0001-000000000111', 'B) 6−a', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000443', '00000000-0000-0000-0001-000000000111', 'C) 3+a', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000444', '00000000-0000-0000-0001-000000000111', 'D) 5+a', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000112', '00000000-0000-0000-0000-000000000008', 'sin3x + sin2x + sinx = 0 tenglama (0; 2π) da nechta ildizga ega?', 'Mavzu B', 7, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000445', '00000000-0000-0000-0001-000000000112', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000446', '00000000-0000-0000-0001-000000000112', 'B) 5', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000447', '00000000-0000-0000-0001-000000000112', 'C) 7', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000448', '00000000-0000-0000-0001-000000000112', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000113', '00000000-0000-0000-0000-000000000008', '12·125^{13}·16^{10} + 27 soni necha xonali?', 'Mavzu B', 8, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000449', '00000000-0000-0000-0001-000000000113', 'A) 39', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000450', '00000000-0000-0000-0001-000000000113', 'B) 43', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000451', '00000000-0000-0000-0001-000000000113', 'C) 40', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000452', '00000000-0000-0000-0001-000000000113', 'D) 41', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000114', '00000000-0000-0000-0000-000000000008', '\overline{abcd} va \overline{bacd} to''rt xonali sonlar bo''lsa, \overline{abcd} − \overline{bacd} ayirma haqidagi fikrlardan qaysi biri noto''g''ri?', 'Mavzu B', 9, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000453', '00000000-0000-0000-0001-000000000114', 'A) 6 ga qoldiqsiz bo''linadi', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000454', '00000000-0000-0000-0001-000000000114', 'B) 37 ga qoldiqsiz bo''linadi', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000455', '00000000-0000-0000-0001-000000000114', 'C) 33 ga qoldiqsiz bo''linadi', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000456', '00000000-0000-0000-0001-000000000114', 'D) 11 ga qoldiqsiz bo''linadi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000115', '00000000-0000-0000-0000-000000000008', 'n+4 ta n−5 ning ko''paytmasining n ning qanday natural qiymatlarida n ga bo''linishi mumkin?', 'Mavzu B', 10, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000457', '00000000-0000-0000-0001-000000000115', 'A) cheksiz ko''p', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000458', '00000000-0000-0000-0001-000000000115', 'B) 2 ta', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000459', '00000000-0000-0000-0001-000000000115', 'C) 1 ta', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000460', '00000000-0000-0000-0001-000000000115', 'D) hech qanday qiymatida', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000116', '00000000-0000-0000-0000-000000000008', '[√2]+[√3]+[√4]+...+[√65]+[√66] ni hisoblang. ([a] − a sonning butun qismi)', 'Mavzu C', 11, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000461', '00000000-0000-0000-0001-000000000116', 'A) 331', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000462', '00000000-0000-0000-0001-000000000116', 'B) 321', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000463', '00000000-0000-0000-0001-000000000116', 'C) 339', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000464', '00000000-0000-0000-0001-000000000116', 'D) 323', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000117', '00000000-0000-0000-0000-000000000008', '[1/7]+[4/7]+[9/7]+...+[169/7] ni hisoblang. (bu yerda [a] − a sonning butun qismi)', 'Mavzu C', 12, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000465', '00000000-0000-0000-0001-000000000117', 'A) 116', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000466', '00000000-0000-0000-0001-000000000117', 'B) 114', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000467', '00000000-0000-0000-0001-000000000117', 'C) 115', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000468', '00000000-0000-0000-0001-000000000117', 'D) 113', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000118', '00000000-0000-0000-0000-000000000008', '2017^{2018}·2018^{2017} − 2016^{2018}·2015^{2019} sonlar birlar xonasidagi raqamni toping.', 'Mavzu C', 13, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000469', '00000000-0000-0000-0001-000000000118', 'A) 2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000470', '00000000-0000-0000-0001-000000000118', 'B) 0', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000471', '00000000-0000-0000-0001-000000000118', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000472', '00000000-0000-0000-0001-000000000118', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000119', '00000000-0000-0000-0000-000000000008', 'x ∈ {1, 2, 3, ..., 98, 99} ning qanday qiymatida ((√((x+2)/x) − √(1−2/(x+2))) : (√(1+2/x + x/(x+2) − 2)) : (1 + √(x/(x+2)))) ifodaning qiymati 73 ga eng yaqin bo''ladi?', 'Mavzu C', 14, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000473', '00000000-0000-0000-0001-000000000119', 'A) 5', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000474', '00000000-0000-0000-0001-000000000119', 'B) 72', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000475', '00000000-0000-0000-0001-000000000119', 'C) 3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000476', '00000000-0000-0000-0001-000000000119', 'D) −22', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000120', '00000000-0000-0000-0000-000000000008', 'f(x) = √(6+√(3−x)) + √(6+√(3+x)) funksiya uchun quyidagi fikrlardan qaysi biri o''rinli?', 'Mavzu C', 15, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000477', '00000000-0000-0000-0001-000000000120', 'A) x ning barcha qiymatlarida o''rinli', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000478', '00000000-0000-0000-0001-000000000120', 'B) juft funksiya', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000479', '00000000-0000-0000-0001-000000000120', 'C) toq ham emas, juft ham emas', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000480', '00000000-0000-0000-0001-000000000120', 'D) toq funksiya', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000009', 'Butun va ratsional sonlar - Variant 4', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000121', '00000000-0000-0000-0000-000000000009', '(−3)⁴ − (−3⁴) − 3² / ((−2)³ − (−2)³ + 2⁴) ni hisoblang.', 'Mavzu A', 1, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000481', '00000000-0000-0000-0001-000000000121', 'A) 153/16', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000482', '00000000-0000-0000-0001-000000000121', 'B) −9/16', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000483', '00000000-0000-0000-0001-000000000121', 'C) 153/32', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000484', '00000000-0000-0000-0001-000000000121', 'D) −9/32', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000122', '00000000-0000-0000-0000-000000000009', 'a, b va c raqamlarni ifodalamoqda. abc3 + abc = 5195 bo''lsa, a + b + c ning qiymatini toping.', 'Mavzu A', 2, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000485', '00000000-0000-0000-0001-000000000122', 'A) 15', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000486', '00000000-0000-0000-0001-000000000122', 'B) 19', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000487', '00000000-0000-0000-0001-000000000122', 'C) 13', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000488', '00000000-0000-0000-0001-000000000122', 'D) 21', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000123', '00000000-0000-0000-0000-000000000009', 'Agar m va n natural sonlar bo''lib, √3·(n−4) + n² − 6mn + 23, 5m = 0 tenglikni qanoatlantirsa, m + n ni toping.', 'Mavzu A', 3, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000489', '00000000-0000-0000-0001-000000000123', 'A) 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000490', '00000000-0000-0000-0001-000000000123', 'B) 36', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000491', '00000000-0000-0000-0001-000000000123', 'C) 12', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000492', '00000000-0000-0000-0001-000000000123', 'D) 20', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000124', '00000000-0000-0000-0000-000000000009', 'x² + y² = 5 bo''lsa, sin²2x + 4cos²x ning eng katta qiymati.', 'Mavzu A', 4, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000493', '00000000-0000-0000-0001-000000000124', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000494', '00000000-0000-0000-0001-000000000124', 'B) 5', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000495', '00000000-0000-0000-0001-000000000124', 'C) 7', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000496', '00000000-0000-0000-0001-000000000124', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000125', '00000000-0000-0000-0000-000000000009', 'Uch xonali sonning birlar xonasi 5 taga orttirildi. Hosil bo''lgan yangi son qanday o''zgaradi?', 'Mavzu A', 5, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000497', '00000000-0000-0000-0001-000000000125', 'A) 457 ta ortadi', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000498', '00000000-0000-0000-0001-000000000125', 'B) 457 ta kamayadi', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000499', '00000000-0000-0000-0001-000000000125', 'C) 437 ta kamayadi', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000500', '00000000-0000-0000-0001-000000000125', 'D) 437 ta ortadi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000126', '00000000-0000-0000-0000-000000000009', 'x va y musbat butun sonlar. −x/y|7/4 Yuqoridagi bo''linmadan x eng ko''pida necha bo''lishi mumkin?', 'Mavzu B', 6, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000501', '00000000-0000-0000-0001-000000000126', 'A) 32', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000502', '00000000-0000-0000-0001-000000000126', 'B) 35', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000503', '00000000-0000-0000-0001-000000000126', 'C) 34', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000504', '00000000-0000-0000-0001-000000000126', 'D) 36', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000127', '00000000-0000-0000-0000-000000000009', 'Ikki sonning yig''indisi 242ga, bu sonlardan kattasi kichigiga bo''lganda bo''linma 4 ga, qoldiq esa 22 ga teng. Sonlardan kichigini toping.', 'Mavzu B', 7, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000505', '00000000-0000-0000-0001-000000000127', 'A) 52', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000506', '00000000-0000-0000-0001-000000000127', 'B) 44', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000507', '00000000-0000-0000-0001-000000000127', 'C) 42', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000508', '00000000-0000-0000-0001-000000000127', 'D) 56', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000128', '00000000-0000-0000-0000-000000000009', '12·125^{13}·16^{10} + 27 soni necha xonali?', 'Mavzu B', 8, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000509', '00000000-0000-0000-0001-000000000128', 'A) 39', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000510', '00000000-0000-0000-0001-000000000128', 'B) 43', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000511', '00000000-0000-0000-0001-000000000128', 'C) 40', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000512', '00000000-0000-0000-0001-000000000128', 'D) 41', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000129', '00000000-0000-0000-0000-000000000009', 'n ning nechta butun qiymatida 54−n⁶+5n⁵ / n³ kasr musbat butun son bo''ladi?', 'Mavzu B', 9, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000513', '00000000-0000-0000-0001-000000000129', 'A) 2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000514', '00000000-0000-0000-0001-000000000129', 'B) 3', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000515', '00000000-0000-0000-0001-000000000129', 'C) 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000516', '00000000-0000-0000-0001-000000000129', 'D) 5', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000130', '00000000-0000-0000-0000-000000000009', 'a sonini 35 ga bo''lganda bo''linma b ga, qoldiq c ga teng bo''ladi. Agar b ni 8 ga va c ni 3 ga bo''lib olganda, bo''lganda a ni qanday ifodalash mumkin?', 'Mavzu B', 10, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000517', '00000000-0000-0000-0001-000000000130', 'A) k = mp + c', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000518', '00000000-0000-0000-0001-000000000130', 'B) m = pk + c', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000519', '00000000-0000-0000-0001-000000000130', 'C) (m/k) = p + (c/k)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000520', '00000000-0000-0000-0001-000000000130', 'D) m = pk − c', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000131', '00000000-0000-0000-0000-000000000009', 'n ning nechta butun qiymatida n²−10n+18 / n ifoda butun son bo''ladi?', 'Mavzu C', 11, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000521', '00000000-0000-0000-0001-000000000131', 'A) 4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000522', '00000000-0000-0000-0001-000000000131', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000523', '00000000-0000-0000-0001-000000000131', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000524', '00000000-0000-0000-0001-000000000131', 'D) 10', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000132', '00000000-0000-0000-0000-000000000009', '[√2]+[√3]+[√4]+...+[√65]+[√66] ni hisoblang.', 'Mavzu C', 12, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000525', '00000000-0000-0000-0001-000000000132', 'A) 331', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000526', '00000000-0000-0000-0001-000000000132', 'B) 321', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000527', '00000000-0000-0000-0001-000000000132', 'C) 339', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000528', '00000000-0000-0000-0001-000000000132', 'D) 323', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000133', '00000000-0000-0000-0000-000000000009', 'Quyidagi kasrlarni qoldiqsiz bo''linadigan eng kichik natural son topish kerak: 1) 121·484; 2) 77·246; 3) 243·22; 4) 55·231; 5) 88·27.', 'Mavzu C', 13, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000529', '00000000-0000-0000-0001-000000000133', 'A) 2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000530', '00000000-0000-0000-0001-000000000133', 'B) 3', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000531', '00000000-0000-0000-0001-000000000133', 'C) 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000532', '00000000-0000-0000-0001-000000000133', 'D) 5', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000134', '00000000-0000-0000-0000-000000000009', '1872368154634528 sonini 2, 4, 5, 9, 10 va 25 larga bo''lgandagi qoldiqlar yig''indisini toping.', 'Mavzu C', 14, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000533', '00000000-0000-0000-0001-000000000134', 'A) 11', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000534', '00000000-0000-0000-0001-000000000134', 'B) 15', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000535', '00000000-0000-0000-0001-000000000134', 'C) 17', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000536', '00000000-0000-0000-0001-000000000134', 'D) 19', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000135', '00000000-0000-0000-0000-000000000009', 'Besh xonali 45n8m soni 5 ga bo''lganda 3 qoldiq, 18 ga bo''lganda 0 ga teng. m·n ko''paytmaning qiymatini toping.', 'Mavzu C', 15, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000537', '00000000-0000-0000-0001-000000000135', 'A) aniqlab bo''lmaydi', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000538', '00000000-0000-0000-0001-000000000135', 'B) 3', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000539', '00000000-0000-0000-0001-000000000135', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000540', '00000000-0000-0000-0001-000000000135', 'D) 9', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000010', 'Butun va ratsional sonlar - Variant 5', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000136', '00000000-0000-0000-0000-000000000010', '62·10·20 + 6·10·20 yig''indini 6 ga bo''lgandagi qoldiqni toping.', 'Mavzu A', 1, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000541', '00000000-0000-0000-0001-000000000136', 'A) 1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000542', '00000000-0000-0000-0001-000000000136', 'B) 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000543', '00000000-0000-0000-0001-000000000136', 'C) 5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000544', '00000000-0000-0000-0001-000000000136', 'D) 0', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000137', '00000000-0000-0000-0000-000000000010', 'Nechta butun x va y sonlar jufti x² − y² = 17 tenglikni qanoatlantiradi?', 'Mavzu A', 2, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000545', '00000000-0000-0000-0001-000000000137', 'A) 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000546', '00000000-0000-0000-0001-000000000137', 'B) 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000547', '00000000-0000-0000-0001-000000000137', 'C) 1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000548', '00000000-0000-0000-0001-000000000137', 'D) 2', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000138', '00000000-0000-0000-0000-000000000010', '1·2 + 2·3 + ... + n·(n+1) yig''indini hisoblang.', 'Mavzu A', 3, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000549', '00000000-0000-0000-0001-000000000138', 'A) n(n+1)(n+2)/3', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000550', '00000000-0000-0000-0001-000000000138', 'B) n(n+1)/2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000551', '00000000-0000-0000-0001-000000000138', 'C) n(n+2)/3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000552', '00000000-0000-0000-0001-000000000138', 'D) n(n+1)(n+2)/6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000139', '00000000-0000-0000-0000-000000000010', 'sin3x + sin2x + sinx = 0 tenglama (0; 2π) da nechta ildizga ega?', 'Mavzu A', 4, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000553', '00000000-0000-0000-0001-000000000139', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000554', '00000000-0000-0000-0001-000000000139', 'B) 5', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000555', '00000000-0000-0000-0001-000000000139', 'C) 7', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000556', '00000000-0000-0000-0001-000000000139', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000140', '00000000-0000-0000-0000-000000000010', '(2009 + 2007) − (2008 + 2005) ni hisoblang.', 'Mavzu A', 5, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000557', '00000000-0000-0000-0001-000000000140', 'A) 1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000558', '00000000-0000-0000-0001-000000000140', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000559', '00000000-0000-0000-0001-000000000140', 'C) 3', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000560', '00000000-0000-0000-0001-000000000140', 'D) 4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000141', '00000000-0000-0000-0000-000000000010', 'x ning nechta natural qiymatida x²+3x+14 / x+1 ifoda butun qiymatlarni qabul qiladi?', 'Mavzu B', 6, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000561', '00000000-0000-0000-0001-000000000141', 'A) 5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000562', '00000000-0000-0000-0001-000000000141', 'B) 6', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000563', '00000000-0000-0000-0001-000000000141', 'C) 12', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000564', '00000000-0000-0000-0001-000000000141', 'D) 10', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000142', '00000000-0000-0000-0000-000000000010', '5n−1 / n+3 ning n ning nechta butun qiymatida butun son bo''ladi?', 'Mavzu B', 7, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000565', '00000000-0000-0000-0001-000000000142', 'A) 8', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000566', '00000000-0000-0000-0001-000000000142', 'B) 6', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000567', '00000000-0000-0000-0001-000000000142', 'C) 3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000568', '00000000-0000-0000-0001-000000000142', 'D) 4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000143', '00000000-0000-0000-0000-000000000010', 'Uch xonali sonning yuzlar xonasi 5 taga, o''nlar xonasi 4 taga va birlar xonasi 1 taga kamaytirildi. Hosil bo''lgan yangi son qanday o''zgaradi?', 'Mavzu B', 8, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000569', '00000000-0000-0000-0001-000000000143', 'A) 457 ta ortadi', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000570', '00000000-0000-0000-0001-000000000143', 'B) 457 ta kamayadi', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000571', '00000000-0000-0000-0001-000000000143', 'C) 437 ta kamayadi', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000572', '00000000-0000-0000-0001-000000000143', 'D) 437 ta ortadi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000144', '00000000-0000-0000-0000-000000000010', 'n²+3n+2 / 3−n ning n ning nechta natural qiymatida natural son bo''ladi?', 'Mavzu B', 9, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000573', '00000000-0000-0000-0001-000000000144', 'A) 4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000574', '00000000-0000-0000-0001-000000000144', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000575', '00000000-0000-0000-0001-000000000144', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000576', '00000000-0000-0000-0001-000000000144', 'D) 10', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000145', '00000000-0000-0000-0000-000000000010', '(−3)⁴ − (−3⁴) − 3² / ((−2)³ − (−2)³ + 2⁴) ni hisoblang.', 'Mavzu B', 10, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000577', '00000000-0000-0000-0001-000000000145', 'A) 153/16', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000578', '00000000-0000-0000-0001-000000000145', 'B) −9/16', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000579', '00000000-0000-0000-0001-000000000145', 'C) 153/32', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000580', '00000000-0000-0000-0001-000000000145', 'D) −9/32', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000146', '00000000-0000-0000-0000-000000000010', 'Quyidagi tasdiqlardan qaysi biri noto''g''ri? A) Agar natural sonning oxirgi raqami 2 ga bo''linsa, bu sonning o''zi ham 2 ga bo''linadi. B) Agar natural son 2 ga va 3 ga bo''linsa, bu son 6 ga bo''linadi. C) Agar natural son 2 ga va 9 ga bo''linsa, bu son 18ga ham bo''linadi. D) Agar natural sonning oxirgi raqami 5 ga bo''linsa, bu son 10 ga bo''linadi.', 'Mavzu C', 11, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000581', '00000000-0000-0000-0001-000000000146', 'A) A', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000582', '00000000-0000-0000-0001-000000000146', 'B) B', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000583', '00000000-0000-0000-0001-000000000146', 'C) C', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000584', '00000000-0000-0000-0001-000000000146', 'D) D', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000147', '00000000-0000-0000-0000-000000000010', 'x ∈ {1,2,...,98,99} ning qanday qiymatida ifodaning qiymati 73 ga eng yaqin bo''ladi?', 'Mavzu C', 12, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000585', '00000000-0000-0000-0001-000000000147', 'A) 5', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000586', '00000000-0000-0000-0001-000000000147', 'B) 72', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000587', '00000000-0000-0000-0001-000000000147', 'C) 3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000588', '00000000-0000-0000-0001-000000000147', 'D) −22', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000148', '00000000-0000-0000-0000-000000000010', '[1/7]+[4/7]+[9/7]+...+[169/7] ni hisoblang.', 'Mavzu C', 13, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000589', '00000000-0000-0000-0001-000000000148', 'A) 116', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000590', '00000000-0000-0000-0001-000000000148', 'B) 114', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000591', '00000000-0000-0000-0001-000000000148', 'C) 115', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000592', '00000000-0000-0000-0001-000000000148', 'D) 113', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000149', '00000000-0000-0000-0000-000000000010', '2017^{2018}·2018^{2017} − 2016^{2018}·2015^{2019} sonlar birlar xonasidagi raqamni toping.', 'Mavzu C', 14, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000593', '00000000-0000-0000-0001-000000000149', 'A) 2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000594', '00000000-0000-0000-0001-000000000149', 'B) 0', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000595', '00000000-0000-0000-0001-000000000149', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000596', '00000000-0000-0000-0001-000000000149', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000150', '00000000-0000-0000-0000-000000000010', 'y = 39·1/16 bo''lgandagi ifodaning qiymatini toping: x^{1/4}·y^{-1/4} − x^{-1/4}·y^{1/4} + 1 / (x^{-1/4} − 1)', 'Mavzu C', 15, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000597', '00000000-0000-0000-0001-000000000150', 'A) 21/4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000598', '00000000-0000-0000-0001-000000000150', 'B) 7/4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000599', '00000000-0000-0000-0001-000000000150', 'C) 5/2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000600', '00000000-0000-0000-0001-000000000150', 'D) 3/2', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000011', 'Algebraik ifodalar - Variant 1', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000151', '00000000-0000-0000-0000-000000000011', '(a+b)⁴ − 4ab(a+b)² + 2a²b² ni soddalashtiring.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000601', '00000000-0000-0000-0001-000000000151', 'A) a⁴−b⁴', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000602', '00000000-0000-0000-0001-000000000151', 'B) a⁴+b⁴', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000603', '00000000-0000-0000-0001-000000000151', 'C) a²−ab+b²', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000604', '00000000-0000-0000-0001-000000000151', 'D) a²+ab+b²', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000152', '00000000-0000-0000-0000-000000000011', 'ab + 4a(11b − a) − a(a − 3) − 27b ko''phadni ko''paytuvchilarga ajrating.', 'Mavzu A', 2, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000605', '00000000-0000-0000-0001-000000000152', 'A) (3a−5)(9b−a)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000606', '00000000-0000-0000-0001-000000000152', 'B) (5a−3)(a−9b)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000607', '00000000-0000-0000-0001-000000000152', 'C) (9b−a)(3a−5)', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000608', '00000000-0000-0000-0001-000000000152', 'D) (5a−3)(9b−a)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000153', '00000000-0000-0000-0000-000000000011', '(x² + 2)·P(x) = x⁷ + x⁴ + 4 bo''lsa, a + b = ?', 'Mavzu A', 3, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000609', '00000000-0000-0000-0001-000000000153', 'A) −23', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000610', '00000000-0000-0000-0001-000000000153', 'B) 9', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000611', '00000000-0000-0000-0001-000000000153', 'C) 12', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000612', '00000000-0000-0000-0001-000000000153', 'D) 23', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000154', '00000000-0000-0000-0000-000000000011', 'P(x) = (x² + 5x − 3)·(7x³ − 6x³ + 5x)(x + 3) ko''phadning koeffitsiyentlari yig''indisini toping.', 'Mavzu A', 4, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000613', '00000000-0000-0000-0001-000000000154', 'A) 72', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000614', '00000000-0000-0000-0001-000000000154', 'B) −9', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000615', '00000000-0000-0000-0001-000000000154', 'C) 0', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000616', '00000000-0000-0000-0001-000000000154', 'D) 54', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000155', '00000000-0000-0000-0000-000000000011', '2x + 7 / x² − 2x − 3 = A / x − 3 + B / x + 1 bo''lsa, A + B = ?', 'Mavzu A', 5, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000617', '00000000-0000-0000-0001-000000000155', 'A) −3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000618', '00000000-0000-0000-0001-000000000155', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000619', '00000000-0000-0000-0001-000000000155', 'C) −1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000620', '00000000-0000-0000-0001-000000000155', 'D) 0', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000156', '00000000-0000-0000-0000-000000000011', 'a² − 5ab + 6b² / (a² − 2ab − 8b²) ni soddalashtiring.', 'Mavzu B', 6, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000621', '00000000-0000-0000-0001-000000000156', 'A) (a−2b)/(a+3b)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000622', '00000000-0000-0000-0001-000000000156', 'B) (a−2b)/(a+2b)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000623', '00000000-0000-0000-0001-000000000156', 'C) (a−3b)/(a−4b)', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000624', '00000000-0000-0000-0001-000000000156', 'D) (a−4b)·(a+3b) / (a−3b)·(a+2b)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000157', '00000000-0000-0000-0000-000000000011', '12ab − 9b² / (9b² − 16a²) ni soddalashtiring.', 'Mavzu B', 7, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000625', '00000000-0000-0000-0001-000000000157', 'A) −3/(3b−4a)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000626', '00000000-0000-0000-0001-000000000157', 'B) 3b/(3b−4a)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000627', '00000000-0000-0000-0001-000000000157', 'C) 3/(4a+3b)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000628', '00000000-0000-0000-0001-000000000157', 'D) −3b/(3b−4a)', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000158', '00000000-0000-0000-0000-000000000011', 'x² − 1 + 2(xy − 1) − (−y² + 1) / (2 − x − y) ni soddalashtiring.', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000629', '00000000-0000-0000-0001-000000000158', 'A) x + y − 2', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000630', '00000000-0000-0000-0001-000000000158', 'B) x − y + 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000631', '00000000-0000-0000-0001-000000000158', 'C) x − y − 2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000632', '00000000-0000-0000-0001-000000000158', 'D) −x − y − 2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000159', '00000000-0000-0000-0000-000000000011', '(a³ + b³ / (a + b) − (a − b)³ / (a − b)) : b ni soddalashtiring.', 'Mavzu B', 9, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000633', '00000000-0000-0000-0001-000000000159', 'A) 3a', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000634', '00000000-0000-0000-0001-000000000159', 'B) 3ab', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000635', '00000000-0000-0000-0001-000000000159', 'C) ab', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000636', '00000000-0000-0000-0001-000000000159', 'D) a', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000160', '00000000-0000-0000-0000-000000000011', 'a⁸ + a⁴ + 1 / (a⁶ − 1) ni soddalashtiring.', 'Mavzu B', 10, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000637', '00000000-0000-0000-0001-000000000160', 'A) (a²+1)² / (a−1)(a+1)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000638', '00000000-0000-0000-0001-000000000160', 'B) (a⁴+a²+1) / a²+1', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000639', '00000000-0000-0000-0001-000000000160', 'C) (a²+1)² / (a−1)²', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000640', '00000000-0000-0000-0001-000000000160', 'D) (a+1)² / (a−1)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000161', '00000000-0000-0000-0000-000000000011', '\sqrt{3 + 4√(-2 + 4√15 + 6√6)} ni hisoblang.', 'Mavzu C', 11, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000641', '00000000-0000-0000-0001-000000000161', 'A) √6+2', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000642', '00000000-0000-0000-0001-000000000161', 'B) 4 + √2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000643', '00000000-0000-0000-0001-000000000161', 'C) 2(3+2√2)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000644', '00000000-0000-0000-0001-000000000161', 'D) √3+2√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000162', '00000000-0000-0000-0000-000000000011', 'a = 7 − √40 bo''lsa, 2√a + 2√2 ni toping.', 'Mavzu C', 12, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000645', '00000000-0000-0000-0001-000000000162', 'A) √5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000646', '00000000-0000-0000-0001-000000000162', 'B) √20', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000647', '00000000-0000-0000-0001-000000000162', 'C) −√10', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000648', '00000000-0000-0000-0001-000000000162', 'D) 4√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000163', '00000000-0000-0000-0000-000000000011', '\sqrt{15 − 9√3 + √2 + 4√3 − 2√4 − 2√3} ni hisoblang.', 'Mavzu C', 13, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000649', '00000000-0000-0000-0001-000000000163', 'A) 2√3−2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000650', '00000000-0000-0000-0001-000000000163', 'B) 2√3+1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000651', '00000000-0000-0000-0001-000000000163', 'C) 2√3−1', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000652', '00000000-0000-0000-0001-000000000163', 'D) 2√3+2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000164', '00000000-0000-0000-0000-000000000011', '\sqrt{7 − 3√5,(3)} + \sqrt{7 + 3√5,(3)} / √2 ni hisoblang.', 'Mavzu C', 14, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000653', '00000000-0000-0000-0001-000000000164', 'A) 2√3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000654', '00000000-0000-0000-0001-000000000164', 'B) √6', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000655', '00000000-0000-0000-0001-000000000164', 'C) 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000656', '00000000-0000-0000-0001-000000000164', 'D) 2√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000165', '00000000-0000-0000-0000-000000000011', '\frac{5\sqrt[5]{7·\sqrt[3]{54}} + 15\sqrt[5]{128}}{3\sqrt[4]{4·\sqrt[3]{32}} + 3\sqrt[9]{4·\sqrt[3]{162}}} ni hisoblang.', 'Mavzu C', 15, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000657', '00000000-0000-0000-0001-000000000165', 'A) 2^{5/12}', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000658', '00000000-0000-0000-0001-000000000165', 'B) 1/\sqrt[4]{2}', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000659', '00000000-0000-0000-0001-000000000165', 'C) −1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000660', '00000000-0000-0000-0001-000000000165', 'D) 1', true, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000012', 'Algebraik ifodalar - Variant 2', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000166', '00000000-0000-0000-0000-000000000012', '(x⁴+5x²−3)·(−3x+ay)·(βx−2y) = x²+4xy+2y² ayniyatdagi noma''lum koeffitsiyentlardan biri β ni toping.', 'Mavzu A', 1, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000661', '00000000-0000-0000-0001-000000000166', 'A) 3', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000662', '00000000-0000-0000-0001-000000000166', 'B) 1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000663', '00000000-0000-0000-0001-000000000166', 'C) 2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000664', '00000000-0000-0000-0001-000000000166', 'D) −1', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000167', '00000000-0000-0000-0000-000000000012', '(1−x²)·(x²+x+1)·(x⁵+x⁴+4) ifodani soddalashtiring, nechta haddan keyin bo''ladi?', 'Mavzu A', 2, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000665', '00000000-0000-0000-0001-000000000167', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000666', '00000000-0000-0000-0001-000000000167', 'B) 4', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000667', '00000000-0000-0000-0001-000000000167', 'C) 8', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000668', '00000000-0000-0000-0001-000000000167', 'D) 10', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000168', '00000000-0000-0000-0000-000000000012', 'P(x) = (x²−5x−3)·Q(x − 1) + 3(2x+4) ko''phadni x−1 ga qoldiqsiz bo''linishi uchun Q(x) ko''phadining ozod hadini nechaga teng bo''lishi kerak?', 'Mavzu A', 3, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000669', '00000000-0000-0000-0001-000000000168', 'A) 2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000670', '00000000-0000-0000-0001-000000000168', 'B) −1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000671', '00000000-0000-0000-0001-000000000168', 'C) −2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000672', '00000000-0000-0000-0001-000000000168', 'D) 1', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000169', '00000000-0000-0000-0000-000000000012', '7 + 9 + 11 + ... + (2n+1) = an² + bn + c ning a, b + c yig''indisi.', 'Mavzu A', 4, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000673', '00000000-0000-0000-0001-000000000169', 'A) 0', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000674', '00000000-0000-0000-0001-000000000169', 'B) 4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000675', '00000000-0000-0000-0001-000000000169', 'C) −5', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000676', '00000000-0000-0000-0001-000000000169', 'D) −6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000170', '00000000-0000-0000-0000-000000000012', '(x⁴+5x²+2)·(x⁴+5x²−6) ifodani (x²+2)·P(x) ko''rinishga keltirsak, P(x) ko''phadning koeffitsiyentlari yig''indisi 13 ga teng bo''lsa, Q(x) ko''phadning ozod hadini toping.', 'Mavzu A', 5, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000677', '00000000-0000-0000-0001-000000000170', 'A) 2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000678', '00000000-0000-0000-0001-000000000170', 'B) −1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000679', '00000000-0000-0000-0001-000000000170', 'C) −2', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000680', '00000000-0000-0000-0001-000000000170', 'D) 1', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000171', '00000000-0000-0000-0000-000000000012', '(2−a)(1+a) / (b+2)(b−4) = (a−2)(a+1) / (−b−2)(4−b) tenglikni soddalashtiring.', 'Mavzu B', 6, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000681', '00000000-0000-0000-0001-000000000171', 'A) 1, 4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000682', '00000000-0000-0000-0001-000000000171', 'B) 2, 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000683', '00000000-0000-0000-0001-000000000171', 'C) 2, 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000684', '00000000-0000-0000-0001-000000000171', 'D) 1, 3', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000172', '00000000-0000-0000-0000-000000000012', 'x² − 1 + 2(xy − 1) − (−y² + 1) / 2 − x − y ni soddalashtiring.', 'Mavzu B', 7, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000685', '00000000-0000-0000-0001-000000000172', 'A) x + y − 2', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000686', '00000000-0000-0000-0001-000000000172', 'B) x − y + 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000687', '00000000-0000-0000-0001-000000000172', 'C) x − y − 2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000688', '00000000-0000-0000-0001-000000000172', 'D) −x − y − 2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000173', '00000000-0000-0000-0000-000000000012', 'a² − 2ab − 3b² / (a² − b²) − 1 ni soddalashtiring.', 'Mavzu B', 8, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000689', '00000000-0000-0000-0001-000000000173', 'A) a/(a−b)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000690', '00000000-0000-0000-0001-000000000173', 'B) b/(b−a)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000691', '00000000-0000-0000-0001-000000000173', 'C) 1/(b−a)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000692', '00000000-0000-0000-0001-000000000173', 'D) a/(b−a)', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000174', '00000000-0000-0000-0000-000000000012', '(1+x/x−1 − x−1/1+x) : ((1+x/1−x − 1)·(1 − 1/1+x)) ni soddalashtiring.', 'Mavzu B', 9, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000693', '00000000-0000-0000-0001-000000000174', 'A) x/2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000694', '00000000-0000-0000-0001-000000000174', 'B) −2/x', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000695', '00000000-0000-0000-0001-000000000174', 'C) 2/x', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000696', '00000000-0000-0000-0001-000000000174', 'D) 1/x', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000175', '00000000-0000-0000-0000-000000000012', 'x³+x⁴+1 / (x⁶−1) : (x⁸+1 / x⁶−1) ni soddalashtiring.', 'Mavzu B', 10, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000697', '00000000-0000-0000-0001-000000000175', 'A) x⁴−1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000698', '00000000-0000-0000-0001-000000000175', 'B) x²+1', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000699', '00000000-0000-0000-0001-000000000175', 'C) x²−1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000700', '00000000-0000-0000-0001-000000000175', 'D) x⁴+1', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000176', '00000000-0000-0000-0000-000000000012', '(a+b/³√a²−³√ab+³√b² + ⁶√a² − ²√(ab) / ⁶√a²−2³√ab+⁶√b²) : (⁶√a − ⁶√b) ni soddalashtiring.', 'Mavzu C', 11, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000701', '00000000-0000-0000-0001-000000000176', 'A) ³√a² + 1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000702', '00000000-0000-0000-0001-000000000176', 'B) ·³√a + 1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000703', '00000000-0000-0000-0001-000000000176', 'C) (³√a + 1)²', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000704', '00000000-0000-0000-0001-000000000176', 'D) ³√a − 1', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000177', '00000000-0000-0000-0000-000000000012', '\sqrt{0,09} + √0,16 − √0,81 + √2,56 ni hisoblang.', 'Mavzu C', 12, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000705', '00000000-0000-0000-0001-000000000177', 'A) 1,2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000706', '00000000-0000-0000-0001-000000000177', 'B) 1,4', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000707', '00000000-0000-0000-0001-000000000177', 'C) 1,6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000708', '00000000-0000-0000-0001-000000000177', 'D) 0,12', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000178', '00000000-0000-0000-0000-000000000012', '1+√7/√4+√7 + 1−√5/√3−√5 ni hisoblang.', 'Mavzu C', 13, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000709', '00000000-0000-0000-0001-000000000178', 'A) 0', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000710', '00000000-0000-0000-0001-000000000178', 'B) 2√2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000711', '00000000-0000-0000-0001-000000000178', 'C) √5−√7', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000712', '00000000-0000-0000-0001-000000000178', 'D) √5−√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000179', '00000000-0000-0000-0000-000000000012', '2 / (√8 − ⁴√2) ni ratsionallashtirib soddalashtiring.', 'Mavzu C', 14, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000713', '00000000-0000-0000-0001-000000000179', 'A) 2⁴√2 + √8', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000714', '00000000-0000-0000-0001-000000000179', 'B) ⁴√8 − √2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000715', '00000000-0000-0000-0001-000000000179', 'C) 2 − √2', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000716', '00000000-0000-0000-0001-000000000179', 'D) 2⁴√8 + 2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000180', '00000000-0000-0000-0000-000000000012', '⁴√216x³(5+2√6) · √3·√2x − 2√3x ni soddalashtiring.', 'Mavzu C', 15, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000717', '00000000-0000-0000-0001-000000000180', 'A) −x', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000718', '00000000-0000-0000-0001-000000000180', 'B) ⁴√3x', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000719', '00000000-0000-0000-0001-000000000180', 'C) √2x', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000720', '00000000-0000-0000-0001-000000000180', 'D) 6x', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000013', 'Algebraik ifodalar - Variant 3', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000181', '00000000-0000-0000-0000-000000000013', 'P(x) = (4x² + 7x − 5)·(9x² − 6x³ + 5x)(x + 3) ko''phadni x + 2 ga bo''lgandagi qoldiqni toping.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000721', '00000000-0000-0000-0001-000000000181', 'A) 72', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000722', '00000000-0000-0000-0001-000000000181', 'B) −9', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000723', '00000000-0000-0000-0001-000000000181', 'C) 0', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000724', '00000000-0000-0000-0001-000000000181', 'D) 54', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000182', '00000000-0000-0000-0000-000000000013', '(x−4)⁵ ifodani ochiqlagandan keyin nechta had bo''ladi?', 'Mavzu A', 2, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000725', '00000000-0000-0000-0001-000000000182', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000726', '00000000-0000-0000-0001-000000000182', 'B) 4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000727', '00000000-0000-0000-0001-000000000182', 'C) 8', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000728', '00000000-0000-0000-0001-000000000182', 'D) 6', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000183', '00000000-0000-0000-0000-000000000013', 'ab + 4a(11b − a) − a(a − 3) − 27b ko''phadni ko''paytuvchilarga ajrating.', 'Mavzu A', 3, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000729', '00000000-0000-0000-0001-000000000183', 'A) (3a−5)(9b−a)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000730', '00000000-0000-0000-0001-000000000183', 'B) (5a−3)(a−9b)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000731', '00000000-0000-0000-0001-000000000183', 'C) (9b−a)(3a−5)', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000732', '00000000-0000-0000-0001-000000000183', 'D) (5a−3)(9b−a)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000184', '00000000-0000-0000-0000-000000000013', '(x⁴+5x²+2)·(x⁴+5x²−6) ifodani P(x) ko''rinishga keltirsak, P(x) ning ozod hadi nechaga teng?', 'Mavzu A', 4, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000733', '00000000-0000-0000-0001-000000000184', 'A) −12', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000734', '00000000-0000-0000-0001-000000000184', 'B) 12', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000735', '00000000-0000-0000-0001-000000000184', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000736', '00000000-0000-0000-0001-000000000184', 'D) −6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000185', '00000000-0000-0000-0000-000000000013', 'P(x) = (x² − 5x − 3)·Q(x) + 6 bo''lsa, P(x) ko''phadni x − 3 ga bo''lgandagi qoldiqni toping.', 'Mavzu A', 5, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000737', '00000000-0000-0000-0001-000000000185', 'A) 3x² − 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000738', '00000000-0000-0000-0001-000000000185', 'B) 3x² − x + 4', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000739', '00000000-0000-0000-0001-000000000185', 'C) 3x² + x + 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000740', '00000000-0000-0000-0001-000000000185', 'D) 3x² + 4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000186', '00000000-0000-0000-0000-000000000013', '4/(a²−2x) = a/(x−2) + b/x tenglik o''rinli bo''lsa, a = ? b = ?', 'Mavzu B', 6, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000741', '00000000-0000-0000-0001-000000000186', 'A) a = −2; b = 2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000742', '00000000-0000-0000-0001-000000000186', 'B) a = 3; b = 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000743', '00000000-0000-0000-0001-000000000186', 'C) a = 2; b = −2', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000744', '00000000-0000-0000-0001-000000000186', 'D) a = −2; b = −2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000187', '00000000-0000-0000-0000-000000000013', '(a+b/2b+a + 6b²+5ab / a²−4b²) : (4b − 2a) ni soddalashtiring.', 'Mavzu B', 7, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000745', '00000000-0000-0000-0001-000000000187', 'A) a/(a−b)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000746', '00000000-0000-0000-0001-000000000187', 'B) b/(b−a)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000747', '00000000-0000-0000-0001-000000000187', 'C) 1/(b−a)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000748', '00000000-0000-0000-0001-000000000187', 'D) a/(b−a)', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000188', '00000000-0000-0000-0000-000000000013', 'x/(x−1) − x/(x+1) : 1/(x − 1/x) = ?', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000749', '00000000-0000-0000-0001-000000000188', 'A) 1', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000750', '00000000-0000-0000-0001-000000000188', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000751', '00000000-0000-0000-0001-000000000188', 'C) 17/3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000752', '00000000-0000-0000-0001-000000000188', 'D) Hisoblab bo''lmaydi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000189', '00000000-0000-0000-0000-000000000013', 'a³ + 27b³ / (a² − 9b²) · (2a − 7b / (a² − 3ab + 9b²)) ni soddalashtiring.', 'Mavzu B', 9, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000753', '00000000-0000-0000-0001-000000000189', 'A) a/(a−b)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000754', '00000000-0000-0000-0001-000000000189', 'B) b/(b−a)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000755', '00000000-0000-0000-0001-000000000189', 'C) 3/(a+b)', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000756', '00000000-0000-0000-0001-000000000189', 'D) a/(b−a)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000190', '00000000-0000-0000-0000-000000000013', 'a+√a+1 / √a−⁴√a+1 · (1 − 1/(a−√a)^{1/2} + √a / √a−⁴√a+1) ni soddalashtiring.', 'Mavzu B', 10, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000757', '00000000-0000-0000-0001-000000000190', 'A) 6√2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000758', '00000000-0000-0000-0001-000000000190', 'B) √a − 1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000759', '00000000-0000-0000-0001-000000000190', 'C) √a + ⁴√a + 1', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000760', '00000000-0000-0000-0001-000000000190', 'D) √a + ⁴√a', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000191', '00000000-0000-0000-0000-000000000013', 'y = 3√5 va z = 5√3 bo''lsa, √z² − 6yz + 9y² + √y² − 2yz + z² ning qiymatini toping.', 'Mavzu C', 11, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000761', '00000000-0000-0000-0001-000000000191', 'A) 6√5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000762', '00000000-0000-0000-0001-000000000191', 'B) 10√3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000763', '00000000-0000-0000-0001-000000000191', 'C) −6√5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000764', '00000000-0000-0000-0001-000000000191', 'D) 12√5 − 10√3', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000192', '00000000-0000-0000-0000-000000000013', '1 + √2 ga teskari ifodani toping.', 'Mavzu C', 12, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000765', '00000000-0000-0000-0001-000000000192', 'A) √2−1', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000766', '00000000-0000-0000-0001-000000000192', 'B) 1−√2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000767', '00000000-0000-0000-0001-000000000192', 'C) 1/(√2−1)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000768', '00000000-0000-0000-0001-000000000192', 'D) √2−1/(√2−1)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000193', '00000000-0000-0000-0000-000000000013', '√32 − p − √p + 16 = 4 bo''lsa, √32 − p − √p + 16 = ?', 'Mavzu C', 13, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000769', '00000000-0000-0000-0001-000000000193', 'A) aniqlab bo''lmaydi', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000770', '00000000-0000-0000-0001-000000000193', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000771', '00000000-0000-0000-0001-000000000193', 'C) 4', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000772', '00000000-0000-0000-0001-000000000193', 'D) 8', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000194', '00000000-0000-0000-0000-000000000013', '√3/√3 + 4/4 − √12/√3 ni hisoblang.', 'Mavzu C', 14, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000773', '00000000-0000-0000-0001-000000000194', 'A) √3−1', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000774', '00000000-0000-0000-0001-000000000194', 'B) √3+1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000775', '00000000-0000-0000-0001-000000000194', 'C) 2√3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000776', '00000000-0000-0000-0001-000000000194', 'D) √3', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000195', '00000000-0000-0000-0000-000000000013', 'Agar −2 < a < 0 bo''lsa, √2−√4−a² + √2+√4−a² ning qiymatini hisoblang.', 'Mavzu C', 15, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000777', '00000000-0000-0000-0001-000000000195', 'A) √a−2−√a+2 / √2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000778', '00000000-0000-0000-0001-000000000195', 'B) √4+2a', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000779', '00000000-0000-0000-0001-000000000195', 'C) √a−2+√a+2 / √2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000780', '00000000-0000-0000-0001-000000000195', 'D) √4−2a', true, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000014', 'Algebraik ifodalar - Variant 4', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000196', '00000000-0000-0000-0000-000000000014', 'P(x) ko''phad: (x² + 5x − 3)·P(x) = x⁷ − 7x + 3 ga bo''lsa, a + b = ?', 'Mavzu A', 1, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000781', '00000000-0000-0000-0001-000000000196', 'A) 2x+5x', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000782', '00000000-0000-0000-0001-000000000196', 'B) 3x−7', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000783', '00000000-0000-0000-0001-000000000196', 'C) 5+3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000784', '00000000-0000-0000-0001-000000000196', 'D) 0', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000197', '00000000-0000-0000-0000-000000000014', '(x²−x+1)·(x⁴+x²+1)·(x⁶+x³+1) − (x+1)·(x²+x+1) ning koeffitsiyentlari yig''indisi.', 'Mavzu A', 2, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000785', '00000000-0000-0000-0001-000000000197', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000786', '00000000-0000-0000-0001-000000000197', 'B) 12', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000787', '00000000-0000-0000-0001-000000000197', 'C) −3', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000788', '00000000-0000-0000-0001-000000000197', 'D) 6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000198', '00000000-0000-0000-0000-000000000014', '2(2x+3) + 2(3x+4) − (x+2) = an² + bn + c ning a, b, c yig''indisi.', 'Mavzu A', 3, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000789', '00000000-0000-0000-0001-000000000198', 'A) 0', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000790', '00000000-0000-0000-0001-000000000198', 'B) 4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000791', '00000000-0000-0000-0001-000000000198', 'C) −5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000792', '00000000-0000-0000-0001-000000000198', 'D) 6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000199', '00000000-0000-0000-0000-000000000014', '(x³ − 2x + 3)·(2x³ + ax + 4) ko''phadning koeffitsiyentlari yig''indisini toping.', 'Mavzu A', 4, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000793', '00000000-0000-0000-0001-000000000199', 'A) −23', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000794', '00000000-0000-0000-0001-000000000199', 'B) 9', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000795', '00000000-0000-0000-0001-000000000199', 'C) 12', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000796', '00000000-0000-0000-0001-000000000199', 'D) 23', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000200', '00000000-0000-0000-0000-000000000014', '(4+5x+2x²) − (x − 7)·5x² − 4x·(x+7) ning x² li hadining koeffitsiyenti.', 'Mavzu A', 5, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000797', '00000000-0000-0000-0001-000000000200', 'A) −23', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000798', '00000000-0000-0000-0001-000000000200', 'B) 9', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000799', '00000000-0000-0000-0001-000000000200', 'C) 12', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000800', '00000000-0000-0000-0001-000000000200', 'D) 23', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000201', '00000000-0000-0000-0000-000000000014', '(2+a)(1+a) / (b+2)(b−4) = (a+2)(a+1) / (−b−2)(4−b) tenglik qaysi qiymatlarda o''rinli?', 'Mavzu B', 6, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000801', '00000000-0000-0000-0001-000000000201', 'A) 1, 4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000802', '00000000-0000-0000-0001-000000000201', 'B) 2, 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000803', '00000000-0000-0000-0001-000000000201', 'C) 2, 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000804', '00000000-0000-0000-0001-000000000201', 'D) 1, 3', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000202', '00000000-0000-0000-0000-000000000014', 'x² − y² − z² + 2yz / (x + y − z) ni soddalashtiring.', 'Mavzu B', 7, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000805', '00000000-0000-0000-0001-000000000202', 'A) x+y+z', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000806', '00000000-0000-0000-0001-000000000202', 'B) x−y+z', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000807', '00000000-0000-0000-0001-000000000202', 'C) x−y−z', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000808', '00000000-0000-0000-0001-000000000202', 'D) x+y−z', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000203', '00000000-0000-0000-0000-000000000014', 'a²−2ab−b²−1 / (a²+2ab+b²−1) ni soddalashtiring.', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000809', '00000000-0000-0000-0001-000000000203', 'A) (a−b−1)/(a+b+1)', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000810', '00000000-0000-0000-0001-000000000203', 'B) (a+b−1)/(a+b+1)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000811', '00000000-0000-0000-0001-000000000203', 'C) (a−b−1)/(a−b+1)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000812', '00000000-0000-0000-0001-000000000203', 'D) (a+b+1)/(a−b+1)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000204', '00000000-0000-0000-0000-000000000014', 'a+√a+1 / √a−⁴√a+1 ni soddalashtiring.', 'Mavzu B', 9, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000813', '00000000-0000-0000-0001-000000000204', 'A) ⁴√a²+1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000814', '00000000-0000-0000-0001-000000000204', 'B) √a+1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000815', '00000000-0000-0000-0001-000000000204', 'C) a+1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000816', '00000000-0000-0000-0001-000000000204', 'D) ⁴√a+1', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000205', '00000000-0000-0000-0000-000000000014', 'x/7 = y/9 = z/12 nisbat o''rinli bo''lsa, x²+y²+z² / xy+yz+xz ning qiymatini toping.', 'Mavzu B', 10, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000817', '00000000-0000-0000-0001-000000000205', 'A) 274/255', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000818', '00000000-0000-0000-0001-000000000205', 'B) 235/223', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000819', '00000000-0000-0000-0001-000000000205', 'C) 256/247', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000820', '00000000-0000-0000-0001-000000000205', 'D) 247/235', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000206', '00000000-0000-0000-0000-000000000014', '√2·∜(3+2√2) + ¹⁶√(3−2√2)·⁸√(3+2√2) ni soddalashtiring.', 'Mavzu C', 11, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000821', '00000000-0000-0000-0001-000000000206', 'A) √3+2', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000822', '00000000-0000-0000-0001-000000000206', 'B) √2+3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000823', '00000000-0000-0000-0001-000000000206', 'C) √3+√2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000824', '00000000-0000-0000-0001-000000000206', 'D) √3', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000207', '00000000-0000-0000-0000-000000000014', '⁴√(216x³(5+2√6)) · √(3·√(2x)−2√(3x)) ni soddalashtiring.', 'Mavzu C', 12, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000825', '00000000-0000-0000-0001-000000000207', 'A) −x', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000826', '00000000-0000-0000-0001-000000000207', 'B) ⁴√(3x)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000827', '00000000-0000-0000-0001-000000000207', 'C) √(2x)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000828', '00000000-0000-0000-0001-000000000207', 'D) 6x', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000208', '00000000-0000-0000-0000-000000000014', 'a = 0,4 va b = −0,2 bo''lganda (a²−2ab−3b²)/(a²+4ab+3b²) · (a−3b)/(a²−b²) ni toping.', 'Mavzu C', 13, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000829', '00000000-0000-0000-0001-000000000208', 'A) −0,6', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000830', '00000000-0000-0000-0001-000000000208', 'B) −0,2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000831', '00000000-0000-0000-0001-000000000208', 'C) 0,2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000832', '00000000-0000-0000-0001-000000000208', 'D) 0,6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000209', '00000000-0000-0000-0000-000000000014', '³√200 + √(200 + 8³√343) ni hisoblang.', 'Mavzu C', 14, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000833', '00000000-0000-0000-0001-000000000209', 'A) 7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000834', '00000000-0000-0000-0001-000000000209', 'B) 8', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000835', '00000000-0000-0000-0001-000000000209', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000836', '00000000-0000-0000-0001-000000000209', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000210', '00000000-0000-0000-0000-000000000014', '³√(9x⁵−4x) / ³√(3x²−²√(3x)) − 2/x^{−2/3} ni soddalashtiring.', 'Mavzu C', 15, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000837', '00000000-0000-0000-0001-000000000210', 'A) ³√3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000838', '00000000-0000-0000-0001-000000000210', 'B) ³√(3x)', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000839', '00000000-0000-0000-0001-000000000210', 'C) ³√(2x²)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000840', '00000000-0000-0000-0001-000000000210', 'D) −³√x', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000015', 'Algebraik ifodalar - Variant 5', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000211', '00000000-0000-0000-0000-000000000015', '(a + 5)(a³ − 17) bo''lganda a + 5 va a³ − 17 qo''shiluvchilarining yig''indisi.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000841', '00000000-0000-0000-0001-000000000211', 'A) (a+5)(a³−17)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000842', '00000000-0000-0000-0001-000000000211', 'B) a⁴+5a³−17a−85', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000843', '00000000-0000-0000-0001-000000000211', 'C) a⁴−17a+5a³−85', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000844', '00000000-0000-0000-0001-000000000211', 'D) −85', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000212', '00000000-0000-0000-0000-000000000015', 'x³ + mx² + 4x + 6 = (x − 1)(x² + px + q) ayniyat bo''lsa, m + p + q ning qiymati.', 'Mavzu A', 2, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000845', '00000000-0000-0000-0001-000000000212', 'A) −27', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000846', '00000000-0000-0000-0001-000000000212', 'B) −13', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000847', '00000000-0000-0000-0001-000000000212', 'C) −15', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000848', '00000000-0000-0000-0001-000000000212', 'D) aniqlab bo''lmaydi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000213', '00000000-0000-0000-0000-000000000015', 'P(x) ko''phad x − 1 ga bo''linganda qoldiq 6, va x + 1 ga bo''linganda qoldiq 2 ga teng. P(x) ko''phadni x² − 1 ga bo''lingandagi qoldiqni toping.', 'Mavzu A', 3, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000849', '00000000-0000-0000-0001-000000000213', 'A) 2x+4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000850', '00000000-0000-0000-0001-000000000213', 'B) 2x−4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000851', '00000000-0000-0000-0001-000000000213', 'C) 2x+1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000852', '00000000-0000-0000-0001-000000000213', 'D) x+4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000214', '00000000-0000-0000-0000-000000000015', 'P(x) = 3x⁴ + 3x³ − 2x ko''phad x³ − 7x + 3 ga bo''linganda qoldiq.', 'Mavzu A', 4, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000853', '00000000-0000-0000-0001-000000000214', 'A) 2x²+5x', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000854', '00000000-0000-0000-0001-000000000214', 'B) −5x+7', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000855', '00000000-0000-0000-0001-000000000214', 'C) 9', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000856', '00000000-0000-0000-0001-000000000214', 'D) aniqlab bo''lmaydi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000215', '00000000-0000-0000-0000-000000000015', 'x³ + 3x² − 2x + 5 ko''padni (x+1) ga bo''lsa, qoldiqi nechaga teng?', 'Mavzu A', 5, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000857', '00000000-0000-0000-0001-000000000215', 'A) 5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000858', '00000000-0000-0000-0001-000000000215', 'B) 7', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000859', '00000000-0000-0000-0001-000000000215', 'C) 9', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000860', '00000000-0000-0000-0001-000000000215', 'D) 3', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000216', '00000000-0000-0000-0000-000000000015', 'a³+27b³ / (a²−9b²) · (2a−7b)/(a²−3ab+9b²) ni soddalashtiring.', 'Mavzu B', 6, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000861', '00000000-0000-0000-0001-000000000216', 'A) a/(a−b)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000862', '00000000-0000-0000-0001-000000000216', 'B) 3/(a+3b)', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000863', '00000000-0000-0000-0001-000000000216', 'C) 3/(a−3b)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000864', '00000000-0000-0000-0001-000000000216', 'D) a/(b−a)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000217', '00000000-0000-0000-0000-000000000015', '1/x · (x−1/x)^{1/2} + 1/(1−1/x) ni soddalashtiring.', 'Mavzu B', 7, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000865', '00000000-0000-0000-0001-000000000217', 'A) x/2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000866', '00000000-0000-0000-0001-000000000217', 'B) −2/x', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000867', '00000000-0000-0000-0001-000000000217', 'C) 2/x', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000868', '00000000-0000-0000-0001-000000000217', 'D) 1/x', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000218', '00000000-0000-0000-0000-000000000015', '(a+b/2b+a + 6b²+5ab/(a²−4b²)) : (4b−2a) ni soddalashtiring.', 'Mavzu B', 8, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000869', '00000000-0000-0000-0001-000000000218', 'A) a/(a−b)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000870', '00000000-0000-0000-0001-000000000218', 'B) b/(b−a)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000871', '00000000-0000-0000-0001-000000000218', 'C) 1/(b−a)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000872', '00000000-0000-0000-0001-000000000218', 'D) a/(b−a)', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000219', '00000000-0000-0000-0000-000000000015', 'x+y/z = y+z/x = x+z/y bo''lsa, x+y+z ning qiymati.', 'Mavzu B', 9, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000873', '00000000-0000-0000-0001-000000000219', 'A) 0 yoki 3', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000874', '00000000-0000-0000-0001-000000000219', 'B) 0 yoki −3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000875', '00000000-0000-0000-0001-000000000219', 'C) 1 yoki 2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000876', '00000000-0000-0000-0001-000000000219', 'D) 0 yoki −2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000220', '00000000-0000-0000-0000-000000000015', '78·12 − 39·4 / (117·7 − 156·3) ni hisoblang.', 'Mavzu B', 10, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000877', '00000000-0000-0000-0001-000000000220', 'A) 25/18', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000878', '00000000-0000-0000-0001-000000000220', 'B) 1/2', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000879', '00000000-0000-0000-0001-000000000220', 'C) 3/8', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000880', '00000000-0000-0000-0001-000000000220', 'D) 20/9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000221', '00000000-0000-0000-0000-000000000015', 'y = 3√5 va z = 5√3 bo''lsa, √z²−6yz+9y² + √y²−2yz+z² ning qiymatini toping.', 'Mavzu C', 11, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000881', '00000000-0000-0000-0001-000000000221', 'A) 6√5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000882', '00000000-0000-0000-0001-000000000221', 'B) 10√3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000883', '00000000-0000-0000-0001-000000000221', 'C) −6√5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000884', '00000000-0000-0000-0001-000000000221', 'D) 12√5−10√3', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000222', '00000000-0000-0000-0000-000000000015', '√32−p − √p+16 = 4 bo''lsa, √32−p + √p+16 = ?', 'Mavzu C', 12, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000885', '00000000-0000-0000-0001-000000000222', 'A) aniqlab bo''lmaydi', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000886', '00000000-0000-0000-0001-000000000222', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000887', '00000000-0000-0000-0001-000000000222', 'C) 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000888', '00000000-0000-0000-0001-000000000222', 'D) 8', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000223', '00000000-0000-0000-0000-000000000015', '³√200 + √(200 + 8³√343) ni hisoblang.', 'Mavzu C', 13, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000889', '00000000-0000-0000-0001-000000000223', 'A) 7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000890', '00000000-0000-0000-0001-000000000223', 'B) 8', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000891', '00000000-0000-0000-0001-000000000223', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000892', '00000000-0000-0000-0001-000000000223', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000224', '00000000-0000-0000-0000-000000000015', '√(√2 − 1⁴√3 + 2√2) + ³√(x+12)·√x − 6x − 8 / (x − √x − √2 + 1⁵√3 − 2√2) ni soddalashtiring.', 'Mavzu C', 14, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000893', '00000000-0000-0000-0001-000000000224', 'A) √x + ³√x', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000894', '00000000-0000-0000-0001-000000000224', 'B) −(√x−1)/2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000895', '00000000-0000-0000-0001-000000000224', 'C) 1', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000896', '00000000-0000-0000-0001-000000000224', 'D) 2/⁶√x', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000225', '00000000-0000-0000-0000-000000000015', 'Maxrajni ratsionallashtirib soddalashtiring: 2a⁴+a³+4a²+a+2 / (2a³−a²+a−2)', 'Mavzu C', 15, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000897', '00000000-0000-0000-0001-000000000225', 'A) (a+2)/(a−1)', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000898', '00000000-0000-0000-0001-000000000225', 'B) (a²+1)/(a−1)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000899', '00000000-0000-0000-0001-000000000225', 'C) (a−2)/(a+1)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000900', '00000000-0000-0000-0001-000000000225', 'D) (a−1)/(a+1)', true, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000016', 'Haqiqiy sonlar - Variant 1', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000226', '00000000-0000-0000-0000-000000000016', '4 + 2√2 ga teskari sonni toping.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000901', '00000000-0000-0000-0001-000000000226', 'A) 4 − 2√2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000902', '00000000-0000-0000-0001-000000000226', 'B) 0,5 − 0,25√2', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000903', '00000000-0000-0000-0001-000000000226', 'C) 1/(4−2√2)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000904', '00000000-0000-0000-0001-000000000226', 'D) −4 − 2√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000227', '00000000-0000-0000-0000-000000000016', 'Quyidagi mulohazalardan qaysi biri to''g''ri? A) Ildiz ko''rsatkichi juft bo''lgan ildiz ostidagi ifoda manfiy qiymatlarni qabul qilmaydi.', 'Mavzu A', 2, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000905', '00000000-0000-0000-0001-000000000227', 'A) A', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000906', '00000000-0000-0000-0001-000000000227', 'B) B', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000907', '00000000-0000-0000-0001-000000000227', 'C) C', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000908', '00000000-0000-0000-0001-000000000227', 'D) D', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000228', '00000000-0000-0000-0000-000000000016', '4/(√5 + √3 − √2) kasrning maxrajini irratsionallikdan qutqaring.', 'Mavzu A', 3, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000909', '00000000-0000-0000-0001-000000000228', 'A) (√30−3√2+2√3)/3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000910', '00000000-0000-0000-0001-000000000228', 'B) (2√3+3√2+√30)/3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000911', '00000000-0000-0000-0001-000000000228', 'C) (2√2+3√3+√30)/3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000912', '00000000-0000-0000-0001-000000000228', 'D) (2√3+3√2+√30)/6', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000229', '00000000-0000-0000-0000-000000000016', '√3 + √5 + √7 + ... + √79 = a − 2 bo''lsa, √12 + 3 + √15 + √21 + ... + √237 = ?', 'Mavzu A', 4, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000913', '00000000-0000-0000-0001-000000000229', 'A) a + √3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000914', '00000000-0000-0000-0001-000000000229', 'B) √3a − 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000915', '00000000-0000-0000-0001-000000000229', 'C) 3a', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000916', '00000000-0000-0000-0001-000000000229', 'D) √3a', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000230', '00000000-0000-0000-0000-000000000016', 'x⁴ − 7x³ + 8x² + 28x − 48 / (x³ − x² − 10x − 8) ni soddalashtiring.', 'Mavzu A', 5, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000917', '00000000-0000-0000-0001-000000000230', 'A) x − 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000918', '00000000-0000-0000-0001-000000000230', 'B) x + 6x+5/(x−1)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000919', '00000000-0000-0000-0001-000000000230', 'C) x − 6x−6/(x+1)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000920', '00000000-0000-0000-0001-000000000230', 'D) x + 2 − (6−3x)/(x+1)', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000231', '00000000-0000-0000-0000-000000000016', '√(5·(1/5)·(1/5)) ni soddalashtiring.', 'Mavzu B', 6, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000921', '00000000-0000-0000-0001-000000000231', 'A) √5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000922', '00000000-0000-0000-0001-000000000231', 'B) ⁴√5', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000923', '00000000-0000-0000-0001-000000000231', 'C) ⁵√5', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000924', '00000000-0000-0000-0001-000000000231', 'D) ⁶√5', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000232', '00000000-0000-0000-0000-000000000016', 'a = ³√2·√3, b = √2·³√3, c = 6⁶√6, d = √2·√3 sonlarini o''sish tartibida yozing.', 'Mavzu B', 7, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000925', '00000000-0000-0000-0001-000000000232', 'A) c < b < a < d', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000926', '00000000-0000-0000-0001-000000000232', 'B) d < a < b < c', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000927', '00000000-0000-0000-0001-000000000232', 'C) c < a < b < d', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000928', '00000000-0000-0000-0001-000000000232', 'D) c < d < b < a', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000233', '00000000-0000-0000-0000-000000000016', 'a = √2/2, b = √5/3, c = √7/4 bo''lsa, a, b va c ni o''sish tartibida yozing.', 'Mavzu B', 8, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000929', '00000000-0000-0000-0001-000000000233', 'A) c < b < a', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000930', '00000000-0000-0000-0001-000000000233', 'B) c < a < b', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000931', '00000000-0000-0000-0001-000000000233', 'C) a < b < c', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000932', '00000000-0000-0000-0001-000000000233', 'D) b < a < c', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000234', '00000000-0000-0000-0000-000000000016', 'Quyidagilardan qaysi biri ratsional emas? I) 2√3·3√12; II) 3√3 + 2√12; III) 5√2·√32; IV) 4√5 − 3√5.', 'Mavzu B', 9, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000933', '00000000-0000-0000-0001-000000000234', 'A) I va III', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000934', '00000000-0000-0000-0001-000000000234', 'B) I va II', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000935', '00000000-0000-0000-0001-000000000234', 'C) III va IV', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000936', '00000000-0000-0000-0001-000000000234', 'D) II va III', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000235', '00000000-0000-0000-0000-000000000016', 'Quyidagi tengliklardan qaysi biri to''g''ri? A) √(−4)² = −4; B) (√−7)² = √(−7)²; C) ⁴√(−2)³ = ⁸√(−2)⁶; D) ¹⁰√32 = √2', 'Mavzu B', 10, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000937', '00000000-0000-0000-0001-000000000235', 'A) A', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000938', '00000000-0000-0000-0001-000000000235', 'B) B', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000939', '00000000-0000-0000-0001-000000000235', 'C) C', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000940', '00000000-0000-0000-0001-000000000235', 'D) D', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000236', '00000000-0000-0000-0000-000000000016', '1/2·√8 − 3/4·√32 + 2/3·√18 ni hisoblang.', 'Mavzu C', 11, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000941', '00000000-0000-0000-0001-000000000236', 'A) −2√2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000942', '00000000-0000-0000-0001-000000000236', 'B) √2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000943', '00000000-0000-0000-0001-000000000236', 'C) 0', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000944', '00000000-0000-0000-0001-000000000236', 'D) −√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000237', '00000000-0000-0000-0000-000000000016', '√4500 soni quyidagilardan qaysi biriga teng?', 'Mavzu C', 12, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000945', '00000000-0000-0000-0001-000000000237', 'A) 18√6', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000946', '00000000-0000-0000-0001-000000000237', 'B) 30√5', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000947', '00000000-0000-0000-0001-000000000237', 'C) 30√6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000948', '00000000-0000-0000-0001-000000000237', 'D) 9√30', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000238', '00000000-0000-0000-0000-000000000016', '8/(3√6) kasrning maxrajini irratsionallikdan qutqaring.', 'Mavzu C', 13, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000949', '00000000-0000-0000-0001-000000000238', 'A) 2√3/3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000950', '00000000-0000-0000-0001-000000000238', 'B) 4√6/9', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000951', '00000000-0000-0000-0001-000000000238', 'C) 3√6/4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000952', '00000000-0000-0000-0001-000000000238', 'D) 2√6/9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000239', '00000000-0000-0000-0000-000000000016', '(2√3 − 3)/(4√3) kasrning maxrajini irratsionallikdan qutqaring.', 'Mavzu C', 14, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000953', '00000000-0000-0000-0001-000000000239', 'A) (√3−1)/2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000954', '00000000-0000-0000-0001-000000000239', 'B) (2√3−2)/3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000955', '00000000-0000-0000-0001-000000000239', 'C) (4−3√3)/8', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000956', '00000000-0000-0000-0001-000000000239', 'D) (2−√3)/4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000240', '00000000-0000-0000-0000-000000000016', 'Quyidagi sonlardan qaysi biri irratsional son? A) 2π − 6,28; B) 2√4 − 3√9; C) (3√2·0)·(π + e); D) √45/√5', 'Mavzu C', 15, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000957', '00000000-0000-0000-0001-000000000240', 'A) A', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000958', '00000000-0000-0000-0001-000000000240', 'B) B', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000959', '00000000-0000-0000-0001-000000000240', 'C) C', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000960', '00000000-0000-0000-0001-000000000240', 'D) D', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000017', 'Haqiqiy sonlar - Variant 2', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000241', '00000000-0000-0000-0000-000000000017', 'a = √13 − √11 va b = √7 − √5 bo''lsa, quyidagi mulohazalardan qaysi biri to''g''ri?', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000961', '00000000-0000-0000-0001-000000000241', 'A) a − b < 0', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000962', '00000000-0000-0000-0001-000000000241', 'B) 0 < a − b < 1', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000963', '00000000-0000-0000-0001-000000000241', 'C) a − b > 2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000964', '00000000-0000-0000-0001-000000000241', 'D) 1 < a − b < 2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000242', '00000000-0000-0000-0000-000000000017', '√0,09 + √0,16 − √0,81 + √2,56 ni hisoblang.', 'Mavzu A', 2, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000965', '00000000-0000-0000-0001-000000000242', 'A) 1,2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000966', '00000000-0000-0000-0001-000000000242', 'B) 1,4', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000967', '00000000-0000-0000-0001-000000000242', 'C) 1,6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000968', '00000000-0000-0000-0001-000000000242', 'D) 0,12', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000243', '00000000-0000-0000-0000-000000000017', '−0,2 + 0,3√6·√12√8 ning 10%ini toping.', 'Mavzu A', 3, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000969', '00000000-0000-0000-0001-000000000243', 'A) 0,3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000970', '00000000-0000-0000-0001-000000000243', 'B) 0,2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000971', '00000000-0000-0000-0001-000000000243', 'C) 7', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000972', '00000000-0000-0000-0001-000000000243', 'D) 0,7', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000244', '00000000-0000-0000-0000-000000000017', '√(50/98) ning qiymatiga teng bo''lgan ifodani toping.', 'Mavzu A', 4, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000973', '00000000-0000-0000-0001-000000000244', 'A) √2/7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000974', '00000000-0000-0000-0001-000000000244', 'B) 5/7', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000975', '00000000-0000-0000-0001-000000000244', 'C) 5/(7√2)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000976', '00000000-0000-0000-0001-000000000244', 'D) 7/(3√5)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000245', '00000000-0000-0000-0000-000000000017', '√70 ning butun qiymatini nimaga teng?', 'Mavzu A', 5, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000977', '00000000-0000-0000-0001-000000000245', 'A) 7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000978', '00000000-0000-0000-0001-000000000245', 'B) 8', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000979', '00000000-0000-0000-0001-000000000245', 'C) 9', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000980', '00000000-0000-0000-0001-000000000245', 'D) 10', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000246', '00000000-0000-0000-0000-000000000017', '(√(−4))² = ? va (⁴√(−4))² = ? larni hisoblang.', 'Mavzu B', 6, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000981', '00000000-0000-0000-0001-000000000246', 'A) −4 va 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000982', '00000000-0000-0000-0001-000000000246', 'B) 4 va aniqlab bo''lmaydi', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000983', '00000000-0000-0000-0001-000000000246', 'C) aniqlab bo''lmaydi va 4', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000984', '00000000-0000-0000-0001-000000000246', 'D) 4 va −4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000247', '00000000-0000-0000-0000-000000000017', '⁵√(5·(1/5)·(1/5)) ni soddalashtiring.', 'Mavzu B', 7, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000985', '00000000-0000-0000-0001-000000000247', 'A) √5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000986', '00000000-0000-0000-0001-000000000247', 'B) ⁴√5', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000987', '00000000-0000-0000-0001-000000000247', 'C) ⁵√5', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000988', '00000000-0000-0000-0001-000000000247', 'D) ⁶√5', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000248', '00000000-0000-0000-0000-000000000017', 'a = ³√2·√3, b = √2·³√3 bo''lsa, a va b ni solishtiring.', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000989', '00000000-0000-0000-0001-000000000248', 'A) a > b', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000990', '00000000-0000-0000-0001-000000000248', 'B) a < b', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000991', '00000000-0000-0000-0001-000000000248', 'C) a = b', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000992', '00000000-0000-0000-0001-000000000248', 'D) aniqlab bo''lmaydi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000249', '00000000-0000-0000-0000-000000000017', 'x∈{1,2,...,99} ning qanday qiymatida ifodaning qiymati 73 ga eng yaqin bo''ladi?', 'Mavzu B', 9, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000993', '00000000-0000-0000-0001-000000000249', 'A) 5', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000994', '00000000-0000-0000-0001-000000000249', 'B) 72', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000995', '00000000-0000-0000-0001-000000000249', 'C) 3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000996', '00000000-0000-0000-0001-000000000249', 'D) −22', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000250', '00000000-0000-0000-0000-000000000017', '2√3·3√12 ni hisoblang.', 'Mavzu B', 10, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000997', '00000000-0000-0000-0001-000000000250', 'A) 18', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000998', '00000000-0000-0000-0001-000000000250', 'B) 36', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000000999', '00000000-0000-0000-0001-000000000250', 'C) 12', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001000', '00000000-0000-0000-0001-000000000250', 'D) 6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000251', '00000000-0000-0000-0000-000000000017', '√(15−9√3) + √(2+4√3−2√4−2√3) ni hisoblang.', 'Mavzu C', 11, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001001', '00000000-0000-0000-0001-000000000251', 'A) 2√3−2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001002', '00000000-0000-0000-0001-000000000251', 'B) 2√3+1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001003', '00000000-0000-0000-0001-000000000251', 'C) 2√3−1', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001004', '00000000-0000-0000-0001-000000000251', 'D) 2√3+2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000252', '00000000-0000-0000-0000-000000000017', '³√200 + √(200 + 8·³√343) ni hisoblang.', 'Mavzu C', 12, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001005', '00000000-0000-0000-0001-000000000252', 'A) 7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001006', '00000000-0000-0000-0001-000000000252', 'B) 8', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001007', '00000000-0000-0000-0001-000000000252', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001008', '00000000-0000-0000-0001-000000000252', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000253', '00000000-0000-0000-0000-000000000017', '√(7 − 3√5,(3)) + √(7 + 3√5,(3)) / √2 ni hisoblang.', 'Mavzu C', 13, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001009', '00000000-0000-0000-0001-000000000253', 'A) 2√3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001010', '00000000-0000-0000-0001-000000000253', 'B) √6', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001011', '00000000-0000-0000-0001-000000000253', 'C) 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001012', '00000000-0000-0000-0001-000000000253', 'D) 2√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000254', '00000000-0000-0000-0000-000000000017', '(⁵√(7·³√54) + 15·⁵√128) / (3·⁴√(4·³√32) + 3·⁹√(4·³√162)) ni hisoblang.', 'Mavzu C', 14, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001013', '00000000-0000-0000-0001-000000000254', 'A) 2^{5/12}', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001014', '00000000-0000-0000-0001-000000000254', 'B) 1/⁴√2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001015', '00000000-0000-0000-0001-000000000254', 'C) −1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001016', '00000000-0000-0000-0001-000000000254', 'D) 1', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000255', '00000000-0000-0000-0000-000000000017', '⁴√(216x³(5+2√6)) · √(3·√(2x) − 2√(3x)) ni soddalashtiring.', 'Mavzu C', 15, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001017', '00000000-0000-0000-0001-000000000255', 'A) −x', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001018', '00000000-0000-0000-0001-000000000255', 'B) ⁴√(3x)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001019', '00000000-0000-0000-0001-000000000255', 'C) √(2x)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001020', '00000000-0000-0000-0001-000000000255', 'D) 6x', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000018', 'Haqiqiy sonlar - Variant 3', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000256', '00000000-0000-0000-0000-000000000018', '√(3+4√(−2+4√15+6√6)) ni hisoblang.', 'Mavzu A', 1, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001021', '00000000-0000-0000-0001-000000000256', 'A) √6+2', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001022', '00000000-0000-0000-0001-000000000256', 'B) 4+√2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001023', '00000000-0000-0000-0001-000000000256', 'C) 2(3+2√2)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001024', '00000000-0000-0000-0001-000000000256', 'D) √3+2√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000257', '00000000-0000-0000-0000-000000000018', '⁴√(216x³(5+2√6))·√(3·√2x−2√3x) ni soddalashtiring.', 'Mavzu A', 2, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001025', '00000000-0000-0000-0001-000000000257', 'A) −x', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001026', '00000000-0000-0000-0001-000000000257', 'B) ⁴√3x', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001027', '00000000-0000-0000-0001-000000000257', 'C) √2x', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001028', '00000000-0000-0000-0001-000000000257', 'D) 6x', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000258', '00000000-0000-0000-0000-000000000018', 'Agar x ≠ y, x > 0 va y > 0 bo''lsa, ⁴√(x³+⁴√x²y²−⁴√xy⁴−⁴√x⁵) : (⁴√y⁵+⁴√x⁴y−⁴√xy⁴−⁴√x⁵) ni soddalashtiring.', 'Mavzu A', 3, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001029', '00000000-0000-0000-0001-000000000258', 'A) ⁴√x+⁴√y', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001030', '00000000-0000-0000-0001-000000000258', 'B) 1', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001031', '00000000-0000-0000-0001-000000000258', 'C) −(⁴√x+⁴√y)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001032', '00000000-0000-0000-0001-000000000258', 'D) −(√x+√y)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000259', '00000000-0000-0000-0000-000000000018', 'ⁿ√(ⁿ√a^{ⁿ²}) = ?', 'Mavzu A', 4, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001033', '00000000-0000-0000-0001-000000000259', 'A) a^{1/n}', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001034', '00000000-0000-0000-0001-000000000259', 'B) a', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001035', '00000000-0000-0000-0001-000000000259', 'C) ⁿ√a', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001036', '00000000-0000-0000-0001-000000000259', 'D) a^n', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000260', '00000000-0000-0000-0000-000000000018', '√0,09 + √0,16 − √0,81 + √2,56 ni hisoblang.', 'Mavzu A', 5, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001037', '00000000-0000-0000-0001-000000000260', 'A) 1,2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001038', '00000000-0000-0000-0001-000000000260', 'B) 1,4', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001039', '00000000-0000-0000-0001-000000000260', 'C) 1,6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001040', '00000000-0000-0000-0001-000000000260', 'D) 0,12', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000261', '00000000-0000-0000-0000-000000000018', '1/2·√8 − 3/4·√32 + 2/3·√18 ni hisoblang.', 'Mavzu B', 6, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001041', '00000000-0000-0000-0001-000000000261', 'A) −2√2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001042', '00000000-0000-0000-0001-000000000261', 'B) √2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001043', '00000000-0000-0000-0001-000000000261', 'C) 0', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001044', '00000000-0000-0000-0001-000000000261', 'D) −√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000262', '00000000-0000-0000-0000-000000000018', '⁴√(11+2√18)·⁸√9−⁸√80·⁸√9+⁸√80 ni hisoblang.', 'Mavzu B', 7, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001045', '00000000-0000-0000-0001-000000000262', 'A) √3+2', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001046', '00000000-0000-0000-0001-000000000262', 'B) √2+3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001047', '00000000-0000-0000-0001-000000000262', 'C) √3+√2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001048', '00000000-0000-0000-0001-000000000262', 'D) √3', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000263', '00000000-0000-0000-0000-000000000018', 'Agar x ≠ y, x > 0 bo''lsa, √x/(⁴√(x³+⁴√(x²y²)−⁴√(xy⁴)−⁴√x⁵)) = ?', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001049', '00000000-0000-0000-0001-000000000263', 'A) ⁴√x+⁴√y', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001050', '00000000-0000-0000-0001-000000000263', 'B) 1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001051', '00000000-0000-0000-0001-000000000263', 'C) −(⁴√x+⁴√y)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001052', '00000000-0000-0000-0001-000000000263', 'D) (√x+√y)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000264', '00000000-0000-0000-0000-000000000018', 'a = √2/2, b = √5/3, c = √7/4 sonlarini o''sish tartibida yozing.', 'Mavzu B', 9, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001053', '00000000-0000-0000-0001-000000000264', 'A) c < b < a', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001054', '00000000-0000-0000-0001-000000000264', 'B) c < a < b', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001055', '00000000-0000-0000-0001-000000000264', 'C) a < b < c', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001056', '00000000-0000-0000-0001-000000000264', 'D) b < a < c', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000265', '00000000-0000-0000-0000-000000000018', 'Agar −2 < a < 0 bo''lsa, √(2−√(4−a²)) + √(2+√(4−a²)) = ?', 'Mavzu B', 10, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001057', '00000000-0000-0000-0001-000000000265', 'A) √(a−2)−√(a+2)/√2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001058', '00000000-0000-0000-0001-000000000265', 'B) √(4+2a)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001059', '00000000-0000-0000-0001-000000000265', 'C) √(a−2)+√(a+2)/√2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001060', '00000000-0000-0000-0001-000000000265', 'D) √(4−2a)', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000266', '00000000-0000-0000-0000-000000000018', '√(7−3√(5,(3))) + √(7+3√(5,(3))) / √2 ni hisoblang.', 'Mavzu C', 11, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001061', '00000000-0000-0000-0001-000000000266', 'A) 2√3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001062', '00000000-0000-0000-0001-000000000266', 'B) √6', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001063', '00000000-0000-0000-0001-000000000266', 'C) 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001064', '00000000-0000-0000-0001-000000000266', 'D) 2√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000267', '00000000-0000-0000-0000-000000000018', '(³√(9x⁵−4x)) / (³√(3x²)−²√(³√x)) − 2/x^{−2/3} ni soddalashtiring.', 'Mavzu C', 12, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001065', '00000000-0000-0000-0001-000000000267', 'A) ³√3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001066', '00000000-0000-0000-0001-000000000267', 'B) ³√(3x)', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001067', '00000000-0000-0000-0001-000000000267', 'C) ³√(2x²)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001068', '00000000-0000-0000-0001-000000000267', 'D) −³√x', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000268', '00000000-0000-0000-0000-000000000018', 'y = 39(1/16) bo''lganda x^{1/4}·y^{−1/4} − x^{−1/4}·y^{1/4} + 1 / (x^{−1/4}−1) ifodaning qiymatini toping.', 'Mavzu C', 13, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001069', '00000000-0000-0000-0001-000000000268', 'A) 21/4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001070', '00000000-0000-0000-0001-000000000268', 'B) 7/4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001071', '00000000-0000-0000-0001-000000000268', 'C) 5/2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001072', '00000000-0000-0000-0001-000000000268', 'D) 3/2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000269', '00000000-0000-0000-0000-000000000018', '⁴√(216x³(5+2√6)) · √(3·√2x−2√3x) ni soddalashtiring.', 'Mavzu C', 14, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001073', '00000000-0000-0000-0001-000000000269', 'A) −x', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001074', '00000000-0000-0000-0001-000000000269', 'B) ⁴√(3x)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001075', '00000000-0000-0000-0001-000000000269', 'C) √(2x)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001076', '00000000-0000-0000-0001-000000000269', 'D) 6x', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000270', '00000000-0000-0000-0000-000000000018', '³√200 + √(200 + 8·³√343) ni hisoblang.', 'Mavzu C', 15, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001077', '00000000-0000-0000-0001-000000000270', 'A) 7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001078', '00000000-0000-0000-0001-000000000270', 'B) 8', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001079', '00000000-0000-0000-0001-000000000270', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001080', '00000000-0000-0000-0001-000000000270', 'D) 9', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000019', 'Haqiqiy sonlar - Variant 4', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000271', '00000000-0000-0000-0000-000000000019', '4 + 2√2 ga teskari sonni toping.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001081', '00000000-0000-0000-0001-000000000271', 'A) 4−2√2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001082', '00000000-0000-0000-0001-000000000271', 'B) 0,5−0,25√2', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001083', '00000000-0000-0000-0001-000000000271', 'C) 1/(4−2√2)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001084', '00000000-0000-0000-0001-000000000271', 'D) −4−2√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000272', '00000000-0000-0000-0000-000000000019', '√70 ning butun qiymatini toping.', 'Mavzu A', 2, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001085', '00000000-0000-0000-0001-000000000272', 'A) 7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001086', '00000000-0000-0000-0001-000000000272', 'B) 8', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001087', '00000000-0000-0000-0001-000000000272', 'C) 9', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001088', '00000000-0000-0000-0001-000000000272', 'D) 10', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000273', '00000000-0000-0000-0000-000000000019', '2√3·3√12 ni hisoblang.', 'Mavzu A', 3, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001089', '00000000-0000-0000-0001-000000000273', 'A) 18', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001090', '00000000-0000-0000-0001-000000000273', 'B) 36', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001091', '00000000-0000-0000-0001-000000000273', 'C) 12', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001092', '00000000-0000-0000-0001-000000000273', 'D) 6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000274', '00000000-0000-0000-0000-000000000019', '⁵√(5·(1/5)·(1/5)) ni soddalashtiring.', 'Mavzu A', 4, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001093', '00000000-0000-0000-0001-000000000274', 'A) √5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001094', '00000000-0000-0000-0001-000000000274', 'B) ⁴√5', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001095', '00000000-0000-0000-0001-000000000274', 'C) ⁵√5', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001096', '00000000-0000-0000-0001-000000000274', 'D) ⁶√5', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000275', '00000000-0000-0000-0000-000000000019', '√(50/98) ning qiymatini toping.', 'Mavzu A', 5, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001097', '00000000-0000-0000-0001-000000000275', 'A) √2/7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001098', '00000000-0000-0000-0001-000000000275', 'B) 5/7', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001099', '00000000-0000-0000-0001-000000000275', 'C) 5/(7√2)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001100', '00000000-0000-0000-0001-000000000275', 'D) 7/(3√5)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000276', '00000000-0000-0000-0000-000000000019', 'a = ³√2·√3, b = √2·³√3 bo''lsa, a va b ni solishtiring.', 'Mavzu B', 6, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001101', '00000000-0000-0000-0001-000000000276', 'A) a > b', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001102', '00000000-0000-0000-0001-000000000276', 'B) a < b', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001103', '00000000-0000-0000-0001-000000000276', 'C) a = b', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001104', '00000000-0000-0000-0001-000000000276', 'D) aniqlab bo''lmaydi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000277', '00000000-0000-0000-0000-000000000019', '1/2·√8 − 3/4·√32 + 2/3·√18 ni hisoblang.', 'Mavzu B', 7, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001105', '00000000-0000-0000-0001-000000000277', 'A) −2√2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001106', '00000000-0000-0000-0001-000000000277', 'B) √2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001107', '00000000-0000-0000-0001-000000000277', 'C) 0', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001108', '00000000-0000-0000-0001-000000000277', 'D) −√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000278', '00000000-0000-0000-0000-000000000019', 'Quyidagi tengliklardan qaysi biri to''g''ri?', 'Mavzu B', 8, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001109', '00000000-0000-0000-0001-000000000278', 'A) √(−4)²=−4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001110', '00000000-0000-0000-0001-000000000278', 'B) (√−7)²=√(−7)²', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001111', '00000000-0000-0000-0001-000000000278', 'C) ⁴√(−2)³=⁸√(−2)⁶', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001112', '00000000-0000-0000-0001-000000000278', 'D) ¹⁰√32=√2', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000279', '00000000-0000-0000-0000-000000000019', '√4500 qaysi ifodaga teng?', 'Mavzu B', 9, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001113', '00000000-0000-0000-0001-000000000279', 'A) 18√6', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001114', '00000000-0000-0000-0001-000000000279', 'B) 30√5', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001115', '00000000-0000-0000-0001-000000000279', 'C) 30√6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001116', '00000000-0000-0000-0001-000000000279', 'D) 9√30', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000280', '00000000-0000-0000-0000-000000000019', '8/(3√6) kasrning maxrajini irratsionallikdan qutqaring.', 'Mavzu B', 10, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001117', '00000000-0000-0000-0001-000000000280', 'A) 2√3/3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001118', '00000000-0000-0000-0001-000000000280', 'B) 4√6/9', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001119', '00000000-0000-0000-0001-000000000280', 'C) 3√6/4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001120', '00000000-0000-0000-0001-000000000280', 'D) 2√6/9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000281', '00000000-0000-0000-0000-000000000019', '(2√3−3)/(4√3) kasrning maxrajini irratsionallikdan qutqaring.', 'Mavzu C', 11, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001121', '00000000-0000-0000-0001-000000000281', 'A) (√3−1)/2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001122', '00000000-0000-0000-0001-000000000281', 'B) (2√3−2)/3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001123', '00000000-0000-0000-0001-000000000281', 'C) (4−3√3)/8', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001124', '00000000-0000-0000-0001-000000000281', 'D) (2−√3)/4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000282', '00000000-0000-0000-0000-000000000019', '³√(9x⁵−4x)/³√(3x²)−²√(³√x)) − 2/x^{−2/3} ni soddalashtiring.', 'Mavzu C', 12, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001125', '00000000-0000-0000-0001-000000000282', 'A) ³√3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001126', '00000000-0000-0000-0001-000000000282', 'B) ³√(3x)', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001127', '00000000-0000-0000-0001-000000000282', 'C) ³√(2x²)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001128', '00000000-0000-0000-0001-000000000282', 'D) −³√x', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000283', '00000000-0000-0000-0000-000000000019', '⁴√(11+2√18)·⁸√9−⁸√80·⁸√9+⁸√80 ni hisoblang.', 'Mavzu C', 13, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001129', '00000000-0000-0000-0001-000000000283', 'A) √3+2', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001130', '00000000-0000-0000-0001-000000000283', 'B) √2+3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001131', '00000000-0000-0000-0001-000000000283', 'C) √3+√2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001132', '00000000-0000-0000-0001-000000000283', 'D) √3', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000284', '00000000-0000-0000-0000-000000000019', '(5·⁵√(7·³√54)+15·⁵√128) / (3·⁴√(4·³√32)+3·⁹√(4·³√162)) ni hisoblang.', 'Mavzu C', 14, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001133', '00000000-0000-0000-0001-000000000284', 'A) 2^{5/12}', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001134', '00000000-0000-0000-0001-000000000284', 'B) 1/⁴√2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001135', '00000000-0000-0000-0001-000000000284', 'C) −1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001136', '00000000-0000-0000-0001-000000000284', 'D) 1', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000285', '00000000-0000-0000-0000-000000000019', '√(15−9√3+√2+4√3−2√4−2√3) ni hisoblang.', 'Mavzu C', 15, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001137', '00000000-0000-0000-0001-000000000285', 'A) 2√3−2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001138', '00000000-0000-0000-0001-000000000285', 'B) 2√3+1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001139', '00000000-0000-0000-0001-000000000285', 'C) 2√3−1', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001140', '00000000-0000-0000-0001-000000000285', 'D) 2√3+2', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000020', 'Haqiqiy sonlar - Variant 5', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000286', '00000000-0000-0000-0000-000000000020', '√0,09 + √0,16 − √0,81 + √2,56 ni hisoblang.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001141', '00000000-0000-0000-0001-000000000286', 'A) 1,2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001142', '00000000-0000-0000-0001-000000000286', 'B) 1,4', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001143', '00000000-0000-0000-0001-000000000286', 'C) 1,6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001144', '00000000-0000-0000-0001-000000000286', 'D) 0,12', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000287', '00000000-0000-0000-0000-000000000020', 'a = √13−√11 va b = √7−√5 bo''lsa, quyidagi mulohazalardan qaysi biri to''g''ri?', 'Mavzu A', 2, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001145', '00000000-0000-0000-0001-000000000287', 'A) a−b < 0', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001146', '00000000-0000-0000-0001-000000000287', 'B) 0 < a−b < 1', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001147', '00000000-0000-0000-0001-000000000287', 'C) a−b > 2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001148', '00000000-0000-0000-0001-000000000287', 'D) 1 < a−b < 2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000288', '00000000-0000-0000-0000-000000000020', '−0,2 + 0,3√6·√12√8 ning 10%ini toping.', 'Mavzu A', 3, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001149', '00000000-0000-0000-0001-000000000288', 'A) 0,3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001150', '00000000-0000-0000-0001-000000000288', 'B) 0,2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001151', '00000000-0000-0000-0001-000000000288', 'C) 7', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001152', '00000000-0000-0000-0001-000000000288', 'D) 0,7', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000289', '00000000-0000-0000-0000-000000000020', '2√3·3√12 ni hisoblang.', 'Mavzu A', 4, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001153', '00000000-0000-0000-0001-000000000289', 'A) 18', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001154', '00000000-0000-0000-0001-000000000289', 'B) 36', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001155', '00000000-0000-0000-0001-000000000289', 'C) 12', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001156', '00000000-0000-0000-0001-000000000289', 'D) 6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000290', '00000000-0000-0000-0000-000000000020', '√70 ning butun qiymatini toping.', 'Mavzu A', 5, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001157', '00000000-0000-0000-0001-000000000290', 'A) 7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001158', '00000000-0000-0000-0001-000000000290', 'B) 8', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001159', '00000000-0000-0000-0001-000000000290', 'C) 9', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001160', '00000000-0000-0000-0001-000000000290', 'D) 10', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000291', '00000000-0000-0000-0000-000000000020', '1/2·√8 − 3/4·√32 + 2/3·√18 ni hisoblang.', 'Mavzu B', 6, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001161', '00000000-0000-0000-0001-000000000291', 'A) −2√2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001162', '00000000-0000-0000-0001-000000000291', 'B) √2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001163', '00000000-0000-0000-0001-000000000291', 'C) 0', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001164', '00000000-0000-0000-0001-000000000291', 'D) −√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000292', '00000000-0000-0000-0000-000000000020', '√4500 qaysi ifodaga teng?', 'Mavzu B', 7, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001165', '00000000-0000-0000-0001-000000000292', 'A) 18√6', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001166', '00000000-0000-0000-0001-000000000292', 'B) 30√5', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001167', '00000000-0000-0000-0001-000000000292', 'C) 30√6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001168', '00000000-0000-0000-0001-000000000292', 'D) 9√30', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000293', '00000000-0000-0000-0000-000000000020', 'a = ³√2·√3, b = √2·³√3, c = 6⁶√6, d = √2·√3 sonlarini o''sish tartibida yozing.', 'Mavzu B', 8, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001169', '00000000-0000-0000-0001-000000000293', 'A) c<b<a<d', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001170', '00000000-0000-0000-0001-000000000293', 'B) d<a<b<c', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001171', '00000000-0000-0000-0001-000000000293', 'C) c<a<b<d', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001172', '00000000-0000-0000-0001-000000000293', 'D) c<d<b<a', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000294', '00000000-0000-0000-0000-000000000020', '8/(3√6) ni ratsionallashtirib soddalashtiring.', 'Mavzu B', 9, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001173', '00000000-0000-0000-0001-000000000294', 'A) 2√3/3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001174', '00000000-0000-0000-0001-000000000294', 'B) 4√6/9', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001175', '00000000-0000-0000-0001-000000000294', 'C) 3√6/4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001176', '00000000-0000-0000-0001-000000000294', 'D) 2√6/9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000295', '00000000-0000-0000-0000-000000000020', 'Quyidagilardan qaysi biri irratsional son? A)2π−6,28; B)2√4−3√9; C)(3√2·0)·(π+e); D)√45/√5', 'Mavzu B', 10, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001177', '00000000-0000-0000-0001-000000000295', 'A) A', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001178', '00000000-0000-0000-0001-000000000295', 'B) B', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001179', '00000000-0000-0000-0001-000000000295', 'C) C', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001180', '00000000-0000-0000-0001-000000000295', 'D) D', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000296', '00000000-0000-0000-0000-000000000020', '³√200 + √(200+8·³√343) ni hisoblang.', 'Mavzu C', 11, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001181', '00000000-0000-0000-0001-000000000296', 'A) 7', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001182', '00000000-0000-0000-0001-000000000296', 'B) 8', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001183', '00000000-0000-0000-0001-000000000296', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001184', '00000000-0000-0000-0001-000000000296', 'D) 9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000297', '00000000-0000-0000-0000-000000000020', '√(7−3√5,(3)) + √(7+3√5,(3)) / √2 ni hisoblang.', 'Mavzu C', 12, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001185', '00000000-0000-0000-0001-000000000297', 'A) 2√3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001186', '00000000-0000-0000-0001-000000000297', 'B) √6', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001187', '00000000-0000-0000-0001-000000000297', 'C) 4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001188', '00000000-0000-0000-0001-000000000297', 'D) 2√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000298', '00000000-0000-0000-0000-000000000020', '(5·⁵√(7·³√54)+15·⁵√128) / (3·⁴√(4·³√32)+3·⁹√(4·³√162)) ni hisoblang.', 'Mavzu C', 13, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001189', '00000000-0000-0000-0001-000000000298', 'A) 2^{5/12}', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001190', '00000000-0000-0000-0001-000000000298', 'B) 1/⁴√2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001191', '00000000-0000-0000-0001-000000000298', 'C) −1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001192', '00000000-0000-0000-0001-000000000298', 'D) 1', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000299', '00000000-0000-0000-0000-000000000020', '⁴√(216x³(5+2√6))·√(3√2x−2√3x) ni soddalashtiring.', 'Mavzu C', 14, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001193', '00000000-0000-0000-0001-000000000299', 'A) −x', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001194', '00000000-0000-0000-0001-000000000299', 'B) ⁴√3x', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001195', '00000000-0000-0000-0001-000000000299', 'C) √2x', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001196', '00000000-0000-0000-0001-000000000299', 'D) 6x', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000300', '00000000-0000-0000-0000-000000000020', '⁴√(11+2√18)·⁸√9−⁸√80·⁸√9+⁸√80 ni hisoblang.', 'Mavzu C', 15, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001197', '00000000-0000-0000-0001-000000000300', 'A) √3+2', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001198', '00000000-0000-0000-0001-000000000300', 'B) √2+3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001199', '00000000-0000-0000-0001-000000000300', 'C) √3+√2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001200', '00000000-0000-0000-0001-000000000300', 'D) √3', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000021', 'Tenglama - Variant 1', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000301', '00000000-0000-0000-0000-000000000021', '4(3²+1)(3⁴+1)...(3^{256}+1)·x = 1 − 3^{512} tenglamani yeching.', 'Mavzu A', 1, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001201', '00000000-0000-0000-0001-000000000301', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001202', '00000000-0000-0000-0001-000000000301', 'B) −2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001203', '00000000-0000-0000-0001-000000000301', 'C) 1/2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001204', '00000000-0000-0000-0001-000000000301', 'D) −1/3', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000302', '00000000-0000-0000-0000-000000000021', 'x − (5x − (2·(−(1+3x)+x)+3)) = 8 − x tenglamani yeching.', 'Mavzu A', 2, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001205', '00000000-0000-0000-0001-000000000302', 'A) −2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001206', '00000000-0000-0000-0001-000000000302', 'B) 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001207', '00000000-0000-0000-0001-000000000302', 'C) −4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001208', '00000000-0000-0000-0001-000000000302', 'D) −3', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000303', '00000000-0000-0000-0000-000000000021', '3(4+1)(2⁴+1)...(2^{512}+1)·x = 1 − 2^{1024} tenglamani yeching.', 'Mavzu A', 3, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001209', '00000000-0000-0000-0001-000000000303', 'A) 1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001210', '00000000-0000-0000-0001-000000000303', 'B) −1', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001211', '00000000-0000-0000-0001-000000000303', 'C) 1/3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001212', '00000000-0000-0000-0001-000000000303', 'D) −1/3', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000304', '00000000-0000-0000-0000-000000000021', '3x+1/2 − 2x+3 = x+2/7 tenglamani yeching.', 'Mavzu A', 4, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001213', '00000000-0000-0000-0001-000000000304', 'A) 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001214', '00000000-0000-0000-0001-000000000304', 'B) 5', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001215', '00000000-0000-0000-0001-000000000304', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001216', '00000000-0000-0000-0001-000000000304', 'D) 7', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000305', '00000000-0000-0000-0000-000000000021', '378:(50−115:x) = 14 tenglamani yeching.', 'Mavzu A', 5, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001217', '00000000-0000-0000-0001-000000000305', 'A) 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001218', '00000000-0000-0000-0001-000000000305', 'B) 5', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001219', '00000000-0000-0000-0001-000000000305', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001220', '00000000-0000-0000-0001-000000000305', 'D) 7', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000306', '00000000-0000-0000-0000-000000000021', 'x² − 12x + q = 0 tenglamaning ildizlaridan biri ikkinchisidan 2 marta katta. Bu tenglamaning koeffitsiyentlari yig''indisini toping.', 'Mavzu B', 6, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001221', '00000000-0000-0000-0001-000000000306', 'A) 21', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001222', '00000000-0000-0000-0001-000000000306', 'B) 32', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001223', '00000000-0000-0000-0001-000000000306', 'C) 44', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001224', '00000000-0000-0000-0001-000000000306', 'D) 45', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000307', '00000000-0000-0000-0000-000000000021', '8x² − 9x + 2 = 0 tenglamaning ildizlari o''rta arifmetigining o''rta geometrigiga nisbatini toping.', 'Mavzu B', 7, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001225', '00000000-0000-0000-0001-000000000307', 'A) 1 1/8', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001226', '00000000-0000-0000-0001-000000000307', 'B) 7/8', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001227', '00000000-0000-0000-0001-000000000307', 'C) 9/16', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001228', '00000000-0000-0000-0001-000000000307', 'D) 16/9', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000308', '00000000-0000-0000-0000-000000000021', 'x² − 9x + a + b = 0 tenglamaning ildizlari a va b ga teng bo''lsa, bu tenglamaning diskriminantini toping.', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001229', '00000000-0000-0000-0001-000000000308', 'A) 81', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001230', '00000000-0000-0000-0001-000000000308', 'B) 49', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001231', '00000000-0000-0000-0001-000000000308', 'C) 33', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001232', '00000000-0000-0000-0001-000000000308', 'D) 45', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000309', '00000000-0000-0000-0000-000000000021', 'x₁ va x₂ x² − 6x + 3 = 0 tenglamaning ildizlari bo''lsa, ildizlari 2x₁+1 va 2x₂+1 bo''lgan tenglamani toping.', 'Mavzu B', 9, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001233', '00000000-0000-0000-0001-000000000309', 'A) x²−10x+25=0', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001234', '00000000-0000-0000-0001-000000000309', 'B) x²−14x+25=0', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001235', '00000000-0000-0000-0001-000000000309', 'C) x²+12x+14=0', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001236', '00000000-0000-0000-0001-000000000309', 'D) x²−14x+16=0', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000310', '00000000-0000-0000-0000-000000000021', 'x₁ va x₂ x² − 5x + 3 = 0 tenglamaning ildizlari. (2/x₁ + 2x₂)(1/x₂ + 2x₁) ifodaning qiymatini toping.', 'Mavzu B', 10, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001237', '00000000-0000-0000-0001-000000000310', 'A) 11,(6)', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001238', '00000000-0000-0000-0001-000000000310', 'B) 14', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001239', '00000000-0000-0000-0001-000000000310', 'C) 5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001240', '00000000-0000-0000-0001-000000000310', 'D) 8,(6)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000311', '00000000-0000-0000-0000-000000000021', '7/(x−4)(x+1)(x+3) = A/(x²−x−12) + B/(x²−3x−4) bo''lsa, B ning qiymatini toping.', 'Mavzu C', 11, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001241', '00000000-0000-0000-0001-000000000311', 'A) 15', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001242', '00000000-0000-0000-0001-000000000311', 'B) 7,5', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001243', '00000000-0000-0000-0001-000000000311', 'C) 0', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001244', '00000000-0000-0000-0001-000000000311', 'D) −7,5', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000312', '00000000-0000-0000-0000-000000000021', '7/(x−4)(x+1)(x+3) = A/x²−x−12 + B/x²−3x−4 ifoda ayniyat bo''lsa, B ning qiymatini toping.', 'Mavzu C', 12, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001245', '00000000-0000-0000-0001-000000000312', 'A) 2,5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001246', '00000000-0000-0000-0001-000000000312', 'B) −3,5', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001247', '00000000-0000-0000-0001-000000000312', 'C) −1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001248', '00000000-0000-0000-0001-000000000312', 'D) 1', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000313', '00000000-0000-0000-0000-000000000021', 'x + 2/(x−2)(x+3) + x/(x+3)(x−1) = 2/(x−2)(x−1) tenglamani yeching.', 'Mavzu C', 13, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001249', '00000000-0000-0000-0001-000000000313', 'A) 0', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001250', '00000000-0000-0000-0001-000000000313', 'B) 1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001251', '00000000-0000-0000-0001-000000000313', 'C) 2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001252', '00000000-0000-0000-0001-000000000313', 'D) 4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000314', '00000000-0000-0000-0000-000000000021', 'x/2 − 1/( 2/2 + 1) = 5 tenglamani yeching.', 'Mavzu C', 14, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001253', '00000000-0000-0000-0001-000000000314', 'A) 18', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001254', '00000000-0000-0000-0001-000000000314', 'B) 26', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001255', '00000000-0000-0000-0001-000000000314', 'C) 38', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001256', '00000000-0000-0000-0001-000000000314', 'D) 54', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000315', '00000000-0000-0000-0000-000000000021', '2x−1/6 − x−2/3 = 1/2 tenglamani yeching.', 'Mavzu C', 15, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001257', '00000000-0000-0000-0001-000000000315', 'A) 0,5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001258', '00000000-0000-0000-0001-000000000315', 'B) Ø', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001259', '00000000-0000-0000-0001-000000000315', 'C) (−∞;∞)', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001260', '00000000-0000-0000-0001-000000000315', 'D) 0,(6)', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000022', 'Tenglama - Variant 2', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000316', '00000000-0000-0000-0000-000000000022', '2x+y/2y−x = 3/2 proporsiya berilgan. y/x ni toping.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001261', '00000000-0000-0000-0001-000000000316', 'A) 1/3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001262', '00000000-0000-0000-0001-000000000316', 'B) 3', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001263', '00000000-0000-0000-0001-000000000316', 'C) 2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001264', '00000000-0000-0000-0001-000000000316', 'D) 1/2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000317', '00000000-0000-0000-0000-000000000022', 'a−b; 2; a+2b va 3 sonlari proporsiyaning ketma-ket hadlari bo''lsa, a²+3b²/(a²−23b²) ni hisoblang.', 'Mavzu A', 2, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001265', '00000000-0000-0000-0001-000000000317', 'A) 1/3', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001266', '00000000-0000-0000-0001-000000000317', 'B) 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001267', '00000000-0000-0000-0001-000000000317', 'C) 2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001268', '00000000-0000-0000-0001-000000000317', 'D) 1/2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000318', '00000000-0000-0000-0000-000000000022', '120:(90 − 800:x) = 3 tenglamani yeching.', 'Mavzu A', 3, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001269', '00000000-0000-0000-0001-000000000318', 'A) 10', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001270', '00000000-0000-0000-0001-000000000318', 'B) 25', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001271', '00000000-0000-0000-0001-000000000318', 'C) 8', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001272', '00000000-0000-0000-0001-000000000318', 'D) 16', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000319', '00000000-0000-0000-0000-000000000022', '5(1/5):4(1/3) = 2(1/4):x ni yeching.', 'Mavzu A', 4, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001273', '00000000-0000-0000-0001-000000000319', 'A) 1 7/8', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001274', '00000000-0000-0000-0001-000000000319', 'B) 8/15', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001275', '00000000-0000-0000-0001-000000000319', 'C) 1 5/12', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001276', '00000000-0000-0000-0001-000000000319', 'D) 2 3/20', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000320', '00000000-0000-0000-0000-000000000022', '1/2 − 1/3 : (1/x − 1/4) = 1/6 tenglamani yeching.', 'Mavzu A', 5, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001277', '00000000-0000-0000-0001-000000000320', 'A) 4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001278', '00000000-0000-0000-0001-000000000320', 'B) 1', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001279', '00000000-0000-0000-0001-000000000320', 'C) 0,5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001280', '00000000-0000-0000-0001-000000000320', 'D) 0,25', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000321', '00000000-0000-0000-0000-000000000022', 'x² − 5x − 24 = 0 tenglamaning kichik ildizidan katta ildizi ayirmasini toping.', 'Mavzu B', 6, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001281', '00000000-0000-0000-0001-000000000321', 'A) −11', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001282', '00000000-0000-0000-0001-000000000321', 'B) 11', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001283', '00000000-0000-0000-0001-000000000321', 'C) 5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001284', '00000000-0000-0000-0001-000000000321', 'D) −5', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000322', '00000000-0000-0000-0000-000000000022', '8x² = 3 − 2x tenglamaning ildizlari ko''paytmasi va yig''indisining ko''paytmasini toping.', 'Mavzu B', 7, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001285', '00000000-0000-0000-0001-000000000322', 'A) −3/32', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001286', '00000000-0000-0000-0001-000000000322', 'B) 3/4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001287', '00000000-0000-0000-0001-000000000322', 'C) −3/16', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001288', '00000000-0000-0000-0001-000000000322', 'D) 3/32', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000323', '00000000-0000-0000-0000-000000000022', 'x² + bx + c = 0 kvadrat tenglamaning diskriminanti Δ bo''lsa, quyidagilarning noto''g''risini toping.', 'Mavzu B', 8, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001289', '00000000-0000-0000-0001-000000000323', 'A) 1,5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001290', '00000000-0000-0000-0001-000000000323', 'B) 2,3', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001291', '00000000-0000-0000-0001-000000000323', 'C) 2,4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001292', '00000000-0000-0000-0001-000000000323', 'D) 3,4,5', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000324', '00000000-0000-0000-0000-000000000022', 'x² + 2x + 1/x² + 2·(x + 1/x) − 6 = 0 tenglamaning ildizlari yig''indisini toping.', 'Mavzu B', 9, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001293', '00000000-0000-0000-0001-000000000324', 'A) −3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001294', '00000000-0000-0000-0001-000000000324', 'B) −4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001295', '00000000-0000-0000-0001-000000000324', 'C) 1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001296', '00000000-0000-0000-0001-000000000324', 'D) −2', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000325', '00000000-0000-0000-0000-000000000022', 'x₁ va x₂ x² − 5x + 3 = 0 ildizlari. √x₁ + √x₂ ning qiymatini toping.', 'Mavzu B', 10, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001297', '00000000-0000-0000-0001-000000000325', 'A) √13', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001298', '00000000-0000-0000-0001-000000000325', 'B) 2√13', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001299', '00000000-0000-0000-0001-000000000325', 'C) √15', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001300', '00000000-0000-0000-0001-000000000325', 'D) √17', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000326', '00000000-0000-0000-0000-000000000022', '3x+1/2−(3x+4)/(−4(2x+3)+3(2x−4)) = 4/3 tenglamani yeching.', 'Mavzu C', 11, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001301', '00000000-0000-0000-0001-000000000326', 'A) 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001302', '00000000-0000-0000-0001-000000000326', 'B) −3 15/44', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001303', '00000000-0000-0000-0001-000000000326', 'C) −2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001304', '00000000-0000-0000-0001-000000000326', 'D) 147/44', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000327', '00000000-0000-0000-0000-000000000022', 'x/(2−1) / (2/2+1 − 1) = 5 tenglamani yeching.', 'Mavzu C', 12, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001305', '00000000-0000-0000-0001-000000000327', 'A) 18', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001306', '00000000-0000-0000-0001-000000000327', 'B) 26', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001307', '00000000-0000-0000-0001-000000000327', 'C) 38', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001308', '00000000-0000-0000-0001-000000000327', 'D) 54', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000328', '00000000-0000-0000-0000-000000000022', '3(2x+3)+2(3x+4) / (−4(2x+3)+3(2x−4)) = 4/3 tenglamani yeching.', 'Mavzu C', 13, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001309', '00000000-0000-0000-0001-000000000328', 'A) 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001310', '00000000-0000-0000-0001-000000000328', 'B) −3 15/44', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001311', '00000000-0000-0000-0001-000000000328', 'C) −2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001312', '00000000-0000-0000-0001-000000000328', 'D) 147/44', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000329', '00000000-0000-0000-0000-000000000022', '2x−1/6 − x−2/3 = 1/2 tenglamani yeching.', 'Mavzu C', 14, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001313', '00000000-0000-0000-0001-000000000329', 'A) 0,5', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001314', '00000000-0000-0000-0001-000000000329', 'B) Ø', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001315', '00000000-0000-0000-0001-000000000329', 'C) (−∞;∞)', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001316', '00000000-0000-0000-0001-000000000329', 'D) 0,(6)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000330', '00000000-0000-0000-0000-000000000022', '3x²/7x−2 + 7x−2/x² = 4 tenglamaning ildizlari ko''paytmasini toping.', 'Mavzu C', 15, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001317', '00000000-0000-0000-0001-000000000330', 'A) 0,(6)', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001318', '00000000-0000-0000-0001-000000000330', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001319', '00000000-0000-0000-0001-000000000330', 'C) 7', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001320', '00000000-0000-0000-0001-000000000330', 'D) 1,(3)', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000023', 'Tenglama - Variant 3', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000331', '00000000-0000-0000-0000-000000000023', '3·4+1·(2⁴+1)...(2^{512}+1)·x = 1−2^{1024} tenglamani yeching.', 'Mavzu A', 1, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001321', '00000000-0000-0000-0001-000000000331', 'A) 1', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001322', '00000000-0000-0000-0001-000000000331', 'B) −1', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001323', '00000000-0000-0000-0001-000000000331', 'C) 1/3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001324', '00000000-0000-0000-0001-000000000331', 'D) −1/3', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000332', '00000000-0000-0000-0000-000000000023', 'x − (5x − (2·(−(1+3x)+x)+3)) = 8−x tenglamani yeching.', 'Mavzu A', 2, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001325', '00000000-0000-0000-0001-000000000332', 'A) −2', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001326', '00000000-0000-0000-0001-000000000332', 'B) 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001327', '00000000-0000-0000-0001-000000000332', 'C) −4', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001328', '00000000-0000-0000-0001-000000000332', 'D) −3', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000333', '00000000-0000-0000-0000-000000000023', 'a/b = b/c = c/a bo''lsa, a, b va c haqida qanday xulosa chiqarish mumkin?', 'Mavzu A', 3, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001329', '00000000-0000-0000-0001-000000000333', 'A) a=b=c', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001330', '00000000-0000-0000-0001-000000000333', 'B) a<b<c', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001331', '00000000-0000-0000-0001-000000000333', 'C) a>b>c', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001332', '00000000-0000-0000-0001-000000000333', 'D) aniqlab bo''lmaydi', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000334', '00000000-0000-0000-0000-000000000023', '5(1/5):4(1/3) = 2(1/4):x tenglamani yeching.', 'Mavzu A', 4, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001333', '00000000-0000-0000-0001-000000000334', 'A) 1 7/8', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001334', '00000000-0000-0000-0001-000000000334', 'B) 8/15', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001335', '00000000-0000-0000-0001-000000000334', 'C) 1 5/12', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001336', '00000000-0000-0000-0001-000000000334', 'D) 2 3/20', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000335', '00000000-0000-0000-0000-000000000023', '240:(120−360:x) = 5 tenglamani yeching.', 'Mavzu A', 5, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001337', '00000000-0000-0000-0001-000000000335', 'A) 6', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001338', '00000000-0000-0000-0001-000000000335', 'B) 5', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001339', '00000000-0000-0000-0001-000000000335', 'C) 12', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001340', '00000000-0000-0000-0001-000000000335', 'D) 15', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000336', '00000000-0000-0000-0000-000000000023', 'x₁ va x₂ x²−30x+81 = 0 ildizlari bo''lsa, √x₁+√x₂ ning qiymatini toping.', 'Mavzu B', 6, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001341', '00000000-0000-0000-0001-000000000336', 'A) √30', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001342', '00000000-0000-0000-0001-000000000336', 'B) 9', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001343', '00000000-0000-0000-0001-000000000336', 'C) 4√3', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001344', '00000000-0000-0000-0001-000000000336', 'D) 5√2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000337', '00000000-0000-0000-0000-000000000023', 'ax² + bx + c = 0 tenglamaning ildizlari o''zero teskari sonlar bo''lsa, quyidagi mulohazalardan qaysi biri to''g''ri?', 'Mavzu B', 7, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001345', '00000000-0000-0000-0001-000000000337', 'A) a=c; b=0; 3)|b|>|2c|; 4)|b|<|2a|.', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001346', '00000000-0000-0000-0001-000000000337', 'B) 2 va 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001347', '00000000-0000-0000-0001-000000000337', 'C) 1 va 3', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001348', '00000000-0000-0000-0001-000000000337', 'D) 2 va 4', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000338', '00000000-0000-0000-0000-000000000023', 'x² − 5x + 3 = 0 ildizlari x₁ va x₂. √x₁ + √x₂ = ?', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001349', '00000000-0000-0000-0001-000000000338', 'A) √13', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001350', '00000000-0000-0000-0001-000000000338', 'B) 2√13', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001351', '00000000-0000-0000-0001-000000000338', 'C) √15', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001352', '00000000-0000-0000-0001-000000000338', 'D) √17', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000339', '00000000-0000-0000-0000-000000000023', 'a² + 6ab − 7b² = 0 bo''lsa, (2a−5b)/(6b−7a) ning eng kichik qiymatini hisoblang.', 'Mavzu B', 9, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001353', '00000000-0000-0000-0001-000000000339', 'A) −19/55', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001354', '00000000-0000-0000-0001-000000000339', 'B) 3', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001355', '00000000-0000-0000-0001-000000000339', 'C) 19/42', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001356', '00000000-0000-0000-0001-000000000339', 'D) 19/55', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000340', '00000000-0000-0000-0000-000000000023', 'x² − 7x + 1 = 0 bo''lsa, x⁴ + 4x² + 4 / 2x² ni hisoblang.', 'Mavzu B', 10, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001357', '00000000-0000-0000-0001-000000000340', 'A) 12,5', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001358', '00000000-0000-0000-0001-000000000340', 'B) 0,5', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001359', '00000000-0000-0000-0001-000000000340', 'C) 5,5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001360', '00000000-0000-0000-0001-000000000340', 'D) 8,6', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000341', '00000000-0000-0000-0000-000000000023', '3x+1/2 − 5 − 12/(2−5) = (x−2)/5 tenglamani yeching.', 'Mavzu C', 11, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001361', '00000000-0000-0000-0001-000000000341', 'A) 4', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001362', '00000000-0000-0000-0001-000000000341', 'B) 5', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001363', '00000000-0000-0000-0001-000000000341', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001364', '00000000-0000-0000-0001-000000000341', 'D) 7', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000342', '00000000-0000-0000-0000-000000000023', 'x+1/3 − 1 / (3/3 − 1) = 1 tenglamani yeching.', 'Mavzu C', 12, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001365', '00000000-0000-0000-0001-000000000342', 'A) 17', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001366', '00000000-0000-0000-0001-000000000342', 'B) 26', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001367', '00000000-0000-0000-0001-000000000342', 'C) 38', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001368', '00000000-0000-0000-0001-000000000342', 'D) 54', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000343', '00000000-0000-0000-0000-000000000023', '3x²/(7x−2) + (7x−2)/x² = 4 tenglamaning ildizlari ko''paytmasini toping.', 'Mavzu C', 13, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001369', '00000000-0000-0000-0001-000000000343', 'A) 0,(6)', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001370', '00000000-0000-0000-0001-000000000343', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001371', '00000000-0000-0000-0001-000000000343', 'C) 7', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001372', '00000000-0000-0000-0001-000000000343', 'D) 1,(3)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000344', '00000000-0000-0000-0000-000000000023', 'x/(x−1) − x/(x+1) : 1/(x − 1/x) tenglamani yeching.', 'Mavzu C', 14, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001373', '00000000-0000-0000-0001-000000000344', 'A) aniqlab bo''lmaydi', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001374', '00000000-0000-0000-0001-000000000344', 'B) 2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001375', '00000000-0000-0000-0001-000000000344', 'C) 0', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001376', '00000000-0000-0000-0001-000000000344', 'D) ∞', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000345', '00000000-0000-0000-0000-000000000023', '2x−4/(x−2) > x − 8 tengsizlikni yeching.', 'Mavzu C', 15, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001377', '00000000-0000-0000-0001-000000000345', 'A) (−∞;2)∪(10;∞)', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001378', '00000000-0000-0000-0001-000000000345', 'B) (−∞;2)∪(2;10)', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001379', '00000000-0000-0000-0001-000000000345', 'C) (2;10)', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001380', '00000000-0000-0000-0001-000000000345', 'D) (−∞;10)', false, 3);

INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('00000000-0000-0000-0000-000000000024', 'Tenglama - Variant 4', 'math', 60, 'Har bir bob 3 mavzuga bo''lingan. Har bir qismdan 5 variant × 15 savol = 75 savol. Savollar kitobdan olingan.', true, now(), now());

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000346', '00000000-0000-0000-0000-000000000024', '4(3²+1)(3⁴+1)...(3^{256}+1)x = 1−3^{512} tenglamani yeching.', 'Mavzu A', 1, 'D', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001381', '00000000-0000-0000-0001-000000000346', 'A) 3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001382', '00000000-0000-0000-0001-000000000346', 'B) −2', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001383', '00000000-0000-0000-0001-000000000346', 'C) 1/2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001384', '00000000-0000-0000-0001-000000000346', 'D) −1/3', true, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000347', '00000000-0000-0000-0000-000000000024', '378:(50−115:x) = 14 tenglamani yeching.', 'Mavzu A', 2, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001385', '00000000-0000-0000-0001-000000000347', 'A) 4', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001386', '00000000-0000-0000-0001-000000000347', 'B) 5', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001387', '00000000-0000-0000-0001-000000000347', 'C) 6', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001388', '00000000-0000-0000-0001-000000000347', 'D) 7', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000348', '00000000-0000-0000-0000-000000000024', '2x+y/(2y−x) = 3/2 proporsiyada y/x ni toping.', 'Mavzu A', 3, 'B', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001389', '00000000-0000-0000-0001-000000000348', 'A) 1/3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001390', '00000000-0000-0000-0001-000000000348', 'B) 3', true, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001391', '00000000-0000-0000-0001-000000000348', 'C) 2', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001392', '00000000-0000-0000-0001-000000000348', 'D) 1/2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000349', '00000000-0000-0000-0000-000000000024', '1001² − 999² = 4p bo''lsa, p = ?', 'Mavzu A', 4, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001393', '00000000-0000-0000-0001-000000000349', 'A) 1000', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001394', '00000000-0000-0000-0001-000000000349', 'B) 500', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001395', '00000000-0000-0000-0001-000000000349', 'C) 100', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001396', '00000000-0000-0000-0001-000000000349', 'D) 50', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000350', '00000000-0000-0000-0000-000000000024', 'a/7 = b/4 = c/5 va a−3b/c·k = 8 bo''lsa, k = ?', 'Mavzu A', 5, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001397', '00000000-0000-0000-0001-000000000350', 'A) −1/10', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001398', '00000000-0000-0000-0001-000000000350', 'B) −1/8', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001399', '00000000-0000-0000-0001-000000000350', 'C) −1/8', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001400', '00000000-0000-0000-0001-000000000350', 'D) −1/2', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000351', '00000000-0000-0000-0000-000000000024', 'x²−12x+q = 0 tenglamaning ildizlaridan biri ikkinchisidan 2 marta katta. Koeffitsiyentlar yig''indisini toping.', 'Mavzu B', 6, 'C', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001401', '00000000-0000-0000-0001-000000000351', 'A) 21', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001402', '00000000-0000-0000-0001-000000000351', 'B) 32', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001403', '00000000-0000-0000-0001-000000000351', 'C) 44', true, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001404', '00000000-0000-0000-0001-000000000351', 'D) 45', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000352', '00000000-0000-0000-0000-000000000024', 'x²−9x+a+b = 0 tenglamaning ildizlari a va b. Diskriminantni toping.', 'Mavzu B', 7, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001405', '00000000-0000-0000-0001-000000000352', 'A) 81', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001406', '00000000-0000-0000-0001-000000000352', 'B) 49', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001407', '00000000-0000-0000-0001-000000000352', 'C) 33', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001408', '00000000-0000-0000-0001-000000000352', 'D) 45', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000353', '00000000-0000-0000-0000-000000000024', 'x²−11x+4 = 0 tenglamaning ildizlari x₁ va x₂. (2/x₁+2x₂)·(1/x₂+2x₁) = ?', 'Mavzu B', 8, 'A', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001409', '00000000-0000-0000-0001-000000000353', 'A) 11,(6)', true, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001410', '00000000-0000-0000-0001-000000000353', 'B) 14', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001411', '00000000-0000-0000-0001-000000000353', 'C) 5', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001412', '00000000-0000-0000-0001-000000000353', 'D) 8,(6)', false, 3);

INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('00000000-0000-0000-0001-000000000354', '00000000-0000-0000-0000-000000000024', 'x²+2x+1/x² + 2·(x+1/x) − 6 = 0 ildizlari yig''indisini toping.', 'Mavzu B', 9, 'undefined', '{}'::jsonb, now());
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001413', '00000000-0000-0000-0001-000000000354', 'A) −3', false, 0);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001414', '00000000-0000-0000-0001-000000000354', 'B) −4', false, 1);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001415', '00000000-0000-0000-0001-000000000354', 'C) 1', false, 2);
INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('00000000-0000-0000-0002-000000001416', '00000000-0000-0000-0001-000000000354', 'D) −2', false, 3);

