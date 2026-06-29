import pg from 'pg';

const client = new pg.Client({
  connectionString: 'postgresql://postgres:K%2Be6xD6d7JmJZTG@db.ekdkrysarlsbrnsgimsx.supabase.co:5432/postgres'
});

async function check() {
  try {
    await client.connect();
    const res = await client.query('SELECT count(*) FROM tests;');
    console.log('Tests count:', res.rows[0].count);
    
    const questionsRes = await client.query('SELECT count(*) FROM questions;');
    console.log('Questions count:', questionsRes.rows[0].count);
    
    const titlesRes = await client.query('SELECT title FROM tests LIMIT 3;');
    console.log('Sample tests:', titlesRes.rows);
  } catch (err) {
    console.error('Error:', err);
  } finally {
    await client.end();
  }
}

check();
