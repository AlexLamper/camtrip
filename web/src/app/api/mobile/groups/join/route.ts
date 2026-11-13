import { z } from 'zod';
import { Group, type GroupDoc } from '@/lib/models';
import { body, handler, HttpError, json } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { FREE_MEMBER_LIMIT, memberRole, normalizeCode, serializeGroup } from '@/lib/groups';
import { hasPro } from '@/lib/entitlements';
import { groupIsPro, refreshGroupRetention } from '@/lib/pro';
import { joinable } from '@/lib/personal-roll';

export const POST = handler(async (req) => {
  const user = await requireUser(req);
  const { code } = await body(req, z.object({ code: z.string().min(4) }));
  const group = await Group.findOne({ code: normalizeCode(code) }).lean<GroupDoc>();
  // A personal roll is never joinable (its code cannot even be typed; this is the second lock).
  if (!group || !joinable(group)) throw new HttpError(404, 'Geen groep gevonden met deze code', 'not_found');

  if (!memberRole(group, user._id)) {
    if (group.status === 'archived') throw new HttpError(410, 'Deze groep is afgesloten', 'archived');
    // One Pro member lifts the limit for everyone, and so does a Pro newcomer.
    const pro = hasPro(user) || (await groupIsPro(group));
    const full = () =>
      new HttpError(
        403,
        `Deze groep zit vol (max. ${FREE_MEMBER_LIMIT} leden). Heeft één lid CamTrip Pro, dan kunnen er onbeperkt mensen bij.`,
        'group_full',
      );
    if (!pro && group.members.length >= FREE_MEMBER_LIMIT) throw full();
    // Conditional push: the size check is part of the update, so two people
    // joining at the same moment cannot take a free group past the limit.
    const res = await Group.updateOne(
      {
        _id: group._id,
        'members.userId': { $ne: user._id },
        ...(pro ? {} : { [`members.${FREE_MEMBER_LIMIT - 1}`]: { $exists: false } }),
      },
      { $push: { members: { userId: user._id, role: 'member', joinedAt: new Date() } } },
    );
    if (res.modifiedCount === 0) {
      const again = await Group.findById(group._id, { members: 1 }).lean<GroupDoc>();
      if (!again || !memberRole(again, user._id)) throw full();
    }
    // A Pro newcomer makes the whole group Pro (no 30-day deletion any more).
    await refreshGroupRetention(group._id);
  }
  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({ group: await serializeGroup(fresh!, user._id) });
});
