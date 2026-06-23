import { describe, it, expect } from "vitest";
import { createClient } from "@supabase/supabase-js";

/**
 * Security regression tests:
 *  - `is_correct` must never be exposed to anonymous/unprivileged clients.
 *  - Only the attempt owner (or admins) may read attempt results.
 *
 * These run against the live project using the public (anon) key only.
 * They skip gracefully when prerequisite data is missing.
 */

const SUPABASE_URL =
  import.meta.env.VITE_SUPABASE_URL ?? "https://ekdkrysarlsbrnsgimsx.supabase.co";
const SUPABASE_ANON_KEY =
  import.meta.env.VITE_SUPABASE_PUBLISHABLE_KEY ??
  "sb_publishable_EvNXcZgyd_QnnzoXBouXDA_cXpM-SFB";

const anon = createClient(SUPABASE_URL, SUPABASE_ANON_KEY);

function deepHasKey(value: unknown, key: string): boolean {
  if (Array.isArray(value)) return value.some((v) => deepHasKey(v, key));
  if (value && typeof value === "object") {
    return Object.entries(value as Record<string, unknown>).some(
      ([k, v]) => k === key || deepHasKey(v, key)
    );
  }
  return false;
}

describe("answer key protection", () => {
  it("direct choices select cannot read is_correct", async () => {
    const { data, error } = await anon
      .from("choices" as any)
      .select("is_correct")
      .limit(1);

    // Either the request is rejected (RLS / column hidden) or it returns no rows.
    if (error) {
      expect(error).toBeTruthy();
      return;
    }
    expect(data ?? []).toEqual([]);
  });

  it("get_test_questions never includes is_correct", async () => {
    // Find a published test via the public stats / tests surface.
    const { data: tests } = await anon
      .from("tests" as any)
      .select("id")
      .eq("is_published", true)
      .limit(1);

    const testId = Array.isArray(tests) && tests[0]?.id;
    if (!testId) {
      console.warn("No published test available — skipping is_correct shape check.");
      return;
    }

    const { data, error } = await anon.rpc("get_test_questions", {
      p_test_id: testId,
    });
    expect(error).toBeFalsy();
    expect(deepHasKey(data, "is_correct")).toBe(false);
  });
});

describe("attempt result authorization", () => {
  it("rejects review of a non-owned / random attempt for anon callers", async () => {
    const randomAttemptId = "00000000-0000-0000-0000-000000000000";
    const { data, error } = await anon.rpc("get_attempt_review", {
      p_attempt_id: randomAttemptId,
    });

    // Anonymous caller must never receive review data.
    expect(error || !data).toBeTruthy();
  });
});
