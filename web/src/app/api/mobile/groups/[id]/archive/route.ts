import { z } from 'zod';
import { Group, type GroupDoc } from '@/lib/models';
import { body, handler, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { requireMember, serializeGroup } from '@/lib/groups';

/**
 * Archives (or un-archives) a group for the current user only. The group moves
 * to "Gearchiveerd" in their albums list; nothing changes for other members.
 * Not to be confused with the admin's "Groep afsluiten" (status 'archived').
 */
export const PATCH = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  const { archived } = await body(req, z.object({ archived: z.boolean() }));
  await Group.updateOne({ _id: group._id }, archived ? { $addToSet: { archivedBy: user._id } } : { $pull: { archivedBy: user._id } });
  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({ group: await serializeGroup(fresh!, user._id) });
});
