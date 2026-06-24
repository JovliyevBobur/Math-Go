-- Add topic grouping and question count parameters to pdf_import_jobs
ALTER TABLE public.pdf_import_jobs
  ADD COLUMN IF NOT EXISTS num_groups INTEGER DEFAULT 3 CHECK (num_groups IN (3, 4)),
  ADD COLUMN IF NOT EXISTS max_questions INTEGER DEFAULT 9999;
