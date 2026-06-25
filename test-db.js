import { createClient } from '@supabase/supabase-js';
import dotenv from 'dotenv';
dotenv.config();

const supabaseUrl = process.env.VITE_SUPABASE_URL;
const supabaseKey = process.env.VITE_SUPABASE_ANON_KEY;

if (!supabaseUrl || !supabaseKey) {
  console.log("Missing Supabase credentials in .env");
  process.exit(1);
}

const supabase = createClient(supabaseUrl, supabaseKey);

async function test() {
  const { data, error } = await supabase.from('test_attempts').select('*').limit(1);
  console.log("test_attempts:", data, error);

  const { data: qData, error: qError } = await supabase.from('user_answers').select('*').limit(1);
  console.log("user_answers:", qData, qError);
}

test();
