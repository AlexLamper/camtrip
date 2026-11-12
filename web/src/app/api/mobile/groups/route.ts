import { z } from 'zod';
import { Group, CAMERA_STYLES, FREE_STYLES, GROUP_TYPES, type GroupDoc } from '@/lib/models';
import { body, handler, HttpError, json } from '@/lib/http';
import { requireUser } from '@/lib/auth';
import { hasPro } from '@/lib/entitlements';
import { computeDeleteAfter, serializeGroup, uniqueCode } from '@/lib/groups';

export const GET = handler(async (req) => {
  const user = await requireUser(req);
  const groups = await Group.find({ 'members.userId': user._id }).sort({ status: 1, updatedAt: -1 }).lean<GroupDoc[]>();
  return json({ groups: await Promise.all(groups.map((g) => serializeGroup(g, user._id))) });
});

const Create = z
  .object({
    name: z.string().trim().min(1).max(60),
    type: z.enum(GROUP_TYPES),
    startDate: z.coerce.date().nullable().optional(),
    endDate: z.coerce.date().nullable().optional(),
    defaultStyle: z.enum(CAMERA_STYLES).default('instant'),
  })
  .refine((v) => !v.startDate || !v.endDate || v.endDate >= v.startDate, {
    message: 'Einddatum ligt voor de begindatum',
  });

export const POST = handler(async (req) => {
  const user = await requireUser(req);
  const input = await body(req, Create);
  if (!FREE_STYLES.includes(input.defaultStyle) && !hasPro(user)) {
    throw new HttpError(402, 'Deze camerastijl hoort bij CamTrip Pro', 'pro_required');
  }
  const endDate = input.type === 'permanent' ? null : (input.endDate ?? input.startDate ?? null);
  const group = await Group.create({
    name: input.name,
    type: input.type,
    startDate: input.type === 'permanent' ? null : (input.startDate ?? null),
    endDate,
    defaultStyle: input.defaultStyle,
    code: await uniqueCode(),
    ownerId: user._id,
    members: [{ userId: user._id, role: 'admin' }],
    deleteAfter: computeDeleteAfter(input.type, endDate, hasPro(user)),
  });
  return json({ group: await serializeGroup(group.toObject(), user._id) }, 201);
});
