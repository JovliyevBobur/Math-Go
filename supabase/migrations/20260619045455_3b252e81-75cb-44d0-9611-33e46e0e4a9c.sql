DROP POLICY IF EXISTS "Anyone can view published books" ON public.books;
CREATE POLICY "Anyone can view published books"
ON public.books
FOR SELECT
TO public
USING (is_published = true);
DROP POLICY IF EXISTS "Admins can view all books" ON public.books;
CREATE POLICY "Admins can view all books"
ON public.books
FOR SELECT
TO authenticated
USING (public.is_admin_or_super(auth.uid()));

DROP POLICY IF EXISTS "Anyone can view published tests" ON public.tests;
CREATE POLICY "Anyone can view published tests"
ON public.tests
FOR SELECT
TO public
USING (is_published = true);
DROP POLICY IF EXISTS "Admins can view all tests" ON public.tests;
CREATE POLICY "Admins can view all tests"
ON public.tests
FOR SELECT
TO authenticated
USING (public.is_admin_or_super(auth.uid()));

DROP POLICY IF EXISTS "Anyone can view questions of published tests" ON public.questions;
CREATE POLICY "Anyone can view questions of published tests"
ON public.questions
FOR SELECT
TO public
USING (
  EXISTS (
    SELECT 1 FROM public.tests t
    WHERE t.id = questions.test_id AND t.is_published = true
  )
);
DROP POLICY IF EXISTS "Admins can view all questions" ON public.questions;
CREATE POLICY "Admins can view all questions"
ON public.questions
FOR SELECT
TO authenticated
USING (public.is_admin_or_super(auth.uid()));

DROP POLICY IF EXISTS "Anyone can view choices of published tests" ON public.choices;
CREATE POLICY "Anyone can view choices of published tests"
ON public.choices
FOR SELECT
TO public
USING (
  EXISTS (
    SELECT 1
    FROM public.questions q
    JOIN public.tests t ON t.id = q.test_id
    WHERE q.id = choices.question_id AND t.is_published = true
  )
);
DROP POLICY IF EXISTS "Admins can view all choices" ON public.choices;
CREATE POLICY "Admins can view all choices"
ON public.choices
FOR SELECT
TO authenticated
USING (public.is_admin_or_super(auth.uid()));

REVOKE EXECUTE ON FUNCTION public.has_role(uuid, public.app_role) FROM anon;
REVOKE EXECUTE ON FUNCTION public.is_admin_or_super(uuid) FROM anon;
REVOKE EXECUTE ON FUNCTION public.get_user_role(uuid) FROM anon;
REVOKE EXECUTE ON FUNCTION public.ensure_profile(text) FROM anon;
REVOKE EXECUTE ON FUNCTION public.claim_super_admin() FROM anon;