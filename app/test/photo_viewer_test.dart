import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/gallery/photo_screen.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/main.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'all_photos_test.dart' show Me, NoQueue, phone;
import 'support/l10n.dart';

Map<String, dynamic> groupJson({bool admin = false}) => {
      'id': 'g1',
      'name': 'Mallorca',
      'type': 'vacation',
      'code': 'ABC',
      'status': 'active',
      'ownerId': 'anna',
      'myRole': admin ? 'admin' : 'member',
      'members': [
        {'id': 'me', 'name': 'Ik', 'role': admin ? 'admin' : 'member'},
        {'id': 'anna', 'name': 'Anna', 'role': 'admin'},
      ],
    };

/// p1 (Anna), p2 (me), p3 (Anna), newest first.
List<Map<String, dynamic>> viewerPhotos([List<String> owners = const ['anna', 'me', 'anna']]) => [
      for (var i = 0; i < owners.length; i++)
        {
          'id': 'p${i + 1}',
          'groupId': 'g1',
          'userId': owners[i],
          'kind': 'photo',
          'width': 3000,
          'height': 4000,
          'takenAt': DateTime.utc(2027, 8, 1, 18).subtract(Duration(hours: i)).toIso8601String(),
          'thumbUrl': 'https://example.invalid/t$i.jpg',
          'displayUrl': 'https://example.invalid/d$i.jpg',
        },
    ];

/// One album: GET /groups, GET /groups/g1/photos, POST batch-delete.
class ViewerApi extends Api {
  ViewerApi({this.admin = false, List<Map<String, dynamic>>? photos}) : photos = photos ?? viewerPhotos(), super(SessionStorage());
  final bool admin;
  final List<Map<String, dynamic>> photos;
  final posts = <(String, Object?)>[];

  @override
  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query}) async {
    if (path == '/groups') {
      return {
        'groups': [groupJson(admin: admin)],
      };
    }
    if (path == '/groups/g1/photos') return {'photos': photos, 'nextCursor': null};
    return {};
  }

  @override
  Future<Map<String, dynamic>> post(String path, [Object? data]) async {
    posts.add((path, data));
    if (path.endsWith('/batch-delete')) {
      return {'deleted': (data as Map)['photoIds']};
    }
    return {};
  }
}

Widget fakeImage(Photo p) => ColoredBox(key: Key('img-${p.id}'), color: Colors.primaries[int.parse(p.id.substring(1)) % 18]);

final systemBars = <bool>[];

/// The viewer on [photoId], pushed on top of a plain page (so closing pops).
Future<ViewerApi> pumpViewer(WidgetTester tester, {String photoId = 'p1', bool admin = false, List<Map<String, dynamic>>? photos}) async {
  phone(tester);
  SharedPreferences.setMockInitialValues({});
  final prefs = Prefs(await SharedPreferences.getInstance());
  final api = ViewerApi(admin: admin, photos: photos);
  await tester.pumpWidget(ProviderScope(
    overrides: [
      prefsProvider.overrideWithValue(prefs),
      apiProvider.overrideWithValue(api),
      authProvider.overrideWith(Me.new),
      uploadQueueProvider.overrideWith(NoQueue.new),
    ],
    child: localizedApp(
      theme: CT.theme(),
      home: Builder(
        builder: (context) => Scaffold(
          body: Center(
            child: TextButton(
              key: const Key('open'),
              onPressed: () => Navigator.of(context).push(MaterialPageRoute<void>(
                builder: (_) => PhotoScreen(groupId: 'g1', photoId: photoId, imageBuilder: fakeImage),
              )),
              child: const Text('open'),
            ),
          ),
        ),
      ),
    ),
  ));
  await tester.tap(find.byKey(const Key('open')));
  await tester.pumpAndSettle();
  expect(find.byType(PhotoScreen), findsOneWidget);
  return api;
}

InkWell action(WidgetTester tester, String key) => tester.widget<InkWell>(find.byKey(Key(key)));

double opacityOf(WidgetTester tester, String key) =>
    tester.widget<Opacity>(find.ancestor(of: find.byKey(Key(key)), matching: find.byType(Opacity)).first).opacity;

double chromeOpacity(WidgetTester tester) =>
    tester.widget<AnimatedOpacity>(find.ancestor(of: find.byKey(const Key('photo-close')), matching: find.byType(AnimatedOpacity)).first).opacity;

Future<void> swipeLeft(WidgetTester tester) async {
  await tester.fling(find.byKey(const Key('photo-pages')), const Offset(-300, 0), 1500);
  await tester.pumpAndSettle();
}

void main() {
  setUpAll(useDutch);
  setUp(() {
    systemBars.clear();
    PhotoScreen.setSystemBars = systemBars.add;
  });

  testWidgets('full screen: the picture fills the screen on black, no print frame', (tester) async {
    await pumpViewer(tester);
    final img = tester.getRect(find.byKey(const Key('img-p1')));
    expect(img, const Rect.fromLTWH(0, 0, 390, 844));
    final scaffold = tester.widget<Scaffold>(find.descendant(of: find.byType(PhotoScreen), matching: find.byType(Scaffold)));
    expect(scaffold.backgroundColor, Colors.black);
    // who + when
    expect(find.text('Anna'), findsOneWidget);
    expect(find.byKey(const Key('photo-when')), findsOneWidget);
    expect(tester.takeException(), isNull);
  });

  testWidgets('bottom bar: 4 actions; delete disabled with a tooltip on someone else\'s photo', (tester) async {
    await pumpViewer(tester);
    for (final label in ['Opslaan', 'Favoriet', 'Delen', 'Verwijderen']) {
      expect(find.text(label), findsOneWidget, reason: label);
    }
    // evenly spaced: same width, in order, across the screen
    final rects = [for (final k in ['photo-save', 'photo-favorite', 'photo-share', 'photo-delete']) tester.getRect(find.byKey(Key(k)))];
    for (var i = 1; i < 4; i++) {
      expect(rects[i].width, closeTo(rects[0].width, 0.5));
      expect(rects[i].left, greaterThan(rects[i - 1].left));
    }
    expect(rects[0].width, greaterThan(80));

    // Anna's photo, I am a member: delete is disabled, the others work.
    expect(action(tester, 'photo-delete').onTap, isNull);
    expect(opacityOf(tester, 'photo-delete'), 0.35);
    expect(action(tester, 'photo-favorite').onTap, isNotNull);
    expect(action(tester, 'photo-share').onTap, isNotNull);
    expect(action(tester, 'photo-save').onTap, isNotNull);
    final tip = tester.widget<Tooltip>(find.ancestor(of: find.byKey(const Key('photo-delete')), matching: find.byType(Tooltip)).first);
    expect(tip.message, 'Alleen de maker of een beheerder kan dit verwijderen');
    await tester.tap(find.byKey(const Key('photo-delete')));
    await tester.pump(const Duration(milliseconds: 200));
    expect(find.text('Alleen de maker of een beheerder kan dit verwijderen'), findsOneWidget);
    expect(find.byType(AlertDialog), findsNothing);
    await tester.pumpAndSettle(const Duration(seconds: 3));

    // Swipe to my own photo: delete is enabled.
    await swipeLeft(tester);
    expect(find.text('Jij'), findsOneWidget);
    expect(action(tester, 'photo-delete').onTap, isNotNull);
    expect(opacityOf(tester, 'photo-delete'), 1);
  });

  testWidgets('an admin may delete someone else\'s photo', (tester) async {
    await pumpViewer(tester, admin: true);
    expect(find.text('Anna'), findsOneWidget);
    expect(action(tester, 'photo-delete').onTap, isNotNull);
    expect(find.ancestor(of: find.byKey(const Key('photo-delete')), matching: find.byType(Tooltip)), findsNothing);
  });

  testWidgets('a tap hides the bars and the status bar, another tap brings them back', (tester) async {
    await pumpViewer(tester);
    expect(chromeOpacity(tester), 1);
    await tester.tap(find.byKey(const Key('img-p1')));
    await tester.pump(kDoubleTapTimeout + const Duration(milliseconds: 20));
    await tester.pumpAndSettle();
    expect(chromeOpacity(tester), 0);
    expect(systemBars, [true]);
    // hidden bars do not take taps
    expect(tester.widget<IgnorePointer>(find.ancestor(of: find.byKey(const Key('photo-close')), matching: find.byType(IgnorePointer)).first).ignoring, isTrue);

    await tester.tap(find.byKey(const Key('img-p1')));
    await tester.pump(kDoubleTapTimeout + const Duration(milliseconds: 20));
    await tester.pumpAndSettle();
    expect(chromeOpacity(tester), 1);
    expect(systemBars, [true, false]);

    // Leaving while immersive gives the status bar back.
    await tester.tap(find.byKey(const Key('img-p1')));
    await tester.pump(kDoubleTapTimeout + const Duration(milliseconds: 20));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('photo-close')), warnIfMissed: false); // ignored: bars hidden
    await tester.pumpAndSettle();
    expect(find.byType(PhotoScreen), findsOneWidget);
    Navigator.of(tester.element(find.byType(PhotoScreen))).pop();
    await tester.pumpAndSettle();
    expect(find.byType(PhotoScreen), findsNothing);
    expect(systemBars, [true, false, true, false]);
  });

  testWidgets('double tap zooms in (paging off), double tap again zooms out; a page change resets the zoom', (tester) async {
    await pumpViewer(tester);
    TransformationController zoomOf(String id) =>
        tester.widget<InteractiveViewer>(find.byKey(Key('photo-zoom-$id'))).transformationController!;
    ScrollPhysics? physics() => tester.widget<PageView>(find.byKey(const Key('photo-pages'))).physics;
    Future<void> doubleTap() async {
      final at = tester.getCenter(find.byKey(const Key('img-p1')));
      await tester.tapAt(at);
      await tester.pump(const Duration(milliseconds: 60));
      await tester.tapAt(at);
      await tester.pumpAndSettle();
    }

    final z1 = zoomOf('p1');
    await doubleTap();
    expect(z1.value.getMaxScaleOnAxis(), closeTo(2.5, 0.01));
    expect(physics(), isA<NeverScrollableScrollPhysics>());
    expect(chromeOpacity(tester), 1, reason: 'a double tap is not a single tap');

    await doubleTap();
    expect(z1.value.getMaxScaleOnAxis(), closeTo(1, 0.01));
    expect(physics(), isA<PageScrollPhysics>());

    // Zoomed in, then the page changes (e.g. after a delete): the zoom resets.
    await doubleTap();
    expect(z1.value.getMaxScaleOnAxis(), closeTo(2.5, 0.01));
    tester.widget<PageView>(find.byKey(const Key('photo-pages'))).controller!.jumpToPage(1);
    await tester.pumpAndSettle();
    expect(find.text('Jij'), findsOneWidget);
    expect(z1.value, Matrix4.identity());
    expect(physics(), isA<PageScrollPhysics>());

    // back to p1: not zoomed
    tester.widget<PageView>(find.byKey(const Key('photo-pages'))).controller!.jumpToPage(0);
    await tester.pumpAndSettle();
    expect(zoomOf('p1').value.getMaxScaleOnAxis(), closeTo(1, 0.01));
  });

  testWidgets('swipe down closes the viewer; a short drag springs back', (tester) async {
    await pumpViewer(tester);
    await tester.drag(find.byKey(const Key('img-p1')), const Offset(0, 60));
    await tester.pumpAndSettle();
    expect(find.byType(PhotoScreen), findsOneWidget);
    expect(tester.getRect(find.byKey(const Key('img-p1'))).top, 0);

    await tester.drag(find.byKey(const Key('img-p1')), const Offset(0, 300));
    await tester.pumpAndSettle();
    expect(find.byType(PhotoScreen), findsNothing);
  });

  testWidgets('delete: confirm dialog (own roll unchanged), cancel does nothing, confirm deletes and shows the next photo', (tester) async {
    final api = await pumpViewer(tester, photoId: 'p2');
    expect(find.text('Jij'), findsOneWidget);

    await tester.tap(find.byKey(const Key('photo-delete')));
    await tester.pumpAndSettle();
    expect(find.byType(AlertDialog), findsOneWidget);
    expect(find.text('Foto verwijderen?'), findsOneWidget);
    expect(find.text('Je eigen fotorol blijft ongewijzigd.'), findsOneWidget);
    await tester.tap(find.text('Annuleer'));
    await tester.pumpAndSettle();
    expect(api.posts, isEmpty);
    expect(find.text('Jij'), findsOneWidget);

    await tester.tap(find.byKey(const Key('photo-delete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirm-delete')));
    await tester.pumpAndSettle();
    expect(api.posts.single.$1, '/groups/g1/photos/batch-delete');
    expect((api.posts.single.$2! as Map)['photoIds'], ['p2']);
    expect(find.text('Foto verwijderd'), findsOneWidget);
    // p3 (Anna) slid into its place; the viewer stays open.
    expect(find.byType(PhotoScreen), findsOneWidget);
    expect(find.text('Anna'), findsOneWidget);
    expect(find.byKey(const Key('img-p3')), findsOneWidget);
    expect(find.byKey(const Key('img-p2')), findsNothing);
  });

  testWidgets('deleting the last photo at the end shows the previous one; the only photo closes the viewer', (tester) async {
    await pumpViewer(tester, photoId: 'p2', photos: viewerPhotos(['anna', 'me']));
    await tester.tap(find.byKey(const Key('photo-delete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirm-delete')));
    await tester.pumpAndSettle();
    expect(find.byType(PhotoScreen), findsOneWidget);
    expect(find.byKey(const Key('img-p1')), findsOneWidget);
    expect(find.text('Anna'), findsOneWidget);
  });

  testWidgets('deleting the only photo closes the viewer', (tester) async {
    await pumpViewer(tester, photoId: 'p1', photos: viewerPhotos(['me']));
    await tester.tap(find.byKey(const Key('photo-delete')));
    await tester.pumpAndSettle();
    await tester.tap(find.byKey(const Key('confirm-delete')));
    await tester.pumpAndSettle();
    expect(find.byType(PhotoScreen), findsNothing);
  });

  testWidgets('"..." keeps the extra actions, without delete', (tester) async {
    await pumpViewer(tester, admin: true);
    await tester.tap(find.byKey(const Key('photo-more')));
    await tester.pumpAndSettle();
    for (final k in ['photo-more-cover', 'photo-more-hide', 'photo-more-report', 'photo-more-block']) {
      expect(find.byKey(Key(k)), findsOneWidget, reason: k);
    }
    expect(find.text('Verwijderen'), findsOneWidget); // only the bottom bar's
  });
}
