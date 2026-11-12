import type { NextConfig } from 'next';

const nextConfig: NextConfig = {
  serverExternalPackages: ['mongoose'],
  async rewrites() {
    return [
      { source: '/.well-known/apple-app-site-association', destination: '/api/well-known/aasa' },
      { source: '/.well-known/assetlinks.json', destination: '/api/well-known/assetlinks' },
    ];
  },
};

export default nextConfig;
