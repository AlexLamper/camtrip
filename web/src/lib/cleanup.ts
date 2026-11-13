// Pure helpers for account deletion. No runtime imports, so this file also
// runs as-is under `node --experimental-strip-types` for the tests.

function escapeRegex(s: string): string {
  return s.replace(/[.*+?^${}()|[\]\\]/g, '\\$&');
}

/**
 * Matches the rate-limit keys (AuthAttempt.key) that contain this e-mail
 * address: `login:<email>:<ip>`, `reset:<email>:<ip>`, `forgot:<email>:<ip>`
 * and `forgot:<email>` (see lib/ratelimit.ts). Exact address only, so
 * `alex@x.nl` does not match `malex@x.nl` or `alex@x.nl.com`.
 */
export function attemptKeyPattern(email: string): RegExp | null {
  const e = email.trim().toLowerCase();
  if (!e) return null;
  return new RegExp(`^[a-z]+:${escapeRegex(e)}(?::|$)`);
}

/** Group field paths that hold personal data of [userId] beyond membership. */
export function groupTraceUpdate(userId: string) {
  return {
    $pull: { archivedBy: userId },
    $unset: { [`lastNotified.${userId}`]: '' },
  };
}
