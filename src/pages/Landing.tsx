import { Link } from 'react-router-dom';
import { Button } from '@/components/ui/button';
import { Layout } from '@/components/layout/Layout';
import { PageTransition } from '@/components/PageTransition';

import { CheckCircle, BookOpen, Trophy, Clock, Users, TrendingUp, Rocket, ArrowRight, Award } from 'lucide-react';
import { useQuery } from '@tanstack/react-query';
import { supabase } from '@/integrations/supabase/client';
const logoImg = '/718d018f-b9e2-4bc3-8bc2-81520e0f0a7e.png';
import mathGoBg from '@/assets/math_go_bg.png';

export default function Landing() {
  const { data: stats } = useQuery({
    queryKey: ['landing-stats'],
    queryFn: async () => {
      const [{ count: userCount }, { count: questionCount }] = await Promise.all([
        supabase.from('profiles').select('*', { count: 'exact', head: true }),
        supabase.from('questions').select('*', { count: 'exact', head: true }),
      ]);
      return { users: userCount ?? 0, questions: questionCount ?? 0 };
    },
  });

  const features = [
    {
      icon: BookOpen,
      title: "Matematika bo'yicha testlar",
      description: "Cheksiz miqdordagi savollar va kuchli yechimlar bilan",
    },
    {
      icon: Clock,
      title: "Vaqt cheklovi",
      description: "Har bir test uchun real imtihon sharoitida mashq qiling",
    },
    {
      icon: Trophy,
      title: "Reyting jadvali",
      description: "O'z natijalaringizni boshqalar bilan solishtiring",
    },
    {
      icon: TrendingUp,
      title: "Batafsil statistika",
      description: "O'z rivojlanishingizni kuzatib boring",
    },
  ];

  return (
    <Layout>
      
      <PageTransition>
        {/* Hero Section */}
        <section className="relative min-h-[100vh] flex items-center overflow-hidden pt-10">
          {/* Vibrant 3D Background from Image 4 */}
          <div className="absolute inset-0 z-0">
            <img src={mathGoBg} alt="Math Go Background" className="w-full h-full object-cover object-center scale-105 transition-transform duration-1000" />
            <div className="absolute inset-0 bg-[#0A0D18]/80 dark:bg-[#0A0D18]/60 backdrop-blur-[1px]" />
            <div className="absolute inset-0 bg-gradient-to-b from-transparent via-[#0A0D18]/50 to-[#0A0D18]" />
          </div>

          <div className="container relative z-10 py-20">
            <div className="flex flex-col items-center text-center max-w-4xl mx-auto">
              {/* Heading */}
              <h1 className="font-serif text-5xl md:text-7xl lg:text-8xl font-bold tracking-tight mb-8 animate-fade-up text-white">
                Imtihonlarga 
                <span className="block mt-2">
                  <span className="text-[#E2B714] drop-shadow-[0_0_15px_rgba(226,183,20,0.5)]">professional</span>
                </span>
                darajada tayyorlaning
              </h1>
              
              {/* Description */}
              <p className="text-xl md:text-2xl text-white/80 max-w-2xl mb-12 animate-fade-up leading-relaxed font-medium" style={{ animationDelay: '0.1s' }}>
                Math Go bilan real imtihon sharoitida o'zingizni sinab ko'ring. 
                Minglab savollar, tez natijalar, va kosmik tajriba.
              </p>

              {/* CTA Buttons */}
              <div className="flex flex-col sm:flex-row gap-4 animate-fade-up w-full sm:w-auto mt-4" style={{ animationDelay: '0.2s' }}>
                <Link to="/register" className="w-full sm:w-auto">
                  <Button size="xl" className="w-full group bg-[#E2B714] hover:bg-[#E2B714]/90 text-[#1B2559] text-lg font-bold shadow-[0_4px_20px_rgba(226,183,20,0.4)] transition-all hover:scale-105 border-none h-14 rounded-xl">
                    <Rocket className="h-5 w-5 mr-2 group-hover:-translate-y-1 transition-transform" />
                    Bepul boshlash
                    <ArrowRight className="h-5 w-5 ml-2 group-hover:translate-x-1 transition-transform" />
                  </Button>
                </Link>
                <Link to="/subjects" className="w-full sm:w-auto">
                  <Button variant="outline" size="xl" className="w-full border-2 border-white/20 bg-black/40 hover:bg-white/10 text-white backdrop-blur-md transition-all hover:scale-105 h-14 rounded-xl font-semibold text-lg">
                    Fanlarni ko'rish
                  </Button>
                </Link>
              </div>

              {/* Stats - Only two cards like in reference image */}
              <div className="flex flex-wrap justify-center gap-6 mt-16 animate-fade-up w-full" style={{ animationDelay: '0.3s' }}>
                <div className="flex items-center gap-4 px-8 py-5 rounded-2xl bg-black/40 backdrop-blur-md border border-white/10 shadow-[0_8px_32px_rgba(0,0,0,0.3)] w-full sm:w-auto">
                  <Users className="h-8 w-8 text-[#E2B714]" />
                  <div className="text-left">
                    <p className="font-serif text-3xl font-bold text-white">{stats?.users?.toLocaleString() ?? '0'}</p>
                    <p className="text-sm text-white/70 font-medium">foydalanuvchi</p>
                  </div>
                </div>
                <div className="flex items-center gap-4 px-8 py-5 rounded-2xl bg-black/40 backdrop-blur-md border border-white/10 shadow-[0_8px_32px_rgba(0,0,0,0.3)] w-full sm:w-auto">
                  <BookOpen className="h-8 w-8 text-[#E2B714]" />
                  <div className="text-left">
                    <p className="font-serif text-3xl font-bold text-white">{stats?.questions?.toLocaleString() ?? '0'}</p>
                    <p className="text-sm text-white/70 font-medium">savollar</p>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </section>

        {/* Features Section */}
        <section className="py-24 relative bg-card/50 backdrop-blur-sm">
          <div className="container relative">
            <div className="text-center mb-16">
              <p className="text-sm font-medium tracking-widest text-accent uppercase mb-3 animate-fade-up">Imkoniyatlar</p>
              <h2 className="font-serif text-4xl md:text-5xl font-bold mb-6 animate-fade-up delay-100">
                Nima uchun <span className="text-gradient-gold">Math Go</span>?
              </h2>
              <p className="text-xl text-muted-foreground max-w-2xl mx-auto animate-fade-up delay-200">
                Eng zamonaviy texnologiyalar bilan qurilgan platforma sizga eng yaxshi natijalarni kafolatlaydi
              </p>
            </div>

            <div className="grid grid-cols-2 md:grid-cols-2 lg:grid-cols-4 gap-3 sm:gap-6">
              {features.map((feature, index) => (
                <div
                  key={index}
                  className="group card-premium p-4 sm:p-8 text-center hover:-translate-y-2 transition-all duration-500 animate-fade-up flex flex-col items-center"
                  style={{ animationDelay: `${index * 0.1}s` }}
                >
                  <div className="inline-flex items-center justify-center w-12 h-12 sm:w-16 sm:h-16 rounded-2xl bg-accent/10 text-accent mb-4 sm:mb-6 group-hover:bg-accent group-hover:text-accent-foreground transition-all duration-300 group-hover:scale-110">
                    <feature.icon className="h-6 w-6 sm:h-8 sm:w-8" />
                  </div>
                  <h3 className="font-serif text-base sm:text-xl font-bold mb-2 sm:mb-3 leading-tight">{feature.title}</h3>
                  <p className="text-xs sm:text-base text-muted-foreground line-clamp-3 sm:line-clamp-none">{feature.description}</p>
                </div>
              ))}
            </div>
          </div>
        </section>

        {/* CTA Section */}
        <section className="py-24 relative">
          <div className="container">
            <div className="relative rounded-3xl overflow-hidden">
              <div className="absolute inset-0 bg-gradient-to-r from-primary via-accent to-primary opacity-90" />
              <div className="absolute inset-0 bg-[radial-gradient(circle_at_30%_50%,rgba(255,255,255,0.1),transparent_50%)]" />
              
              <div className="relative px-8 py-20 text-center text-white">
                <Award className="h-16 w-16 mx-auto mb-6 opacity-80 animate-cosmic-float" />
                <h2 className="font-serif text-4xl md:text-5xl font-bold mb-6">
                  Hoziroq boshlang!
                </h2>
                <p className="text-xl opacity-90 max-w-2xl mx-auto mb-10">
                  Ro'yxatdan o'ting va birinchi testingizni bepul ishlang. 
                  Muvaffaqiyat yo'lida birinchi qadamni qo'ying.
                </p>
                <Link to="/register">
                  <Button size="xl" variant="gold" className="font-bold text-lg hover:scale-105 transition-transform">
                    Bepul ro'yxatdan o'tish
                    <ArrowRight className="h-5 w-5 ml-2" />
                  </Button>
                </Link>
              </div>
            </div>
          </div>
        </section>

        {/* Footer */}
        <footer className="py-12 border-t bg-card/50 backdrop-blur-sm">
          <div className="container flex flex-col md:flex-row items-center justify-between gap-6">
            <div className="flex items-center gap-3 font-serif text-xl font-bold">
              <img src={logoImg} alt="Math Go Logo" className="h-10 w-10 rounded-xl" />
              <span>Math Go</span>
            </div>
            <p className="text-muted-foreground">
              © 2025 Math Go. Barcha huquqlar himoyalangan.
            </p>
          </div>
        </footer>
      </PageTransition>
    </Layout>
  );
}
