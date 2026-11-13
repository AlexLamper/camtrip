@Tags(['visual'])
library;

import 'dart:io';
import 'dart:math' as math;
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/auth/onboarding_slides.dart';
import 'package:camtrip/features/groups/groups_controller.dart';
import 'package:camtrip/features/tripmap/trip_location.dart';
import 'package:camtrip/features/tripmap/trip_map_data.dart';
import 'package:camtrip/features/tripmap/trip_map_screen.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';

import 'all_photos_test.dart' show Me, NoQueue;
import 'support/l10n.dart';
import 'support/real_fonts.dart';
import 'trip_map_test.dart' show FakeLocator, TripApi, tripMapJson;

/// Renders the Reiskaart with real fonts, photos and a fake (offline) tile
/// source to PNG. Run with:
/// CAMTRIP_PREVIEW=/tmp/tripmap flutter test test/trip_map_preview_test.dart
void main() {
  final out = Platform.environment['CAMTRIP_PREVIEW'];
  setUpAll(() async {
    useDutch();
    await loadRealFonts();
  });

  Future<void> shoot(WidgetTester tester, GlobalKey key, String name) async {
    final boundary = tester.renderObject<RenderRepaintBoundary>(find.byKey(key));
    await tester.runAsync(() async {
      final image = await boundary.toImage(pixelRatio: 2);
      final png = await image.toByteData(format: ui.ImageByteFormat.png);
      Directory(out!).createSync(recursive: true);
      File('$out/$name.png').writeAsBytesSync(png!.buffer.asUint8List());
    });
  }

  Future<void> pumpMap(WidgetTester tester, GlobalKey key, TripApi api) async {
    tester.view.physicalSize = const Size(390, 844) * 3;
    tester.view.devicePixelRatio = 3;
    tester.view.padding = const FakeViewPadding(top: 47 * 3, bottom: 34 * 3);
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({});
    final prefs = Prefs(await SharedPreferences.getInstance());
    final photos = OnboardingPhotos.all;
    final container = ProviderContainer(overrides: [
      prefsProvider.overrideWithValue(prefs),
      apiProvider.overrideWithValue(api),
      authProvider.overrideWith(Me.new),
      uploadQueueProvider.overrideWith(NoQueue.new),
      tripLocatorProvider.overrideWithValue(FakeLocator()),
    ]);
    addTearDown(container.dispose);
    await tester.pumpWidget(RepaintBoundary(
      key: key,
      child: UncontrolledProviderScope(
        container: container,
        child: localizedApp(
          theme: CT.theme(),
          debugShowCheckedModeBanner: false,
          home: TripMapScreen(
            groupId: 'g1',
            tileProvider: PreviewTiles(),
            thumbBuilder: (p) => Image.asset(photos[int.parse(p.photoId.substring(1)) % photos.length], fit: BoxFit.cover, cacheWidth: 200),
          ),
        ),
      ),
    ));
    await tester.runAsync(() async {
      await container.read(authProvider.future);
      await container.read(groupsProvider.future);
    });
    await tester.pumpAndSettle();
    final context = tester.element(find.byType(TripMapScreen));
    await tester.runAsync(() async {
      for (final p in photos) {
        await precacheImage(ResizeImage(AssetImage(p), width: 200), context);
      }
    });
    // Let the tiles decode.
    for (var i = 0; i < 12; i++) {
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 250)));
      await tester.pumpAndSettle();
    }
    expect(tester.takeException(), isNull);
  }

  testWidgets('trip map with stats', (tester) async {
    final key = GlobalKey();
    final points = mallorcaTrip();
    final map = tripMapJson(points: points);
    final sorted = points.map(TripPoint.fromJson).toList();
    var km = 0.0;
    for (var i = 1; i < sorted.length; i++) {
      km += haversineKm(sorted[i - 1].lat, sorted[i - 1].lng, sorted[i].lat, sorted[i].lng);
    }
    map['stats'] = <String, dynamic>{
      ...(map['stats'] as Map<String, dynamic>),
      'days': 4,
      'photos': 13,
      'videos': 1,
      'located': 14,
      'distanceKm': (km * 10).round() / 10,
      'places': 11,
      'mostActiveDay': {'date': '2027-08-01', 'count': 4},
      'topPhotographer': {'userId': 'anna', 'name': 'Anna', 'count': 5},
    };
    await pumpMap(tester, key, TripApi(map: map));
    expect(find.byType(FlutterMap), findsOneWidget);
    final lines = tester.widget<PolylineLayer>(find.byType(PolylineLayer)).polylines;
    expect(lines, hasLength(5)); // the whole trip + one route per day
    await shoot(tester, key, 'preview');
  }, skip: out == null);

  testWidgets('stats only (map off)', (tester) async {
    final key = GlobalKey();
    await pumpMap(tester, key, TripApi(admin: true, enabled: false));
    await shoot(tester, key, 'preview_off');
  }, skip: out == null);
}

/// Four days around Mallorca, 14 photos.
List<Map<String, dynamic>> mallorcaTrip() {
  final stops = [
    (39.570, 2.650, 1, 9), (39.571, 2.648, 1, 10), (39.566, 2.637, 1, 13), (39.613, 2.690, 1, 17),
    (39.766, 2.715, 2, 10), (39.767, 2.716, 2, 11), (39.748, 2.648, 2, 15), (39.797, 2.693, 2, 19),
    (39.853, 3.121, 3, 11), (39.871, 3.164, 3, 14), (39.904, 3.093, 3, 18),
    (39.426, 3.265, 4, 10), (39.360, 3.122, 4, 13), (39.333, 3.093, 4, 17),
  ];
  return [
    for (var i = 0; i < stops.length; i++)
      {
        'photoId': 'p$i',
        'userId': ['me', 'anna', 'sanne'][i % 3],
        'lat': stops[i].$1,
        'lng': stops[i].$2,
        'takenAt': DateTime.utc(2027, 7, 31 + stops[i].$3, stops[i].$4 - 2).toIso8601String(),
        'countryCode': 'ES',
      },
  ];
}

/// Offline stand-in for the CARTO light basemap: land, sea around Mallorca
/// (a rough island shape), and a few roads, drawn per tile.
class PreviewTiles extends TileProvider {
  final _cache = <String, Uint8List>{};

  // Rough Mallorca outline (lng, lat).
  static const _island = [
    (2.35, 39.60), (2.52, 39.70), (2.70, 39.80), (2.95, 39.92), (3.20, 39.97), (3.20, 39.85),
    (3.12, 39.78), (3.46, 39.75), (3.42, 39.55), (3.30, 39.38), (3.07, 39.27), (2.95, 39.36),
    (2.75, 39.50), (2.62, 39.55), (2.50, 39.47), (2.38, 39.52),
  ];

  static bool _inIsland(double lng, double lat) {
    var inside = false;
    for (var i = 0, j = _island.length - 1; i < _island.length; j = i++) {
      final (xi, yi) = _island[i];
      final (xj, yj) = _island[j];
      if ((yi > lat) != (yj > lat) && lng < (xj - xi) * (lat - yi) / (yj - yi) + xi) inside = !inside;
    }
    return inside;
  }

  static (double, double) _lngLat(int z, double x, double y) {
    final n = math.pow(2, z).toDouble();
    final lng = x / n * 360 - 180;
    final lat = math.atan((math.exp(math.pi * (1 - 2 * y / n)) - math.exp(-math.pi * (1 - 2 * y / n))) / 2) * 180 / math.pi;
    return (lng, lat);
  }

  Uint8List _tile(TileCoordinates c) {
    const size = 128; // upscaled by the map; enough for a preview
    final t = img.Image(width: size, height: size);
    final land = img.ColorRgb8(247, 245, 240);
    final sea = img.ColorRgb8(212, 222, 228);
    for (var py = 0; py < size; py++) {
      for (var px = 0; px < size; px++) {
        final (lng, lat) = _lngLat(c.z, c.x + px / size, c.y + py / size);
        t.setPixel(px, py, _inIsland(lng, lat) ? land : sea);
      }
    }
    final rnd = math.Random(c.x * 7919 + c.y * 104729 + c.z);
    final road = img.ColorRgb8(255, 255, 255);
    for (var i = 0; i < 3; i++) {
      img.drawLine(t, x1: rnd.nextInt(size), y1: 0, x2: rnd.nextInt(size), y2: size - 1, color: road, thickness: 2);
    }
    return Uint8List.fromList(img.encodePng(t));
  }

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) =>
      MemoryImage(_cache.putIfAbsent('${coordinates.z}/${coordinates.x}/${coordinates.y}', () => _tile(coordinates)));
}
