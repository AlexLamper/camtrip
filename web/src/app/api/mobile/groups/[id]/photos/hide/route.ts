import { z } from 'zod';
import { Group, HiddenPhoto, Photo, type GroupDoc } from '@/lib/models';
import { body, handler, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { requireMember, serializeGroup } from '@/lib/groups';
import { toObjectIds } from '@/lib/photos';

const Input = z.object({
  photoIds: z.array(z.string()).min(1).max(500),
  hidden: z.boolean().default(true),
});

/**
 * "Verbergen voor mij": hides photos for the current user only (or shows them
 * again with hidden=false). Everyone else in the group still sees them.
 */
export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  const { photoIds, hidden } = await body(req, Input);
  const ids = toObjectIds(photoIds);

  let changed: string[];
  if (hidden) {
    const photos = await Photo.find({ _id: { $in: ids }, groupId: group._id }, { _id: 1 }).lean();
    changed = photos.map((p) => String(p._id));
    if (photos.length) {
      await HiddenPhoto.bulkWrite(
        photos.map((p) => ({
          updateOne: {
            filter: { userId: user._id, groupId: group._id, photoId: p._id },
            update: { $setOnInsert: { userId: user._id, groupId: group._id, photoId: p._id } },
            upsert: true,
          },
        })),
      );
    }
  } else {
    changed = ids.map(String);
    await HiddenPhoto.deleteMany({ userId: user._id, groupId: group._id, photoId: { $in: ids } });
  }

  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({ ids: changed, hidden, group: await serializeGroup(fresh!, user._id) });
});
