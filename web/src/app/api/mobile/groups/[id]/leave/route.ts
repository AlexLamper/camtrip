import { Group, HiddenPhoto, Photo } from '@/lib/models';
import { handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { refuseForPersonalRoll, requireMember } from '@/lib/groups';
import { refreshGroupRetention } from '@/lib/pro';

export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  refuseForPersonalRoll(group);
  const rest = group.members.filter((m) => String(m.userId) !== String(user._id));
  if (!rest.length) throw new HttpError(400, 'Je bent het laatste lid. Verwijder de groep in plaats daarvan.', 'last_member');

  // Never leave a group without an admin.
  const members = rest.some((m) => m.role === 'admin') ? rest : rest.map((m, i) => (i === 0 ? { ...m, role: 'admin' } : m));
  const update: Record<string, unknown> = { members, $pull: { archivedBy: user._id } };
  if (String(group.ownerId) === String(user._id)) update.ownerId = members.find((m) => m.role === 'admin')!.userId;
  await Group.updateOne({ _id: group._id }, update);
  await HiddenPhoto.deleteMany({ userId: user._id, groupId: group._id });
  // Reiskaart: their photos stay, their locations do not (consent ends with membership).
  await Photo.updateMany({ groupId: group._id, userId: user._id, location: { $exists: true } }, { $unset: { location: 1 } });
  // The group may have been Pro through this member only.
  await refreshGroupRetention(group._id);
  return json({ ok: true });
});
