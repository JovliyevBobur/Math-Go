-- Add topic_order (numeric topic/chapter number) and source (book/ai) to questions
ALTER TABLE public.questions
  ADD COLUMN IF NOT EXISTS topic_order INTEGER,
  ADD COLUMN IF NOT EXISTS source TEXT DEFAULT 'book' CHECK (source IN ('book', 'ai', 'manual'));

-- Add index for faster filtering by topic_order
CREATE INDEX IF NOT EXISTS idx_questions_topic_order ON public.questions(test_id, topic_order);

-- Update existing questions to have source based on their presence
-- If a question has solution_text and intermediate_steps, it's likely from book
UPDATE public.questions 
SET source = 'book' 
WHERE solution_text IS NOT NULL 
  AND intermediate_steps != '[]'::jsonb;

UPDATE public.questions 
SET source = 'ai' 
WHERE source IS NULL OR source = 'book';
