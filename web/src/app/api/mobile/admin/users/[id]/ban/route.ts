import { z } from 'zod';
import { body, handler, json, type Params } from '@/lib/http';
import { adminUserDetail, objectIdOr404, requireAdmin, setBanned } from '@/lib/admin';

const Ban = z.object({
  banned: z.boolean(),
  reason: z.string().trim().max(300).optional(),
});

/** POST {banned: boolean, reason?} -> blocks (or unblocks) sign-in and every API call. */
export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const admin = await requireAdmin(req);
  const id = objectIdOr404((await params).id);
  const input = await body(req, Ban);
  const user = await setBanned(admin, id, input.banned, input.reason ?? '');
  return json({ user: await adminUserDetail(user) });
});
