import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/theme.dart';

/// Map tiles for the Reiskaart.
///
/// Source: CARTO Basemaps "light_all" raster tiles (OpenStreetMap data).
/// Why not tile.openstreetmap.org: the OSMF tile usage policy forbids heavy
/// use such as a distributed app without permission. CARTO terms
/// (carto.com/legal/basemap-terms, docs.carto.com/faqs/carto-basemaps):
/// - a free API key is required (dart-define CARTO_BASEMAPS_KEY, set as the
///   GitHub Actions variable of the same name); without one
///   CARTO serves "API KEY REQUIRED" tiles;
/// - commercial use is free up to 1 million tile requests per calendar
///   month (counted per customer); above that a paid plan is needed;
/// - "© OpenStreetMap contributors" and "© CARTO" must stay visible on every map;
/// - no bulk downloading / offline caching beyond normal use.
/// The request carries a real User-Agent (app id) as OSM-based services ask.
/// Tiles only load while the Reiskaart screen is open; CARTO sees the IP
/// address and the tile area, nothing else (no photos, no member data).
class TripTiles {
  TripTiles._();

  static const _key = String.fromEnvironment('CARTO_BASEMAPS_KEY', defaultValue: '');

  /// {r} becomes "@2x" on high-density screens (retinaMode).
  static String get urlTemplate =>
      'https://basemaps.cartocdn.com/rastertiles/light_all/{z}/{x}/{y}{r}.png${_key.isEmpty ? '' : '?key=$_key'}';

  static const userAgentPackageName = 'app.camtrip';

  /// Highest zoom: street level is enough, points are ~100 m anyway.
  static const maxZoom = 17.0;

  /// The light basemap, warmed up to the app's cream ("Instant Wit").
  static Widget creamTile(BuildContext context, Widget tile, TileImage _) => ColorFiltered(
        colorFilter: const ColorFilter.mode(CT.cream, BlendMode.multiply),
        child: tile,
      );

  static Widget layer({TileProvider? tileProvider, bool retina = false}) => TileLayer(
        urlTemplate: urlTemplate,
        userAgentPackageName: userAgentPackageName,
        tileProvider: tileProvider,
        retinaMode: retina,
        maxNativeZoom: 19,
        maxZoom: maxZoom,
        tileBuilder: creamTile,
      );

  /// Required credits: always visible (CARTO terms 3.d), tap for the OSM copyright page.
  static Widget attribution() => Align(
        alignment: Alignment.bottomRight,
        child: GestureDetector(
          onTap: () => launchUrl(Uri.parse('https://www.openstreetmap.org/copyright'), mode: LaunchMode.externalApplication),
          child: Container(
            margin: const EdgeInsets.all(6),
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(color: CT.bg.withValues(alpha: 0.85), borderRadius: BorderRadius.circular(6)),
            child: Text('© OpenStreetMap · © CARTO', maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(10, color: CT.muted, height: 1.3)),
          ),
        ),
      );
}
