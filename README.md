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

- **Inloggen**: account met e-mail + wachtwoord, Sign in with Apple of Google → de API geeft een eigen JWT (180 dagen).
  - `POST /api/mobile/auth/register` `{name, email, password}` (min. 8 tekens), `POST /auth/login` `{email, password}`, `POST /auth/forgot` `{email}` (altijd 200; mailt een 6-cijferige code, 15 min geldig, via Resend), `POST /auth/reset` `{email, code, password}`. Alle geven `{token, user}` terug, net als `/auth/apple` en `/auth/google`.
  - Wachtwoorden: scrypt met eigen salt per gebruiker (`web/src/lib/password.ts`, tests: `cd web && npm test`). Login/forgot/reset: max. 10 (forgot 5) pogingen per 15 min per e-mail + IP, opgeslagen in Mongo (`AuthAttempt`, TTL). Een resetcode vervalt na 5 foute pogingen.
  - Koppelen: logt iemand in met Apple/Google met een *geverifieerd* e-mailadres waarvoor al een wachtwoord-account bestaat, dan wordt dat account gekoppeld. Was dat adres nog niet bevestigd (geen resetcode gebruikt), dan vervalt het wachtwoord (bescherming tegen vooraf kapen); met "Wachtwoord vergeten?" stel je een nieuw in.
  - Google-knop verschijnt pas als `GOOGLE_IOS_CLIENT_ID` (iOS) / `GOOGLE_SERVER_CLIENT_ID` (Android) gezet is (dart-define of default in `app/lib/core/config.dart`).
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

**Vercel (web/)** - zie `web/.env.example`: `MONGODB_URI`, `JWT_SECRET`, `APPLE_CLIENT_IDS`, `GOOGLE_CLIENT_IDS` (kommalijst: web- + iOS-client id), `RESEND_API_KEY`, `MAIL_FROM` (optioneel), `R2_*`, `REVENUECAT_*`, `APNS_KEY_ID`, `APNS_KEY_P8`, `CRON_SECRET`, `APPLE_TEAM_ID`, `ANDROID_SHA256_FINGERPRINTS`.

**Sign in with Apple token-intrekking (guideline 5.1.1(v))**: `APPLE_SIWA_KEY_ID` + `APPLE_SIWA_KEY_P8` (inhoud van een AuthKey_XXXX.p8 met "Sign in with Apple" aan voor `app.camtrip.camtrip`; ruwe PEM, met `\n` of base64), samen met `APPLE_TEAM_ID` (4K4D59MXKW). Optioneel: `APPLE_CLIENT_ID` (default `app.camtrip.camtrip`) en `APPLE_TOKEN_ENC_KEY` (default afgeleid van `JWT_SECRET`). Bij inloggen wisselt de API de `authorizationCode` in voor een refresh token (versleuteld opgeslagen als `appleRefreshToken`); bij account verwijderen wordt dat token ingetrokken bij Apple. Zonder key wordt dit overgeslagen (waarschuwing in de log), inloggen en verwijderen werken gewoon. `/api/health` toont `siwa: ok|missing`.

**GitHub Actions secret**: alleen `APP_STORE_CONNECT_API_KEY_P8` (inhoud van AuthKey_QS5UXPB9HY.p8, API key "CamTrip CI", Admin). Signing gaat automatisch via die key (`-allowProvisioningUpdates`); Key ID, Issuer ID en de RevenueCat public key hebben defaults.

**GitHub Actions variables**: `GOOGLE_IOS_CLIENT_ID`, `GOOGLE_SERVER_CLIENT_ID` (of vul de defaults in `app/lib/core/config.dart`; CI leest die ook voor `ios/Flutter/Secrets.xcconfig`).

**App ID** `app.camtrip.camtrip` met Sign in with Apple, Push Notifications en Associated Domains (`applinks:camtrip.app`).
