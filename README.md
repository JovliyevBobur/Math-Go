# Welcome to your Lovable project

## Project info

**URL**: https://lovable.dev/projects/REPLACE_WITH_PROJECT_ID

## How can I edit this code?

There are several ways of editing your application.

**Use Lovable**

Simply visit the [Lovable Project](https://lovable.dev/projects/REPLACE_WITH_PROJECT_ID) and start prompting.

Changes made via Lovable will be committed automatically to this repo.

**Use your preferred IDE**

If you want to work locally using your own IDE, you can clone this repo and push changes. Pushed changes will also be reflected in Lovable.

The only requirement is having Node.js & npm installed - [install with nvm](https://github.com/nvm-sh/nvm#installing-and-updating)

Follow these steps:

```sh
# Step 1: Clone the repository using the project's Git URL.
git clone <YOUR_GIT_URL>

# Step 2: Navigate to the project directory.
cd <YOUR_PROJECT_NAME>

# Step 3: Install the necessary dependencies.
npm i

# Step 4: Start the development server with auto-reloading and an instant preview.
npm run dev
```

**Edit a file directly in GitHub**

- Navigate to the desired file(s).
- Click the "Edit" button (pencil icon) at the top right of the file view.
- Make your changes and commit the changes.

**Use GitHub Codespaces**

- Navigate to the main page of your repository.
- Click on the "Code" button (green button) near the top right.
- Select the "Codespaces" tab.
- Click on "New codespace" to launch a new Codespace environment.
- Edit files directly within the Codespace and commit and push your changes once you're done.

## What technologies are used for this project?

This project is built with:

- Vite
- TypeScript
- React
- shadcn-ui
- Tailwind CSS

## How can I deploy this project?

Simply open [Lovable](https://lovable.dev/projects/REPLACE_WITH_PROJECT_ID) and click on Share -> Publish.

## Can I connect a custom domain to my Lovable project?

Yes, you can!

To connect a domain, navigate to Project > Settings > Domains and click Connect Domain.

Read more here: [Setting up a custom domain](https://docs.lovable.dev/features/custom-domain#custom-domain)

---

## 🛠️ database Troubleshooting & Fix

### Problem
When users submit their test attempts, they receive the following PostgreSQL error:
`column "percentage" can only be updated to DEFAULT`

This happens because the database function `submit_test_attempt` (specifically the one on project `ekdkrysarlsbrnsgimsx`) includes `percentage = v_pct` and `grade = v_grade` in the `UPDATE public.test_attempts` statement, which is prohibited since those columns are defined as `GENERATED ALWAYS AS ... STORED`.

### Current Workaround (Client-Side Fallback)
We modified [TakeTest.tsx](file:///c:/Users/sefsd/Math-Go/src/pages/TakeTest.tsx) so that if calling the RPC `submit_test_attempt` fails, it falls back to a **client-side grading and direct table update** flow:
1. Fetches correct choices and correct text answers using RLS permissions.
2. Grades the submission locally.
3. Inserts answer records directly into `user_answers`.
4. Directly updates the `test_attempts` table (`completed_at`, `score`, `total_questions`, `time_spent_seconds`) without sending the generated columns `percentage` or `grade` in the payload. PostgreSQL automatically and successfully calculates them on the database side.

### permanent Database Fix (SQL Editor)
To fix the function in the remote database itself so the client doesn't need to fall back, log in to the Supabase Dashboard for project `ekdkrysarlsbrnsgimsx`, open the **SQL Editor**, and run the SQL query from the [FIX_DATABASE.sql](file:///c:/Users/sefsd/Math-Go/FIX_DATABASE.sql) file:
1. Re-creates `submit_test_attempt` without updating generated columns.
2. Adds a unique constraint on `(attempt_id, question_id)` in the `user_answers` table so the `ON CONFLICT` clause does not fail.

### 📦 Database Backup
A full backup of the tests, questions, and choices has been extracted and saved to [questions_backup.json](file:///c:/Users/sefsd/Math-Go/questions_backup.json).

