-- Create books storage bucket (was missing from the original migration)
INSERT INTO storage.buckets (id, name, public, file_size_limit)
VALUES ('books', 'books', false, 524288000)
ON CONFLICT (id) DO NOTHING;
