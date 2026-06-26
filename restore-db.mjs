// Script to delete existing tests/questions/choices and restore them from backup
// via Supabase client (using admin authentication) on ekdkrysarlsbrnsgimsx

import { createClient } from '@supabase/supabase-js';
import fs from 'fs';

const supabase = createClient(
  'https://ekdkrysarlsbrnsgimsx.supabase.co',
  'sb_publishable_EvNXcZgyd_QnnzoXBouXDA_cXpM-SFB'
);

try {
  console.log('1. Signing in as admin...');
  const { data: authData, error: authErr } = await supabase.auth.signInWithPassword({
    email: 'admin2o1o@jbn.jbn',
    password: 'Admin2o1o'
  });

  if (authErr) throw authErr;
  console.log('   Signed in successfully!');

  // Load backup
  const backup = JSON.parse(fs.readFileSync('questions_backup.json', 'utf8'));
  console.log(`Loaded backup: ${backup.tests.length} tests, ${backup.questions.length} questions, ${backup.choices.length} choices.`);

  // Deleting order is important due to foreign keys: choices -> questions -> tests
  console.log('2. Deleting existing choices...');
  const { error: delChoicesErr } = await supabase
    .from('choices')
    .delete()
    .neq('id', '00000000-0000-0000-0000-000000000000');
  
  if (delChoicesErr) throw delChoicesErr;
  console.log('   Choices deleted.');

  console.log('3. Deleting existing questions...');
  const { error: delQsErr } = await supabase
    .from('questions')
    .delete()
    .neq('id', '00000000-0000-0000-0000-000000000000');

  if (delQsErr) throw delQsErr;
  console.log('   Questions deleted.');

  console.log('4. Deleting existing tests...');
  const { error: delTestsErr } = await supabase
    .from('tests')
    .delete()
    .neq('id', '00000000-0000-0000-0000-000000000000');

  if (delTestsErr) throw delTestsErr;
  console.log('   Tests deleted.');

  // Restore tests
  console.log('5. Restoring tests...');
  const { error: insTestsErr } = await supabase
    .from('tests')
    .insert(backup.tests);
  
  if (insTestsErr) throw insTestsErr;
  console.log(`   ${backup.tests.length} tests restored.`);

  // Restore questions
  console.log('6. Restoring questions...');
  const { error: insQsErr } = await supabase
    .from('questions')
    .insert(backup.questions);

  if (insQsErr) throw insQsErr;
  console.log(`   ${backup.questions.length} questions restored.`);

  // Restore choices
  console.log('7. Restoring choices...');
  // We can insert choices in batches of 100 to avoid request size limits
  const batchSize = 100;
  for (let i = 0; i < backup.choices.length; i += batchSize) {
    const batch = backup.choices.slice(i, i + batchSize);
    const { error: insChoicesErr } = await supabase
      .from('choices')
      .insert(batch);
    if (insChoicesErr) throw insChoicesErr;
  }
  console.log(`   ${backup.choices.length} choices restored.`);

  console.log('✅ DATABASE RESTORE COMPLETED SUCCESSFULLY!');

} catch (err) {
  console.error('❌ Restore failed:', err.message);
}
