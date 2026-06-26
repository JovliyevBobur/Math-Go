import { useEffect, useState, useCallback, useRef } from 'react';
import { useParams, useNavigate } from 'react-router-dom';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/hooks/useAuth';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Progress } from '@/components/ui/progress';
import { RadioGroup, RadioGroupItem } from '@/components/ui/radio-group';
import { Label } from '@/components/ui/label';
import { Input } from '@/components/ui/input';
import { getSubjectById } from '@/lib/constants';
import { Loader2, Clock, ChevronLeft, ChevronRight, Flag, AlertTriangle } from 'lucide-react';
import { toast } from 'sonner';
import {
  AlertDialog,
  AlertDialogAction,
  AlertDialogCancel,
  AlertDialogContent,
  AlertDialogDescription,
  AlertDialogFooter,
  AlertDialogHeader,
  AlertDialogTitle,
} from '@/components/ui/alert-dialog';
import { cn } from '@/lib/utils';
import { MathContent } from '@/components/MathContent';

interface Choice {
  id: string;
  choice_text: string;
  order_index: number;
}

interface Question {
  id: string;
  question_text: string;
  topic?: string | null;
  order_index: number;
  is_input?: boolean;
  choices: Choice[];
}

interface Test {
  id: string;
  title: string;
  subject: string;
  duration_minutes: number;
}

export default function TakeTest() {
  const { testId } = useParams<{ testId: string }>();
  const { user } = useAuth();
  const navigate = useNavigate();

  const [test, setTest] = useState<Test | null>(null);
  const [questions, setQuestions] = useState<Question[]>([]);
  const [currentIndex, setCurrentIndex] = useState(0);
  const [answers, setAnswers] = useState<Record<string, string>>({});
  const [attemptId, setAttemptId] = useState<string | null>(null);
  const [loading, setLoading] = useState(true);
  const [submitting, setSubmitting] = useState(false);
  const [timeLeft, setTimeLeft] = useState(0);
  const [showSubmitDialog, setShowSubmitDialog] = useState(false);
  const startTimeRef = useRef<Date>(new Date());

  useEffect(() => {
    if (testId && user) {
      fetchTestAndStart();
    }
  }, [testId, user]);

  // Timer
  useEffect(() => {
    if (timeLeft <= 0) return;

    const timer = setInterval(() => {
      setTimeLeft((prev) => {
        if (prev <= 1) {
          clearInterval(timer);
          handleSubmit();
          return 0;
        }
        return prev - 1;
      });
    }, 1000);

    return () => clearInterval(timer);
  }, [timeLeft]);

  const fetchTestAndStart = async () => {
    // Fetch test details
    const { data: testData, error: testError } = await supabase
      .from('tests')
      .select('id, title, subject, duration_minutes')
      .eq('id', testId)
      .single();

    if (testError || !testData) {
      toast.error('Test topilmadi');
      navigate('/subjects');
      return;
    }

    setTest(testData);
    setTimeLeft(testData.duration_minutes * 60);

    // Fetch questions with choices (correct answers are NOT exposed)
    const { data: questionsData, error: questionsError } = await supabase
      .rpc('get_test_questions', { p_test_id: testId });

    const questionsList = (questionsData as unknown as Question[]) || [];

    if (questionsError || questionsList.length === 0) {
      toast.error('Savollar topilmadi');
      navigate('/subjects');
      return;
    }

    // Sort choices by order_index
    const sortedQuestions = questionsList.map((q) => ({
      ...q,
      choices: [...q.choices].sort((a, b) => a.order_index - b.order_index),
    }));

    setQuestions(sortedQuestions);

    // Create test attempt
    const { data: attemptData, error: attemptError } = await supabase
      .from('test_attempts')
      .insert({
        user_id: user!.id,
        test_id: testId,
        total_questions: sortedQuestions.length,
      })
      .select()
      .single();

    if (attemptError) {
      toast.error('Test boshlanmadi. Qayta urinib ko\'ring.');
      navigate('/subjects');
      return;
    }

    setAttemptId(attemptData.id);
    startTimeRef.current = new Date();
    setLoading(false);
  };

  const formatTime = (seconds: number) => {
    const mins = Math.floor(seconds / 60);
    const secs = seconds % 60;
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`;
  };

  const handleAnswer = (questionId: string, choiceId: string) => {
    setAnswers((prev) => ({ ...prev, [questionId]: choiceId }));
  };

  const handleSubmit = async () => {
    if (!attemptId || submitting) return;
    
    setSubmitting(true);
    setShowSubmitDialog(false);

    const timeSpent = Math.floor((new Date().getTime() - startTimeRef.current.getTime()) / 1000);

    // Score the attempt securely on the server (correct answers stay server-side)
    const answersPayload: Record<string, string> = {};
    questions.forEach((q) => {
      if (answers[q.id]) answersPayload[q.id] = answers[q.id];
    });

    const { error: submitError } = await supabase.rpc('submit_test_attempt', {
      p_attempt_id: attemptId,
      p_answers: answersPayload,
      p_time_spent: timeSpent,
    });

    if (submitError) {
      console.warn('RPC submission failed, falling back to client-side grading...', submitError);

      try {
        // Fetch correct answers for questions and choices from DB (permitted by RLS)
        const { data: questionsWithAnswers, error: qErr } = await supabase
          .from('questions')
          .select('id, correct_answer')
          .eq('test_id', testId);

        if (qErr || !questionsWithAnswers) {
          throw new Error(qErr?.message || 'Savollarni tekshirishda xatolik yuz berdi.');
        }

        const { data: choicesWithIsCorrect, error: cErr } = await supabase
          .from('choices')
          .select('id, question_id, is_correct')
          .in('question_id', questionsWithAnswers.map((q) => q.id));

        if (cErr || !choicesWithIsCorrect) {
          throw new Error(cErr?.message || 'Variantlarni tekshirishda xatolik yuz berdi.');
        }

        const questionCorrectAnswerMap = new Map(
          questionsWithAnswers.map((q) => [q.id, q.correct_answer])
        );
        const correctChoicesSet = new Set(
          choicesWithIsCorrect.filter((c) => c.is_correct).map((c) => c.id)
        );

        let score = 0;
        const userAnswersToInsert = [];

        for (const q of questions) {
          const userAnswer = answers[q.id];
          const hasChoices = q.choices && q.choices.length > 0;

          let selectedChoiceId: string | null = null;
          let textAnswer: string | null = null;
          let isCorrect = false;

          if (userAnswer !== undefined && userAnswer !== null && userAnswer !== '') {
            if (hasChoices) {
              selectedChoiceId = userAnswer;
              isCorrect = correctChoicesSet.has(userAnswer);
            } else {
              textAnswer = userAnswer;
              const correctAnswer = questionCorrectAnswerMap.get(q.id) || '';
              const formattedUserAns = userAnswer.replace(/\s+/g, '').toLowerCase();
              const formattedCorrectAns = correctAnswer.replace(/\s+/g, '').toLowerCase();
              isCorrect = formattedUserAns === formattedCorrectAns;
            }
          } else {
            if (hasChoices) {
              selectedChoiceId = null;
            } else {
              textAnswer = null;
            }
            isCorrect = false;
          }

          if (isCorrect) {
            score++;
          }

          userAnswersToInsert.push({
            attempt_id: attemptId,
            question_id: q.id,
            selected_choice_id: selectedChoiceId,
            text_answer: textAnswer,
            is_correct: isCorrect,
          });
        }

        // Delete any existing answers for this attempt first to avoid primary/unique key conflicts
        await supabase.from('user_answers').delete().eq('attempt_id', attemptId);

        const { error: insertErr } = await supabase.from('user_answers').insert(userAnswersToInsert);

        if (insertErr) {
          throw new Error(`Javoblarni saqlashda xatolik: ${insertErr.message}`);
        }

        // Update test attempt directly
        const { error: updateErr } = await supabase
          .from('test_attempts')
          .update({
            completed_at: new Date().toISOString(),
            score: score,
            total_questions: questions.length,
            time_spent_seconds: Math.max(timeSpent, 0),
          })
          .eq('id', attemptId);

        if (updateErr) {
          throw new Error(`Urinishni saqlashda xatolik: ${updateErr.message}`);
        }
      } catch (fallbackError: any) {
        console.error('Fallback submission failed:', fallbackError);
        toast.error(fallbackError.message || 'Natijani saqlashda xatolik. Qayta urinib ko\'ring.');
        setSubmitting(false);
        return;
      }
    }

    // Navigate to results
    navigate(`/results/${attemptId}`);
  };

  const currentQuestion = questions[currentIndex];
  const answeredCount = Object.keys(answers).length;
  const progress = (answeredCount / questions.length) * 100;

  if (loading) {
    return (
      <div className="flex min-h-screen items-center justify-center">
        <div className="text-center">
          <Loader2 className="h-8 w-8 animate-spin text-primary mx-auto mb-4" />
          <p className="text-muted-foreground">Test yuklanmoqda...</p>
        </div>
      </div>
    );
  }

  const subject = getSubjectById(test?.subject || '');
  const isTimeWarning = timeLeft < 60;

  return (
    <div className="min-h-screen bg-muted/30">
      {/* Header */}
      <header className="sticky top-0 z-50 bg-background border-b shadow-sm">
        <div className="container flex items-center justify-between h-16">
          <div className="flex items-center gap-3">
            <span className="text-2xl">{subject?.icon}</span>
            <div>
              <h1 className="font-display font-semibold">{test?.title}</h1>
              <p className="text-xs text-muted-foreground">
                {answeredCount}/{questions.length} javob berildi
              </p>
            </div>
          </div>

          <div className={cn(
            "flex items-center gap-2 px-4 py-2 rounded-lg font-mono text-lg font-bold",
            isTimeWarning ? "bg-destructive text-destructive-foreground animate-pulse" : "bg-muted"
          )}>
            <Clock className="h-5 w-5" />
            <span>{formatTime(timeLeft)}</span>
          </div>
        </div>
        <Progress value={progress} className="h-1" />
      </header>

      <main className="container py-8 max-w-3xl">
        {/* Question Navigation */}
        <div className="flex flex-wrap gap-2 mb-6">
          {questions.map((q, idx) => (
            <button
              key={q.id}
              onClick={() => setCurrentIndex(idx)}
              className={cn(
                "w-10 h-10 rounded-lg font-medium transition-all",
                idx === currentIndex
                  ? "bg-primary text-primary-foreground"
                  : answers[q.id]
                  ? "bg-success text-success-foreground"
                  : "bg-muted hover:bg-muted/80"
              )}
            >
              {idx + 1}
            </button>
          ))}
        </div>

        {/* Question Card */}
        <Card className="shadow-lg">
          <CardHeader>
            <div className="flex items-center justify-between">
              <span className="text-sm text-muted-foreground">
                Savol {currentIndex + 1}/{questions.length}
              </span>
              {answers[currentQuestion.id] && (
                <span className="text-sm text-success font-medium">Javob berildi ✓</span>
              )}
            </div>
            <div className="font-display text-xl font-semibold leading-relaxed">
              <MathContent className="prose-p:my-0 text-xl">{currentQuestion.question_text}</MathContent>
            </div>
            {currentQuestion.topic && (
              <span className="mt-3 inline-flex w-fit rounded-full border border-info/30 bg-info/10 px-2.5 py-0.5 text-xs font-medium text-info">
                {currentQuestion.topic}
              </span>
            )}
          </CardHeader>
          <CardContent>
            {currentQuestion.is_input || currentQuestion.choices.length === 0 ? (
              <div className="space-y-3">
                <Label htmlFor="text-answer" className="text-sm text-muted-foreground">
                  Javobni kiriting (variant yo'q):
                </Label>
                <Input
                  id="text-answer"
                  value={answers[currentQuestion.id] || ''}
                  onChange={(e) => handleAnswer(currentQuestion.id, e.target.value)}
                  placeholder="Javobingizni shu yerga yozing..."
                  className="text-lg h-14"
                  autoComplete="off"
                />
              </div>
            ) : (
              <RadioGroup
                value={answers[currentQuestion.id] || ''}
                onValueChange={(value) => handleAnswer(currentQuestion.id, value)}
                className="space-y-3"
              >
                {currentQuestion.choices.map((choice, idx) => (
                  <div
                    key={choice.id}
                    className={cn(
                      "flex items-center space-x-3 p-4 rounded-lg border-2 cursor-pointer transition-all",
                      answers[currentQuestion.id] === choice.id
                        ? "border-primary bg-primary/5"
                        : "border-border hover:border-primary/30 hover:bg-muted/50"
                    )}
                    onClick={() => handleAnswer(currentQuestion.id, choice.id)}
                  >
                    <RadioGroupItem value={choice.id} id={choice.id} />
                    <Label htmlFor={choice.id} className="flex-1 cursor-pointer text-base">
                      <span className="font-semibold mr-2">
                        {String.fromCharCode(65 + idx)}.
                      </span>
                      <MathContent className="inline-block prose-p:my-0">{choice.choice_text}</MathContent>
                    </Label>
                  </div>
                ))}
              </RadioGroup>
            )}
          </CardContent>
        </Card>


        {/* Navigation */}
        <div className="flex items-center justify-between mt-6">
          <Button
            variant="outline"
            onClick={() => setCurrentIndex(Math.max(0, currentIndex - 1))}
            disabled={currentIndex === 0}
          >
            <ChevronLeft className="h-4 w-4 mr-1" />
            Oldingi
          </Button>

          {currentIndex === questions.length - 1 ? (
            <Button variant="gradient" onClick={() => setShowSubmitDialog(true)}>
              <Flag className="h-4 w-4 mr-1" />
              Testni yakunlash
            </Button>
          ) : (
            <Button
              onClick={() => setCurrentIndex(Math.min(questions.length - 1, currentIndex + 1))}
            >
              Keyingi
              <ChevronRight className="h-4 w-4 ml-1" />
            </Button>
          )}
        </div>
      </main>

      {/* Submit Dialog */}
      <AlertDialog open={showSubmitDialog} onOpenChange={setShowSubmitDialog}>
        <AlertDialogContent>
          <AlertDialogHeader>
            <AlertDialogTitle className="font-display">Testni yakunlaysizmi?</AlertDialogTitle>
            <AlertDialogDescription asChild>
              <div className="space-y-3">
                <p>
                  Siz {answeredCount}/{questions.length} ta savolga javob berdingiz.
                </p>
                {answeredCount < questions.length && (
                  <div className="flex items-center gap-2 p-3 rounded-lg bg-warning/10 text-warning">
                    <AlertTriangle className="h-5 w-5 flex-shrink-0" />
                    <span className="text-sm">
                      {questions.length - answeredCount} ta savol javobsiz qoldi
                    </span>
                  </div>
                )}
              </div>
            </AlertDialogDescription>
          </AlertDialogHeader>
          <AlertDialogFooter>
            <AlertDialogCancel>Davom etish</AlertDialogCancel>
            <AlertDialogAction onClick={handleSubmit} disabled={submitting}>
              {submitting ? <Loader2 className="h-4 w-4 animate-spin mr-2" /> : null}
              Yakunlash
            </AlertDialogAction>
          </AlertDialogFooter>
        </AlertDialogContent>
      </AlertDialog>
    </div>
  );
}
