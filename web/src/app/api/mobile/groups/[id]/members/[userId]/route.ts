import { z } from 'zod';
import { Types } from 'mongoose';
import { Group, HiddenPhoto, Photo, type GroupDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { refuseForPersonalRoll, requireAdmin, serializeGroup } from '@/lib/groups';
import { refreshGroupRetention } from '@/lib/pro';

type P = Params<{ id: string; userId: string }>;

/** Admin removes a member. Their photos stay in the group. */
export const DELETE = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const { id, userId } = await params;
  const group = await requireAdmin(id, user._id);
  refuseForPersonalRoll(group);
  if (!Types.ObjectId.isValid(userId)) throw new HttpError(404, 'Lid niet gevonden');
  if (String(group.ownerId) === userId) throw new HttpError(400, 'De maker van de groep kan niet verwijderd worden');
  const removed = new Types.ObjectId(userId);
  await Group.updateOne({ _id: group._id }, { $pull: { members: { userId: removed }, archivedBy: removed } });
  await HiddenPhoto.deleteMany({ userId: removed, groupId: group._id });
  // Reiskaart: their photos stay, their locations do not.
  await Photo.updateMany({ groupId: group._id, userId: removed, location: { $exists: true } }, { $unset: { location: 1 } });
  // The group may have been Pro through the removed member only.
  await refreshGroupRetention(group._id);
  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({ group: await serializeGroup(fresh!, user._id) });
});

/** Admin promotes / demotes a member. */
export const PATCH = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const { id, userId } = await params;
  const group = await requireAdmin(id, user._id);
  refuseForPersonalRoll(group);
  const { role } = await body(req, z.object({ role: z.enum(['admin', 'member']) }));
  if (!Types.ObjectId.isValid(userId) || !group.members.some((m) => String(m.userId) === userId)) {
    throw new HttpError(404, 'Lid niet gevonden');
  }
  if (String(group.ownerId) === userId && role === 'member') throw new HttpError(400, 'De maker blijft beheerder');
  if (role === 'member' && !group.members.some((m) => m.role === 'admin' && String(m.userId) !== userId)) {
    throw new HttpError(400, 'Een groep heeft minstens één beheerder nodig');
  }
  await Group.updateOne(
    { _id: group._id, 'members.userId': new Types.ObjectId(userId) },
    { $set: { 'members.$.role': role } },
  );
  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({ group: await serializeGroup(fresh!, user._id) });
});
