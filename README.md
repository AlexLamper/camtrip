# CamTrip

Eén rolletje voor de hele groep. Schiet met een retro-camera, iedereen in je groep ziet je foto's direct, en ze staan meteen in je eigen album.

Een app van AL Design.

## Repo

| Map | Wat |
|-----|-----|
| `app/` | Flutter-app (iOS + Android): Riverpod, go_router, dio, RevenueCat - zelfde opzet als BijbelQuiz |
| `web/` | Next.js op Vercel: promotiesite **camtrip.app** + de API voor de app (`/api/mobile/*`) |
| `.github/workflows/ios-release.yml` | Elke push naar `main` die `app/` raakt bouwt een nieuwe **TestFlight**-build |
| `.github/workflows/ci.yml` | `flutter analyze` + `flutter test` + `next build` op elke push |

## Hoe het werkt

- **Inloggen**: Sign in with Apple / Google → de API geeft een eigen JWT (180 dagen).
- **Groepen**: vakantie (met datum), event of altijd open. Joinen met een code van 6 tekens, QR-code of de link `camtrip.app/j/CODE` (opent de app direct via universal links / app links).
- **Camera**: 6 stijlen (Film, Instant, Wegwerp gratis; Z/W, Golden, Chrome Pro). Live in de zoeker via een kleurmatrix + korrel/vignet/lichtlek; dezelfde berekening wordt op de foto zelf toegepast (`processor.dart`), plus datumstempel en instant-rand. Video's krijgen de stijl via ffmpeg.
- **Delen**: de foto gaat eerst naar een wachtrij op het toestel en in je eigen album "CamTrip - groepsnaam", daarna naar Cloudflare R2 via presigned URLs (origineel, display 2048 px, thumbnail). Werkt zonder bereik; video's optioneel alleen via wifi.
- **Galerij**: tijdlijn per dag, reacties, favorieten, filter per persoon, "Alles opslaan".
- **Recap**: video 9:16 met 4 templates en 3 eigen (rechtenvrije) muziekstukken in `app/assets/music`.
- **Pro** (RevenueCat, entitlement `pro`): €7,99/maand of €49,99/jaar, 7 dagen proef. Alle stijlen, onbeperkt leden, altijd bewaard, geen watermerk, originele kwaliteit.
- **Gratis groepen** worden 30 dagen na de einddatum verwijderd (Vercel Cron, dagelijks).
- **Push** (rechtstreeks via Apple APNs, geen Firebase): gebundeld - één melding per persoon per groep per 20 minuten - en "recap klaar".

## Lokaal draaien

```bash
# API + site
cd web && cp .env.example .env.local   # vul in
npm install && npm run dev

# app tegen de lokale API
cd app && flutter run --dart-define=API_BASE_URL=http://localhost:3000/api/mobile
```

## Configuratie

**Vercel (web/)** - zie `web/.env.example`: `MONGODB_URI`, `JWT_SECRET`, `APPLE_CLIENT_IDS`, `GOOGLE_CLIENT_IDS`, `R2_*`, `REVENUECAT_*`, `APNS_KEY_ID`, `APNS_KEY_P8`, `CRON_SECRET`, `APPLE_TEAM_ID`, `ANDROID_SHA256_FINGERPRINTS`.

**GitHub Actions secrets** (zelfde als BijbelQuiz): `BUILD_CERTIFICATE_BASE64`, `P12_PASSWORD`, `BUILD_PROVISION_PROFILE_BASE64`, `KEYCHAIN_PASSWORD`, `APPLE_TEAM_ID`, `APP_STORE_CONNECT_KEY_ID`, `APP_STORE_CONNECT_ISSUER_ID`, `APP_STORE_CONNECT_API_KEY_P8`, `REVENUECAT_APPLE_KEY`.

**GitHub Actions variables**: `GOOGLE_IOS_CLIENT_ID`, `GOOGLE_SERVER_CLIENT_ID`.

**App ID** `app.camtrip.camtrip` met Sign in with Apple, Push Notifications en Associated Domains (`applinks:camtrip.app`).
