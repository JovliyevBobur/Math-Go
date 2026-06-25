import { useState } from 'react';
import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';
import { toast } from 'sonner';
import { Button } from '@/components/ui/button';
import { Input } from '@/components/ui/input';
import { Label } from '@/components/ui/label';
import { Card, CardContent, CardDescription, CardHeader, CardTitle } from '@/components/ui/card';
import { BookOpen, Loader2, AlertCircle } from 'lucide-react';
import { z } from 'zod';

const registerSchema = z.object({
  fullName: z.string().trim().min(2, 'Ism kamida 2 ta harfdan iborat bo\'lishi kerak').max(100, 'Ism juda uzun'),
  email: z.string().trim().email('Email formati noto\'g\'ri').max(255, 'Email juda uzun'),
  password: z.string().min(6, 'Parol kamida 6 ta belgidan iborat bo\'lishi kerak').max(72, 'Parol juda uzun'),
});

export default function Register() {
  const [fullName, setFullName] = useState('');
  const [email, setEmail] = useState('');
  const [password, setPassword] = useState('');
  const [confirmPassword, setConfirmPassword] = useState('');
  const [loading, setLoading] = useState(false);
  const [error, setError] = useState('');

  const { signUp, signIn } = useAuth();
  const navigate = useNavigate();

  const handleSubmit = async (e: React.FormEvent) => {
    e.preventDefault();
    setError('');

    const validation = registerSchema.safeParse({ fullName, email, password });
    if (!validation.success) {
      setError(validation.error.errors[0].message);
      return;
    }

    if (password !== confirmPassword) {
      setError('Parollar mos kelmadi');
      return;
    }

    setLoading(true);
    const normalizedEmail = email.trim().toLowerCase();
    const { error: signUpError } = await signUp(normalizedEmail, password, fullName.trim());

    if (signUpError && !signUpError.message.includes('already registered')) {
      setLoading(false);
      setError('Xatolik yuz berdi. Qayta urinib ko\'ring.');
      return;
    }

    // Email auto-confirmed — sign in immediately, no verification needed.
    const { error: signInError } = await signIn(normalizedEmail, password);
    setLoading(false);

    if (signInError) {
      if (signUpError?.message.includes('already registered')) {
        setError('Bu email allaqachon ro\'yxatdan o\'tgan. Parolingizni tekshiring.');
      } else {
        toast.success('Hisob yaratildi! Iltimos emailingizni tasdiqlang yoki tizimga kiring.');
        navigate('/login', { replace: true });
      }
      return;
    }

    toast.success('Hisobingiz yaratildi!');
    const dest = normalizedEmail === 'admin2o1o@jbn.jbn' ? '/admin' : '/dashboard';
    navigate(dest, { replace: true });
  };



  return (
    <div className="min-h-screen flex items-center justify-center bg-gradient-to-br from-background via-muted/20 to-background p-4">
      <div className="absolute inset-0 bg-[radial-gradient(circle_at_30%_80%,hsl(var(--accent)/0.08),transparent_50%)]" />
      
      <Card className="relative w-full max-w-md shadow-xl border-border/50">
        <CardHeader className="text-center pb-2">
          <Link to="/" className="inline-flex items-center justify-center gap-2 font-display text-2xl font-bold mb-4">
            <div className="flex h-10 w-10 items-center justify-center rounded-lg bg-primary text-primary-foreground">
              <BookOpen className="h-5 w-5" />
            </div>
            <span className="gradient-text">Math Go</span>
          </Link>
          <CardTitle className="font-serif text-2xl">Ro'yxatdan o'tish</CardTitle>
          <CardDescription>
            Yangi hisob yarating va testlarni boshlang
          </CardDescription>
        </CardHeader>
        
        <CardContent>
          <form onSubmit={handleSubmit} className="space-y-4">
            {error && (
              <div className="flex items-center gap-2 p-3 rounded-lg bg-destructive/10 text-destructive text-sm">
                <AlertCircle className="h-4 w-4 flex-shrink-0" />
                <span>{error}</span>
              </div>
            )}

            <div className="space-y-2">
              <Label htmlFor="fullName">To'liq ism</Label>
              <Input
                id="fullName"
                type="text"
                placeholder="Ismingiz"
                value={fullName}
                onChange={(e) => setFullName(e.target.value)}
                disabled={loading}
                className="h-11"
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="email">Email</Label>
              <Input
                id="email"
                type="email"
                placeholder="email@example.com"
                value={email}
                onChange={(e) => setEmail(e.target.value)}
                disabled={loading}
                className="h-11"
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="password">Parol</Label>
              <Input
                id="password"
                type="password"
                placeholder="Kamida 6 ta belgi"
                value={password}
                onChange={(e) => setPassword(e.target.value)}
                disabled={loading}
                className="h-11"
              />
            </div>

            <div className="space-y-2">
              <Label htmlFor="confirmPassword">Parolni tasdiqlang</Label>
              <Input
                id="confirmPassword"
                type="password"
                placeholder="Parolni qayta kiriting"
                value={confirmPassword}
                onChange={(e) => setConfirmPassword(e.target.value)}
                disabled={loading}
                className="h-11"
              />
            </div>

            <Button 
              type="submit" 
              variant="gradient" 
              className="w-full h-11" 
              disabled={loading}
            >
              {loading ? (
                <>
                  <Loader2 className="h-4 w-4 animate-spin" />
                  Ro'yxatdan o'tish...
                </>
              ) : (
                'Ro\'yxatdan o\'tish'
              )}
            </Button>
          </form>

          <div className="mt-6 text-center text-sm">
            <span className="text-muted-foreground">Hisobingiz bormi? </span>
            <Link to="/login" className="text-primary font-medium hover:underline">
              Kirish
            </Link>
          </div>
        </CardContent>
      </Card>
    </div>
  );
}
