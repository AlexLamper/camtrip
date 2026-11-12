import { Group } from '@/lib/models';
import { handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { requireMember } from '@/lib/groups';

export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  const rest = group.members.filter((m) => String(m.userId) !== String(user._id));
  if (!rest.length) throw new HttpError(400, 'Je bent het laatste lid. Verwijder de groep in plaats daarvan.', 'last_member');

  // Never leave a group without an admin.
  const members = rest.some((m) => m.role === 'admin') ? rest : rest.map((m, i) => (i === 0 ? { ...m, role: 'admin' } : m));
  const update: Record<string, unknown> = { members };
  if (String(group.ownerId) === String(user._id)) update.ownerId = members.find((m) => m.role === 'admin')!.userId;
  await Group.updateOne({ _id: group._id }, update);
  return json({ ok: true });
});
