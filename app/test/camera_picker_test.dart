import 'dart:io';

import 'package:camtrip/features/camera/camera_picker_sheet.dart';
import 'package:camtrip/features/camera/styles.dart';
import 'package:camtrip/features/premium/pro_gate.dart';
import 'package:camtrip/l10n/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/l10n.dart';

/// The ids in `export const NAME = [...]` in web/src/lib/models.ts.
List<String> _serverList(String name) {
  final src = File('../web/src/lib/models.ts').readAsStringSync();
  final m = RegExp('export const $name[^=]*=\\s*\\[([^\\]]*)\\]').firstMatch(src);
  expect(m, isNotNull, reason: '$name not found in models.ts');
  return RegExp(r"'([^']+)'").allMatches(m!.group(1)!).map((e) => e.group(1)!).toList();
}

void main() {
  group('camera styles', () {
    test('every style has camera art', () {
      for (final s in CameraStyle.all) {
        expect(s.art, 'assets/images/cameras/${s.id}.png');
        expect(File(s.art).existsSync(), isTrue, reason: 'missing art for ${s.id}');
      }
      // ready for the default direct-flash camera
      expect(File('assets/images/cameras/flash.png').existsSync(), isTrue);
    });

    test('every style has a translated name and description in every language', () {
      for (final locale in L10n.supportedLocales) {
        final l = lookupAppLocalizations(locale);
        for (final s in CameraStyle.all) {
          expect(s.nameIn(l), isNot(s.id == 'lomo' ? '' : s.id), reason: '${s.id} name in $locale');
          expect(s.nameIn(l).trim(), isNotEmpty);
          expect(s.descriptionIn(l).trim(), isNotEmpty, reason: '${s.id} description in $locale');
          expect(s.descriptionIn(l), isNot(contains('—')));
        }
      }
    });

    test('ids are unique', () {
      final ids = CameraStyle.all.map((s) => s.id).toList();
      expect(ids.toSet().length, ids.length);
    });

    test('the server accepts every app style', () {
      final server = _serverList('CAMERA_STYLES');
      for (final s in CameraStyle.all) {
        expect(server, contains(s.id), reason: '${s.id} missing from CAMERA_STYLES in web/src/lib/models.ts');
      }
    });

    test('free styles match the server', () {
      final free = _serverList('FREE_STYLES');
      expect(CameraStyle.all.where((s) => !s.pro).map((s) => s.id).toSet(), free.toSet());
    });
  });

  group('picker order', () {
    test('free cameras first, then Pro, in list order', () {
      final order = cameraPickerOrder();
      final firstPro = order.indexWhere((s) => s.pro);
      expect(order.skip(firstPro).every((s) => s.pro), isTrue);
      expect(order.length, CameraStyle.all.length);
    });

    test('the flash camera comes first', () {
      final flash = CameraStyle(id: 'flash', matrix: ColorMatrix.identity);
      final order = cameraPickerOrder([CameraStyle.film, CameraStyle.bw, flash]);
      expect(order.map((s) => s.id), ['flash', 'film', 'bw']);
    });
  });

  group('picker sheet', () {
    setUp(useDutch);

    Future<CameraStyle?> open(WidgetTester tester, ProGate gate, String tapName) async {
      tester.view.physicalSize = const Size(390, 844) * 3;
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);
      CameraStyle? result;
      var done = false;
      await tester.pumpWidget(
        localizedApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: Center(
                child: CameraPickerButton(
                  style: CameraStyle.instant,
                  onTap: () async {
                    result = await showCameraPicker(context, current: CameraStyle.instant, gate: gate);
                    done = true;
                  },
                ),
              ),
            ),
          ),
        ),
      );
      await tester.tap(find.byType(CameraPickerButton));
      await tester.pumpAndSettle();
      expect(find.text('Kies je camera'), findsOneWidget);
      final card = find.widgetWithText(CameraCard, tapName);
      await tester.scrollUntilVisible(card, 200, scrollable: find.byType(Scrollable).last);
      await tester.ensureVisible(card);
      await tester.pumpAndSettle();
      await tester.tap(find.descendant(of: card, matching: find.text(tapName)));
      await tester.pumpAndSettle(const Duration(milliseconds: 100));
      expect(done, isTrue);
      expect(find.text('Kies je camera'), findsNothing);
      return result;
    }

    testWidgets('picking a free camera closes with it', (tester) async {
      final s = await open(tester, const ProGate(personal: false), 'Film');
      expect(s?.id, 'film');
    });

    testWidgets('a locked Pro camera is handed back for the paywall', (tester) async {
      final s = await open(tester, const ProGate(personal: false), 'Super 8');
      expect(s?.id, 'super8');
      expect(const ProGate(personal: false).canUseStyle(styleIsPro: s!.pro), isFalse);
    });

    testWidgets('locks only show without Pro', (tester) async {
      await tester.pumpWidget(
        localizedApp(
          home: Scaffold(
            body: CameraPickerSheet(current: CameraStyle.film, gate: const ProGate(personal: true)),
          ),
        ),
      );
      await tester.pump();
      expect(find.byIcon(Icons.lock_rounded), findsNothing);
      await tester.pumpWidget(
        localizedApp(
          home: Scaffold(
            body: CameraPickerSheet(current: CameraStyle.film, gate: const ProGate(personal: false)),
          ),
        ),
      );
      await tester.pump();
      expect(find.byIcon(Icons.lock_rounded), findsWidgets);
    });
    test('3 columns on phones, 2 on very narrow ones, 4 on tablets', () {
      expect(cameraPickerColumns(320 - 28), 2);
      expect(cameraPickerColumns(360 - 28), 3);
      expect(cameraPickerColumns(375 - 28), 3);
      expect(cameraPickerColumns(430 - 28), 3);
      expect(cameraPickerColumns(768 - 28), 4);
    });

    testWidgets('compact grid: 3 per row and at least 9 cameras on a small phone', (tester) async {
      tester.view.physicalSize = const Size(375, 667) * 2;
      tester.view.devicePixelRatio = 2;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        localizedApp(
          home: Scaffold(
            body: CameraPickerSheet(current: CameraStyle.film, gate: const ProGate(personal: false)),
          ),
        ),
      );
      await tester.pump();
      expect(tester.takeException(), isNull);
      final cards = find.byType(CameraCard);
      final rects = [for (var i = 0; i < cards.evaluate().length; i++) tester.getRect(cards.at(i))];
      // first row: three cards side by side
      expect(rects[0].top, rects[1].top);
      expect(rects[1].top, rects[2].top);
      expect(rects[3].top, greaterThan(rects[0].top));
      final fullyVisible = rects.where((r) => r.bottom <= 667).length;
      expect(fullyVisible, greaterThanOrEqualTo(9));
      // still a comfortable tap target
      expect(rects[0].width, greaterThanOrEqualTo(44));
      expect(rects[0].height, greaterThanOrEqualTo(44));
    });

    testWidgets('the description is in the semantics and shows on long-press', (tester) async {
      tester.view.physicalSize = const Size(390, 844) * 3;
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);
      final handle = tester.ensureSemantics();
      await tester.pumpWidget(
        localizedApp(
          home: Scaffold(
            body: CameraPickerSheet(current: CameraStyle.film, gate: const ProGate(personal: false)),
          ),
        ),
      );
      await tester.pump();
      final film = CameraStyle.film;
      final card = find.widgetWithText(CameraCard, film.name);
      expect(find.text(film.description), findsNothing);
      expect(
        tester.getSemantics(card),
        matchesSemantics(
          label: '${film.name}. ${film.description}. Gekozen',
          isButton: true,
          isSelected: true,
          hasSelectedState: true,
          hasTapAction: true,
        ),
      );
      await tester.longPress(card);
      await tester.pumpAndSettle();
      expect(find.text(film.description), findsOneWidget);
      handle.dispose();
    });

    testWidgets('the form row opens the picker', (tester) async {
      tester.view.physicalSize = const Size(390, 844) * 3;
      tester.view.devicePixelRatio = 3;
      addTearDown(tester.view.reset);
      await tester.pumpWidget(
        localizedApp(
          home: Builder(
            builder: (context) => Scaffold(
              body: CameraSelectRow(
                style: CameraStyle.film,
                onTap: () => showCameraPicker(context, current: CameraStyle.film, gate: const ProGate(personal: false)),
              ),
            ),
          ),
        ),
      );
      expect(find.text('Film'), findsOneWidget);
      await tester.tap(find.byType(CameraSelectRow));
      await tester.pumpAndSettle();
      expect(find.text('Kies je camera'), findsOneWidget);
    });
  });
}
