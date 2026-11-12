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

const userSchema = new Schema(
  {
    name: { type: String, default: '' },
    email: { type: String, default: '' },
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
  },
  { timestamps: true },
);

export interface UserDoc {
  _id: Types.ObjectId;
  name: string;
  email: string;
  appleId?: string;
  googleId?: string;
  avatarColor: string;
  pushTokens: { token: string; platform: 'ios' | 'android'; updatedAt: Date }[];
  proStore: boolean;
  proExpiresAt: Date | null;
  settings?: { notifyNewPhotos?: boolean; notifyRecap?: boolean };
  createdAt?: Date;
  updatedAt?: Date;
}

// ---------------------------------------------------------------- Group
export const GROUP_TYPES = ['vacation', 'event', 'permanent'] as const;
export const CAMERA_STYLES = ['film', 'instant', 'disposable', 'bw', 'golden', 'chrome'] as const;
export const FREE_STYLES: readonly string[] = ['film', 'instant', 'disposable'];

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

// ---------------------------------------------------------------- RevenueCat webhook dedupe
const webhookEventSchema = new Schema(
  { eventId: { type: String, unique: true, required: true } },
  { timestamps: true },
);

export const User = (mongoose.models.User ?? mongoose.model('User', userSchema)) as unknown as Model<UserDoc>;
export const Group = (mongoose.models.Group ?? mongoose.model('Group', groupSchema)) as unknown as Model<GroupDoc>;
export const Photo = (mongoose.models.Photo ?? mongoose.model('Photo', photoSchema)) as unknown as Model<PhotoDoc>;
export const WebhookEvent = (mongoose.models.WebhookEvent ?? mongoose.model('WebhookEvent', webhookEventSchema)) as unknown as Model<{ eventId: string }>;
