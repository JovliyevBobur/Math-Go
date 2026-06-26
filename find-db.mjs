// Try multiple Supabase pooler connections to find the right one
import { execSync } from 'child_process';

const PROJECT_REF = 'ekdkrysarlsbrnsgimsx';
const PASSWORD = 'K+e6xD6d7JmJZTG';

const regions = [
  'us-east-1', 'us-west-1', 'us-west-2',
  'eu-west-1', 'eu-west-2', 'eu-central-1',
  'ap-northeast-1', 'ap-northeast-2', 'ap-southeast-1', 'ap-southeast-2',
  'ap-south-1', 'sa-east-1',
];
const awsNumbers = ['0', '1'];
const modes = ['transaction', 'session'];
const ports = ['5432', '6543'];

for (const region of regions) {
  for (const awsNum of awsNumbers) {
    const host = `aws-${awsNum}-${region}.pooler.supabase.com`;
    for (const port of ports) {
      const url = `postgresql://postgres.${PROJECT_REF}:${PASSWORD}@${host}:${port}/postgres`;
      try {
        const result = execSync(
          `npx supabase db query --db-url "${url}" "SELECT 1+1 as test;" 2>&1`,
          { timeout: 10000, encoding: 'utf-8', cwd: 'c:\\Users\\sefsd\\Math-Go' }
        );
        console.log(`✅ SUCCESS: ${host}:${port}`);
        console.log(result);
        process.exit(0);
      } catch (e) {
        // skip
      }
    }
  }
}

console.log('❌ No working connection found');
