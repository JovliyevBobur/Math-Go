import { useEffect, useState } from 'react';
import { useParams, Link } from 'react-router-dom';
import { Layout } from '@/components/layout/Layout';
import { PageTransition } from '@/components/PageTransition';
import { supabase } from '@/integrations/supabase/client';
import { useAuth } from '@/hooks/useAuth';
import { Button } from '@/components/ui/button';
import { Card, CardContent, CardHeader, CardTitle } from '@/components/ui/card';
import { Progress } from '@/components/ui/progress';
import { getSubjectById } from '@/lib/constants';
import { Loader2, Trophy, Clock, CheckCircle, XCircle, RotateCcw, Home, Info, ChevronDown, ChevronUp, Sparkles } from 'lucide-react';
import { cn } from '@/lib/utils';
import { toast } from 'sonner';
import confetti from 'canvas-confetti';
import { MathContent } from '@/components/MathContent';

interface Choice {
  id: string;
  choice_text: string;
  is_correct: boolean;
}

interface Question {
  id: string;
  question_text: string;
  topic: string | null;
  solution_text: string | null;
  intermediate_steps: unknown;
  correct_answer: string | null;
  choices: Choice[];
}

interface UserAnswer {
  question_id: string;
  selected_choice_id: string | null;
  text_answer: string | null;
  is_correct: boolean | null;
}

interface AttemptResult {
  id: string;
  score: number;
  total_questions: number;
  time_spent_seconds: number;
  test: {
    id: string;
    title: string;
    subject: string;
  };
  questions: Question[];
  answers: UserAnswer[];
}

export default function Results() {
  const { attemptId } = useParams<{ attemptId: string }>();
  const { session } = useAuth();
  const [result, setResult] = useState<AttemptResult | null>(null);
  const [loading, setLoading] = useState(true);
  const [showAnswers, setShowAnswers] = useState(false);
  const [expandedQuestions, setExpandedQuestions] = useState<Record<string, boolean>>({});
  const [aiAnalysis, setAiAnalysis] = useState<string | null>(null);
  const [analyzing, setAnalyzing] = useState(false);
  const [analysisError, setAnalysisError] = useState<string | null>(null);

  useEffect(() => {
    if (attemptId) {
      fetchResults();
    }
  }, [attemptId]);

  const fetchResults = async () => {
    const { data, error } = await supabase
      .rpc('get_attempt_review', { p_attempt_id: attemptId });

    if (error || !data) {
      setLoading(false);
      return;
    }

    const review = data as unknown as {
      attempt: { id: string; score: number; total_questions: number; time_spent_seconds: number };
      test: { id: string; title: string; subject: string };
      questions: Question[];
      answers: UserAnswer[];
    };

    setResult({
      id: review.attempt.id,
      score: review.attempt.score || 0,
      total_questions: review.attempt.total_questions || 0,
      time_spent_seconds: review.attempt.time_spent_seconds || 0,
      test: review.test,
      questions: review.questions || [],
      answers: review.answers || [],
    });

    setLoading(false);

    const percentage = ((review.attempt.score || 0) / (review.attempt.total_questions || 1)) * 100;
    if (percentage >= 80) {
      setTimeout(() => {
        confetti({
          particleCount: 100,
          spread: 70,
          origin: { y: 0.6 },
        });
      }, 500);
    }
  };

  const getGrade = (p: number) => {
    if (p >= 95) return { grade: 'A+', label: "Mukammal", color: 'text-emerald-500', msg: 'Mukammal natija! 🏆' };
    if (p >= 85) return { grade: 'A',  label: "A'lo",      color: 'text-emerald-500', msg: 'Ajoyib! 🎉' };
    if (p >= 75) return { grade: 'B+', label: 'Juda yaxshi', color: 'text-success',  msg: 'Juda yaxshi 👏' };
    if (p >= 65) return { grade: 'B',  label: 'Yaxshi',     color: 'text-success',   msg: 'Yaxshi natija 💪' };
    if (p >= 50) return { grade: 'C+', label: 'Qoniqarli',  color: 'text-warning',   msg: 'Qoniqarli, ko\'proq mashq qiling 📚' };
    return            { grade: 'C',  label: "Boshlang'ich", color: 'text-destructive', msg: 'Qayta urinib ko\'ring 🔄' };
  };

  const toggleQuestionExpand = (questionId: string) => {
    setExpandedQuestions(prev => ({
      ...prev,
      [questionId]: !prev[questionId],
    }));
  };

  const getIntermediateSteps = (value: unknown): string[] => {
    if (!Array.isArray(value)) return [];
    return value
      .map((step) => {
        if (typeof step === 'string') return step;
        if (step && typeof step === 'object') {
          const record = step as Record<string, unknown>;
          return String(record.text || record.step || record.value || '').trim();
        }
        return '';
      })
      .filter(Boolean);
  };

  const handleAiAnalysis = async () => {
    if (!result || analyzing) return;
    setAnalyzing(true);
    setAnalysisError(null);
    try {
      const questionsForAi = result.questions.map((q, i) => {
        const userAnswer = result.answers.find(a => a.question_id === q.id);
        const selectedChoice = q.choices.find(c => c.id === userAnswer?.selected_choice_id);
        return {
          index: i + 1,
          question_text: q.question_text,
          choices: q.choices.map(c => ({ text: c.choice_text, is_correct: c.is_correct })),
          user_choice: selectedChoice?.choice_text || null,
          is_correct: userAnswer?.is_correct ?? null,
        };
      });

      const response = await fetch(
        `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/ai-chat`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${session?.access_token || import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY}`,
            apikey: import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY,
          },
          body: JSON.stringify({ mode: 'analyze', questions: questionsForAi }),
        }
      );

      const data = await response.json().catch(() => ({}));
      if (!response.ok) throw new Error(data?.error || `Server xatosi (${response.status})`);
      setAiAnalysis(data.analysis || 'Tahlil olishda xatolik.');
      setShowAnswers(true);
    } catch (error: any) {
      const msg = error?.message || 'AI tahlil qilishda xatolik yuz berdi';
      setAnalysisError(msg);
      toast.error(msg);
    } finally {
      setAnalyzing(false);
    }
  };

  if (loading) {
    return (
      <Layout>
        <div className="flex min-h-[60vh] items-center justify-center">
          <Loader2 className="h-8 w-8 animate-spin text-primary" />
        </div>
      </Layout>
    );
  }

  if (!result) {
    return (
      <Layout>
        <div className="container py-8 text-center">
          <h1 className="font-serif text-2xl font-bold mb-4">Natija topilmadi</h1>
          <Link to="/dashboard">
            <Button>Bosh sahifaga qaytish</Button>
          </Link>
        </div>
      </Layout>
    );
  }

  const percentage = Math.round((result.score / result.total_questions) * 100);
  const subject = getSubjectById(result.test.subject);
  const wrongAnswers = result.answers.filter(a => a.is_correct === false);

  return (
    <Layout>
      <PageTransition>
        <div className="container py-8 max-w-4xl">
          {/* Score Card */}
          <Card className="mb-8 overflow-hidden">
            <div className="bg-gradient-to-r from-primary via-accent to-primary p-8 text-center text-white">
              <div className="text-6xl mb-4">📐</div>
              <h1 className="font-serif text-3xl font-bold mb-2">{result.test.title}</h1>
              <p className="opacity-80">Matematika</p>
            </div>
            <CardContent className="p-8">
              <div className="text-center mb-8">
                {(() => {
                  const g = getGrade(percentage);
                  return (
                    <>
                      <div className={cn("inline-flex items-baseline gap-3 mb-2")}>
                        <span className={cn("text-7xl font-serif font-bold", g.color)}>{percentage}%</span>
                        <span className={cn("text-4xl font-serif font-bold px-4 py-1 rounded-xl border-2", g.color)}>{g.grade}</span>
                      </div>
                      <p className="text-lg text-muted-foreground">Daraja: <strong>{g.label}</strong></p>
                    </>
                  );
                })()}
                <p className="text-xl text-muted-foreground mb-4">
                  {result.score} / {result.total_questions} to'g'ri javob
                </p>
                <p className="text-2xl font-semibold">{getGrade(percentage).msg}</p>
              </div>

              <Progress value={percentage} className="h-4 mb-8" />

              <div className="grid sm:grid-cols-3 gap-4 text-center">
                <div className="p-4 rounded-lg bg-muted">
                  <Trophy className="h-6 w-6 mx-auto mb-2 text-primary" />
                  <p className="text-2xl font-bold">{result.score}</p>
                  <p className="text-sm text-muted-foreground">To'g'ri</p>
                </div>
                <div className="p-4 rounded-lg bg-muted">
                  <XCircle className="h-6 w-6 mx-auto mb-2 text-destructive" />
                  <p className="text-2xl font-bold">{result.total_questions - result.score}</p>
                  <p className="text-sm text-muted-foreground">Noto'g'ri</p>
                </div>
                <div className="p-4 rounded-lg bg-muted">
                  <Clock className="h-6 w-6 mx-auto mb-2 text-info" />
                  <p className="text-2xl font-bold">{Math.floor(result.time_spent_seconds / 60)}</p>
                  <p className="text-sm text-muted-foreground">Daqiqa</p>
                </div>
              </div>
            </CardContent>
          </Card>

          {/* Actions */}
          <div className="flex flex-wrap gap-4 justify-center mb-8">
            <Link to={`/test/${result.test.id}`}>
              <Button variant="premium" size="lg">
                <RotateCcw className="h-5 w-5 mr-2" />
                Qayta ishlash
              </Button>
            </Link>
            <Button
              variant="outline"
              size="lg"
              onClick={() => setShowAnswers(!showAnswers)}
            >
              {showAnswers ? 'Javoblarni yashirish' : 'Javoblarni ko\'rish'}
            </Button>
            <Button
              variant="outline"
              size="lg"
              onClick={handleAiAnalysis}
              disabled={analyzing}
              className="gap-2 border-emerald-500/40 text-emerald-600 hover:bg-emerald-500/10 dark:text-emerald-400"
            >
              {analyzing ? <Loader2 className="h-5 w-5 animate-spin" /> : <Sparkles className="h-5 w-5" />}
              {analyzing ? 'Tahlil qilinmoqda...' : 'Testni tahlil qilish'}
            </Button>
            {analysisError && (
              <Button variant="destructive" size="lg" onClick={handleAiAnalysis} disabled={analyzing} className="gap-2">
                <RotateCcw className="h-5 w-5" />
                Qayta urinish
              </Button>
            )}
            <Link to="/dashboard">
              <Button variant="outline" size="lg">
                <Home className="h-5 w-5 mr-2" />
                Bosh sahifa
              </Button>
            </Link>
          </div>

          {/* AI Analysis */}
          {aiAnalysis && (
            <Card className="mb-8 border-emerald-500/30 bg-emerald-500/5 animate-fade-up">
              <CardHeader>
                <CardTitle className="font-serif text-xl flex items-center gap-2">
                  <Sparkles className="h-5 w-5 text-emerald-500" />
                  AI Tahlil — Math Go AI
                </CardTitle>
              </CardHeader>
              <CardContent>
                <MathContent className="whitespace-normal text-sm leading-relaxed">{aiAnalysis}</MathContent>
              </CardContent>
            </Card>
          )}

          {analysisError && !aiAnalysis && (
            <Card className="mb-8 border-destructive/30 bg-destructive/5">
              <CardContent className="p-4 flex flex-wrap items-center justify-between gap-3">
                <p className="text-sm text-destructive">{analysisError}</p>
                <Button variant="destructive" size="sm" onClick={handleAiAnalysis} disabled={analyzing} className="gap-2">
                  <RotateCcw className="h-4 w-4" />
                  Qayta urinish
                </Button>
              </CardContent>
            </Card>
          )}

          {/* Answers Review */}
          {showAnswers && (
            <div className="space-y-4">
              <h2 className="font-serif text-2xl font-bold mb-4">Javoblar tahlili</h2>
              
              {/* Summary for wrong answers */}
              {wrongAnswers.length > 0 && (
                <Card className="border-warning/30 bg-warning/5 mb-6">
                  <CardContent className="p-4">
                    <div className="flex items-center gap-3">
                      <Info className="h-5 w-5 text-warning" />
                      <p className="text-sm">
                        <strong>{wrongAnswers.length}</strong> ta savolga noto'g'ri javob berdingiz. 
                        Har bir savolning yechimini ko'rish uchun ustiga bosing.
                      </p>
                    </div>
                  </CardContent>
                </Card>
              )}

              {result.questions.map((question, idx) => {
                const userAnswer = result.answers.find((a) => a.question_id === question.id);
                const isCorrect = userAnswer?.is_correct;
                const correctChoice = question.choices.find((c) => c.is_correct);
                const selectedChoice = question.choices.find((c) => c.id === userAnswer?.selected_choice_id);
                const isInput = question.choices.length === 0;
                const isExpanded = expandedQuestions[question.id];

                return (
                  <Card 
                    key={question.id} 
                    className={cn(
                      "border-2 transition-all cursor-pointer",
                      isCorrect ? "border-success/30" : "border-destructive/30"
                    )}
                    onClick={() => toggleQuestionExpand(question.id)}
                  >
                    <CardHeader className="pb-2">
                      <div className="flex items-start gap-3">
                        <div className={cn(
                          "flex items-center justify-center w-8 h-8 rounded-full flex-shrink-0",
                          isCorrect ? "bg-success text-success-foreground" : "bg-destructive text-destructive-foreground"
                        )}>
                          {isCorrect ? <CheckCircle className="h-5 w-5" /> : <XCircle className="h-5 w-5" />}
                        </div>
                        <div className="flex-1">
                          <div className="font-serif text-lg font-semibold leading-relaxed">
                            {idx + 1}. <MathContent className="inline-block prose-p:my-0">{question.question_text}</MathContent>
                          </div>
                          <div className="mt-2 flex flex-wrap gap-2">
                            <span className="rounded-full border border-info/30 bg-info/10 px-2.5 py-0.5 text-xs font-medium text-info">
                              {question.topic || result.test.subject || 'Matematika'}
                            </span>
                            <span className={cn(
                              "rounded-full px-2.5 py-0.5 text-xs font-medium",
                              isCorrect ? "bg-success/10 text-success" : "bg-destructive/10 text-destructive"
                            )}>
                              {isCorrect ? "To'g'ri" : "Tahlil kerak"}
                            </span>
                          </div>
                        </div>
                        <Button variant="ghost" size="icon" className="flex-shrink-0">
                          {isExpanded ? <ChevronUp className="h-5 w-5" /> : <ChevronDown className="h-5 w-5" />}
                        </Button>
                      </div>
                    </CardHeader>
                    <CardContent>
                      <div className="space-y-2 ml-11">
                        {isInput ? (
                          <div className="space-y-2">
                            <div className={cn(
                              "p-3 rounded-lg border flex items-center gap-2",
                              isCorrect ? "bg-success/10 border-success" : "bg-destructive/10 border-destructive"
                            )}>
                              {isCorrect ? <CheckCircle className="h-4 w-4 text-success" /> : <XCircle className="h-4 w-4 text-destructive" />}
                              <span className="text-sm">
                                Sizning javobingiz:{' '}
                                <strong className={isCorrect ? "text-success" : "text-destructive"}>
                                  {userAnswer?.text_answer || '— (javob berilmagan)'}
                                </strong>
                              </span>
                            </div>
                            {!isCorrect && (
                              <div className="p-3 rounded-lg border bg-success/10 border-success flex items-center gap-2">
                                <CheckCircle className="h-4 w-4 text-success" />
                                <span className="text-sm">To'g'ri javob: <strong className="text-success">{question.correct_answer}</strong></span>
                              </div>
                            )}
                          </div>
                        ) : (
                          question.choices.map((choice) => {
                            const isSelected = userAnswer?.selected_choice_id === choice.id;
                            const isCorrectChoice = choice.is_correct;

                            return (
                              <div
                                key={choice.id}
                                className={cn(
                                  "p-3 rounded-lg border",
                                  isCorrectChoice && "bg-success/10 border-success",
                                  isSelected && !isCorrectChoice && "bg-destructive/10 border-destructive",
                                  !isSelected && !isCorrectChoice && "bg-muted/50"
                                )}
                              >
                                <div className="flex items-center gap-2">
                                  {isCorrectChoice && <CheckCircle className="h-4 w-4 text-success" />}
                                  {isSelected && !isCorrectChoice && <XCircle className="h-4 w-4 text-destructive" />}
                                  <span className={cn(
                                    isCorrectChoice && "font-semibold text-success",
                                    isSelected && !isCorrectChoice && "line-through text-destructive"
                                  )}>
                                    {choice.choice_text}
                                  </span>
                                  {isSelected && <span className="text-xs text-muted-foreground">(sizning javobingiz)</span>}
                                </div>
                              </div>
                            );
                          })
                        )}
                      </div>


                      {/* Step-by-step explanation */}
                      {isExpanded && (
                        <div className="mt-4 ml-11 p-4 rounded-lg bg-info/10 border border-info/30">
                          <div className="flex items-start gap-3">
                            <Info className="h-5 w-5 text-info flex-shrink-0 mt-0.5" />
                            <div className="min-w-0 flex-1 space-y-3">
                              <p className="font-semibold text-info">Ish jarayoni:</p>
                              <p className="text-sm text-muted-foreground">
                                To'g'ri javob: <strong className="text-success">{correctChoice?.choice_text ?? question.correct_answer}</strong>
                              </p>
                              {isInput ? (
                                userAnswer?.text_answer && (
                                  <p className="text-sm text-muted-foreground mt-1">
                                    Siz yozdingiz: <span className={isCorrect ? "text-success" : "text-destructive line-through"}>{userAnswer.text_answer}</span>
                                  </p>
                                )
                              ) : selectedChoice && (
                                <p className="text-sm text-muted-foreground mt-1">
                                  Siz tanladingiz: <span className="text-destructive line-through">{selectedChoice.choice_text}</span>
                                </p>
                              )}
                              {!isInput && !selectedChoice && (
                                <p className="text-sm text-warning mt-1">
                                  Siz bu savolga javob bermadingiz.
                                </p>
                              )}
                              {isInput && !userAnswer?.text_answer && (
                                <p className="text-sm text-warning mt-1">
                                  Siz bu savolga javob bermadingiz.
                                </p>
                              )}
                              {getIntermediateSteps(question.intermediate_steps).length > 0 && (
                                <ol className="list-decimal space-y-2 pl-5 text-sm">
                                  {getIntermediateSteps(question.intermediate_steps).map((step, stepIndex) => (
                                    <li key={`${question.id}-step-${stepIndex}`}>
                                      <MathContent className="prose-p:my-0">{step}</MathContent>
                                    </li>
                                  ))}
                                </ol>
                              )}
                              {question.solution_text ? (
                                <MathContent className="text-sm">{question.solution_text}</MathContent>
                              ) : (
                                <p className="text-sm text-muted-foreground">
                                  Bu savol uchun admin tomonidan alohida yechim kiritilmagan. “Testni tahlil qilish” tugmasi orqali Math Go AI to'liq bosqichma-bosqich tahlil beradi.
                                </p>
                              )}
                            </div>
                          </div>
                        </div>
                      )}
                    </CardContent>
                  </Card>
                );
              })}
            </div>
          )}
        </div>
      </PageTransition>
    </Layout>
  );
}
