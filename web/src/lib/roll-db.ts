// Database side of the free roll (rules in ./roll).
import { Types } from 'mongoose';
import { Photo, type GroupDoc, type UserDoc } from './models';
import { hasPro } from './entitlements';
import { groupIsPro } from './pro';
import { HttpError } from './http';
import { checkRoll, rollCountFilter, rollExempt, rollForViewer, type RollUsage } from './roll';

type GroupForRoll = Pick<GroupDoc, '_id' | 'type' | 'members' | 'ownerId'> & Partial<Pick<GroupDoc, 'tripPass'>>;

/** How many shots [userId] has on their roll in [group] (see rollCountFilter). */
export async function rollUsed(group: Pick<GroupDoc, '_id' | 'type'>, userId: Types.ObjectId, now: Date = new Date()): Promise<number> {
  return Photo.countDocuments(rollCountFilter(group, userId, now));
}

/** True when this person has no roll limit in this group (own Pro, Pro member or Trip Pass). */
export async function rollExemptFor(user: UserDoc, group: GroupForRoll, groupPro?: boolean): Promise<boolean> {
  const userIsPro = hasPro(user);
  if (userIsPro) return true;
  return rollExempt({ userIsPro, groupIsPro: groupPro ?? (await groupIsPro(group)) });
}

/**
 * Throws the 402 {code:'roll_full', limit, used} when [adding] more shots do
 * not fit on [user]'s roll in [group]. [groupPro] can be passed when known.
 * Returns the roll after adding them (null = no limit).
 */
export async function assertRollSpace(
  user: UserDoc,
  group: GroupForRoll,
  opts: { adding?: number; groupPro?: boolean } = {},
): Promise<RollUsage | null> {
  if (await rollExemptFor(user, group, opts.groupPro)) return null;
  const used = await rollUsed(group, user._id);
  const adding = opts.adding ?? 1;
  const err = checkRoll({ used, adding, exempt: false });
  if (err) throw new HttpError(err.status, err.message, err.code, { limit: err.limit, used: err.used });
  // The roll as it is once these shots are on it.
  return rollForViewer({ used: used + adding, exempt: false });
}

/** The viewer's roll in a group for the app ("18/24"), or null without a limit. */
export async function rollForGroup(user: Pick<UserDoc, '_id'>, group: Pick<GroupDoc, '_id' | 'type'>, exempt: boolean): Promise<RollUsage | null> {
  if (exempt) return null;
  return rollForViewer({ used: await rollUsed(group, user._id), exempt });
}
