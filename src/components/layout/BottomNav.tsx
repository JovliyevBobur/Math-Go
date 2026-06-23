import { NavLink } from 'react-router-dom';
import { Home, Info, Mail, LayoutDashboard, User, BarChart2 } from 'lucide-react';
import { cn } from '@/lib/utils';
import { useAuth } from '@/hooks/useAuth';

export function BottomNav() {
  const { user } = useAuth();

  const navItems = [
    { to: '/', icon: Home, label: 'Home' },
    { to: '/about', icon: Info, label: 'About' },
    { to: '/contact', icon: Mail, label: 'Contact' },
    ...(user ? [{ to: '/dashboard', icon: LayoutDashboard, label: 'Dashboard' }] : []),
    ...(user ? [{ to: '/profile', icon: User, label: 'Profile' }] : []),
    { to: '/leaderboard', icon: BarChart2, label: 'Reyting' },
  ];

  return (
    <div className="md:hidden fixed bottom-0 left-0 right-0 bg-[#020120] border-t border-white/10 z-50 pb-safe shadow-[0_-10px_40px_rgba(0,0,0,0.3)] transition-all duration-500">
      <div className="flex items-center justify-around px-2 py-2 relative">
        {navItems.map((item) => (
          <NavLink
            key={item.to}
            to={item.to}
            className={({ isActive }) =>
              cn(
                "flex flex-col items-center justify-center gap-1 w-14 h-14 rounded-2xl transition-all duration-500 relative group",
                isActive 
                  ? "text-white" 
                  : "text-white/60 hover:text-white"
              )
            }
          >
            {({ isActive }) => (
              <>
                {/* Animated active background pill */}
                <div className={cn(
                  "absolute inset-0 m-auto w-12 h-12 rounded-xl bg-blue-500/10 transition-all duration-500 ease-out",
                  isActive ? "scale-100 opacity-100" : "scale-50 opacity-0"
                )} />
                
                {/* Icon with bounce effect */}
                <div className="relative z-10 flex flex-col items-center justify-center h-full">
                  <item.icon 
                    strokeWidth={isActive ? 2.5 : 2}
                    className={cn(
                      "w-5 h-5 sm:w-6 sm:h-6 transition-all duration-500 ease-out mb-1",
                      isActive ? "scale-110 -translate-y-0.5 drop-shadow-[0_0_8px_rgba(255,255,255,0.5)] text-[#E2B714]" : "group-hover:scale-110"
                    )} 
                  />
                  {/* Label */}
                  <span className={cn(
                    "text-[10px] sm:text-[11px] font-medium tracking-wide transition-all duration-500",
                    isActive ? "text-white font-bold" : "text-white/60"
                  )}>
                    {item.label}
                  </span>
                </div>
              </>
            )}
          </NavLink>
        ))}
      </div>
    </div>
  );
}
