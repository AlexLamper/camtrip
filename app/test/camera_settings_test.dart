import 'dart:typed_data';

import 'package:camera/camera.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/camera/camera_settings.dart';
import 'package:camtrip/features/camera/camera_settings_sheet.dart';
import 'package:camtrip/features/camera/flash_control.dart';
import 'package:camtrip/features/camera/low_light.dart';
import 'package:camtrip/features/camera/processor.dart';
import 'package:camtrip/features/camera/viewfinder_overlays.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';

import 'support/l10n.dart';

void main() {
  setUpAll(useDutch);

  group('camera settings sheet', () {
    late CameraSettingsStore store;
    late List<CameraSettings> changes;

    Future<void> pumpSheet(WidgetTester t) async {
      changes = [];
      // tall phone, so every row is on screen without scrolling
      t.view.physicalSize = const Size(430, 1400);
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.reset);
      await t.pumpWidget(localizedApp(
        home: Scaffold(
          body: Align(
            alignment: Alignment.bottomCenter,
            child: CameraSettingsSheet(store: store, initial: store.read(), onChanged: changes.add),
          ),
        ),
      ));
    }

    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      store = await CameraSettingsStore.load();
    });

    testWidgets('defaults: stamp, haptics, mirror and save-to-roll on; grid, sound, timer off; high quality', (t) async {
      final s = store.read();
      expect(s, const CameraSettings());
      expect([s.dateStamp, s.haptics, s.mirrorSelfies, s.saveToRoll], everyElement(isTrue));
      expect([s.grid, s.sound], everyElement(isFalse));
      expect(s.timer, ShutterTimer.off);
      expect(s.quality, CaptureQuality.high);
      await pumpSheet(t);
      expect(find.text('Camera-instellingen'), findsOneWidget);
      for (final label in ['Raster', 'Tijdstempel rechtsonder', 'Spiegel selfies', 'Trillen bij afdrukken', 'Sluitergeluid', 'Zelfontspanner', 'Kwaliteit']) {
        expect(find.text(label), findsOneWidget, reason: label);
      }
    });

    testWidgets('each toggle is saved per device and reported', (t) async {
      await pumpSheet(t);
      final prefs = await SharedPreferences.getInstance();

      Future<void> tapRow(String key) async {
        await t.ensureVisible(find.byKey(ValueKey(key)));
        await t.tap(find.byKey(ValueKey(key)));
        await t.pumpAndSettle();
      }

      await tapRow('cam-setting-grid');
      expect(prefs.getBool(CameraSettingsStore.kGrid), isTrue);
      expect(changes.last.grid, isTrue);

      await tapRow('cam-setting-stamp');
      expect(prefs.getBool('date_stamp'), isFalse, reason: 'same key as the app settings screen');

      await tapRow('cam-setting-haptics');
      expect(prefs.getBool(CameraSettingsStore.kHaptics), isFalse);

      await tapRow('cam-setting-sound');
      expect(prefs.getBool(CameraSettingsStore.kSound), isTrue);

      await tapRow('cam-setting-mirror');
      expect(prefs.getBool(CameraSettingsStore.kMirror), isFalse);

      await tapRow('cam-setting-roll');
      expect(prefs.getBool('save_own'), isFalse, reason: 'same key as the app settings screen');

      // A fresh store (next app start) reads the same values back.
      final again = (await CameraSettingsStore.load()).read();
      expect(again, changes.last);
      expect(again.grid, isTrue);
      expect(again.dateStamp, isFalse);
      expect(again.haptics, isFalse);
      expect(again.sound, isTrue);
      expect(again.mirrorSelfies, isFalse);
      expect(again.saveToRoll, isFalse);
    });

    testWidgets('timer and quality segments persist', (t) async {
      await pumpSheet(t);
      await t.ensureVisible(find.text('10 s'));
      await t.tap(find.text('10 s'));
      await t.pumpAndSettle();
      expect(store.read().timer, ShutterTimer.ten);

      await t.ensureVisible(find.text('Standaard'));
      await t.tap(find.text('Standaard'));
      await t.pumpAndSettle();
      expect(store.read().quality, CaptureQuality.standard);
      expect(store.read().quality.preset, ResolutionPreset.veryHigh);

      await t.tap(find.text('Uit').first);
      await t.pumpAndSettle();
      expect(store.read().timer, ShutterTimer.off);
      expect(changes.map((c) => c.timer), [ShutterTimer.ten, ShutterTimer.ten, ShutterTimer.off]);
    });

    testWidgets('switch rows have 44pt+ targets and readable semantics', (t) async {
      await pumpSheet(t);
      expect(t.getSize(find.byKey(const ValueKey('cam-setting-grid'))).height, greaterThanOrEqualTo(44));
      final handle = t.ensureSemantics();
      expect(find.bySemanticsLabel(RegExp('Raster')), findsWidgets);
      handle.dispose();
    });
  });

  group('flash', () {
    test('cycles Uit -> Aan -> Auto -> Uit', () {
      expect(FlashSetting.off.next, FlashSetting.on);
      expect(FlashSetting.on.next, FlashSetting.auto);
      expect(FlashSetting.auto.next, FlashSetting.off);
    });

    test('maps to the controller: photo flash modes, torch for video', () {
      expect(FlashSetting.off.controllerMode(video: false), FlashMode.off);
      expect(FlashSetting.on.controllerMode(video: false), FlashMode.always);
      expect(FlashSetting.auto.controllerMode(video: false), FlashMode.auto);
      expect(FlashSetting.on.controllerMode(video: true), FlashMode.torch);
      expect(FlashSetting.auto.controllerMode(video: true), FlashMode.off);
      expect(FlashSetting.off.controllerMode(video: true), FlashMode.off);
    });

    test('screen flash for selfies: on always, auto only in low light', () {
      expect(FlashSetting.on.wantsScreenFlash(lowLight: false), isTrue);
      expect(FlashSetting.auto.wantsScreenFlash(lowLight: true), isTrue);
      expect(FlashSetting.auto.wantsScreenFlash(lowLight: false), isFalse);
      expect(FlashSetting.off.wantsScreenFlash(lowLight: true), isFalse);
    });

    testWidgets('button cycles with each tap and shows the state', (t) async {
      var setting = FlashSetting.off;
      await t.pumpWidget(localizedApp(
        home: Scaffold(
          body: Center(
            child: StatefulBuilder(
              builder: (_, setState) => FlashButton(setting: setting, onPressed: () => setState(() => setting = setting.next)),
            ),
          ),
        ),
      ));
      final handle = t.ensureSemantics();
      expect(find.bySemanticsLabel('Flits: Uit'), findsOneWidget);
      expect(find.byIcon(Icons.flash_off_rounded), findsOneWidget);
      await t.tap(find.byKey(const ValueKey('flash-button')));
      await t.pumpAndSettle();
      expect(setting, FlashSetting.on);
      expect(find.bySemanticsLabel('Flits: Aan'), findsOneWidget);
      expect(find.byIcon(Icons.flash_on_rounded), findsOneWidget);
      expect(t.widget<Icon>(find.byIcon(Icons.flash_on_rounded)).color, FlashColors.on, reason: 'amber when on');
      await t.tap(find.byKey(const ValueKey('flash-button')));
      await t.pumpAndSettle();
      expect(find.bySemanticsLabel('Flits: Auto'), findsOneWidget);
      expect(find.byIcon(Icons.flash_auto_rounded), findsOneWidget, reason: 'bolt with a small A');
      await t.tap(find.byKey(const ValueKey('flash-button')));
      await t.pumpAndSettle();
      expect(setting, FlashSetting.off);
      handle.dispose();
      expect(t.getSize(find.byKey(const ValueKey('flash-button'))).height, greaterThanOrEqualTo(44));
      expect(t.getSize(find.byKey(const ValueKey('flash-button'))).width, greaterThanOrEqualTo(44));
    });

    testWidgets('borderless in every state: no outline, only a soft fill when on', (t) async {
      for (final setting in FlashSetting.values) {
        for (final hasFlash in [true, false]) {
          await t.pumpWidget(localizedApp(
            home: Scaffold(body: Center(child: FlashButton(setting: setting, hasFlash: hasFlash, onPressed: () {}))),
          ));
          await t.pumpAndSettle();
          final boxes = find.descendant(of: find.byKey(const ValueKey('flash-button')), matching: find.byWidgetPredicate((w) {
            final d = switch (w) {
              Container(:final decoration) => decoration,
              DecoratedBox(:final decoration) => decoration,
              _ => null,
            };
            return d is BoxDecoration && d.border != null;
          }));
          expect(boxes, findsNothing, reason: '$setting hasFlash=$hasFlash');
          final disc = t.widget<AnimatedContainer>(find.byKey(const ValueKey('flash-disc'))).decoration! as BoxDecoration;
          expect(disc.color, setting == FlashSetting.on && hasFlash ? FlashColors.onFill : Colors.transparent);
        }
      }
    });

    testWidgets('front camera: tooltip says screen flash', (t) async {
      await t.pumpWidget(localizedApp(
        home: Scaffold(body: Center(child: FlashButton(setting: FlashSetting.auto, screenFlash: true, onPressed: () {}))),
      ));
      expect(find.byWidgetPredicate((w) => w is Tooltip && w.message == 'Schermflits'), findsOneWidget);
    });

    testWidgets('camera without flash: disabled, explains why', (t) async {
      var taps = 0;
      await t.pumpWidget(localizedApp(
        home: Scaffold(body: Center(child: FlashButton(setting: FlashSetting.on, hasFlash: false, onPressed: () => taps++))),
      ));
      await t.tap(find.byKey(const ValueKey('flash-button')));
      await t.pumpAndSettle();
      expect(taps, 0);
      expect(find.text('Deze camera heeft geen flits'), findsOneWidget, reason: 'tooltip on tap');
      final icon = t.widget<Icon>(find.byIcon(Icons.flash_off_rounded));
      expect(icon.color, isNot(CT.ink), reason: 'greyed out');
      expect(icon.color, isNot(FlashColors.on));
    });
  });

  group('low light', () {
    test('hysteresis: enters below the low mark, leaves only above the high mark', () {
      final h = LowLightHysteresis(enterBelow: 40, exitAbove: 60, confirmSamples: 2, smoothing: 1);
      expect(h.add(100), isFalse);
      expect(h.add(30), isFalse, reason: 'one dark sample is not enough');
      expect(h.add(30), isTrue);
      // inside the band: stays dark
      expect(h.add(50), isTrue);
      expect(h.add(55), isTrue);
      expect(h.add(61), isTrue, reason: 'needs two samples above the high mark');
      expect(h.add(70), isFalse);
      // inside the band: stays light
      expect(h.add(45), isFalse);
      expect(h.add(45), isFalse);
    });

    test('does not flicker around one threshold', () {
      final h = LowLightHysteresis();
      final states = <bool>[];
      for (var i = 0; i < 40; i++) {
        states.add(h.add(i.isEven ? 38 : 48));
      }
      var flips = 0;
      for (var i = 1; i < states.length; i++) {
        if (states[i] != states[i - 1]) flips++;
      }
      expect(flips, lessThanOrEqualTo(1));
    });

    test('smoothing ignores a single bright frame', () {
      final h = LowLightHysteresis(enterBelow: 40, exitAbove: 60, confirmSamples: 2, smoothing: 0.5);
      for (var i = 0; i < 6; i++) {
        h.add(10);
      }
      expect(h.isLow, isTrue);
      expect(h.add(200), isTrue);
      expect(h.add(10), isTrue);
      h.reset();
      expect(h.isLow, isFalse);
    });

    test('average luma from a Y plane and from BGRA', () {
      const w = 64, h = 48;
      final y = Uint8List(w * h)..fillRange(0, w * h, 30);
      expect(averageLuma(bytes: y, width: w, height: h, bytesPerRow: w, bgra: false), closeTo(30, 0.01));

      // padded rows (bytesPerRow > width * 4)
      const stride = w * 4 + 16;
      final bgra = Uint8List(stride * h);
      for (var r = 0; r < h; r++) {
        for (var x = 0; x < w; x++) {
          final i = r * stride + x * 4;
          bgra[i] = 200; // B
          bgra[i + 1] = 100; // G
          bgra[i + 2] = 50; // R
          bgra[i + 3] = 255;
        }
      }
      expect(averageLuma(bytes: bgra, width: w, height: h, bytesPerRow: stride, bgra: true), closeTo(0.114 * 200 + 0.587 * 100 + 0.299 * 50, 0.01));
      expect(averageLuma(bytes: Uint8List(0), width: w, height: h, bytesPerRow: w, bgra: false), isNull);
    });

    testWidgets('pill reads the localized hint and turns the flash on', (t) async {
      var tapped = false;
      await t.pumpWidget(localizedApp(home: Scaffold(body: Center(child: LowLightPill(onTap: () => tapped = true)))));
      expect(find.text('Weinig licht - zet de flits aan'), findsOneWidget);
      expect(t.getSize(find.byKey(const ValueKey('low-light-pill'))).height, greaterThanOrEqualTo(44));
      await t.tap(find.byKey(const ValueKey('low-light-pill')));
      expect(tapped, isTrue);
    });
  });

  group('date stamp toggle reaches the processor', () {
    test('options follow the setting; selfies mirror only when asked', () {
      const on = CameraSettings();
      final off = on.copyWith(dateStamp: false, mirrorSelfies: false);
      final a = PhotoProcessOptions.from(on, frontCamera: true, stampText: "'27 07 13");
      expect(a.showDateStamp, isTrue);
      expect(a.dateStamp, "'27 07 13");
      expect(a.mirror, isTrue);
      final b = PhotoProcessOptions.from(off, frontCamera: true, stampText: "'27 07 13");
      expect(b.showDateStamp, isFalse);
      expect(b.mirror, isFalse);
      expect(PhotoProcessOptions.from(on, frontCamera: false, stampText: 'x').mirror, isFalse);
    });

    test('processPhoto draws the stamp only when showDateStamp is on', () async {
      final src = img.Image(width: 1400, height: 1000);
      img.fill(src, color: img.ColorRgb8(60, 70, 80));
      final jpg = Uint8List.fromList(img.encodeJpg(src, quality: 95));

      final none = await processPhoto(jpg, styleId: 'film');
      final hidden = await processPhoto(jpg, styleId: 'film', dateStamp: "'27 07 13", showDateStamp: false);
      final shown = await processPhoto(jpg, styleId: 'film', dateStamp: "'27 07 13", showDateStamp: true);

      double cornerOrange(Uint8List bytes) {
        final im = img.decodeJpg(bytes)!;
        var score = 0.0;
        for (var y = im.height - 120; y < im.height - 20; y += 2) {
          for (var x = im.width - 420; x < im.width - 20; x += 2) {
            final p = im.getPixel(x, y);
            score += (p.r - p.b).toDouble();
          }
        }
        return score;
      }

      expect(hidden.original, none.original, reason: 'stamp off = same pixels as no stamp');
      expect(cornerOrange(shown.original), greaterThan(cornerOrange(hidden.original) * 1.5));
    });
  });
}
