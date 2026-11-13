import { Types } from 'mongoose';
import { Group, HiddenPhoto, Photo, type GroupDoc, type PhotoDoc } from '@/lib/models';
import { handler, json } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { serializePhoto } from '@/lib/photos';
import { isPersonalRoll } from '@/lib/personal-roll';
import { buildMyPhotosFilter, MY_PHOTOS_SORT, pageOf, parseMyPhotosQuery, withGroupName } from '@/lib/my-photos';

/**
 * "Alle foto's": every photo and video the current user made, across all
 * groups they are still a member of, plus their personal roll ("Mijn rolletje",
 * groupPersonal: true). Newest first (takenAt desc, id desc),
 * cursor paging: ?cursor=<nextCursor>&limit=60. Each item is serialized like
 * a group photo (signed thumbnail/display URLs) plus groupId and groupName.
 */
export const GET = handler(async (req) => {
  const user = await requireUser(req);
  const { cursor, limit } = parseMyPhotosQuery(new URL(req.url).searchParams);

  // Groups they left are not in this list, so their photos there drop out.
  const groups = await Group.find({ 'members.userId': user._id }, { name: 1, type: 1 }).lean<Pick<GroupDoc, '_id' | 'name' | 'type'>[]>();
  if (!groups.length) return json({ photos: [], nextCursor: null });
  const groupIds = groups.map((g) => g._id);
  const groupNames = new Map(groups.map((g) => [String(g._id), g.name]));
  const personal = new Set(groups.filter((g) => isPersonalRoll(g)).map((g) => String(g._id)));

  const hidden = await HiddenPhoto.find({ userId: user._id }, { photoId: 1 }).lean();
  const filter = buildMyPhotosFilter(
    { userId: user._id, groupIds, hiddenIds: hidden.map((h) => h.photoId), cursor },
    (s) => new Types.ObjectId(s),
  );

  const rows = await Photo.find(filter).sort(MY_PHOTOS_SORT).limit(limit + 1).lean<PhotoDoc[]>();
  const { page, nextCursor } = pageOf(rows, limit);
  return json({
    photos: await Promise.all(page.map(async (p) => withGroupName(await serializePhoto(p, user._id), groupNames, personal))),
    nextCursor,
  });
});
