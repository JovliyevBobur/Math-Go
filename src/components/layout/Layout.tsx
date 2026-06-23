import { ReactNode } from 'react';
import { Header } from './Header';
import { FloatingShapes } from '@/components/ui/FloatingShapes';
import { AlKhorazmiyChat } from '@/components/AlKhorazmiyChat';

interface LayoutProps {
  children: ReactNode;
}

export function Layout({ children }: LayoutProps) {
  return (
    <div className="min-h-screen bg-background relative">
      <FloatingShapes className="fixed z-0" />
      <Header />
      <main className="relative z-10">{children}</main>
      <AlKhorazmiyChat />
    </div>
  );
}
