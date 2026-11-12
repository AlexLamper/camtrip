import { z } from 'zod';
import { Types } from 'mongoose';
import { Group, Photo, CAMERA_STYLES, FREE_STYLES, type GroupDoc } from '@/lib/models';
import { body, handler, HttpError, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { computeDeleteAfter, deleteGroupEverywhere, requireAdmin, requireMember, serializeGroup } from '@/lib/groups';
import { groupIsPro } from '@/lib/pro';

type P = Params<{ id: string }>;

export const GET = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireMember((await params).id, user._id);
  return json({ group: await serializeGroup(group, user._id) });
});

const Patch = z.object({
  name: z.string().trim().min(1).max(60).optional(),
  startDate: z.coerce.date().nullable().optional(),
  endDate: z.coerce.date().nullable().optional(),
  defaultStyle: z.enum(CAMERA_STYLES).optional(),
  status: z.enum(['active', 'archived']).optional(),
  coverPhotoId: z.string().optional(),
  // "Reis afronden": the trip ends now (endDate = now; a future start moves to now too).
  endNow: z.boolean().optional(),
});

export const PATCH = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireAdmin((await params).id, user._id);
  const input = await body(req, Patch);
  if (input.endNow) {
    if (group.type === 'permanent') throw new HttpError(400, 'Een groep die altijd open is heeft geen einddatum');
    const now = new Date();
    input.endDate = now;
    if (group.startDate && group.startDate > now) input.startDate = now;
  }
  const update: Partial<GroupDoc> & Record<string, unknown> = {};
  const pro = await groupIsPro(group);
  if (input.defaultStyle && !FREE_STYLES.includes(input.defaultStyle) && !pro) {
    throw new HttpError(402, 'Deze camerastijl hoort bij CamTrip Pro', 'pro_required');
  }
  const start = input.startDate !== undefined ? input.startDate : group.startDate;
  const end = input.endDate !== undefined ? input.endDate : group.endDate;
  if (group.type !== 'permanent' && start && end && end < start) throw new HttpError(400, 'Einddatum ligt voor de begindatum');
  if (input.name) update.name = input.name;
  if (input.defaultStyle) update.defaultStyle = input.defaultStyle;
  if (input.status) update.status = input.status;
  if (input.startDate !== undefined && group.type !== 'permanent') update.startDate = input.startDate;
  if (input.coverPhotoId) {
    // Only a ready photo of this very group can be the cover.
    const cover = Types.ObjectId.isValid(input.coverPhotoId)
      ? await Photo.exists({ _id: input.coverPhotoId, groupId: group._id, status: 'ready', kind: 'photo' })
      : null;
    if (!cover) throw new HttpError(404, 'Foto niet gevonden');
    update.coverPhotoId = new Types.ObjectId(input.coverPhotoId);
  }
  if (input.endDate !== undefined && group.type !== 'permanent') {
    update.endDate = input.endDate;
    update.deleteAfter = computeDeleteAfter(group.type, input.endDate, pro);
  }
  const updated = await Group.findByIdAndUpdate(group._id, update, { new: true }).lean<GroupDoc>();
  return json({ group: await serializeGroup(updated!, user._id) });
});

export const DELETE = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireAdmin((await params).id, user._id);
  // Everything goes for everyone, R2 files included. Nobody is notified.
  const deletedPhotos = await deleteGroupEverywhere(group);
  return json({ ok: true, deletedPhotos });
});
