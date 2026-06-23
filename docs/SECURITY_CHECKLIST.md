# Security Verification Checklist — Answer Keys & Attempt Results

This checklist confirms that test answer keys (`is_correct`) are never exposed to
clients and that test results can only be viewed by the attempt owner (or admins).

## 1. `is_correct` is never exposed during a test
- [ ] Direct `select` on `public.choices` from the client does NOT return `is_correct`
      (the column is not selectable / table read is restricted to admins).
- [ ] `get_test_questions(test_id)` RPC returns choices WITHOUT an `is_correct` field.
- [ ] `TakeTest.tsx` only consumes `get_test_questions` and never fetches `choices` with `is_correct`.
- [ ] Grading happens server-side in `submit_test_attempt` (the client never computes the score).

## 2. Only the attempt owner can view results
- [ ] `get_attempt_review(attempt_id)` raises `Not authorized` when the caller is not
      the attempt owner and not an admin/super admin.
- [ ] The owner (and admins) receive the full review including correct answers + solutions.
- [ ] `Results.tsx` retrieves data exclusively via `get_attempt_review`.

## 3. Automated coverage
- [ ] `src/test/security.answerkey.test.ts` (anon client) asserts:
  - `get_test_questions` never includes `is_correct`.
  - Direct `choices` select cannot read `is_correct`.
  - `get_attempt_review` for a foreign/random attempt is rejected.

## 4. Run
```
bunx vitest run src/test/security.answerkey.test.ts
```

> Tests skip gracefully when no published test exists in the environment.
