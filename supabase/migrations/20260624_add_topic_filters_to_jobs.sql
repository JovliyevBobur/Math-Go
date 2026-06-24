-- Add topic filtering and max questions parameters to pdf_import_jobs
ALTER TABLE public.pdf_import_jobs
  ADD COLUMN IF NOT EXISTS topic_start INTEGER DEFAULT 0,
  ADD COLUMN IF NOT EXISTS topic_end INTEGER DEFAULT 999,
  ADD COLUMN IF NOT EXISTS max_questions INTEGER DEFAULT 9999;
