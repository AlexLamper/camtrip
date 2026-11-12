// Android App Links: lets https://camtrip.app/j/CODE open the app directly.
export function GET() {
  const fingerprints = (process.env.ANDROID_SHA256_FINGERPRINTS ?? '').split(',').map((s) => s.trim()).filter(Boolean);
  return Response.json([
    {
      relation: ['delegate_permission/common.handle_all_urls'],
      target: {
        namespace: 'android_app',
        package_name: process.env.ANDROID_PACKAGE ?? 'app.camtrip.camtrip',
        sha256_cert_fingerprints: fingerprints,
      },
    },
  ]);
}
