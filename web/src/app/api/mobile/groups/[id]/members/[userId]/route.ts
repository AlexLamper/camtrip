import { z } from 'zod';
import { Types } from 'mongoose';
import { Group, type GroupDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { requireAdmin, serializeGroup } from '@/lib/groups';

type P = Params<{ id: string; userId: string }>;

/** Admin removes a member. Their photos stay in the group. */
export const DELETE = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const { id, userId } = await params;
  const group = await requireAdmin(id, user._id);
  if (!Types.ObjectId.isValid(userId)) throw new HttpError(404, 'Lid niet gevonden');
  if (String(group.ownerId) === userId) throw new HttpError(400, 'De maker van de groep kan niet verwijderd worden');
  await Group.updateOne({ _id: group._id }, { $pull: { members: { userId: new Types.ObjectId(userId) } } });
  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({ group: await serializeGroup(fresh!, user._id) });
});

/** Admin promotes / demotes a member. */
export const PATCH = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const { id, userId } = await params;
  const group = await requireAdmin(id, user._id);
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
