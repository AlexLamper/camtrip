import { z } from 'zod';
import { Group, HiddenPhoto, Photo, Report, FREE_STYLES, type GroupDoc, type PhotoDoc } from '@/lib/models';
import { body, handler, HttpError, json } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { hasPro } from '@/lib/entitlements';
import { groupIsPro } from '@/lib/pro';
import { assertRollSpace } from '@/lib/roll-db';
import { findPersonalRoll, memberRole, serializeGroup } from '@/lib/groups';
import { toObjectIds } from '@/lib/photos';
import { checkMove, MOVE_MAX_PHOTOS } from '@/lib/personal-roll';
import { Types } from 'mongoose';

const Move = z.object({
  photoIds: z.array(z.string()).min(1).max(MOVE_MAX_PHOTOS),
  groupId: z.string(),
});

/** Recounts a group's photos/videos and fixes its cover after photos left or arrived. */
async function recount(groupId: Types.ObjectId, opts: { coverGone?: boolean; coverCandidate?: Types.ObjectId | null }) {
  const group = await Group.findById(groupId, { coverPhotoId: 1 }).lean<GroupDoc>();
  if (!group) return;
  const [photoCount, videoCount] = await Promise.all([
    Photo.countDocuments({ groupId, status: 'ready', kind: { $ne: 'video' } }),
    Photo.countDocuments({ groupId, status: 'ready', kind: 'video' }),
  ]);
  const $set: Record<string, unknown> = { photoCount, videoCount };
  if (opts.coverGone) {
    const next = await Photo.findOne({ groupId, status: 'ready', kind: 'photo' }, { _id: 1 }).sort({ takenAt: -1 }).lean();
    $set.coverPhotoId = next?._id ?? null;
  } else if (!group.coverPhotoId && opts.coverCandidate) {
    $set.coverPhotoId = opts.coverCandidate;
  }
  await Group.updateOne({ _id: groupId }, { $set });
}

/**
 * "Verplaats naar album": moves the user's own photos from their personal
 * roll ("Mijn rolletje") into a shared group they are a member of. Pro camera
 * styles need the user's own Pro or the target group's Pro, the same rule as
 * uploading into that group. Storage keys stay as they are (they are opaque).
 */
export const POST = handler(async (req) => {
  const user = await requireUser(req);
  const input = await body(req, Move);
  const ids = toObjectIds(input.photoIds);

  const roll = await findPersonalRoll(user._id);
  const target = Types.ObjectId.isValid(input.groupId) ? await Group.findById(input.groupId).lean<GroupDoc>() : null;
  const photos = ids.length
    ? await Photo.find({ _id: { $in: ids } }, { userId: 1, groupId: 1, status: 1, style: 1, kind: 1, takenAt: 1 }).lean<PhotoDoc[]>()
    : [];
  const userIsPro = hasPro(user);
  const targetIsPro = target && !userIsPro ? await groupIsPro(target) : false;

  const err = checkMove({
    userId: String(user._id),
    roll,
    target: target ? { _id: target._id, type: target.type, status: target.status, isMember: Boolean(memberRole(target, user._id)) } : null,
    photos,
    requested: ids.length,
    userIsPro,
    targetIsPro,
    freeStyles: FREE_STYLES,
  });
  if (err) throw new HttpError(err.status, err.message, err.code);
  // The free roll counts in the target album too: moving photos in uses shots there.
  await assertRollSpace(user, target!, { adding: ids.length, groupPro: userIsPro || targetIsPro });

  // Conditional on the old group and owner, so a concurrent move or delete cannot be overridden.
  const res = await Photo.updateMany(
    { _id: { $in: ids }, userId: user._id, groupId: roll!._id, status: 'ready' },
    { $set: { groupId: target!._id } },
  );
  await HiddenPhoto.updateMany({ photoId: { $in: ids } }, { $set: { groupId: target!._id } });
  await Report.updateMany({ photoId: { $in: ids } }, { $set: { groupId: target!._id } });

  const newestPhoto = photos
    .filter((p) => p.kind === 'photo')
    .sort((a, b) => new Date(b.takenAt).getTime() - new Date(a.takenAt).getTime())[0];
  await recount(roll!._id, { coverGone: ids.some((id) => String(id) === String(roll!.coverPhotoId)) });
  await recount(target!._id, { coverCandidate: newestPhoto?._id ?? null });

  const fresh = await Group.findById(target!._id).lean<GroupDoc>();
  return json({ moved: res.modifiedCount, group: await serializeGroup(fresh!, user._id) });
});
