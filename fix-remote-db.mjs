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

  // Get secrets from vault
  const vault = await client.query(`
    SELECT name, secret, decrypted_secret 
    FROM vault.decrypted_secrets 
    ORDER BY name;
  `).catch(e => ({ rows: [], err: e.message }));
  console.log('Vault secrets:', JSON.stringify(vault.rows));

  // Get auth users to confirm project is in use
  const users = await client.query(`
    SELECT id, email, created_at FROM auth.users LIMIT 5;
  `).catch(e => ({ rows: [], err: e.message }));
  console.log('\nAuth users:', JSON.stringify(users.rows));

  // Check if admin user exists in this project
  const admin = await client.query(`
    SELECT id, email FROM auth.users WHERE lower(email) = 'admin2o1o@jbn.jbn';
  `).catch(e => ({ rows: [] }));
  console.log('\nAdmin user exists in this DB:', admin.rows.length > 0, admin.rows);

} catch (err) {
  console.error('Error:', err.message);
} finally {
  await client.end().catch(() => {});
}
