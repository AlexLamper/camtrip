import { z } from 'zod';
import { Group, Photo, User, type GroupDoc, type PhotoDoc, type UserDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { requireAdmin, requireMember, serializeGroup } from '@/lib/groups';
import { hiddenForViewer } from '@/lib/photos';
import { isPersonalRoll } from '@/lib/personal-roll';
import { readUrl } from '@/lib/storage';
import { computeTripStats, mapAccess, parseTzOffset, tripMapView } from '@/lib/trip-map';

// Reiskaart + statistieken. See lib/trip-map.ts for the privacy rules.

type P = Params<{ id: string }>;

/** Most points sent at once; a trip with more still gets full stats. */
const MAX_POINTS = 3000;

/**
 * Stats for every member, always. Points (thumbnail + coarse location) only
 * while the trip map is on. ?tz=<minutes east of UTC> makes "days" local.
 * Photos the viewer blocked, reported or hid are left out, like the gallery.
 */
export const GET = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  const access = mapAccess(group, user._id);
  if (!access.ok) throw new HttpError(404, 'Groep niet gevonden');
  const tz = parseTzOffset(new URL(req.url).searchParams.get('tz'));

  const hidden = await hiddenForViewer(user, group._id);
  const and: Record<string, unknown>[] = [{ groupId: group._id, status: 'ready' }];
  if (hidden.userId) and.push({ userId: hidden.userId });
  if (hidden._id) and.push({ _id: hidden._id });
  const rows = await Photo.find(
    { $and: and },
    { takenAt: 1, userId: 1, kind: 1, thumbKey: 1, ...(access.showPoints ? { location: 1 } : {}) },
  )
    .sort({ takenAt: 1, _id: 1 })
    .lean<PhotoDoc[]>();

  const stats = computeTripStats(rows, { members: group.members.length, tzOffset: tz, mapEnabled: access.showPoints });
  let topPhotographer: { userId: string; name: string; count: number } | null = null;
  if (stats.topPhotographer) {
    const u = await User.findById(stats.topPhotographer.userId, { name: 1 }).lean<UserDoc>();
    topPhotographer = { ...stats.topPhotographer, name: u?.name || 'Vriend' };
  }

  const located = access.showPoints ? rows.filter((p) => p.location).slice(-MAX_POINTS) : [];
  const points = await Promise.all(
    located.map(async (p) => ({
      photoId: String(p._id),
      userId: String(p.userId),
      kind: p.kind,
      takenAt: p.takenAt,
      lat: p.location!.lat,
      lng: p.location!.lng,
      countryCode: p.location!.countryCode ?? null,
      thumbUrl: await readUrl(p.thumbKey),
    })),
  );

  return json({
    tripMap: tripMapView(group, user._id),
    stats: { ...stats, topPhotographer },
    points,
  });
});

/**
 * The viewer's own consent: "Deel waar je foto's gemaakt zijn op de reiskaart
 * van deze groep?". Saying no removes every location of their photos in this group.
 */
export const PUT = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  if (isPersonalRoll(group)) throw new HttpError(400, 'Dit kan niet met je eigen rolletje', 'personal_roll');
  const { consent } = await body(req, z.object({ consent: z.boolean() }));
  await Group.updateOne(
    { _id: group._id, 'members.userId': user._id },
    { $set: { 'members.$.mapConsent': consent } },
  );
  let removed = 0;
  if (!consent) removed = (await Photo.updateMany({ groupId: group._id, userId: user._id }, { $unset: { location: 1 } })).modifiedCount;
  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({ tripMap: tripMapView(fresh!, user._id), removedLocations: removed, group: await serializeGroup(fresh!, user._id) });
});

/**
 * Admins switch the trip map on or off for the group (default off). Off
 * removes every location in the group and resets everyone's answer, so
 * switching it on again asks each member again.
 */
export const PATCH = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireAdmin((await params).id, user._id);
  if (isPersonalRoll(group)) throw new HttpError(400, 'Dit kan niet met je eigen rolletje', 'personal_roll');
  const { enabled } = await body(req, z.object({ enabled: z.boolean() }));
  if (enabled) {
    await Group.updateOne({ _id: group._id }, { $set: { 'tripMap.enabled': true } });
  } else {
    await Group.updateOne({ _id: group._id }, { $set: { 'tripMap.enabled': false, 'members.$[].mapConsent': null } });
    await Photo.updateMany({ groupId: group._id, location: { $exists: true } }, { $unset: { location: 1 } });
  }
  const fresh = await Group.findById(group._id).lean<GroupDoc>();
  return json({ tripMap: tripMapView(fresh!, user._id), group: await serializeGroup(fresh!, user._id) });
});
