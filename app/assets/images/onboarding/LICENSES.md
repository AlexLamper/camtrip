# Onboarding photos - licences

Real holiday photos, all free for commercial use without required attribution. Two sources:

- **Skitterphoto** (https://skitterphoto.com): every image there is published under **Creative Commons CC0 1.0**
  (public domain dedication; https://skitterphoto.com/license, https://creativecommons.org/publicdomain/zero/1.0/).
  Each photo page below was checked on 2026-11-12 and shows "CC0 / Public Domain".
- **Unsplash** (https://unsplash.com/license): the same base photos as camtrip.app uses
  (see `web/public/examples/LICENSES.md`), so the app and the website match. Unsplash License: free to use,
  also commercially, no permission or attribution needed; not allowed is selling them unaltered or compiling them
  into a competing photo service. These were found through the metadata of the public Unsplash Lite dataset and
  downloaded one by one from images.unsplash.com, so they fall under the normal Unsplash License (not the dataset
  terms). Worth a quick check on the photo pages before release that each photo is still listed there.

Processing: originals were cropped and run through CamTrip's own camera processing
(`lib/features/camera/processor.dart` with the styles from `styles.dart`: colour matrix, vignette, light leak,
grain and the orange date stamp). The white instant frame is drawn by the app (`InstantPrint`), not baked in.
Exported as optimised JPGs (max 900 px, under 150 KB).

People are only shown from behind, as silhouettes or at a distance; no logos or brands. CC0 and the Unsplash
License do not cover trademark, publicity or privacy rights; the photos were picked so nobody is recognisable
in close-up.

| File | Original | Photographer | Source | Licence | CamTrip style |
|---|---|---|---|---|---|
| `s1_beach.jpg` | Beach/sunset with friends around a campfire | Kimson Doan | https://unsplash.com/photos/AZMmUy2qL6A | Unsplash License | Film, stamp `'26 07 13` |
| `s1_campfire.jpg` | Evening with friends around a fire (from behind) | Kevin Wolf | https://unsplash.com/photos/gXNpIugknlA | Unsplash License | Wegwerp, stamp `'26 07 12` |
| `s1_friends.jpg` | Friends walking towards the sun (from behind) | The Ian | https://unsplash.com/photos/0TvvHQKcwRI | Unsplash License | Golden, stamp `'26 07 15` |
| `s2_parasols.jpg` | Sunset by the Sea with Umbrella and Sunbeds in Ammes Beach, Greek Island of Kefalonia | Dana Tentis | https://skitterphoto.com/photos/3129/sunset-by-the-sea-with-umbrella-and-sunbeds-in-ammes-beach-greek-island-of-kefalonia | CC0 1.0 (Public Domain) | Instant, stamp `'26 07 13` |
| `s2_walk.jpg` | People walking into the sunlight | Peter Heeling | https://skitterphoto.com/photos/13059/people-walking-into-the-sunlight | CC0 1.0 (Public Domain) | Film, stamp `'26 07 13` |
| `s2_dunes.jpg` | People walking to the beach | Peter Heeling | https://skitterphoto.com/photos/2392/people-walking-to-the-beach | CC0 1.0 (Public Domain) | Instant, stamp `'26 07 14` |
| `s2_hiker.jpg` | Hiker from behind, Crested Butte | Holly Mandarich | https://unsplash.com/photos/UVyOfX3v0Ls | Unsplash License | Chrome, stamp `'26 07 16` |
| `s2_concert.jpg` | Watching a concert | Peter Heeling | https://skitterphoto.com/photos/169/watching-a-concert | CC0 1.0 (Public Domain) | Wegwerp, stamp `'26 07 12` |
| `s2_alley.jpg` | Alley with sea view, Cinque Terre | Andrew Spencer | https://unsplash.com/photos/RPxMkJsqaUY | Unsplash License | Film, stamp `'26 07 17` |
| `s3_sunset.jpg` | Sun going down at the beach | Rudy van der Veen | https://skitterphoto.com/photos/11501/sun-going-down-at-the-beach | CC0 1.0 (Public Domain) | Golden, stamp `'26 07 13` |
| `s3_roadtrip.jpg` | Road to Fitz Roy, Patagonia | Andrea Leopardi | https://unsplash.com/photos/QVD3Xht9txA | Unsplash License | Film, stamp `'26 07 15` |
| `s3_mountains.jpg` | Swiss and the mountains | Rudy van der Veen | https://skitterphoto.com/photos/2537/swiss-and-the-mountains | CC0 1.0 (Public Domain) | Chrome, stamp `'26 07 16` |
| `s3_beach.jpg` | People at windy beach | Peter Heeling | https://skitterphoto.com/photos/11867/people-at-windy-beach | CC0 1.0 (Public Domain) | Z/W, stamp `'26 07 14` |
| `s3_summit.jpg` | People climbing a mountain | Peter Heeling | https://skitterphoto.com/photos/3081/people-climbing-a-mountain | CC0 1.0 (Public Domain) | Golden, stamp `'26 07 16` |
| `s3_crowd.jpg` | Summer Fun | Maderl | https://skitterphoto.com/photos/7907/summer-fun | CC0 1.0 (Public Domain) | Instant, stamp `'26 07 18` |
