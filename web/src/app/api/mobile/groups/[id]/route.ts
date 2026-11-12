import { z } from 'zod';
import { Types } from 'mongoose';
import { Group, Photo, CAMERA_STYLES, type GroupDoc } from '@/lib/models';
import { body, handler, json, type Params } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { computeDeleteAfter, ownerIsPro, requireAdmin, requireMember, serializeGroup } from '@/lib/groups';
import { deleteKeys } from '@/lib/storage';

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
});

export const PATCH = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireAdmin((await params).id, user._id);
  const input = await body(req, Patch);
  const update: Partial<GroupDoc> & Record<string, unknown> = {};
  if (input.name) update.name = input.name;
  if (input.defaultStyle) update.defaultStyle = input.defaultStyle;
  if (input.status) update.status = input.status;
  if (input.startDate !== undefined) update.startDate = input.startDate;
  if (input.coverPhotoId && Types.ObjectId.isValid(input.coverPhotoId)) update.coverPhotoId = new Types.ObjectId(input.coverPhotoId);
  if (input.endDate !== undefined && group.type !== 'permanent') {
    update.endDate = input.endDate;
    update.deleteAfter = computeDeleteAfter(group.type, input.endDate, await ownerIsPro(group));
  }
  const updated = await Group.findByIdAndUpdate(group._id, update, { new: true }).lean<GroupDoc>();
  return json({ group: await serializeGroup(updated!, user._id) });
});

export const DELETE = handler<P>(async (req, { params }) => {
  const user = await requireUser(req);
  const group = await requireAdmin((await params).id, user._id);
  const photos = await Photo.find({ groupId: group._id }, { originalKey: 1, displayKey: 1, thumbKey: 1 }).lean();
  await deleteKeys(photos.flatMap((p) => [p.originalKey, p.displayKey, p.thumbKey]));
  await Photo.deleteMany({ groupId: group._id });
  await Group.deleteOne({ _id: group._id });
  return json({ ok: true });
});
