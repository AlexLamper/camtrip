import 'dart:typed_data';

import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/groups/groups_controller.dart';
import 'package:camtrip/features/tripmap/trip_location.dart';
import 'package:camtrip/features/tripmap/trip_map_data.dart';
import 'package:camtrip/features/tripmap/trip_map_screen.dart';
import 'package:camtrip/features/tripmap/trip_map_settings.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/main.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';

import 'all_photos_test.dart' show Me, NoQueue, phone;
import 'support/l10n.dart';

// ---------------------------------------------------------------- fakes

Map<String, dynamic> tripGroupJson({bool admin = false, bool enabled = true, bool? consent}) => {
      'id': 'g1',
      'name': 'Mallorca',
      'type': 'vacation',
      'code': 'ABC123',
      'status': 'active',
      'ownerId': 'anna',
      'myRole': admin ? 'admin' : 'member',
      'photoCount': 4,
      'members': [
        {'id': 'me', 'name': 'Ik', 'role': admin ? 'admin' : 'member'},
        {'id': 'anna', 'name': 'Anna', 'role': 'admin'},
        {'id': 'sanne', 'name': 'Sanne', 'role': 'member'},
      ],
      'tripMap': {'enabled': enabled, 'myConsent': consent},
    };

/// Palma -> Sóller -> Deià on 1 Aug, Alcúdia on 2 Aug.
List<Map<String, dynamic>> tripPointsJson() => [
      {'photoId': 'p1', 'userId': 'anna', 'lat': 39.570, 'lng': 2.650, 'takenAt': '2027-08-01T08:00:00Z', 'countryCode': 'ES'},
      {'photoId': 'p2', 'userId': 'me', 'lat': 39.766, 'lng': 2.715, 'takenAt': '2027-08-01T12:00:00Z', 'countryCode': 'ES'},
      {'photoId': 'p3', 'userId': 'anna', 'lat': 39.748, 'lng': 2.648, 'takenAt': '2027-08-01T17:00:00Z', 'countryCode': 'ES', 'kind': 'video'},
      {'photoId': 'p4', 'userId': 'sanne', 'lat': 39.853, 'lng': 3.121, 'takenAt': '2027-08-02T10:00:00Z', 'countryCode': 'ES'},
    ];

Map<String, dynamic> tripMapJson({bool enabled = true, bool? consent = true, List<Map<String, dynamic>>? points}) => {
      'tripMap': {'enabled': enabled, 'myConsent': consent},
      'stats': {
        'days': 2,
        'photos': 3,
        'videos': 1,
        'members': 3,
        'mostActiveDay': {'date': '2027-08-01', 'count': 3},
        'topPhotographer': {'userId': 'anna', 'name': 'Anna', 'count': 2},
        'located': enabled ? 4 : 0,
        'distanceKm': enabled ? 78.4 : 0,
        'countries': enabled ? ['ES'] : <String>[],
        'places': enabled ? 4 : 0,
      },
      'points': enabled ? (points ?? tripPointsJson()) : <Map<String, dynamic>>[],
    };

class TripApi extends Api {
  TripApi({this.admin = false, this.enabled = true, this.consent, Map<String, dynamic>? map})
      : map = map ?? tripMapJson(enabled: enabled, consent: consent),
        super(SessionStorage());
  bool admin;
  bool enabled;
  bool? consent;
  Map<String, dynamic> map;
  final calls = <(String, String, Object?)>[];

  @override
  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query}) async {
    calls.add(('GET', path, query));
    if (path == '/groups') {
      return {
        'groups': [tripGroupJson(admin: admin, enabled: enabled, consent: consent)],
      };
    }
    if (path == '/groups/g1/map') return map;
    if (path == '/groups/g1/photos') return {'photos': <Object>[], 'nextCursor': null};
    return {};
  }

  @override
  Future<Map<String, dynamic>> put(String path, Object data) async {
    calls.add(('PUT', path, data));
    consent = (data as Map)['consent'] as bool;
    return {'group': tripGroupJson(admin: admin, enabled: enabled, consent: consent)};
  }

  @override
  Future<Map<String, dynamic>> patch(String path, Object data) async {
    calls.add(('PATCH', path, data));
    if (path == '/groups/g1/map') {
      enabled = (data as Map)['enabled'] as bool;
      if (!enabled) consent = null;
      map = tripMapJson(enabled: enabled, consent: consent);
    }
    return {'group': tripGroupJson(admin: admin, enabled: enabled, consent: consent)};
  }
}

class FakeLocator implements TripLocator {
  FakeLocator({this.granted = true, this.fix});
  bool granted;
  TripLatLng? fix;
  int permissionAsks = 0;
  int reads = 0;

  @override
  Future<bool> ensurePermission() async {
    permissionAsks++;
    return granted;
  }

  @override
  Future<TripLatLng?> current() async {
    reads++;
    return fix;
  }
}

/// Map tiles without network: a plain cream square with a faint grid.
class FakeTiles extends TileProvider {
  FakeTiles() : _png = _tile();
  final Uint8List _png;
  int requests = 0;

  static Uint8List _tile() {
    final t = img.Image(width: 256, height: 256);
    img.fill(t, color: img.ColorRgb8(246, 244, 238));
    for (var i = 0; i < 256; i += 64) {
      img.drawLine(t, x1: i, y1: 0, x2: i, y2: 255, color: img.ColorRgb8(226, 222, 212));
      img.drawLine(t, x1: 0, y1: i, x2: 255, y2: i, color: img.ColorRgb8(226, 222, 212));
    }
    return Uint8List.fromList(img.encodePng(t));
  }

  @override
  ImageProvider getImage(TileCoordinates coordinates, TileLayer options) {
    requests++;
    return MemoryImage(_png);
  }
}

Widget colorPin(TripPoint p) => ColoredBox(key: Key('pin-${p.photoId}'), color: Colors.primaries[p.photoId.hashCode % 18]);

Future<ProviderContainer> containerFor(TripApi api, FakeLocator locator) async {
  SharedPreferences.setMockInitialValues({});
  final prefs = Prefs(await SharedPreferences.getInstance());
  return ProviderContainer(overrides: [
    prefsProvider.overrideWithValue(prefs),
    apiProvider.overrideWithValue(api),
    authProvider.overrideWith(Me.new),
    uploadQueueProvider.overrideWith(NoQueue.new),
    tripLocatorProvider.overrideWithValue(locator),
  ]);
}

Future<(TripApi, FakeLocator, ProviderContainer)> pumpApp(
  WidgetTester tester,
  Widget home, {
  TripApi? api,
  FakeLocator? locator,
}) async {
  phone(tester);
  final a = api ?? TripApi();
  final l = locator ?? FakeLocator();
  final container = await containerFor(a, l);
  addTearDown(container.dispose);
  await tester.pumpWidget(UncontrolledProviderScope(
    container: container,
    child: localizedApp(theme: CT.theme(), home: home),
  ));
  await container.read(authProvider.future);
  await container.read(groupsProvider.future);
  await tester.pumpAndSettle();
  return (a, l, container);
}

// ---------------------------------------------------------------- tests

void main() {
  setUpAll(useDutch);

  group('data and stats', () {
    test('parses the map endpoint: stats, points in time order', () {
      final json = tripMapJson();
      (json['points'] as List).shuffle();
      final d = TripMapData.fromJson(json);
      expect(d.enabled, isTrue);
      expect(d.myConsent, isTrue);
      expect(d.points.map((p) => p.photoId), ['p1', 'p2', 'p3', 'p4']);
      expect(d.points[2].isVideo, isTrue);
      final s = d.stats;
      expect((s.days, s.photos, s.videos, s.members), (2, 3, 1, 3));
      expect(s.mostActiveDay, DateTime(2027, 8, 1));
      expect(s.mostActiveDayCount, 3);
      expect(s.topPhotographerName, 'Anna');
      expect(s.distanceKm, 78.4);
      expect(s.countries, ['ES']);
      expect(s.places, 4);
    });

    test('stats without the map and empty answers', () {
      final off = TripMapData.fromJson(tripMapJson(enabled: false, consent: null));
      expect(off.enabled, isFalse);
      expect(off.myConsent, isNull);
      expect(off.points, isEmpty);
      expect(off.stats.distanceKm, 0);
      final empty = TripStats.fromJson(const {});
      expect(empty.isEmpty, isTrue);
      expect(empty.mostActiveDay, isNull);
      expect(TripStats.fromJson(const {'mostActiveDay': {'date': 'garbage'}}).mostActiveDay, isNull);
    });

    test('coarsening keeps ~100 m, distance matches the server formula', () {
      expect(coarsenCoord(51.923456), 51.923);
      expect(coarsenCoord(-0.0004), 0);
      final p = TripLatLng(52.3731234, 4.8926789);
      expect((p.lat, p.lng), (52.373, 4.893));
      expect(haversineKm(52.3676, 4.9041, 48.8566, 2.3522), closeTo(430, 5));
      expect(haversineKm(1, 1, 1, 1), 0);
    });

    test('route: one line per local day, in time order, single-point days left out', () {
      final pts = TripMapData.fromJson(tripMapJson()).points;
      final lines = routeByDay([pts[3], pts[1], pts[0], pts[2]]);
      // In UTC+0..+2 the first three are one day; p4 alone on the next day.
      expect(lines, hasLength(1));
      expect(lines.single.map((p) => p.photoId), ['p1', 'p2', 'p3']);
    });

    test('clustering by screen cell, newest photo on top', () {
      final pts = TripMapData.fromJson(tripMapJson()).points;
      // Far zoomed out: everything in one cell.
      final one = clusterPoints(pts, (p) => Offset(p.lng, p.lat));
      expect(one, hasLength(1));
      expect(one.single.count, 4);
      expect(one.single.cover.photoId, 'p4');
      // Zoomed in (1000 px per degree): four separate pins.
      Offset near(TripPoint p) => Offset(p.lng * 1000, -p.lat * 1000);
      expect(clusterPoints(pts, near).map((c) => c.count), [1, 1, 1, 1]);
      // A second photo a few metres from Sóller, later that day, joins its pin and becomes its face.
      final extra = TripPoint(photoId: 'p5', userId: 'me', lat: 39.7661, lng: 2.7151, takenAt: DateTime.utc(2027, 8, 1, 13));
      final withExtra = clusterPoints([...pts, extra], near);
      expect(withExtra.map((c) => c.count), [1, 2, 1, 1]);
      final pair = withExtra[1];
      expect(pair.points.map((p) => p.photoId), ['p2', 'p5']);
      expect(pair.cover.photoId, 'p5');
      expect(pair.lat, closeTo((39.766 + 39.7661) / 2, 1e-9));
    });

    test('group json carries the trip map state', () {
      final g = Group.fromJson(tripGroupJson(consent: null));
      expect(g.tripMap.enabled, isTrue);
      expect(g.tripMap.needsConsent, isTrue);
      expect(g.tripMap.sharesLocation, isFalse);
      expect(Group.fromJson(tripGroupJson(consent: true)).tripMap.sharesLocation, isTrue);
      expect(Group.fromJson(tripGroupJson(enabled: false, consent: true)).tripMap.sharesLocation, isFalse);
      final old = Group.fromJson({...tripGroupJson()}..remove('tripMap'));
      expect(old.tripMap.enabled, isFalse);
      expect(old.copyWith(name: 'x').tripMap.enabled, isFalse);
      expect(g.copyWith(name: 'x').tripMap.needsConsent, isTrue);
    });

    test('upload queue keeps the coarse location and sends it on init only when set', () {
      final item = UploadItem(
        id: 'u1',
        groupId: 'g1',
        kind: 'photo',
        style: 'flash',
        mime: 'image/jpeg',
        takenAt: DateTime.utc(2027, 8, 1),
        fromRoll: false,
        width: 1,
        height: 1,
        durationMs: 0,
        originalPath: 'o',
        displayPath: 'd',
        thumbPath: 't',
        lat: 39.57,
        lng: 2.65,
      );
      final back = UploadItem.fromJson(item.toJson());
      expect((back.lat, back.lng), (39.57, 2.65));
      final none = UploadItem.fromJson({...item.toJson()}..remove('lat')..remove('lng'));
      expect(none.lat, isNull);
      expect(none.toJson().containsKey('lat'), isFalse);
    });
  });

  group('location capture gating', () {
    for (final (enabled, consent, reads) in [(true, true, true), (true, false, false), (true, null, false), (false, true, false)]) {
      test('map $enabled, consent $consent -> ${reads ? 'reads' : 'no'} location', () async {
        final api = TripApi(enabled: enabled, consent: consent);
        final locator = FakeLocator(fix: TripLatLng(39.5701234, 2.6509876));
        final c = await containerFor(api, locator);
        addTearDown(c.dispose);
        await c.read(authProvider.future);
        await c.read(groupsProvider.future);
        final fix = await c.read(tripLocationProvider).forCapture('g1');
        expect(locator.reads, reads ? 1 : 0);
        expect(fix == null, !reads);
        if (reads) expect((fix!.lat, fix.lng), (39.57, 2.651));
      });
    }
  });

  group('opt-in dialog', () {
    Widget asker() => Consumer(
          builder: (context, ref, _) => Scaffold(
            body: Center(
              child: TextButton(
                key: const Key('shoot'),
                onPressed: () => askTripMapConsentIfNeeded(context, ref, ref.read(groupProvider('g1'))!),
                child: const Text('shoot'),
              ),
            ),
          ),
        );

    testWidgets('first photo asks once; Ja saves consent and asks for location access', (tester) async {
      final (api, locator, c) = await pumpApp(tester, asker(), api: TripApi(consent: null));
      await tester.tap(find.byKey(const Key('shoot')));
      await tester.pumpAndSettle();
      expect(find.text("Deel waar je foto's gemaakt zijn op de reiskaart van deze groep?"), findsOneWidget);
      await tester.tap(find.byKey(const Key('tripmap-consent-yes')));
      await tester.pumpAndSettle();
      final put = api.calls.where((x) => x.$1 == 'PUT').single;
      expect(put.$2, '/groups/g1/map');
      expect(put.$3, {'consent': true});
      expect(locator.permissionAsks, 1);
      expect(c.read(groupProvider('g1'))!.tripMap.sharesLocation, isTrue);
      // Answered: no second question.
      await tester.tap(find.byKey(const Key('shoot')));
      await tester.pumpAndSettle();
      expect(find.byType(AlertDialog), findsNothing);
    });

    testWidgets('Nee saves "no" and never asks for location access', (tester) async {
      final (api, locator, c) = await pumpApp(tester, asker(), api: TripApi(consent: null));
      await tester.tap(find.byKey(const Key('shoot')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('tripmap-consent-no')));
      await tester.pumpAndSettle();
      expect(api.calls.where((x) => x.$1 == 'PUT').single.$3, {'consent': false});
      expect(locator.permissionAsks, 0);
      expect(c.read(groupProvider('g1'))!.tripMap.myConsent, isFalse);
    });

    testWidgets('denied location access shows a hint', (tester) async {
      await pumpApp(tester, asker(), api: TripApi(consent: null), locator: FakeLocator(granted: false));
      await tester.tap(find.byKey(const Key('shoot')));
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key('tripmap-consent-yes')));
      await tester.pumpAndSettle();
      expect(find.textContaining('Geen toegang tot je locatie'), findsOneWidget);
    });

    testWidgets('no question while the map is off or already answered', (tester) async {
      for (final api in [TripApi(enabled: false), TripApi(consent: false)]) {
        await pumpApp(tester, asker(), api: api);
        await tester.tap(find.byKey(const Key('shoot')));
        await tester.pumpAndSettle();
        expect(find.byType(AlertDialog), findsNothing);
      }
    });

    testWidgets('group settings: stop sharing confirms, then withdraws consent', (tester) async {
      final (api, _, c) = await pumpApp(
        tester,
        Consumer(builder: (_, ref, _) {
          final g = ref.watch(groupProvider('g1'));
          return Scaffold(body: g == null ? const SizedBox() : TripMapSettingsSection(group: g));
        }),
        api: TripApi(consent: true),
      );
      expect(find.byKey(const Key('tripmap-enabled')), findsNothing); // not an admin
      await tester.tap(find.byKey(const Key('tripmap-sharing')));
      await tester.pumpAndSettle();
      expect(find.text('Locatie niet meer delen?'), findsOneWidget);
      await tester.tap(find.text('Stop met delen'));
      await tester.pumpAndSettle();
      expect(api.calls.where((x) => x.$1 == 'PUT').single.$3, {'consent': false});
      expect(c.read(groupProvider('g1'))!.tripMap.myConsent, isFalse);
    });

    testWidgets('group settings: admin turns the map off after a warning', (tester) async {
      final (api, _, c) = await pumpApp(
        tester,
        Consumer(builder: (_, ref, _) {
          final g = ref.watch(groupProvider('g1'));
          return Scaffold(body: g == null ? const SizedBox() : TripMapSettingsSection(group: g));
        }),
        api: TripApi(admin: true, consent: true),
      );
      await tester.tap(find.byKey(const Key('tripmap-enabled')));
      await tester.pumpAndSettle();
      expect(find.text('Reiskaart uitzetten?'), findsOneWidget);
      await tester.tap(find.text('Uitzetten'));
      await tester.pumpAndSettle();
      final patch = api.calls.where((x) => x.$1 == 'PATCH').single;
      expect(patch.$2, '/groups/g1/map');
      expect(patch.$3, {'enabled': false});
      expect(c.read(groupProvider('g1'))!.tripMap.enabled, isFalse);
      expect(find.byKey(const Key('tripmap-sharing')), findsNothing);
    });
  });

  group('map screen', () {
    testWidgets('renders stats, route and clustered pins on mocked tiles', (tester) async {
      final tiles = FakeTiles();
      final (api, _, _) = await pumpApp(tester, TripMapScreen(groupId: 'g1', tileProvider: tiles, thumbBuilder: colorPin));
      expect(api.calls.any((x) => x.$2 == '/groups/g1/map' && (x.$3 as Map).containsKey('tz')), isTrue);
      expect(find.byKey(const Key('tripmap-stats')), findsOneWidget);
      expect(find.text('78,4'), findsOneWidget); // km, Dutch decimal comma
      expect(find.text('km afgelegd'), findsOneWidget);
      expect(find.text('Landen'), findsOneWidget);
      expect(find.textContaining("Meeste foto's op zondag 1 augustus (3)"), findsOneWidget);
      expect(find.text('Topfotograaf: Anna (2)'), findsOneWidget);
      expect(find.byType(FlutterMap), findsOneWidget);
      expect(tiles.requests, greaterThan(0));
      expect(find.byType(PolylineLayer), findsOneWidget);
      final pins = tester.widgetList<TripPin>(find.byType(TripPin)).toList();
      expect(pins.fold<int>(0, (a, p) => a + p.cluster.count), 4);
      expect(find.text('© OpenStreetMap · © CARTO'), findsOneWidget);
      expect(tester.takeException(), isNull);
    });

    testWidgets('map off: stats only, and admins can switch it on', (tester) async {
      final (api, _, _) = await pumpApp(
        tester,
        TripMapScreen(groupId: 'g1', tileProvider: FakeTiles(), thumbBuilder: colorPin),
        api: TripApi(admin: true, enabled: false),
      );
      expect(find.byType(FlutterMap), findsNothing);
      expect(find.text("Video's"), findsOneWidget);
      expect(find.text('Leden'), findsOneWidget);
      expect(find.text('De reiskaart staat uit'), findsOneWidget);
      await tester.tap(find.text('Reiskaart aanzetten'));
      await tester.pumpAndSettle();
      expect(api.calls.where((x) => x.$1 == 'PATCH').single.$3, {'enabled': true});
      expect(find.byType(FlutterMap), findsOneWidget);
    });

    testWidgets('members without the map see stats and no switch', (tester) async {
      await pumpApp(tester, TripMapScreen(groupId: 'g1', tileProvider: FakeTiles()), api: TripApi(enabled: false));
      expect(find.text('De reiskaart staat uit'), findsOneWidget);
      expect(find.text('Reiskaart aanzetten'), findsNothing);
    });
  });
}
