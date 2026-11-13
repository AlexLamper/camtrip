import { handler, json } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { ensurePersonalRoll, serializeGroup } from '@/lib/groups';

/**
 * "Mijn rolletje": the user's private personal roll for loose photos that are
 * not for a shared album. Created on first use; GET and POST are the same and
 * both idempotent. Shaped like a group (isPersonal: true, no invite code).
 */
async function roll(req: Request) {
  const user = await requireUser(req);
  const group = await ensurePersonalRoll(user._id);
  return json({ group: await serializeGroup(group, user._id) });
}

export const GET = handler(roll);
export const POST = handler(roll);
