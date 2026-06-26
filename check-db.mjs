// Brute force find the correct pooler for ekdkrysarlsbrnsgimsx
import pg from 'pg';
const { Client } = pg;

const PASSWORD = 'K+e6xD6d7JmJZTG';
const PROJECT_REF = 'ekdkrysarlsbrnsgimsx';

const regions = [
  'us-east-1', 'us-east-2',
  'us-west-1', 'us-west-2',
  'eu-west-1', 'eu-west-2', 'eu-west-3',
  'eu-central-1', 'eu-central-2',
  'eu-north-1',
  'ap-northeast-1', 'ap-northeast-2', 'ap-northeast-3',
  'ap-southeast-1', 'ap-southeast-2',
  'ap-south-1',
  'sa-east-1',
  'ca-central-1',
  'me-south-1',
  'af-south-1',
];

async function tryConnect(connStr) {
  const client = new Client({ 
    connectionString: connStr,
    connectionTimeoutMillis: 5000,
    ssl: { rejectUnauthorized: false },
  });
  try {
    await client.connect();
    const res = await client.query('SELECT 1+1 as test');
    return client;
  } catch (err) {
    await client.end().catch(() => {});
    throw err;
  }
}

async function main() {
  const promises = [];
  
  for (const region of regions) {
    for (const prefix of ['aws-0', 'aws-1']) {
      for (const port of ['6543', '5432']) {
        const host = `${prefix}-${region}.pooler.supabase.com`;
        const connStr = `postgresql://postgres.${PROJECT_REF}:${encodeURIComponent(PASSWORD)}@${host}:${port}/postgres`;
        
        promises.push(
          tryConnect(connStr)
            .then(async (client) => {
              console.log(`✅ FOUND: ${host}:${port}`);
              
              const func = await client.query(
                "SELECT prosrc FROM pg_proc WHERE proname = 'submit_test_attempt'"
              );
              if (func.rows.length > 0) {
                const src = func.rows[0].prosrc;
                const hasBug = src.includes('percentage =') || src.includes('percentage=');
                console.log(`  submit_test_attempt: percentage bug = ${hasBug}`);
              } else {
                console.log(`  submit_test_attempt: NOT FOUND`);
              }
              
              await client.end();
              return `${host}:${port}`;
            })
            .catch(() => null)
        );
      }
    }
  }
  
  const results = await Promise.all(promises);
  const found = results.filter(r => r !== null);
  
  if (found.length === 0) {
    console.log('❌ No pooler connection found for ekdkrysarlsbrnsgimsx');
    console.log('Trying direct connection...');
    
    // Try direct
    try {
      const client = await tryConnect(
        `postgresql://postgres:${encodeURIComponent(PASSWORD)}@db.${PROJECT_REF}.supabase.co:5432/postgres`
      );
      console.log('✅ Direct connection works!');
      await client.end();
    } catch (err) {
      console.log(`❌ Direct also failed: ${err.message}`);
    }
  }
}

main().catch(err => {
  console.error('Fatal:', err.message);
});
