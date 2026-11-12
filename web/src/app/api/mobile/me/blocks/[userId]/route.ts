import { Types } from 'mongoose';
import { User, type UserDoc } from '@/lib/models';
import { handler, HttpError, json, type Params } from '@/lib/http';
import { publicUser, requireUser } from '@/lib/auth';

/** Unblock. */
export const DELETE = handler<Params<{ userId: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const { userId } = await params;
  if (!Types.ObjectId.isValid(userId)) throw new HttpError(404, 'Persoon niet gevonden');
  const updated = await User.findByIdAndUpdate(
    user._id,
    { $pull: { blockedUserIds: new Types.ObjectId(userId) } },
    { new: true },
  ).lean<UserDoc>();
  return json({ user: publicUser(updated!) });
});
