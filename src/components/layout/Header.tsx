import { Link, useNavigate } from 'react-router-dom';
import { useAuth } from '@/hooks/useAuth';
import { Button } from '@/components/ui/button';
import {
  DropdownMenu,
  DropdownMenuContent,
  DropdownMenuItem,
  DropdownMenuSeparator,
  DropdownMenuTrigger,
} from '@/components/ui/dropdown-menu';
import { Avatar, AvatarFallback, AvatarImage } from '@/components/ui/avatar';
import { LogOut, User, LayoutDashboard, ChevronDown, Menu } from 'lucide-react';
import { Sheet, SheetContent, SheetTrigger } from '@/components/ui/sheet';
import { ThemeToggle } from '@/components/ThemeToggle';
import { useState } from 'react';
import logoAsset from '@/assets/mathgo-logo.png.asset.json';
const logoImg = logoAsset.url;
export function Header() {
  const { user, profile, isAdmin, signOut } = useAuth();
  const navigate = useNavigate();
  const [mobileOpen, setMobileOpen] = useState(false);

  const handleSignOut = async () => {
    await signOut();
    navigate('/');
  };

  const getInitials = (name: string) => {
    return name
      .split(' ')
      .map((n) => n[0])
      .join('')
      .toUpperCase()
      .slice(0, 2);
  };

  const navLinks = [
    { href: '/tests', label: 'Testlar' },
    { href: '/books', label: 'Kitoblar' },
    { href: '/leaderboard', label: 'Reyting' },
    ...(user ? [{ href: '/dashboard', label: 'Dashboard' }] : []),
    { href: '/about', label: 'Biz haqimizda' },
    { href: '/contact', label: 'Aloqa' },
  ];

  return (
    <header className="sticky top-0 z-50 w-full bg-card/95 backdrop-blur-md border-b border-border/60 transition-all duration-300">
      <div className="container flex h-20 items-center justify-between">
        {/* Logo */}
        <Link to="/" className="flex items-center gap-3 group">
          <img src={logoImg} alt="Math Go Logo" className="h-11 w-11 rounded-md shadow-md transition-transform duration-300 group-hover:scale-105" />
          <div className="flex flex-col">
            <span className="font-serif text-xl font-semibold tracking-tight text-foreground">Math Go</span>
            <span className="text-[10px] tracking-elegant text-accent font-medium uppercase">Professional</span>
          </div>
        </Link>

        {/* Desktop Nav */}
        <nav className="hidden md:flex items-center gap-1">
          {navLinks.map((link) => (
            <Link key={link.href} to={link.href}>
              <Button variant="ghost" size="sm" className="text-muted-foreground hover:text-foreground transition-colors">
                {link.label}
              </Button>
            </Link>
          ))}
        </nav>

        {/* Right Side */}
        <div className="flex items-center gap-2">
          <ThemeToggle />
          {/* Mobile Menu */}
          <Sheet open={mobileOpen} onOpenChange={setMobileOpen}>
            <SheetTrigger asChild className="md:hidden">
              <Button variant="ghost" size="icon">
                <Menu className="h-5 w-5" />
              </Button>
            </SheetTrigger>
            <SheetContent side="right" className="w-72">
              <nav className="flex flex-col gap-2 mt-8">
                {navLinks.map((link) => (
                  <Link
                    key={link.href}
                    to={link.href}
                    onClick={() => setMobileOpen(false)}
                    className="flex items-center gap-3 px-4 py-3 rounded-md hover:bg-muted transition-colors"
                  >
                    {link.label}
                  </Link>
                ))}
                {!user && (
                  <>
                    <Link to="/login" onClick={() => setMobileOpen(false)}>
                      <Button variant="outline" className="w-full mt-4">Kirish</Button>
                    </Link>
                    <Link to="/register" onClick={() => setMobileOpen(false)}>
                      <Button variant="premium" className="w-full">Ro'yxatdan o'tish</Button>
                    </Link>
                  </>
                )}
              </nav>
            </SheetContent>
          </Sheet>

          {user ? (
            <DropdownMenu>
              <DropdownMenuTrigger asChild>
                <Button variant="ghost" className="flex items-center gap-2 h-auto p-2 hover:bg-muted/50">
                  <Avatar className="h-9 w-9 border-2 border-border transition-transform duration-300 hover:scale-105">
                    <AvatarImage src={profile?.avatar_url || ''} />
                    <AvatarFallback className="bg-primary/10 text-primary font-medium text-sm">
                      {profile?.full_name ? getInitials(profile.full_name) : 'U'}
                    </AvatarFallback>
                  </Avatar>
                  <span className="hidden sm:block text-sm font-medium">{profile?.full_name?.split(' ')[0]}</span>
                  <ChevronDown className="h-4 w-4 text-muted-foreground" />
                </Button>
              </DropdownMenuTrigger>
              <DropdownMenuContent className="w-56 animate-fade-in" align="end">
                <div className="flex items-center gap-3 p-3 border-b border-border/60">
                  <Avatar className="h-10 w-10 border-2 border-border">
                    <AvatarImage src={profile?.avatar_url || ''} />
                    <AvatarFallback className="bg-primary/10 text-primary font-medium">
                      {profile?.full_name ? getInitials(profile.full_name) : 'U'}
                    </AvatarFallback>
                  </Avatar>
                  <div className="flex flex-col">
                    <p className="text-sm font-medium">{profile?.full_name}</p>
                    <p className="text-xs text-muted-foreground">{user.email}</p>
                  </div>
                </div>
                <div className="p-1">
                  <DropdownMenuItem asChild>
                    <Link to="/profile" className="flex items-center gap-2 cursor-pointer">
                      <User className="h-4 w-4" />
                      Profil
                    </Link>
                  </DropdownMenuItem>
                  {isAdmin && (
                    <DropdownMenuItem asChild>
                      <Link to="/admin" className="flex items-center gap-2 cursor-pointer">
                        <LayoutDashboard className="h-4 w-4" />
                        Admin Panel
                      </Link>
                    </DropdownMenuItem>
                  )}
                </div>
                <DropdownMenuSeparator />
                <div className="p-1">
                  <DropdownMenuItem onClick={handleSignOut} className="cursor-pointer text-destructive focus:text-destructive">
                    <LogOut className="h-4 w-4 mr-2" />
                    Chiqish
                  </DropdownMenuItem>
                </div>
              </DropdownMenuContent>
            </DropdownMenu>
          ) : (
            <div className="hidden md:flex items-center gap-3">
              <Link to="/login">
                <Button variant="ghost" size="sm">
                  Kirish
                </Button>
              </Link>
              <Link to="/register">
                <Button variant="premium" size="sm">
                  Ro'yxatdan o'tish
                </Button>
              </Link>
            </div>
          )}
        </div>
      </div>
    </header>
  );
}
