import { User, type UserDoc } from '@/lib/models';
import { handler, HttpError, json, type Params } from '@/lib/http';
import { adminUserDetail, objectIdOr404, requireAdmin } from '@/lib/admin';

/** GET -> one user: groups, photos, Pro status and source, sign-in methods, ban. */
export const GET = handler<Params<{ id: string }>>(async (req, { params }) => {
  await requireAdmin(req);
  const id = objectIdOr404((await params).id);
  const user = await User.findById(id, { passwordHash: 0, resetCodeHash: 0, pushTokens: 0 }).lean<UserDoc>();
  if (!user) throw new HttpError(404, 'Gebruiker niet gevonden');
  return json({ user: await adminUserDetail(user) });
});
