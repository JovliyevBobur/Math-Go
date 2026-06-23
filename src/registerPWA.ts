// Guarded PWA service worker registration.
// Only registers in the real published app — never in Lovable preview/dev/iframe.

function isRefusedContext(): boolean {
  if (!import.meta.env.PROD) return true;
  if (typeof window === "undefined") return true;

  try {
    if (window.self !== window.top) return true; // inside an iframe
  } catch {
    return true; // cross-origin iframe access throws
  }

  const host = window.location.hostname;
  const refusedHost =
    host.startsWith("id-preview--") ||
    host.startsWith("preview--") ||
    host === "lovableproject.com" ||
    host.endsWith(".lovableproject.com") ||
    host === "lovableproject-dev.com" ||
    host.endsWith(".lovableproject-dev.com") ||
    host === "beta.lovable.dev" ||
    host.endsWith(".beta.lovable.dev");
  if (refusedHost) return true;

  if (new URLSearchParams(window.location.search).get("sw") === "off") return true;

  return false;
}

async function unregisterExisting(): Promise<void> {
  if (!("serviceWorker" in navigator)) return;
  const registrations = await navigator.serviceWorker.getRegistrations();
  await Promise.all(
    registrations
      .filter((r) => r.active?.scriptURL?.endsWith("/sw.js"))
      .map((r) => r.unregister())
  );
}

export function registerPWA(): void {
  if (typeof navigator === "undefined" || !("serviceWorker" in navigator)) return;

  if (isRefusedContext()) {
    void unregisterExisting();
    return;
  }

  window.addEventListener("load", () => {
    navigator.serviceWorker.register("/sw.js").catch(() => {
      /* ignore registration errors */
    });
  });
}
