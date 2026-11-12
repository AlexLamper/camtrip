import { z } from 'zod';
import { Photo } from '@/lib/models';
import { body, handler, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { requireMember } from '@/lib/groups';
import { toObjectIds } from '@/lib/photos';

const Input = z.object({
  photoIds: z.array(z.string()).min(1).max(500),
  favorite: z.boolean(),
});

/** Marks (or unmarks) several photos as the current user's favorites. */
export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  const { photoIds, favorite } = await body(req, Input);
  const ids = toObjectIds(photoIds);
  await Photo.updateMany(
    { _id: { $in: ids }, groupId: group._id },
    favorite ? { $addToSet: { favoritedBy: user._id } } : { $pull: { favoritedBy: user._id } },
  );
  return json({ ids: ids.map(String), favorite });
});
