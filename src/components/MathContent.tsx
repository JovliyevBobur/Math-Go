import ReactMarkdown from 'react-markdown';
import remarkMath from 'remark-math';
import rehypeKatex from 'rehype-katex';
import { cn } from '@/lib/utils';

interface MathContentProps {
  children: string;
  className?: string;
}

export function MathContent({ children, className }: MathContentProps) {
  return (
    <div className={cn('math-content prose prose-sm dark:prose-invert max-w-none', className)}>
      <ReactMarkdown remarkPlugins={[remarkMath]} rehypePlugins={[rehypeKatex]}>
        {children}
      </ReactMarkdown>
    </div>
  );
}