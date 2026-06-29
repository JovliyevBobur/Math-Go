import fs from 'fs';

function generateSql() {
  console.log('Reading data.json...');
  let dataRaw;
  try {
    dataRaw = fs.readFileSync('./data.json', 'utf8');
  } catch (err) {
    console.error('Could not read data.json', err);
    return;
  }
  
  const data = JSON.parse(dataRaw);
  
  let sql = `-- Clear existing data
DELETE FROM choices;
DELETE FROM user_answers;
DELETE FROM questions;
DELETE FROM test_attempts;
DELETE FROM tests;

`;

  const algebraData = data.ALGEBRA_VA_MATEMATIK_ANALIZ;
  if (!algebraData) {
    console.log("No data found to generate SQL");
    return;
  }
  
  let testIdCounter = 1;
  let questionIdCounter = 1;
  let choiceIdCounter = 1;
  
  const escapeSql = (str) => {
    if (typeof str !== 'string') return str;
    return str.replace(/'/g, "''");
  };

  for (const [bobKey, bobValue] of Object.entries(algebraData)) {
    const bobTitle = bobValue.nomi;
    
    for (const [variantKey, questionsList] of Object.entries(bobValue.variantlar)) {
      const testTitle = `${bobTitle} - ${variantKey.replace('_', ' ').replace(/\b\w/g, l => l.toUpperCase())}`;
      const testId = `00000000-0000-0000-0000-${testIdCounter.toString().padStart(12, '0')}`;
      testIdCounter++;
      
      sql += `INSERT INTO tests (id, title, subject, duration_minutes, description, is_published, created_at, updated_at) 
VALUES ('${testId}', '${escapeSql(testTitle)}', 'math', 60, '${escapeSql(data.izoh || '')}', true, now(), now());\n\n`;
      
      let orderIndex = 0;
      for (const q of questionsList) {
        orderIndex++;
        const questionId = `00000000-0000-0000-0001-${questionIdCounter.toString().padStart(12, '0')}`;
        questionIdCounter++;
        
        sql += `INSERT INTO questions (id, test_id, question_text, topic, order_index, correct_answer, intermediate_steps, created_at)
VALUES ('${questionId}', '${testId}', '${escapeSql(q.savol)}', 'Mavzu ${escapeSql(q.mavzu)}', ${orderIndex}, '${escapeSql(q.togri)}', '{}'::jsonb, now());\n`;
        
        let choiceIndex = 0;
        for (const [choiceKey, choiceText] of Object.entries(q.javoblar)) {
          const choiceId = `00000000-0000-0000-0002-${choiceIdCounter.toString().padStart(12, '0')}`;
          choiceIdCounter++;
          
          sql += `INSERT INTO choices (id, question_id, choice_text, is_correct, order_index)
VALUES ('${choiceId}', '${questionId}', '${escapeSql(choiceKey)}) ${escapeSql(choiceText)}', ${choiceKey === q.togri}, ${choiceIndex++});\n`;
        }
        sql += '\n';
      }
    }
  }
  
  fs.writeFileSync('./import-tests.sql', sql, 'utf8');
  console.log('SQL file generated at ./import-tests.sql. Please run it in your Supabase SQL Editor.');
}

generateSql();
