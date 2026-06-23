DO $$
BEGIN
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'app_role' AND typnamespace = 'public'::regnamespace) THEN
    CREATE TYPE public.app_role AS ENUM ('super_admin', 'admin', 'user');
  END IF;
  IF NOT EXISTS (SELECT 1 FROM pg_type WHERE typname = 'subject' AND typnamespace = 'public'::regnamespace) THEN
    CREATE TYPE public.subject AS ENUM ('math', 'physics', 'english', 'history', 'russian', 'uzbek', 'chemistry', 'biology', 'informatics');
  END IF;
END $$;

CREATE TABLE IF NOT EXISTS public.profiles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL UNIQUE,
  full_name text NOT NULL,
  avatar_url text,
  is_blocked boolean NOT NULL DEFAULT false,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT, INSERT, UPDATE ON public.profiles TO authenticated;
GRANT ALL ON public.profiles TO service_role;
ALTER TABLE public.profiles ENABLE ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS public.user_roles (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL,
  role public.app_role NOT NULL DEFAULT 'user',
  created_at timestamptz NOT NULL DEFAULT now(),
  UNIQUE (user_id, role)
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.user_roles TO authenticated;
GRANT ALL ON public.user_roles TO service_role;
ALTER TABLE public.user_roles ENABLE ROW LEVEL SECURITY;

CREATE OR REPLACE FUNCTION public.has_role(_user_id uuid, _role public.app_role)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.user_roles
    WHERE user_id = _user_id AND role = _role
  )
$$;

CREATE OR REPLACE FUNCTION public.is_admin_or_super(_user_id uuid)
RETURNS boolean
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT EXISTS (
    SELECT 1 FROM public.user_roles
    WHERE user_id = _user_id AND role IN ('super_admin', 'admin')
  )
$$;

CREATE OR REPLACE FUNCTION public.get_user_role(_user_id uuid)
RETURNS public.app_role
LANGUAGE sql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
  SELECT role
  FROM public.user_roles
  WHERE user_id = _user_id
  ORDER BY CASE role WHEN 'super_admin' THEN 1 WHEN 'admin' THEN 2 ELSE 3 END
  LIMIT 1
$$;

CREATE OR REPLACE FUNCTION public.update_updated_at_column()
RETURNS trigger
LANGUAGE plpgsql
SET search_path = public
AS $$
BEGIN
  NEW.updated_at = now();
  RETURN NEW;
END;
$$;

DROP POLICY IF EXISTS "Authenticated users can view profiles" ON public.profiles;
DROP POLICY IF EXISTS "Users can insert their own profile" ON public.profiles;
DROP POLICY IF EXISTS "Users can update their own profile" ON public.profiles;
DROP POLICY IF EXISTS "Super admins can update all profiles" ON public.profiles;
CREATE POLICY "Authenticated users can view profiles" ON public.profiles
  FOR SELECT TO authenticated USING (true);
CREATE POLICY "Users can insert their own profile" ON public.profiles
  FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update their own profile" ON public.profiles
  FOR UPDATE TO authenticated USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Super admins can update all profiles" ON public.profiles
  FOR UPDATE TO authenticated USING (public.has_role(auth.uid(), 'super_admin')) WITH CHECK (public.has_role(auth.uid(), 'super_admin'));

DROP POLICY IF EXISTS "Users can view their own roles" ON public.user_roles;
DROP POLICY IF EXISTS "Admins can view all roles" ON public.user_roles;
DROP POLICY IF EXISTS "Super admins can view all roles" ON public.user_roles;
DROP POLICY IF EXISTS "Users can create their own user role" ON public.user_roles;
DROP POLICY IF EXISTS "Super admins can manage all roles" ON public.user_roles;
CREATE POLICY "Users can view their own roles" ON public.user_roles
  FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Admins can view all roles" ON public.user_roles
  FOR SELECT TO authenticated USING (public.is_admin_or_super(auth.uid()));
CREATE POLICY "Users can create their own user role" ON public.user_roles
  FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id AND role = 'user');
CREATE POLICY "Super admins can manage all roles" ON public.user_roles
  FOR ALL TO authenticated USING (public.has_role(auth.uid(), 'super_admin')) WITH CHECK (public.has_role(auth.uid(), 'super_admin'));

CREATE TABLE IF NOT EXISTS public.tests (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  description text,
  subject public.subject NOT NULL,
  duration_minutes integer NOT NULL DEFAULT 30,
  is_published boolean NOT NULL DEFAULT false,
  access_code text,
  created_by uuid,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT ON public.tests TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.tests TO authenticated;
GRANT ALL ON public.tests TO service_role;
ALTER TABLE public.tests ENABLE ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS public.questions (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  test_id uuid NOT NULL REFERENCES public.tests(id) ON DELETE CASCADE,
  question_text text NOT NULL,
  order_index integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT ON public.questions TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.questions TO authenticated;
GRANT ALL ON public.questions TO service_role;
ALTER TABLE public.questions ENABLE ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS public.choices (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  question_id uuid NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
  choice_text text NOT NULL,
  is_correct boolean NOT NULL DEFAULT false,
  order_index integer NOT NULL DEFAULT 0
);
GRANT SELECT ON public.choices TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.choices TO authenticated;
GRANT ALL ON public.choices TO service_role;
ALTER TABLE public.choices ENABLE ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS public.test_attempts (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL,
  test_id uuid NOT NULL REFERENCES public.tests(id) ON DELETE CASCADE,
  started_at timestamptz NOT NULL DEFAULT now(),
  completed_at timestamptz,
  score integer,
  total_questions integer,
  time_spent_seconds integer
);
GRANT SELECT, INSERT, UPDATE ON public.test_attempts TO authenticated;
GRANT ALL ON public.test_attempts TO service_role;
ALTER TABLE public.test_attempts ENABLE ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS public.user_answers (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  attempt_id uuid NOT NULL REFERENCES public.test_attempts(id) ON DELETE CASCADE,
  question_id uuid NOT NULL REFERENCES public.questions(id) ON DELETE CASCADE,
  selected_choice_id uuid REFERENCES public.choices(id) ON DELETE SET NULL,
  is_correct boolean
);
GRANT SELECT, INSERT ON public.user_answers TO authenticated;
GRANT ALL ON public.user_answers TO service_role;
ALTER TABLE public.user_answers ENABLE ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS public.pdf_import_jobs (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  user_id uuid NOT NULL,
  title text NOT NULL,
  subject public.subject NOT NULL,
  duration_minutes integer NOT NULL DEFAULT 30,
  access_code text,
  file_name text NOT NULL,
  file_size_bytes integer NOT NULL,
  page_count integer,
  answer_keys text,
  status text NOT NULL DEFAULT 'queued' CHECK (status IN ('queued', 'running', 'done', 'failed')),
  stage text NOT NULL DEFAULT 'queued',
  progress integer NOT NULL DEFAULT 0 CHECK (progress >= 0 AND progress <= 100),
  attempt_count integer NOT NULL DEFAULT 0,
  max_attempts integer NOT NULL DEFAULT 2,
  error_message text,
  error_stage text,
  debug jsonb,
  result_test_id uuid REFERENCES public.tests(id) ON DELETE SET NULL,
  questions_count integer,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now(),
  started_at timestamptz,
  completed_at timestamptz
);
GRANT SELECT, INSERT, UPDATE, DELETE ON public.pdf_import_jobs TO authenticated;
GRANT ALL ON public.pdf_import_jobs TO service_role;
ALTER TABLE public.pdf_import_jobs ENABLE ROW LEVEL SECURITY;

CREATE TABLE IF NOT EXISTS public.books (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  title text NOT NULL,
  author text,
  description text,
  page_count integer,
  cover_url text,
  pdf_path text NOT NULL,
  file_size_bytes bigint,
  created_by uuid,
  is_published boolean NOT NULL DEFAULT true,
  download_count integer NOT NULL DEFAULT 0,
  created_at timestamptz NOT NULL DEFAULT now(),
  updated_at timestamptz NOT NULL DEFAULT now()
);
GRANT SELECT ON public.books TO anon, authenticated;
GRANT INSERT, UPDATE, DELETE ON public.books TO authenticated;
GRANT ALL ON public.books TO service_role;
ALTER TABLE public.books ENABLE ROW LEVEL SECURITY;

DROP POLICY IF EXISTS "Anyone can view published tests" ON public.tests;
DROP POLICY IF EXISTS "Admins can insert tests" ON public.tests;
DROP POLICY IF EXISTS "Admins can update tests" ON public.tests;
DROP POLICY IF EXISTS "Admins can delete tests" ON public.tests;
CREATE POLICY "Anyone can view published tests" ON public.tests
  FOR SELECT USING (is_published = true OR public.is_admin_or_super(auth.uid()));
CREATE POLICY "Admins can insert tests" ON public.tests
  FOR INSERT TO authenticated WITH CHECK (public.is_admin_or_super(auth.uid()));
CREATE POLICY "Admins can update tests" ON public.tests
  FOR UPDATE TO authenticated USING (public.is_admin_or_super(auth.uid())) WITH CHECK (public.is_admin_or_super(auth.uid()));
CREATE POLICY "Admins can delete tests" ON public.tests
  FOR DELETE TO authenticated USING (public.is_admin_or_super(auth.uid()));

DROP POLICY IF EXISTS "Anyone can view questions of published tests" ON public.questions;
DROP POLICY IF EXISTS "Admins can manage questions" ON public.questions;
CREATE POLICY "Anyone can view questions of published tests" ON public.questions
  FOR SELECT USING (EXISTS (SELECT 1 FROM public.tests t WHERE t.id = questions.test_id AND (t.is_published = true OR public.is_admin_or_super(auth.uid()))));
CREATE POLICY "Admins can manage questions" ON public.questions
  FOR ALL TO authenticated USING (public.is_admin_or_super(auth.uid())) WITH CHECK (public.is_admin_or_super(auth.uid()));

DROP POLICY IF EXISTS "Anyone can view choices of published tests" ON public.choices;
DROP POLICY IF EXISTS "Admins can manage choices" ON public.choices;
CREATE POLICY "Anyone can view choices of published tests" ON public.choices
  FOR SELECT USING (EXISTS (SELECT 1 FROM public.questions q JOIN public.tests t ON t.id = q.test_id WHERE q.id = choices.question_id AND (t.is_published = true OR public.is_admin_or_super(auth.uid()))));
CREATE POLICY "Admins can manage choices" ON public.choices
  FOR ALL TO authenticated USING (public.is_admin_or_super(auth.uid())) WITH CHECK (public.is_admin_or_super(auth.uid()));

DROP POLICY IF EXISTS "Users can view their own attempts" ON public.test_attempts;
DROP POLICY IF EXISTS "Admins can view all attempts" ON public.test_attempts;
DROP POLICY IF EXISTS "Authenticated users can create attempts" ON public.test_attempts;
DROP POLICY IF EXISTS "Users can update their own attempts" ON public.test_attempts;
CREATE POLICY "Users can view their own attempts" ON public.test_attempts
  FOR SELECT TO authenticated USING (auth.uid() = user_id);
CREATE POLICY "Admins can view all attempts" ON public.test_attempts
  FOR SELECT TO authenticated USING (public.is_admin_or_super(auth.uid()));
CREATE POLICY "Authenticated users can create attempts" ON public.test_attempts
  FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id);
CREATE POLICY "Users can update their own attempts" ON public.test_attempts
  FOR UPDATE TO authenticated USING (auth.uid() = user_id) WITH CHECK (auth.uid() = user_id);

DROP POLICY IF EXISTS "Users can view their own answers" ON public.user_answers;
DROP POLICY IF EXISTS "Users can insert their own answers" ON public.user_answers;
CREATE POLICY "Users can view their own answers" ON public.user_answers
  FOR SELECT TO authenticated USING (EXISTS (SELECT 1 FROM public.test_attempts ta WHERE ta.id = user_answers.attempt_id AND ta.user_id = auth.uid()));
CREATE POLICY "Users can insert their own answers" ON public.user_answers
  FOR INSERT TO authenticated WITH CHECK (EXISTS (SELECT 1 FROM public.test_attempts ta WHERE ta.id = user_answers.attempt_id AND ta.user_id = auth.uid()));

DROP POLICY IF EXISTS "Super admins can view pdf import jobs" ON public.pdf_import_jobs;
DROP POLICY IF EXISTS "Super admins can create pdf import jobs" ON public.pdf_import_jobs;
DROP POLICY IF EXISTS "Super admins can update pdf import jobs" ON public.pdf_import_jobs;
CREATE POLICY "Super admins can view pdf import jobs" ON public.pdf_import_jobs
  FOR SELECT TO authenticated USING (public.has_role(auth.uid(), 'super_admin'));
CREATE POLICY "Super admins can create pdf import jobs" ON public.pdf_import_jobs
  FOR INSERT TO authenticated WITH CHECK (auth.uid() = user_id AND public.has_role(auth.uid(), 'super_admin'));
CREATE POLICY "Super admins can update pdf import jobs" ON public.pdf_import_jobs
  FOR UPDATE TO authenticated USING (public.has_role(auth.uid(), 'super_admin')) WITH CHECK (public.has_role(auth.uid(), 'super_admin'));

DROP POLICY IF EXISTS "Anyone can view published books" ON public.books;
DROP POLICY IF EXISTS "Admins can insert books" ON public.books;
DROP POLICY IF EXISTS "Admins can update books" ON public.books;
DROP POLICY IF EXISTS "Admins can delete books" ON public.books;
CREATE POLICY "Anyone can view published books" ON public.books
  FOR SELECT USING (is_published = true OR public.is_admin_or_super(auth.uid()));
CREATE POLICY "Admins can insert books" ON public.books
  FOR INSERT TO authenticated WITH CHECK (public.is_admin_or_super(auth.uid()));
CREATE POLICY "Admins can update books" ON public.books
  FOR UPDATE TO authenticated USING (public.is_admin_or_super(auth.uid())) WITH CHECK (public.is_admin_or_super(auth.uid()));
CREATE POLICY "Admins can delete books" ON public.books
  FOR DELETE TO authenticated USING (public.is_admin_or_super(auth.uid()));

DROP TRIGGER IF EXISTS update_profiles_updated_at ON public.profiles;
CREATE TRIGGER update_profiles_updated_at BEFORE UPDATE ON public.profiles
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
DROP TRIGGER IF EXISTS update_tests_updated_at ON public.tests;
CREATE TRIGGER update_tests_updated_at BEFORE UPDATE ON public.tests
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
DROP TRIGGER IF EXISTS update_pdf_import_jobs_updated_at ON public.pdf_import_jobs;
CREATE TRIGGER update_pdf_import_jobs_updated_at BEFORE UPDATE ON public.pdf_import_jobs
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();
DROP TRIGGER IF EXISTS update_books_updated_at ON public.books;
CREATE TRIGGER update_books_updated_at BEFORE UPDATE ON public.books
  FOR EACH ROW EXECUTE FUNCTION public.update_updated_at_column();

CREATE INDEX IF NOT EXISTS idx_tests_access_code ON public.tests(access_code) WHERE access_code IS NOT NULL;
CREATE INDEX IF NOT EXISTS idx_questions_test_order ON public.questions(test_id, order_index);
CREATE INDEX IF NOT EXISTS idx_choices_question_order ON public.choices(question_id, order_index);
CREATE INDEX IF NOT EXISTS idx_test_attempts_user_completed ON public.test_attempts(user_id, completed_at DESC);
CREATE INDEX IF NOT EXISTS idx_pdf_import_jobs_user_created ON public.pdf_import_jobs(user_id, created_at DESC);
CREATE INDEX IF NOT EXISTS idx_pdf_import_jobs_status_created ON public.pdf_import_jobs(status, created_at DESC);

CREATE OR REPLACE FUNCTION public.get_leaderboard(p_subject public.subject DEFAULT NULL::public.subject, p_limit integer DEFAULT 10)
RETURNS TABLE(user_id uuid, full_name text, avatar_url text, total_score bigint, tests_completed bigint, avg_score numeric)
LANGUAGE plpgsql
STABLE
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN
  IF p_limit IS NULL OR p_limit < 1 THEN
    p_limit := 10;
  END IF;
  IF p_limit > 100 THEN
    p_limit := 100;
  END IF;

  RETURN QUERY
  SELECT
    p.user_id,
    p.full_name,
    p.avatar_url,
    COALESCE(SUM(ta.score), 0)::bigint AS total_score,
    COUNT(ta.id)::bigint AS tests_completed,
    ROUND(COALESCE(AVG(ta.score::numeric / NULLIF(ta.total_questions, 0) * 100), 0), 1) AS avg_score
  FROM public.profiles p
  LEFT JOIN public.test_attempts ta ON ta.user_id = p.user_id AND ta.completed_at IS NOT NULL
  LEFT JOIN public.tests t ON t.id = ta.test_id
  WHERE p_subject IS NULL OR t.subject = p_subject
  GROUP BY p.user_id, p.full_name, p.avatar_url
  ORDER BY total_score DESC, avg_score DESC
  LIMIT p_limit;
END;
$$;
GRANT EXECUTE ON FUNCTION public.has_role(uuid, public.app_role) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.is_admin_or_super(uuid) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.get_user_role(uuid) TO authenticated, service_role;
GRANT EXECUTE ON FUNCTION public.get_leaderboard(public.subject, integer) TO anon, authenticated, service_role;