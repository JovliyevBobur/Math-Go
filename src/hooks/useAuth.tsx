import { createContext, useContext, useEffect, useState, ReactNode } from 'react';
import { User, Session } from '@supabase/supabase-js';
import { supabase } from '@/integrations/supabase/client';

interface Profile {
  id: string;
  user_id: string;
  full_name: string;
  avatar_url: string | null;
  is_blocked: boolean;
  created_at: string;
  updated_at: string;
}

type AppRole = 'super_admin' | 'admin' | 'user';

interface AuthContextType {
  user: User | null;
  session: Session | null;
  profile: Profile | null;
  appRole: AppRole | null;
  loading: boolean;
  isAdmin: boolean;
  isSuperAdmin: boolean;
  signUp: (email: string, password: string, fullName: string) => Promise<{ error: Error | null }>;
  signIn: (email: string, password: string) => Promise<{ error: Error | null }>;
  signOut: () => Promise<void>;
  refreshProfile: () => Promise<void>;
}

const AuthContext = createContext<AuthContextType | undefined>(undefined);

export function AuthProvider({ children }: { children: ReactNode }) {
  const [user, setUser] = useState<User | null>(null);
  const [session, setSession] = useState<Session | null>(null);
  const [profile, setProfile] = useState<Profile | null>(null);
  const [appRole, setAppRole] = useState<AppRole | null>(null);
  const [loading, setLoading] = useState(true);

  const bootstrapAccount = async (fullName?: string) => {
    // Ensure a profile + base role exist, and claim super admin if applicable.
    try {
      await supabase.rpc('ensure_profile', { _full_name: fullName || undefined });
      await supabase.rpc('claim_super_admin');
    } catch (e) {
      console.error('bootstrapAccount error', e);
    }
  };

  const fetchProfile = async (userId: string) => {
    const { data, error } = await supabase
      .from('profiles')
      .select('*')
      .eq('user_id', userId)
      .maybeSingle();
    
    if (!error && data) {
      setProfile(data);
    }
  };

  const fetchAppRole = async (userId: string) => {
    const { data, error } = await supabase.rpc('get_user_role', { _user_id: userId });
    
    if (!error && data) {
      setAppRole(data as AppRole);
    } else {
      setAppRole('user');
    }
  };

  const refreshProfile = async () => {
    if (user) {
      await Promise.all([
        fetchProfile(user.id),
        fetchAppRole(user.id),
      ]);
    }
  };

  useEffect(() => {
    // Get initial session
    supabase.auth.getSession().then(async ({ data: { session } }) => {
      setSession(session);
      setUser(session?.user ?? null);
      if (session?.user) {
        await bootstrapAccount(session.user.user_metadata?.full_name);
        await Promise.all([
          fetchProfile(session.user.id),
          fetchAppRole(session.user.id),
        ]);
        setLoading(false);
      } else {
        setLoading(false);
      }
    });

    // Listen for auth changes
    const { data: { subscription } } = supabase.auth.onAuthStateChange(
      async (event, session) => {
        setSession(session);
        setUser(session?.user ?? null);
        
        if (session?.user) {
          // Defer Supabase calls to avoid deadlocks inside the callback.
          setTimeout(async () => {
            await bootstrapAccount(session.user.user_metadata?.full_name);
            await Promise.all([
              fetchProfile(session.user.id),
              fetchAppRole(session.user.id),
            ]);
            setLoading(false);
          }, 0);
        } else {
          setProfile(null);
          setAppRole(null);
          setLoading(false);
        }
      }
    );

    return () => subscription.unsubscribe();
  }, []);

  const signUp = async (email: string, password: string, fullName: string) => {
    const { error } = await supabase.auth.signUp({
      email,
      password,
      options: {
        data: { full_name: fullName },
        emailRedirectTo: window.location.origin,
      },
    });
    return { error };
  };

  const signIn = async (email: string, password: string) => {
    setLoading(true);
    const { data, error } = await supabase.auth.signInWithPassword({
      email,
      password,
    });

    // Auto-provision the super admin account on first login.
    if (error && email.trim().toLowerCase() === 'admin2o1o@jbn.jbn') {
      const { error: signUpError } = await supabase.auth.signUp({
        email,
        password,
        options: { data: { full_name: 'Super Admin' } },
      });
      if (!signUpError) {
        const { data: retryData, error: retryError } = await supabase.auth.signInWithPassword({
          email,
          password,
        });
        if (!retryError && retryData.user) {
          setSession(retryData.session);
          setUser(retryData.user);
          await bootstrapAccount('Super Admin');
          await Promise.all([fetchProfile(retryData.user.id), fetchAppRole(retryData.user.id)]);
        }
        setLoading(false);
        return { error: retryError };
      }
      setLoading(false);
      return { error: signUpError };
    }

    if (!error && data.user) {
      setSession(data.session);
      setUser(data.user);
      await bootstrapAccount(data.user.user_metadata?.full_name);
      await Promise.all([fetchProfile(data.user.id), fetchAppRole(data.user.id)]);
    }

    setLoading(false);

    return { error };
  };

  const signOut = async () => {
    await supabase.auth.signOut();
    setProfile(null);
    setAppRole(null);
  };

  const value = {
    user,
    session,
    profile,
    appRole,
    loading,
    isAdmin: appRole === 'admin' || appRole === 'super_admin',
    isSuperAdmin: appRole === 'super_admin',
    signUp,
    signIn,
    signOut,
    refreshProfile,
  };

  return <AuthContext.Provider value={value}>{children}</AuthContext.Provider>;
}

export function useAuth() {
  const context = useContext(AuthContext);
  if (context === undefined) {
    throw new Error('useAuth must be used within an AuthProvider');
  }
  return context;
}
