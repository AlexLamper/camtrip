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
  - `POST /api/mobile/auth/register` `{name, email, password}` (min. 8 tekens), `POST /auth/login` `{email, password}`, `POST /auth/forgot` `{email}` (altijd 200 `{ok: true}`, ook als het account niet bestaat; is het account nog ergens ingelogd, dan gaat er een 6-cijferige code, 15 min geldig, als **pushmelding** naar die toestellen - CamTrip verstuurt geen e-mail), `POST /auth/reset` `{email, code, password}`. Alle geven `{token, user}` terug, net als `/auth/apple` en `/auth/google`.
  - Wachtwoorden: scrypt met eigen salt per gebruiker (`web/src/lib/password.ts`, tests: `cd web && npm test`). Login/forgot/reset: max. 10 (forgot 5) pogingen per 15 min per e-mail + IP, opgeslagen in Mongo (`AuthAttempt`, TTL). Een resetcode vervalt na 5 foute pogingen.
  - Koppelen: logt iemand in met Apple/Google met een *geverifieerd* e-mailadres waarvoor al een wachtwoord-account bestaat, dan wordt dat account gekoppeld. Was dat adres nog niet bevestigd, dan vervalt het wachtwoord (bescherming tegen vooraf kapen). Dit is ook de uitweg als iemand zijn wachtwoord kwijt is en nergens meer ingelogd is: log in met Apple of Google met hetzelfde e-mailadres. Een resetcode via push bevestigt het e-mailadres niet (alleen Apple/Google doen dat; dat telt voor koppelen en `ADMIN_EMAILS`).
  - Google-knop verschijnt pas als `GOOGLE_IOS_CLIENT_ID` (iOS) / `GOOGLE_SERVER_CLIENT_ID` (Android) gezet is (dart-define of default in `app/lib/core/config.dart`).
- **Groepen**: vakantie (met datum), event of altijd open. Joinen met een code van 6 tekens, QR-code of de link `camtrip.app/j/CODE` (opent de app direct via universal links / app links).
- **Camera**: 6 stijlen (Film, Instant, Wegwerp gratis; Z/W, Golden, Chrome Pro). Live in de zoeker via een kleurmatrix + korrel/vignet/lichtlek; dezelfde berekening wordt op de foto zelf toegepast (`processor.dart`), plus datumstempel en instant-rand. Video's krijgen de stijl via ffmpeg.
- **Delen**: de foto gaat eerst naar een wachtrij op het toestel en in je eigen album "CamTrip - groepsnaam", daarna naar Cloudflare R2 via presigned URLs (origineel, display 2048 px, thumbnail). Werkt zonder bereik; video's optioneel alleen via wifi.
- **Galerij**: tijdlijn per dag, reacties, favorieten, filter per persoon, "Alles opslaan".
- **Reiskaart + statistieken** (`app/lib/features/tripmap`, `GET/PUT/PATCH /api/mobile/groups/:id/map`, `web/src/lib/trip-map.ts`): statistieken voor elke groep; de kaart alleen als een beheerder hem aanzet (standaard uit) én het lid ja zegt bij de eerste foto. Dan stuurt de app bij upload-init `{lat, lng}` mee, afgerond op ~100 m, los van het bestand (dat blijft zonder EXIF/GPS). Land via offline Natural Earth 110m (`web/src/data/countries-110m.json`, public domain). Nee zeggen, verlaten, verwijderd worden of de kaart uitzetten wist de locaties. Kaarttegels: CARTO Basemaps `light_all` (OSM-data), gratis API-key nodig: dart-define / Actions-variable `CARTO_BASEMAPS_KEY`; commercieel gratis tot 1 mln tile-requests per maand, attributie "© OpenStreetMap · © CARTO" blijft zichtbaar.
- **Recap**: video 9:16 met 4 templates en 3 eigen (rechtenvrije) muziekstukken in `app/assets/music`.
- **Pro** (RevenueCat, entitlement `pro`): €7,99/maand of €49,99/jaar, 7 dagen proef. Alle stijlen, onbeperkt leden, altijd bewaard, geen watermerk, originele kwaliteit.
- **Gratis groepen** worden 30 dagen na de einddatum verwijderd (Vercel Cron, dagelijks).
- **Push** (rechtstreeks via Apple APNs, geen Firebase): gebundeld - één melding per persoon per groep per 20 minuten - en "recap klaar". Ook: resetcodes voor "Wachtwoord vergeten?" en "Nieuwe melding" voor beheerders (role `admin` of geverifieerd adres in `ADMIN_EMAILS`) als een foto gerapporteerd wordt; tikken opent Instellingen > Beheer > Meldingen. Alle pushteksten staan in 18 talen in `web/src/lib/push-i18n.ts` (zelfde termen als `app/lib/l10n/GLOSSARY.md`, fallback Engels); de app stuurt zijn taal mee met `POST /me/push-token` `{token, platform, locale}`.
- **Privacy bij uploads**: foto's worden opnieuw gecodeerd zonder EXIF/GPS (oriëntatie zit in de pixels), video's gaan altijd door ffmpeg met `-map_metadata -1 -map_chapters -1` (ook uit de filmrol: remux met `-c copy`), dus er gaat geen locatie mee naar de server.

## Lokaal draaien

```bash
# API + site
cd web && cp .env.example .env.local   # vul in
npm install && npm run dev

# app tegen de lokale API
cd app && flutter run --dart-define=API_BASE_URL=http://localhost:3000/api/mobile
```

## Configuratie

**Vercel (web/)** - zie `web/.env.example`: `MONGODB_URI`, `JWT_SECRET`, `APPLE_CLIENT_IDS`, `GOOGLE_CLIENT_IDS` (kommalijst: web- + iOS-client id), `ADMIN_EMAILS`, `R2_*`, `REVENUECAT_*`, `APNS_KEY_ID`, `APNS_KEY_P8`, `CRON_SECRET`, `APPLE_TEAM_ID`, `ANDROID_SHA256_FINGERPRINTS`.

**Sign in with Apple token-intrekking (guideline 5.1.1(v))**: `APPLE_SIWA_KEY_ID` + `APPLE_SIWA_KEY_P8` (inhoud van een AuthKey_XXXX.p8 met "Sign in with Apple" aan voor `app.camtrip.camtrip`; ruwe PEM, met `\n` of base64), samen met `APPLE_TEAM_ID` (4K4D59MXKW). Optioneel: `APPLE_CLIENT_ID` (default `app.camtrip.camtrip`) en `APPLE_TOKEN_ENC_KEY` (default afgeleid van `JWT_SECRET`). Bij inloggen wisselt de API de `authorizationCode` in voor een refresh token (versleuteld opgeslagen als `appleRefreshToken`); bij account verwijderen wordt dat token ingetrokken bij Apple. Zonder key wordt dit overgeslagen (waarschuwing in de log), inloggen en verwijderen werken gewoon. `/api/health` toont `siwa: ok|missing`.

**GitHub Actions secret**: alleen `APP_STORE_CONNECT_API_KEY_P8` (inhoud van AuthKey_QS5UXPB9HY.p8, API key "CamTrip CI", Admin). Signing gaat automatisch via die key (`-allowProvisioningUpdates`); Key ID, Issuer ID en de RevenueCat public key hebben defaults.

**GitHub Actions variables**: `GOOGLE_IOS_CLIENT_ID`, `GOOGLE_SERVER_CLIENT_ID` (of vul de defaults in `app/lib/core/config.dart`; CI leest die ook voor `ios/Flutter/Secrets.xcconfig`).

**App ID** `app.camtrip.camtrip` met Sign in with Apple, Push Notifications en Associated Domains (`applinks:camtrip.app`).

## De Flash-look aanpassen ("Tweaking the Flash look")

**Flits 400 / Flash 400** (`id: flash`) is de standaardstijl: gratis, de default voor nieuwe gebruikers en groepen, en de fallback als een Pro-stijl niet mag. Hij bootst een compactcamera met directe flits op warme 400-film na: sterke amber-zweem, opgetilde warme zwarten, crème hooglichten, krachtig rood/oranje, gedempt groen/blauw en fijne korrel.

Waar het zit:

- `app/lib/features/camera/styles.dart` - `CameraStyle.flash`: de 3 tooncurves (`look: FilmLook(curves: ...)`, 17 knopen per kanaal voor R, G, B, uitvoer 0-255 voor invoer 0, 1/16 ... 1), `vignette`, en de `matrix` (alleen voor de live preview: een least-squares benadering van de look).
- `app/lib/features/camera/film_look.dart` - `FilmLook`: alle andere knoppen, plus het bakken van de 33³ LUT en de ffmpeg-keten voor video.
- `app/lib/features/camera/processor.dart` - `applyFilmLook`: per foto statistiek, LUT, halation, vignet en korrel (op de ruwe bytes).

Wat je kunt draaien (in `FilmLook`):

| Knop | Effect |
|---|---|
| `curves` | De kern. Hoger in G/B = minder oranje; R-knopen 12-16 omlaag = zachtere hooglichten; knoop 0 = zwartpunt (nu 17/15/10: warm opgetild). |
| `amberMin`, `amberFor()` | Sterkte per scène: donker/warm (binnen, flits) = 1 = volle look, helder/koel daglicht = `amberMin` (0.5). |
| `satWarm` / `satCool` | Verzadiging van rood-oranje-geel vs. groen-cyaan-blauw, als (daglicht, flits). |
| `yellowToOrange` | Trekt geel naar oranje (de referenties hebben bijna geen geel). |
| `liftTarget`, `liftMax` | Belichtingslift voor donkere foto's zonder flits: onder gemiddelde luminantie 0.30 een gamma tot max 0.5. |
| `halation` | Rood-oranje gloed rond hooglichten. |
| `grain`, `chromaGrain` | Korrel-std in de middentonen (0.02 = ~4/255, gemeten als de scans) en kleurkorrel t.o.v. luminantiekorrel. |

Na een wijziging: `flutter test test/flash_style_test.dart` (checkt o.a. warme zwarten, crème wit en de gemiddelde kleur van een fixture) en draai de visuele test met eigen foto's in `/tmp/filter/in` - de uitvoer komt in `/tmp/filter/dart_out`. De preview-`matrix` en de video-keten volgen de curves niet vanzelf exact: de video leest `curves` wel automatisch (bij sterkte 0.85), de matrix moet je opnieuw fitten (least squares van LUT-uitvoer op een set pixels) als je de curves flink verandert.

Hoe de getallen tot stand kwamen: de curves zijn per kanaal gefit (CDF-matching) van "schone" telefoonversies van de referentiefoto's (de-graded: zwartpunt eraf, witte objecten neutraal met wat binnenwarmte, korrel weg) naar de referenties, daarna gladgestreken en de hooglichten van R/G/B iets afgerold. Resultaat op de drie flitsreferenties: gemiddelde kwantielfout 6.8/255 (A 6.7, B 11.0, C 2.8), korrel 3-5/255 met autocorrelatie 0.76/0.31 bij 1/2 px (scans: 0.76/0.34).
