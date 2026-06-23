import { useState, useRef, useEffect, useCallback } from 'react';
import { MessageSquare, X, Send, Loader2, Bot, User, Sparkles, RotateCcw } from 'lucide-react';
import { cn } from '@/lib/utils';
import { useAuth } from '@/hooks/useAuth';
import { supabase } from '@/integrations/supabase/client';
import { MathContent } from '@/components/MathContent';

interface Message {
  id: string;
  role: 'user' | 'assistant';
  content: string;
  timestamp: Date;
}

const WELCOME_MESSAGE: Message = {
  id: 'welcome',
  role: 'assistant',
  content:
    "Assalomu alaykum! Men **Math Go AI** — matematika bo'yicha AI yordamchingiz. Algebra, geometriya, trigonometriya yoki statistika haqida so'rang! 📐",
  timestamp: new Date(),
};

export function AlKhorazmiyChat() {
  const { session } = useAuth();
  const [isOpen, setIsOpen] = useState(false);
  const [messages, setMessages] = useState<Message[]>([WELCOME_MESSAGE]);
  const [input, setInput] = useState('');
  const [isLoading, setIsLoading] = useState(false);
  const [errorText, setErrorText] = useState<string | null>(null);
  const [historyLoaded, setHistoryLoaded] = useState(false);
  const lastUserTextRef = useRef<string>('');
  const messagesEndRef = useRef<HTMLDivElement>(null);
  const inputRef = useRef<HTMLInputElement>(null);

  const scrollToBottom = useCallback(() => {
    messagesEndRef.current?.scrollIntoView({ behavior: 'smooth' });
  }, []);

  useEffect(() => {
    scrollToBottom();
  }, [messages, scrollToBottom]);

  useEffect(() => {
    if (isOpen) {
      setTimeout(() => inputRef.current?.focus(), 300);
    }
  }, [isOpen]);

  // Load saved chat history per profile when chat first opens
  useEffect(() => {
    if (!isOpen || historyLoaded || !session?.user) return;
    setHistoryLoaded(true);
    (async () => {
      const { data } = await supabase
        .from('chat_messages')
        .select('id, role, content, created_at')
        .order('created_at', { ascending: true })
        .limit(200);
      if (data && data.length > 0) {
        setMessages([
          WELCOME_MESSAGE,
          ...data.map((m) => ({
            id: m.id,
            role: m.role as 'user' | 'assistant',
            content: m.content,
            timestamp: new Date(m.created_at),
          })),
        ]);
      }
    })();
  }, [isOpen, historyLoaded, session]);

  const persistMessage = async (role: 'user' | 'assistant', content: string) => {
    if (!session?.user) return;
    try {
      await supabase.from('chat_messages').insert({
        user_id: session.user.id,
        role,
        content,
      });
    } catch (e) {
      console.error('chat persist error', e);
    }
  };

  const requestReply = async (history: { role: string; content: string }[]) => {
    const controller = new AbortController();
    const timeoutId = setTimeout(() => controller.abort(), 45000);
    try {
      const response = await fetch(
        `${import.meta.env.VITE_SUPABASE_URL}/functions/v1/ai-chat`,
        {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json',
            Authorization: `Bearer ${session?.access_token || import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY}`,
            apikey: import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY,
          },
          body: JSON.stringify({ mode: 'chat', messages: history }),
          signal: controller.signal,
        }
      );

      if (response.status === 429) throw new Error("So'rovlar limiti oshib ketdi. Biroz kuting va qayta urinib ko'ring.");
      if (response.status === 402) throw new Error('AI kreditlari tugadi. Iltimos keyinroq urinib ko\'ring.');
      if (!response.ok) throw new Error(`Server xatosi (${response.status}). Qayta urinib ko'ring.`);

      const data = await response.json();
      return (data.reply as string) || 'Javob olishda xatolik yuz berdi.';
    } catch (err: any) {
      if (err?.name === 'AbortError') {
        throw new Error("So'rov vaqti tugadi (timeout). Internetni tekshirib qayta urinib ko'ring.");
      }
      throw err;
    } finally {
      clearTimeout(timeoutId);
    }
  };

  const runConversation = async (text: string, baseMessages: Message[]) => {
    setErrorText(null);
    setIsLoading(true);
    try {
      const history = [...baseMessages.filter((m) => m.id !== 'welcome')].map((m) => ({
        role: m.role === 'user' ? 'user' : 'assistant',
        content: m.content,
      }));

      const reply = await requestReply(history);

      const assistantMessage: Message = {
        id: `assistant-${Date.now()}`,
        role: 'assistant',
        content: reply,
        timestamp: new Date(),
      };
      setMessages((prev) => [...prev, assistantMessage]);
      void persistMessage('assistant', reply);
    } catch (error: any) {
      setErrorText(error?.message || "Javob berishda xatolik yuz berdi.");
    } finally {
      setIsLoading(false);
    }
  };

  const sendMessage = async () => {
    const text = input.trim();
    if (!text || isLoading) return;

    const userMessage: Message = {
      id: `user-${Date.now()}`,
      role: 'user',
      content: text,
      timestamp: new Date(),
    };

    const updated = [...messages, userMessage];
    setMessages(updated);
    setInput('');
    lastUserTextRef.current = text;
    void persistMessage('user', text);
    await runConversation(text, updated);
  };

  const retry = async () => {
    if (isLoading) return;
    await runConversation(lastUserTextRef.current, messages);
  };

  const handleKeyDown = (e: React.KeyboardEvent) => {
    if (e.key === 'Enter' && !e.shiftKey) {
      e.preventDefault();
      sendMessage();
    }
  };

  return (
    <>
      {/* Floating Button */}
      <button
        onClick={() => setIsOpen(!isOpen)}
        className={cn(
          'fixed bottom-6 right-6 z-50 flex items-center justify-center rounded-full shadow-2xl transition-all duration-500 ease-out',
          isOpen
            ? 'h-14 w-14 bg-gradient-to-br from-red-500 to-red-600 rotate-0 hover:from-red-600 hover:to-red-700'
            : 'h-16 w-16 bg-gradient-to-br from-emerald-500 to-teal-600 hover:from-emerald-600 hover:to-teal-700 hover:scale-110 chat-fab-pulse'
        )}
        aria-label={isOpen ? 'Chatni yopish' : 'Math Go AI bilan suhbatlashish'}
      >
        {isOpen ? (
          <X className="h-6 w-6 text-white" />
        ) : (
          <MessageSquare className="h-7 w-7 text-white" />
        )}
      </button>

      {/* Chat Window */}
      <div
        className={cn(
          'fixed bottom-24 right-6 z-50 flex flex-col rounded-2xl shadow-2xl border border-border/60 overflow-hidden transition-all duration-500 ease-out origin-bottom-right',
          isOpen
            ? 'w-[380px] h-[520px] opacity-100 scale-100 translate-y-0'
            : 'w-[380px] h-[520px] opacity-0 scale-75 translate-y-8 pointer-events-none'
        )}
        style={{
          maxHeight: 'calc(100vh - 140px)',
          maxWidth: 'calc(100vw - 48px)',
        }}
      >
        {/* Header */}
        <div className="bg-gradient-to-r from-emerald-600 to-teal-600 px-5 py-4 flex items-center gap-3 flex-shrink-0">
          <div className="flex items-center justify-center w-9 h-9 rounded-full bg-white/20 backdrop-blur-sm">
            <Sparkles className="h-5 w-5 text-white" />
          </div>
          <div className="flex-1">
            <h3 className="text-white font-bold text-base leading-tight" style={{ fontFamily: "'Playfair Display', serif" }}>
              Math Go AI
            </h3>
            <p className="text-emerald-100 text-xs">Matematik AI yordamchi</p>
          </div>
          <button
            onClick={() => setIsOpen(false)}
            className="text-white/80 hover:text-white transition-colors p-1 rounded-lg hover:bg-white/10"
          >
            <X className="h-5 w-5" />
          </button>
        </div>

        {/* Messages */}
        <div className="flex-1 overflow-y-auto p-4 space-y-4 bg-background/95 backdrop-blur-sm chat-messages-scrollbar">
          {messages.map((message) => (
            <div
              key={message.id}
              className={cn(
                'flex gap-2.5 animate-fade-in',
                message.role === 'user' ? 'flex-row-reverse' : 'flex-row'
              )}
            >
              {/* Avatar */}
              <div
                className={cn(
                  'flex-shrink-0 w-8 h-8 rounded-full flex items-center justify-center',
                  message.role === 'user'
                    ? 'bg-primary/10'
                    : 'bg-gradient-to-br from-emerald-500 to-teal-600'
                )}
              >
                {message.role === 'user' ? (
                  <User className="h-4 w-4 text-primary" />
                ) : (
                  <Bot className="h-4 w-4 text-white" />
                )}
              </div>

              {/* Bubble */}
              <div
                className={cn(
                  'max-w-[75%] rounded-2xl px-4 py-2.5 text-sm leading-relaxed overflow-x-auto',
                  message.role === 'user'
                    ? 'bg-primary text-primary-foreground rounded-br-md'
                    : 'bg-card border border-border/60 text-foreground rounded-bl-md shadow-sm'
                )}
              >
                <MathContent className={cn('prose-p:my-0', message.role === 'user' && 'text-primary-foreground')}>{message.content}</MathContent>
              </div>
            </div>
          ))}

          {/* Loading indicator */}
          {isLoading && (
            <div className="flex gap-2.5 animate-fade-in">
              <div className="flex-shrink-0 w-8 h-8 rounded-full flex items-center justify-center bg-gradient-to-br from-emerald-500 to-teal-600">
                <Bot className="h-4 w-4 text-white" />
              </div>
              <div className="bg-card border border-border/60 rounded-2xl rounded-bl-md px-4 py-3 shadow-sm">
                <div className="flex items-center gap-1.5">
                  <div className="w-2 h-2 bg-emerald-500 rounded-full animate-bounce" style={{ animationDelay: '0ms' }} />
                  <div className="w-2 h-2 bg-emerald-500 rounded-full animate-bounce" style={{ animationDelay: '150ms' }} />
                  <div className="w-2 h-2 bg-emerald-500 rounded-full animate-bounce" style={{ animationDelay: '300ms' }} />
                </div>
              </div>
            </div>
          )}

          {/* Error with retry */}
          {errorText && !isLoading && (
            <div className="flex flex-col gap-2 rounded-xl border border-destructive/40 bg-destructive/10 p-3 animate-fade-in">
              <p className="text-sm text-destructive">{errorText}</p>
              <button
                onClick={retry}
                className="inline-flex items-center justify-center gap-1.5 self-start rounded-full bg-destructive px-3 py-1.5 text-xs font-medium text-destructive-foreground hover:opacity-90 transition-opacity"
              >
                <RotateCcw className="h-3.5 w-3.5" />
                Qayta urinish
              </button>
            </div>
          )}

          <div ref={messagesEndRef} />
        </div>

        {/* Input */}
        <div className="p-3 border-t border-border/60 bg-card flex-shrink-0">
          <div className="flex items-center gap-2">
            <input
              ref={inputRef}
              type="text"
              value={input}
              onChange={(e) => setInput(e.target.value)}
              onKeyDown={handleKeyDown}
              placeholder="Savolingizni yozing..."
              disabled={isLoading}
              className="flex-1 bg-muted/50 border border-border/40 rounded-full px-4 py-2.5 text-base sm:text-sm outline-none focus:border-emerald-500/50 focus:ring-2 focus:ring-emerald-500/20 transition-all placeholder:text-muted-foreground/60 disabled:opacity-50"
            />
            <button
              onClick={sendMessage}
              disabled={isLoading || !input.trim()}
              className={cn(
                'flex items-center justify-center w-10 h-10 rounded-full transition-all duration-300',
                input.trim() && !isLoading
                  ? 'bg-gradient-to-br from-emerald-500 to-teal-600 text-white hover:from-emerald-600 hover:to-teal-700 shadow-lg hover:shadow-emerald-500/30'
                  : 'bg-muted text-muted-foreground cursor-not-allowed'
              )}
            >
              {isLoading ? (
                <Loader2 className="h-4 w-4 animate-spin" />
              ) : (
                <Send className="h-4 w-4" />
              )}
            </button>
          </div>
        </div>
      </div>
    </>
  );
}
