import { z } from 'zod';
import { User, type UserDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { adminUserDetail, objectIdOr404, requireAdmin } from '@/lib/admin';
import { grantUntil } from '@/lib/entitlements';
import { refreshRetentionForMember } from '@/lib/pro';

type P = Params<{ id: string }>;

const Grant = z
  .object({
    duration: z.enum(['month', 'year', 'lifetime', 'custom']),
    // Only for 'custom': the day Pro ends (ISO date or date-time).
    until: z.coerce.date().optional(),
    reason: z.string().trim().min(1, 'Geef een reden op').max(200),
  })
  .refine((v) => v.duration !== 'custom' || (v.until && v.until.getTime() > Date.now()), {
    message: 'Kies een datum in de toekomst',
    path: ['until'],
  });

/**
 * POST {duration: month|year|lifetime|custom, until?, reason} -> gives Pro.
 * Replaces an earlier gift. The person's groups become Pro groups right away.
 */
export const POST = handler<P>(async (req, { params }) => {
  const admin = await requireAdmin(req);
  const id = objectIdOr404((await params).id);
  const input = await body(req, Grant);
  const until = grantUntil(input.duration, new Date(), input.until ?? null);

  const user = await User.findByIdAndUpdate(
    id,
    { $set: { proGrant: { until, grantedBy: admin._id, reason: input.reason, createdAt: new Date() } } },
    { new: true, projection: { passwordHash: 0, resetCodeHash: 0, pushTokens: 0 } },
  ).lean<UserDoc>();
  if (!user) throw new HttpError(404, 'Gebruiker niet gevonden');
  await refreshRetentionForMember(user._id);
  console.info(`[admin] ${String(admin._id)} gave Pro to ${String(user._id)} (${input.duration}): ${input.reason}`);
  return json({ user: await adminUserDetail(user) });
});

/** DELETE -> takes a gift back. A running subscription is not touched. */
export const DELETE = handler<P>(async (req, { params }) => {
  const admin = await requireAdmin(req);
  const id = objectIdOr404((await params).id);
  const user = await User.findByIdAndUpdate(
    id,
    { $set: { proGrant: null } },
    { new: true, projection: { passwordHash: 0, resetCodeHash: 0, pushTokens: 0 } },
  ).lean<UserDoc>();
  if (!user) throw new HttpError(404, 'Gebruiker niet gevonden');
  await refreshRetentionForMember(user._id);
  console.info(`[admin] ${String(admin._id)} revoked the Pro gift of ${String(user._id)}`);
  return json({ user: await adminUserDetail(user) });
});
