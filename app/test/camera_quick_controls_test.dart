import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/camera/camera_layout.dart';
import 'package:camtrip/features/camera/camera_settings.dart';
import 'package:camtrip/features/camera/camera_settings_sheet.dart';
import 'package:camtrip/features/camera/flash_control.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:image/image.dart' as img;
import 'package:shared_preferences/shared_preferences.dart';

import 'support/l10n.dart';

const _timer = ValueKey('camera-timer-button');
const _empty = ValueKey('camera-last-shot-empty');

/// The camera screen's quick timer: the button next to the shutter writes the
/// same setting the "..." sheet edits (as CameraScreen._cycleTimer does).
class _TimerHarness extends StatefulWidget {
  const _TimerHarness({required this.store});
  final CameraSettingsStore store;
  @override
  State<_TimerHarness> createState() => _TimerHarnessState();
}

class _TimerHarnessState extends State<_TimerHarness> {
  late CameraSettings settings = widget.store.read();

  void changed(CameraSettings next) => setState(() => settings = next);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: Column(children: [
          const SizedBox(height: 40),
          CameraTimerButton(
            timer: settings.timer,
            onPressed: () {
              final next = settings.copyWith(timer: nextQuickTimer(settings.timer));
              HapticFeedback.selectionClick();
              widget.store.write(next);
              changed(next);
            },
          ),
          Builder(
            builder: (c) => TextButton(
              onPressed: () => showCameraSettingsSheet(c, store: widget.store, settings: settings, onChanged: changed),
              child: const Text('open sheet'),
            ),
          ),
        ]),
      );
}

/// A small processed thumbnail, as the processor would hand it over.
Uint8List _jpeg() {
  final image = img.Image(width: 48, height: 64);
  img.fill(image, color: img.ColorRgb8(200, 80, 40));
  return Uint8List.fromList(img.encodeJpg(image));
}

void main() {
  setUpAll(useDutch);

  test('quick timer cycles Uit -> 3 s -> 10 s -> Uit', () {
    expect(nextQuickTimer(ShutterTimer.off), ShutterTimer.three);
    expect(nextQuickTimer(ShutterTimer.three), ShutterTimer.ten);
    expect(nextQuickTimer(ShutterTimer.ten), ShutterTimer.off);
  });

  group('timer button', () {
    late CameraSettingsStore store;
    setUp(() async {
      SharedPreferences.setMockInitialValues({});
      store = await CameraSettingsStore.load();
    });

    testWidgets('cycles with a haptic tick, shows the state and stays in step with the sheet', (t) async {
      t.view.physicalSize = const Size(430, 1400);
      t.view.devicePixelRatio = 1;
      addTearDown(t.view.reset);
      final haptics = <String>[];
      t.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, (call) async {
        if (call.method == 'HapticFeedback.vibrate') haptics.add(call.arguments as String);
        return null;
      });
      addTearDown(() => t.binding.defaultBinaryMessenger.setMockMethodCallHandler(SystemChannels.platform, null));
      final semantics = t.ensureSemantics();

      await t.pumpWidget(localizedApp(theme: CT.theme(), home: _TimerHarness(store: store)));
      expect(t.getSize(find.byKey(_timer)).width, greaterThanOrEqualTo(44));
      expect(t.getSize(find.byKey(_timer)).height, greaterThanOrEqualTo(44));
      expect(find.bySemanticsLabel('Zelfontspanner: Uit'), findsOneWidget);
      expect(find.byKey(const ValueKey('camera-timer-icon-off')), findsOneWidget);
      expect(find.text('3'), findsNothing);

      await t.tap(find.byKey(_timer));
      await t.pumpAndSettle();
      expect(store.read().timer, ShutterTimer.three);
      expect(find.text('3'), findsOneWidget, reason: 'small "3" badge');
      expect(t.widget<Icon>(find.byKey(const ValueKey('camera-timer-icon-three'))).color, CameraTimerButton.active);
      expect(CameraTimerButton.active, FlashColors.on, reason: 'the same amber as the flash');
      expect(find.bySemanticsLabel('Zelfontspanner: 3 s'), findsOneWidget);
      expect(haptics, ['HapticFeedbackType.selectionClick']);

      // the sheet opens on the same choice ...
      await t.tap(find.text('open sheet'));
      await t.pumpAndSettle();
      expect(t.widget<CupertinoSlidingSegmentedControl<ShutterTimer>>(find.byType(CupertinoSlidingSegmentedControl<ShutterTimer>)).groupValue,
          ShutterTimer.three);
      // ... and a change there shows on the button
      await t.tap(find.byKey(const ValueKey('segment-ShutterTimer.ten')));
      await t.pumpAndSettle();
      await t.tap(find.byTooltip('Sluiten').last);
      await t.pumpAndSettle();
      expect(find.text('10'), findsOneWidget);
      expect(store.read().timer, ShutterTimer.ten);

      await t.tap(find.byKey(_timer));
      await t.pumpAndSettle();
      expect(store.read().timer, ShutterTimer.off);
      expect(find.text('10'), findsNothing);
      expect(find.byKey(const ValueKey('camera-timer-icon-off')), findsOneWidget);
      semantics.dispose();
    });

    testWidgets('disabled: greyed out, no taps', (t) async {
      await t.pumpWidget(localizedApp(home: const Scaffold(body: Center(child: CameraTimerButton(timer: ShutterTimer.three, onPressed: null)))));
      final icon = t.widget<Icon>(find.byKey(const ValueKey('camera-timer-icon-three')));
      expect(icon.color, isNot(CameraTimerButton.active));
    });
  });

  group('last shot', () {
    test('newest wins; the local copy wins a near tie; none gives the empty print', () {
      final a = MemoryImage(Uint8List(1));
      final b = MemoryImage(Uint8List(2));
      final t0 = DateTime(2026, 11, 13, 12);
      expect(newestShot(const []), isNull);
      expect(newestShot([null, null]), isNull);
      expect(newestShot([LastShotCandidate(image: a, takenAt: t0), LastShotCandidate(image: b, takenAt: t0.add(const Duration(minutes: 1)))])!.image, b);
      // the uploaded copy of the shot just taken (server time a bit later)
      expect(
          newestShot([LastShotCandidate(image: a, takenAt: t0, local: true), LastShotCandidate(image: b, takenAt: t0.add(const Duration(milliseconds: 900)))])!
              .image,
          a);
    });

    testWidgets('empty print until a capture, then the processed photo with a pop; badge stays', (t) async {
      var shots = 0;
      ImageProvider? image;
      late StateSetter set;
      await t.pumpWidget(localizedApp(
        home: Scaffold(
          body: Center(
            child: StatefulBuilder(builder: (c, s) {
              set = s;
              return LastShotThumb(image: image, shotKey: shots, pending: 1, onTap: () {});
            }),
          ),
        ),
      ));
      expect(find.byKey(_empty), findsOneWidget);
      expect(find.byType(Image), findsNothing);
      expect(find.byKey(const ValueKey('camera-last-shot-pending')), findsOneWidget);
      expect(find.bySemanticsLabel(RegExp("Nog geen foto's")), findsOneWidget);

      // capture event: the processor's thumbnail arrives
      final provider = MemoryImage(_jpeg());
      set(() {
        image = provider;
        shots++;
      });
      await t.pump();
      final scale = t.widget<ScaleTransition>(find.descendant(of: find.byKey(const ValueKey('camera-last-shot')), matching: find.byType(ScaleTransition)).first);
      await t.pump(const Duration(milliseconds: 60));
      expect(scale.scale.value, lessThan(1), reason: 'pops in from small');
      await t.runAsync(() => precacheImage(provider, t.element(find.byKey(const ValueKey('camera-last-shot')))));
      await t.pumpAndSettle();
      expect(scale.scale.value, 1);
      expect(t.widget<Image>(find.byType(Image)).image, provider);
      expect(find.byKey(_empty), findsNothing);
      expect(find.byKey(const ValueKey('camera-last-shot-pending')), findsOneWidget);
      expect(find.bySemanticsLabel(RegExp('Laatste foto')), findsOneWidget);
    });

    testWidgets('a picture that cannot be read falls back to the empty print', (t) async {
      final broken = MemoryImage(Uint8List.fromList([1, 2, 3]));
      await t.pumpWidget(localizedApp(home: Scaffold(body: Center(child: LastShotThumb(image: broken, pending: 0)))));
      await t.runAsync(() async {
        try {
          await precacheImage(broken, t.element(find.byType(LastShotThumb)), onError: (_, _) {});
        } catch (_) {}
      });
      await t.pumpAndSettle();
      expect(find.byKey(_empty), findsOneWidget);
    });
  });
}
