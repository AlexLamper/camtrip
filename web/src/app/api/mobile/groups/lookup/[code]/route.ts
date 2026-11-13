import { connectDB } from '@/lib/db';
import { Group, User, type GroupDoc } from '@/lib/models';
import { handler, HttpError, json, type Params } from '@/lib/http';
import { normalizeCode } from '@/lib/groups';
import { joinable } from '@/lib/personal-roll';

/** Public preview for an invite: enough to say "Daan invites you to Mallorca '27", nothing more. */
export const GET = handler<Params<{ code: string }>>(async (_req, { params }) => {
  await connectDB();
  const group = await Group.findOne({ code: normalizeCode((await params).code) }).lean<GroupDoc>();
  if (!group || !joinable(group)) throw new HttpError(404, 'Geen groep gevonden met deze code');
  const owner = await User.findById(group.ownerId, { name: 1 }).lean();
  return json({
    name: group.name,
    code: group.code,
    memberCount: group.members.length,
    ownerName: owner?.name ?? 'Iemand',
    status: group.status,
  });
});
