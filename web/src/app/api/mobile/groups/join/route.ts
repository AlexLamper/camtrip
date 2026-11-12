import { z } from 'zod';
import { Group, type GroupDoc } from '@/lib/models';
import { body, handler, HttpError, json } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { FREE_MEMBER_LIMIT, memberRole, normalizeCode, ownerIsPro, serializeGroup } from '@/lib/groups';

export const POST = handler(async (req) => {
  const user = await requireUser(req);
  const { code } = await body(req, z.object({ code: z.string().min(4) }));
  const group = await Group.findOne({ code: normalizeCode(code) }).lean<GroupDoc>();
  if (!group) throw new HttpError(404, 'Geen groep gevonden met deze code', 'not_found');

  if (!memberRole(group, user._id)) {
    if (group.status === 'archived') throw new HttpError(410, 'Deze groep is afgesloten', 'archived');
    if (!(await ownerIsPro(group)) && group.members.length >= FREE_MEMBER_LIMIT) {
      throw new HttpError(
        403,
        `Deze groep zit vol (max. ${FREE_MEMBER_LIMIT} leden). Met CamTrip Pro van de maker kunnen er onbeperkt mensen bij.`,
        'group_full',
      );
    }
    // Conditional push so two people joining at once cannot exceed the limit by one.
    await Group.updateOne(
      { _id: group._id, 'members.userId': { $ne: user._id } },
      { $push: { members: { userId: user._id, role: 'member', joinedAt: new Date() } } },
    );
  }
  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({ group: await serializeGroup(fresh!, user._id) });
});
