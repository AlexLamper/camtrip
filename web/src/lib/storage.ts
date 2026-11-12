import {
  DeleteObjectsCommand,
  GetObjectCommand,
  PutObjectCommand,
  S3Client,
} from '@aws-sdk/client-s3';
import { getSignedUrl } from '@aws-sdk/s3-request-presigner';

// Cloudflare R2 speaks the S3 API. No egress fees, which matters for a product
// whose main feature is "download all 400 photos".
let client: S3Client | null = null;

function r2(): S3Client {
  if (client) return client;
  const accountId = process.env.R2_ACCOUNT_ID;
  if (!accountId) throw new Error('R2_ACCOUNT_ID is not set');
  client = new S3Client({
    region: 'auto',
    endpoint: `https://${accountId}.r2.cloudflarestorage.com`,
    credentials: {
      accessKeyId: process.env.R2_ACCESS_KEY_ID ?? '',
      secretAccessKey: process.env.R2_SECRET_ACCESS_KEY ?? '',
    },
  });
  return client;
}

const bucket = () => process.env.R2_BUCKET ?? 'camtrip-media';

const UPLOAD_TTL = 60 * 30; // 30 min: long enough for a slow upload on holiday wifi
const READ_TTL = 60 * 60 * 6; // 6 h: the gallery caches thumbnails by photo id, not URL

export function uploadUrl(key: string, contentType: string): Promise<string> {
  return getSignedUrl(r2(), new PutObjectCommand({ Bucket: bucket(), Key: key, ContentType: contentType }), {
    expiresIn: UPLOAD_TTL,
  });
}

export function readUrl(key: string, downloadName?: string): Promise<string> {
  return getSignedUrl(
    r2(),
    new GetObjectCommand({
      Bucket: bucket(),
      Key: key,
      ResponseContentDisposition: downloadName ? `attachment; filename="${downloadName}"` : undefined,
    }),
    { expiresIn: READ_TTL },
  );
}

export async function deleteKeys(keys: string[]): Promise<void> {
  for (let i = 0; i < keys.length; i += 1000) {
    const chunk = keys.slice(i, i + 1000);
    if (!chunk.length) continue;
    await r2().send(
      new DeleteObjectsCommand({ Bucket: bucket(), Delete: { Objects: chunk.map((Key) => ({ Key })), Quiet: true } }),
    );
  }
}

export function mediaKeys(groupId: string, photoId: string, ext: string) {
  const base = `groups/${groupId}/${photoId}`;
  return {
    originalKey: `${base}/original.${ext}`,
    displayKey: `${base}/display.jpg`,
    thumbKey: `${base}/thumb.jpg`,
  };
}
