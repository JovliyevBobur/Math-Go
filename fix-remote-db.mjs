import pg from 'pg';
const { Client } = pg;

const client = new Client({
  host: 'aws-1-ap-northeast-2.pooler.supabase.com',
  port: 5432,
  database: 'postgres',
  user: 'postgres.guwouvtbtorzvlvkewfn',
  password: 'K+e6xD6d7JmJZTG',
  ssl: { rejectUnauthorized: false },
  connectionTimeoutMillis: 15000,
});

try {
  await client.connect();
  console.log('Connected!\n');

  // Get the JWT secret and anon key
  const res = await client.query(`
    SELECT 
      current_setting('app.settings.jwt_secret', true) as jwt_secret,
      current_setting('request.jwt.claims', true) as jwt_claims;
  `);
  console.log('Settings:', res.rows);

  // Try to get anon key from supabase_functions schema
  const res2 = await client.query(`
    SELECT * FROM information_schema.schemata WHERE schema_name IN ('extensions', 'supabase_functions', 'auth');
  `);
  console.log('Schemas:', res2.rows.map(r => r.schema_name));

  // Check auth.config for JWT 
  const res3 = await client.query(`SELECT parameter, value FROM auth.config LIMIT 20;`);
  console.log('Auth config:', res3.rows);

} catch (err) {
  console.error('Error:', err.message);
  
  // Simpler: just get the URL and anon key from the project settings table
  try {
    const client2 = new pg.Client({
      host: 'aws-1-ap-northeast-2.pooler.supabase.com',
      port: 5432,
      database: 'postgres',
      user: 'postgres.guwouvtbtorzvlvkewfn',
      password: 'K+e6xD6d7JmJZTG',
      ssl: { rejectUnauthorized: false },
    });
    await client2.connect();
    
    // Check for the project's anon key via extensions
    const r = await client2.query(`SELECT key_id, key FROM pgsodium.valid_key LIMIT 5;`);
    console.log('pgsodium keys:', r.rows);
    await client2.end();
  } catch(e2) {
    console.error('Inner error:', e2.message);
  }
} finally {
  await client.end().catch(() => {});
}
