import pg from 'pg';
import fs from 'fs';
const { Client } = pg;

const connStr = `postgresql://postgres:${encodeURIComponent('K+e6xD6d7JmJZTG')}@db.ekdkrysarlsbrnsgimsx.supabase.co:5432/postgres`;

async function execute() {
  const client = new Client({ 
    connectionString: connStr,
    connectionTimeoutMillis: 15000,
    ssl: { rejectUnauthorized: false },
  });
  
  console.log("Connecting to the database...");
  await client.connect();
  
  console.log("Reading SQL file...");
  const sql = fs.readFileSync('./import-tests.sql', 'utf8');
  
  console.log("Executing SQL...");
  await client.query(sql);
  
  console.log("SQL executed successfully!");
  await client.end();
}

execute().catch(e => {
  console.error("Failed:", e);
  process.exit(1);
});
