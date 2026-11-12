import type { NextConfig } from 'next';

const nextConfig: NextConfig = {
  // firebase-admin and the AWS SDK are server-only and large; keep them out of
  // the bundler so cold starts stay small.
  serverExternalPackages: ['firebase-admin', 'mongoose'],
  async rewrites() {
    return [
      { source: '/.well-known/apple-app-site-association', destination: '/api/well-known/aasa' },
      { source: '/.well-known/assetlinks.json', destination: '/api/well-known/assetlinks' },
    ];
  },
};

export default nextConfig;
