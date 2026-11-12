# Foto's op camtrip.app - bronnen en licenties

Alle basisfoto's komen van Unsplash en vallen onder de **Unsplash License** (https://unsplash.com/license):
gratis te gebruiken, ook commercieel, zonder toestemming en zonder verplichte naamsvermelding.
Niet toegestaan onder die licentie: de foto's onbewerkt verkopen, of ze verzamelen om een concurrerende fotodienst na te bouwen. Beide is hier niet aan de orde.

Hoe ze gevonden zijn: via de metadata van de openbare Unsplash Lite dataset (photo id, fotograaf, beeld-URL).
De foto's zelf zijn los gedownload van images.unsplash.com, dus onder de gewone Unsplash License en niet onder de dataset-voorwaarden.
Gekozen op: geen herkenbare gezichten van dichtbij (mensen van achteren, als silhouet of op afstand) en geen logo's of merken.

Let op: de Unsplash License dekt geen merk- of portretrecht. Er staan geen merken of close-ups van gezichten op deze foto's. Check eventueel nog even de fotopagina's (links hieronder) of de foto er nog staat.

Alles is bewerkt met een Python/PIL-port van de camerastijlen uit de app (`app/lib/features/camera/styles.dart` en `processor.dart`):
dezelfde kleurmatrices, vignet, lichtlek, korrel, oranje datumstempel ('26 07 13) en de witte instant-rand.
De video (`video-film.mp4`) is gemaakt met ffmpeg en gebruikt precies de filterketen uit `video_processor.dart` (stijl Film).
De schermen in `screens/` zijn de bestaande app-screenshots, met de getekende voorbeeldfoto's vervangen door deze foto's.

| Scène | Unsplash-foto | Fotograaf | Plek | Gebruikt in |
|---|---|---|---|---|
| strand - Strand/zonsondergang met vrienden rond een kampvuur | https://unsplash.com/photos/AZMmUy2qL6A | Kimson Doan (@kimsondoan) | Ocean Beach, San Francisco, United States | strand-*.webp/jpg, print-strand-*, video-film.mp4, screens/screen-{galerij,detail,recap,camera} |
| roadtrip - Roadtrip, weg naar de bergen | https://unsplash.com/photos/QVD3Xht9txA | Andrea Leopardi (@whatyouhide) | Fitz Roy, Patagonia, Argentina | roadtrip-*.webp/jpg, print-roadtrip-*, video-film.mp4, screens/screen-galerij |
| stad - Stedentrip, steegje met zeezicht | https://unsplash.com/photos/RPxMkJsqaUY | Andrew Spencer (@iam_aspencer) | Cinque Terre, SP, Italy | stad-*.webp/jpg, print-stad-*, screens/screen-{camera,galerij,albums} |
| bergen - Bergen, wandelaar van achteren | https://unsplash.com/photos/UVyOfX3v0Ls | Holly Mandarich (@hollymandarich) | Crested Butte, United States | print-bergen-*, video-film.mp4 |
| sneeuw - Sneeuw, toerskiers op afstand | https://unsplash.com/photos/uK7qs8UHOo4 | Naomi Hutchinson (@naomihutchinson) | Sankt Christoph am Arlberg, Sankt Anton am Arlberg, Austria | print-sneeuw-* |
| vrienden - Vrienden lopen de zon tegemoet (van achteren) | https://unsplash.com/photos/0TvvHQKcwRI | The Ian (@theian20) | Kota Ambon, Maluku, Indonesia | print-vrienden-*, screens/screen-galerij |
| feest - Avond met vrienden rond een vuur (van achteren) | https://unsplash.com/photos/gXNpIugknlA | Kevin Wolf (@kevinwolf) | - | screens/screen-albums |
| palmen - Strand bij zonsondergang, mensen op afstand | https://unsplash.com/photos/JLkhiWpBSSs | David Straight (@davidstraight) | Moody Beach, Wells, United States | screens/screen-albums |

Naamsvermelding is niet verplicht, maar wordt door Unsplash gewaardeerd. Als je dat wilt kan dat bijvoorbeeld in de footer of op een aparte credits-pagina.
