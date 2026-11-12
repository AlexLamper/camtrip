import { HeadBucketCommand, S3Client } from '@aws-sdk/client-s3';
import mongoose from 'mongoose';
import { connectDB } from '@/lib/db';

export const dynamic = 'force-dynamic';

// Health check for uptime monitoring and deploy verification. Reports only
// whether each dependency answers, never any configuration values.
export async function GET() {
  const result: Record<string, 'ok' | 'error' | 'missing'> = {};

  try {
    await connectDB();
    await mongoose.connection.db?.admin().ping();
    result.database = 'ok';
  } catch {
    result.database = process.env.MONGODB_URI ? 'error' : 'missing';
  }

  try {
    const accountId = process.env.R2_ACCOUNT_ID;
    if (!accountId || !process.env.R2_ACCESS_KEY_ID || !process.env.R2_SECRET_ACCESS_KEY) {
      result.storage = 'missing';
    } else {
      const s3 = new S3Client({
        region: 'auto',
        endpoint: `https://${accountId}.r2.cloudflarestorage.com`,
        credentials: {
          accessKeyId: process.env.R2_ACCESS_KEY_ID,
          secretAccessKey: process.env.R2_SECRET_ACCESS_KEY,
        },
      });
      await s3.send(new HeadBucketCommand({ Bucket: process.env.R2_BUCKET ?? 'camtrip-media' }));
      result.storage = 'ok';
    }
  } catch {
    result.storage = 'error';
  }

  result.push = process.env.APNS_KEY_P8 && process.env.APNS_KEY_ID ? 'ok' : 'missing';
  result.revenuecat = process.env.REVENUECAT_REST_API_KEY ? 'ok' : 'missing';

  const healthy = Object.values(result).every((v) => v === 'ok');
  return Response.json({ healthy, ...result }, { status: healthy ? 200 : 503 });
}
