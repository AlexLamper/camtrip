import mongoose, { Schema, type Model, Types } from 'mongoose';

// ---------------------------------------------------------------- User
const pushTokenSchema = new Schema(
  {
    token: { type: String, required: true },
    platform: { type: String, enum: ['ios', 'android'], required: true },
    updatedAt: { type: Date, default: () => new Date() },
  },
  { _id: false },
);

const proGrantSchema = new Schema(
  {
    until: { type: Date, default: null },
    grantedBy: { type: Schema.Types.ObjectId, ref: 'User', default: null },
    reason: { type: String, default: '', maxlength: 200 },
    createdAt: { type: Date, default: () => new Date() },
  },
  { _id: false },
);

const userSchema = new Schema(
  {
    name: { type: String, default: '' },
    // Always stored lowercase. Apple/Google users may share an address with
    // another sign-in, so uniqueness is enforced only for password accounts
    // (see the partial index below).
    email: { type: String, default: '', lowercase: true, trim: true },
    // E-mail + password accounts. Absent for Apple/Google-only users.
    passwordHash: { type: String },
    emailVerified: { type: Boolean, default: false },
    resetCodeHash: { type: String, default: null },
    resetExpires: { type: Date, default: null },
    resetAttempts: { type: Number, default: 0 },
    appleId: { type: String, unique: true, sparse: true },
    googleId: { type: String, unique: true, sparse: true },
    avatarColor: { type: String, default: '#d9472b' },
    pushTokens: { type: [pushTokenSchema], default: [] },
    // Pro comes from the stores via RevenueCat. Expiry is kept so an access
    // check never trusts a flag whose subscription has already lapsed.
    proStore: { type: Boolean, default: false },
    proExpiresAt: { type: Date, default: null },
    settings: {
      notifyNewPhotos: { type: Boolean, default: true },
      notifyRecap: { type: Boolean, default: true },
    },
    // People whose photos this user never wants to see (App Store guideline 1.2).
    blockedUserIds: { type: [Schema.Types.ObjectId], default: [] },
    // App-wide role. 'admin' unlocks the "Beheer" tools and Pro. Set in the DB
    // or bootstrapped from ADMIN_EMAILS (see lib/admin-env.ts).
    role: { type: String, enum: ['user', 'admin'], default: 'user', index: true },
    // Pro given by an admin, so this person does not have to pay. until null = lifetime.
    proGrant: { type: proGrantSchema, default: null },
    // Banned by an admin: sign-in and every API call are refused.
    banned: { type: Boolean, default: false, index: true },
    bannedAt: { type: Date, default: null },
    bannedReason: { type: String, default: '' },
  },
  { timestamps: true },
);
// One password account per address. Partial (not plain sparse) because older
// Apple/Google users have email '' or may share an address.
userSchema.index(
  { email: 1 },
  { unique: true, name: 'email_password_unique', partialFilterExpression: { passwordHash: { $type: 'string' } } },
);

export interface UserDoc {
  _id: Types.ObjectId;
  name: string;
  email: string;
  passwordHash?: string;
  emailVerified?: boolean;
  resetCodeHash?: string | null;
  resetExpires?: Date | null;
  resetAttempts?: number;
  appleId?: string;
  googleId?: string;
  avatarColor: string;
  pushTokens: { token: string; platform: 'ios' | 'android'; updatedAt: Date }[];
  proStore: boolean;
  proExpiresAt: Date | null;
  settings?: { notifyNewPhotos?: boolean; notifyRecap?: boolean };
  blockedUserIds?: Types.ObjectId[];
  role?: 'user' | 'admin';
  proGrant?: ProGrant | null;
  banned?: boolean;
  bannedAt?: Date | null;
  bannedReason?: string;
  createdAt?: Date;
  updatedAt?: Date;
}

export interface ProGrant {
  until: Date | null;
  grantedBy: Types.ObjectId | null;
  reason: string;
  createdAt: Date;
}

// ---------------------------------------------------------------- Group
export const GROUP_TYPES = ['vacation', 'event', 'permanent'] as const;
export const CAMERA_STYLES = ['film', 'instant', 'disposable', 'bw', 'golden', 'chrome'] as const;
export const FREE_STYLES: readonly string[] = ['film', 'instant', 'disposable'];
/** Photos picked from the camera roll carry no camera style. */
export const PHOTO_STYLES = [...CAMERA_STYLES, 'roll'] as const;

const memberSchema = new Schema(
  {
    userId: { type: Schema.Types.ObjectId, ref: 'User', required: true },
    role: { type: String, enum: ['admin', 'member'], default: 'member' },
    joinedAt: { type: Date, default: () => new Date() },
  },
  { _id: false },
);

const groupSchema = new Schema(
  {
    name: { type: String, required: true, maxlength: 60 },
    type: { type: String, enum: GROUP_TYPES, required: true },
    startDate: { type: Date, default: null },
    endDate: { type: Date, default: null },
    defaultStyle: { type: String, enum: CAMERA_STYLES, default: 'instant' },
    code: { type: String, required: true, unique: true, index: true },
    ownerId: { type: Schema.Types.ObjectId, ref: 'User', required: true },
    members: { type: [memberSchema], default: [] },
    status: { type: String, enum: ['active', 'archived'], default: 'active' },
    coverPhotoId: { type: Schema.Types.ObjectId, ref: 'Photo', default: null },
    photoCount: { type: Number, default: 0 },
    videoCount: { type: Number, default: 0 },
    // Free groups are removed 30 days after they end; null = keep.
    deleteAfter: { type: Date, default: null, index: true },
    recapNotifiedAt: { type: Date, default: null },
    // actorId -> last time members were told about this person's new photos.
    // Lets several photos in a row become one bundled push.
    lastNotified: { type: Map, of: Date, default: {} },
    // Members who archived this group for themselves ("Archiveren" in the
    // albums list). Personal: the group stays as it is for everyone else.
    archivedBy: { type: [Schema.Types.ObjectId], default: [] },
  },
  { timestamps: true },
);
groupSchema.index({ 'members.userId': 1 });

export interface GroupMember {
  userId: Types.ObjectId;
  role: 'admin' | 'member';
  joinedAt: Date;
}
export interface GroupDoc {
  _id: Types.ObjectId;
  name: string;
  type: (typeof GROUP_TYPES)[number];
  startDate: Date | null;
  endDate: Date | null;
  defaultStyle: string;
  code: string;
  ownerId: Types.ObjectId;
  members: GroupMember[];
  status: 'active' | 'archived';
  coverPhotoId: Types.ObjectId | null;
  photoCount: number;
  videoCount: number;
  deleteAfter: Date | null;
  recapNotifiedAt: Date | null;
  lastNotified?: Record<string, Date>;
  archivedBy?: Types.ObjectId[];
  createdAt?: Date;
  updatedAt?: Date;
}

// ---------------------------------------------------------------- Photo
const reactionSchema = new Schema(
  {
    userId: { type: Schema.Types.ObjectId, ref: 'User', required: true },
    emoji: { type: String, required: true },
  },
  { _id: false },
);

const photoSchema = new Schema(
  {
    groupId: { type: Schema.Types.ObjectId, ref: 'Group', required: true },
    userId: { type: Schema.Types.ObjectId, ref: 'User', required: true },
    kind: { type: String, enum: ['photo', 'video'], default: 'photo' },
    style: { type: String, default: 'instant' },
    mime: { type: String, default: 'image/jpeg' },
    originalKey: { type: String, required: true },
    displayKey: { type: String, required: true },
    thumbKey: { type: String, required: true },
    width: { type: Number, default: 0 },
    height: { type: Number, default: 0 },
    durationMs: { type: Number, default: 0 },
    takenAt: { type: Date, required: true },
    fromRoll: { type: Boolean, default: false },
    caption: { type: String, default: '', maxlength: 140 },
    reactions: { type: [reactionSchema], default: [] },
    favoritedBy: { type: [Schema.Types.ObjectId], default: [] },
    status: { type: String, enum: ['pending', 'ready'], default: 'pending' },
  },
  { timestamps: true },
);
photoSchema.index({ groupId: 1, status: 1, takenAt: -1 });

export interface PhotoDoc {
  _id: Types.ObjectId;
  groupId: Types.ObjectId;
  userId: Types.ObjectId;
  kind: 'photo' | 'video';
  style: string;
  mime: string;
  originalKey: string;
  displayKey: string;
  thumbKey: string;
  width: number;
  height: number;
  durationMs: number;
  takenAt: Date;
  fromRoll: boolean;
  caption: string;
  reactions: { userId: Types.ObjectId; emoji: string }[];
  favoritedBy: Types.ObjectId[];
  status: 'pending' | 'ready';
  createdAt?: Date;
  updatedAt?: Date;
}

// ---------------------------------------------------------------- Report (App Store guideline 1.2)
export const REPORT_REASONS = ['ongepast', 'spam', 'anders'] as const;

const reportSchema = new Schema(
  {
    photoId: { type: Schema.Types.ObjectId, ref: 'Photo', required: true, index: true },
    groupId: { type: Schema.Types.ObjectId, ref: 'Group', required: true, index: true },
    reporterId: { type: Schema.Types.ObjectId, ref: 'User', required: true, index: true },
    // Owner of the reported photo, kept so moderation still knows who after the photo is removed.
    photoUserId: { type: Schema.Types.ObjectId, ref: 'User', default: null },
    reason: { type: String, enum: REPORT_REASONS, required: true },
    note: { type: String, default: '', maxlength: 500 },
    status: { type: String, enum: ['open', 'handled'], default: 'open', index: true },
    // Set by an app admin in "Beheer" > Meldingen.
    resolution: { type: String, enum: ['dismissed', 'photo_deleted', 'user_banned', null], default: null },
    handledBy: { type: Schema.Types.ObjectId, ref: 'User', default: null },
    handledAt: { type: Date, default: null },
  },
  { timestamps: { createdAt: true, updatedAt: false } },
);
reportSchema.index({ photoId: 1, reporterId: 1 }, { unique: true });

export interface ReportDoc {
  _id: Types.ObjectId;
  photoId: Types.ObjectId;
  groupId: Types.ObjectId;
  reporterId: Types.ObjectId;
  photoUserId: Types.ObjectId | null;
  reason: (typeof REPORT_REASONS)[number];
  note: string;
  status: 'open' | 'handled';
  resolution?: 'dismissed' | 'photo_deleted' | 'user_banned' | null;
  handledBy?: Types.ObjectId | null;
  handledAt?: Date | null;
  createdAt?: Date;
}

// ---------------------------------------------------------------- Hidden photo ("Verbergen voor mij")
// One document per (user, photo). Only hides the photo for that user; it stays
// in the group for everyone else and can be shown again from "Verborgen foto's".
const hiddenPhotoSchema = new Schema(
  {
    userId: { type: Schema.Types.ObjectId, ref: 'User', required: true },
    groupId: { type: Schema.Types.ObjectId, ref: 'Group', required: true, index: true },
    photoId: { type: Schema.Types.ObjectId, ref: 'Photo', required: true, index: true },
  },
  { timestamps: { createdAt: true, updatedAt: false } },
);
hiddenPhotoSchema.index({ userId: 1, groupId: 1, photoId: 1 }, { unique: true });

export interface HiddenPhotoDoc {
  _id: Types.ObjectId;
  userId: Types.ObjectId;
  groupId: Types.ObjectId;
  photoId: Types.ObjectId;
  createdAt?: Date;
}

// ---------------------------------------------------------------- RevenueCat webhook dedupe
const webhookEventSchema = new Schema(
  { eventId: { type: String, unique: true, required: true } },
  { timestamps: true },
);

// ---------------------------------------------------------------- Auth rate limiting
// One document per attempt; Mongo's TTL monitor removes them after the window.
export const AUTH_ATTEMPT_WINDOW_SECONDS = 15 * 60;
const authAttemptSchema = new Schema({
  key: { type: String, required: true, index: true },
  createdAt: { type: Date, default: () => new Date(), expires: AUTH_ATTEMPT_WINDOW_SECONDS },
});

export const User = (mongoose.models.User ?? mongoose.model('User', userSchema)) as unknown as Model<UserDoc>;
export const Group = (mongoose.models.Group ?? mongoose.model('Group', groupSchema)) as unknown as Model<GroupDoc>;
export const Photo = (mongoose.models.Photo ?? mongoose.model('Photo', photoSchema)) as unknown as Model<PhotoDoc>;
export const Report = (mongoose.models.Report ?? mongoose.model('Report', reportSchema)) as unknown as Model<ReportDoc>;
export const HiddenPhoto = (mongoose.models.HiddenPhoto ?? mongoose.model('HiddenPhoto', hiddenPhotoSchema)) as unknown as Model<HiddenPhotoDoc>;
export const WebhookEvent = (mongoose.models.WebhookEvent ?? mongoose.model('WebhookEvent', webhookEventSchema)) as unknown as Model<{ eventId: string }>;
export const AuthAttempt = (mongoose.models.AuthAttempt ?? mongoose.model('AuthAttempt', authAttemptSchema)) as unknown as Model<{ key: string; createdAt: Date }>;
