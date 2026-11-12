import { z } from 'zod';
import { Types } from 'mongoose';
import { User, type UserDoc } from '@/lib/models';
import { body, handler, HttpError, json } from '@/lib/http';
import { publicUser, requireUser } from '@/lib/auth';

/** People the current user blocked, with enough to show them in settings. */
export const GET = handler(async (req) => {
  const user = await requireUser(req);
  const ids = user.blockedUserIds ?? [];
  const users = ids.length ? await User.find({ _id: { $in: ids } }, { name: 1, avatarColor: 1 }).lean<UserDoc[]>() : [];
  return json({
    users: users.map((u) => ({ id: String(u._id), name: u.name || 'Vriend', avatarColor: u.avatarColor ?? '#d9472b' })),
  });
});

/** "Lid blokkeren": hides all photos of that person for the current user. */
export const POST = handler(async (req) => {
  const user = await requireUser(req);
  const { userId } = await body(req, z.object({ userId: z.string() }));
  if (!Types.ObjectId.isValid(userId)) throw new HttpError(404, 'Persoon niet gevonden');
  if (userId === String(user._id)) throw new HttpError(400, 'Je kunt jezelf niet blokkeren');
  if (!(await User.exists({ _id: userId }))) throw new HttpError(404, 'Persoon niet gevonden');
  const updated = await User.findByIdAndUpdate(
    user._id,
    { $addToSet: { blockedUserIds: new Types.ObjectId(userId) } },
    { new: true },
  ).lean<UserDoc>();
  return json({ user: publicUser(updated!) });
});
