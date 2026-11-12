import { z } from 'zod';
import { Group, Photo, type GroupDoc, type PhotoDoc } from '@/lib/models';
import { body, handler, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { requireMember, serializeGroup } from '@/lib/groups';
import { canDeletePhoto, deletePhotos, toObjectIds } from '@/lib/photos';

const Input = z.object({ photoIds: z.array(z.string()).min(1).max(500) });

type Skip = { id: string; reason: 'not_found' | 'forbidden' };

/**
 * Deletes several photos of one group at once (gallery selection mode).
 * Same rule as DELETE /photos/:id for every photo: your own, or any when you
 * are an admin. Photos you may not delete, or that are already gone, are
 * skipped and listed, so one forbidden photo does not block the rest.
 */
export const POST = handler<Params<{ id: string }>>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  const { photoIds } = await body(req, Input);
  const ids = toObjectIds(photoIds);

  const found = await Photo.find(
    { _id: { $in: ids }, groupId: group._id },
    { userId: 1, kind: 1, status: 1, originalKey: 1, displayKey: 1, thumbKey: 1 },
  ).lean<PhotoDoc[]>();
  const byId = new Map(found.map((p) => [String(p._id), p]));

  const skipped: Skip[] = [];
  const allowed: PhotoDoc[] = [];
  for (const raw of new Set(photoIds)) {
    const p = byId.get(raw);
    if (!p) skipped.push({ id: raw, reason: 'not_found' });
    else if (!canDeletePhoto(p, group, user._id)) skipped.push({ id: raw, reason: 'forbidden' });
    else allowed.push(p);
  }

  await deletePhotos(group, allowed);
  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({
    deleted: allowed.map((p) => String(p._id)),
    skipped,
    group: fresh ? await serializeGroup(fresh, user._id) : null,
  });
});
