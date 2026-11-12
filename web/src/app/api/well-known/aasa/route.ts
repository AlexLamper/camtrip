// Universal links: lets https://camtrip.app/j/CODE open the app directly.
export function GET() {
  const appId = `${process.env.APPLE_TEAM_ID ?? 'TEAMID'}.${process.env.IOS_BUNDLE_ID ?? 'app.camtrip.camtrip'}`;
  return Response.json(
    { applinks: { details: [{ appIDs: [appId], components: [{ '/': '/j/*' }] }] } },
    { headers: { 'Content-Type': 'application/json' } },
  );
}
