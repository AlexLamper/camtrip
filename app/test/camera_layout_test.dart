import 'package:camera/camera.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/camera/camera_layout.dart';
import 'package:camtrip/features/camera/camera_picker_sheet.dart';
import 'package:camtrip/features/camera/camera_settings.dart';
import 'package:camtrip/features/camera/flash_control.dart';
import 'package:camtrip/features/camera/shutter_button.dart';
import 'package:camtrip/features/camera/styles.dart';
import 'package:camtrip/features/camera/viewfinder_overlays.dart';
import 'package:flutter/gestures.dart' show kDoubleTapTimeout;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/l10n.dart';

const _flash = ValueKey('flash-button');
const _flip = ValueKey('camera-flip-button');
const _picker = ValueKey('camera-picker-button');
const _vf = ValueKey('viewfinder-gestures');

/// The camera screen's chrome as CameraScreen builds it, with a coloured box
/// for the live preview.
Widget _screen({
  String group = 'Zomer in Zeeland · 6',
  VoidCallback? onDoubleTap,
  VoidCallback? onFlip,
  VoidCallback? onShutter,
  int flips = 0,
  bool front = false,
}) =>
    localizedApp(
      theme: CT.theme(),
      home: Scaffold(
        backgroundColor: CT.bg,
        body: SafeArea(
          child: CameraScreenLayout(
            topBar: CameraTopBar(groupPill: CameraGroupPill(label: group, onTap: () {}), onClose: () {}, onSettings: () {}),
            viewfinder: ViewfinderFlip(
              flips: flips,
              onDoubleTap: onDoubleTap,
              child: const ViewfinderFrame(instant: false, child: ColoredBox(color: Colors.blueGrey)),
            ),
            controls: CameraControlsRow(
              flash: FlashButton(setting: FlashSetting.auto, onPressed: () {}),
              selector: CameraPickerButton(style: CameraStyle.defaultStyle, onTap: () {}),
              flip: CameraFlipButton(front: front, onPressed: onFlip),
            ),
            modeSwitch: CameraModeSwitch(videoMode: false, onChanged: (_) {}),
            lastShot: const LastShotThumb(thumb: null, pending: 0),
            shutter: ShutterButton(videoMode: false, recording: false, busy: false, onTap: onShutter),
            timer: CameraTimerButton(timer: ShutterTimer.off, onPressed: () {}),
          ),
        ),
      ),
    );

void _phone(WidgetTester t, Size size) {
  t.view.physicalSize = size * 3;
  t.view.devicePixelRatio = 3;
  addTearDown(t.view.reset);
}

void main() {
  setUpAll(useDutch);

  group('layout', () {
    for (final size in const [Size(375, 667), Size(440, 956)]) {
      testWidgets('[flash] [camera] [flip] under the viewfinder, symmetric, ${size.width.toInt()}x${size.height.toInt()}', (t) async {
        _phone(t, size);
        await t.pumpWidget(_screen(group: 'Kampeerweekend Ardennen met de hele vriendengroep · 12'));
        expect(t.takeException(), isNull, reason: 'no overflow');

        final flash = t.getCenter(find.byKey(_flash));
        final picker = t.getCenter(find.byKey(_picker));
        final flip = t.getCenter(find.byKey(_flip));
        // one row, in this order, camera exactly in the middle
        expect(flash.dx, lessThan(t.getRect(find.byKey(_picker)).left));
        expect(flip.dx, greaterThan(t.getRect(find.byKey(_picker)).right));
        expect(flash.dy, closeTo(picker.dy, 1));
        expect(flip.dy, closeTo(picker.dy, 1));
        expect(picker.dx, closeTo(size.width / 2, 1));
        expect(flash.dx, closeTo(size.width - flip.dx, 1), reason: 'same distance from both edges');

        // top to bottom: top bar, viewfinder, controls, FOTO|VIDEO, shutter
        final vf = t.getRect(find.byKey(_vf));
        final settings = t.getRect(find.byKey(const ValueKey('camera-settings-button')));
        expect(settings.bottom, lessThanOrEqualTo(vf.top));
        expect(t.getRect(find.byKey(_picker)).top, greaterThan(vf.bottom));
        expect(t.getCenter(find.text('FOTO')).dy, greaterThan(t.getRect(find.byKey(_picker)).bottom));
        final shutter = t.getCenter(find.byKey(const ValueKey('shutter-ring')));
        expect(shutter.dy, greaterThan(t.getCenter(find.text('FOTO')).dy));
        expect(shutter.dx, closeTo(size.width / 2, 1));
        // the last shot sits under the flash button
        expect(t.getCenter(find.byKey(const ValueKey('camera-last-shot'))).dx, closeTo(flash.dx, 1));
        // and the self-timer mirrors it under the flip button, level with it
        final timer = t.getCenter(find.byKey(const ValueKey('camera-timer-button')));
        expect(timer.dx, closeTo(flip.dx, 1));
        expect(timer.dy, closeTo(t.getCenter(find.byKey(const ValueKey('camera-last-shot'))).dy, 1));

        // 44pt+ targets
        for (final k in [_flash, _flip, _picker, const ValueKey('camera-timer-button')]) {
          expect(t.getSize(find.byKey(k)).height, greaterThanOrEqualTo(44), reason: '$k');
          expect(t.getSize(find.byKey(k)).width, greaterThanOrEqualTo(44), reason: '$k');
        }
      });
    }

    testWidgets('top bar holds only close, the group and "..."', (t) async {
      _phone(t, const Size(390, 844));
      await t.pumpWidget(_screen());
      final vfTop = t.getRect(find.byKey(_vf)).top;
      expect(t.getCenter(find.byKey(_flash)).dy, greaterThan(vfTop), reason: 'flash left the top bar');
      expect(t.getCenter(find.byKey(_flip)).dy, greaterThan(vfTop), reason: 'flip left the top bar');
      final bar = find.byType(CameraTopBar);
      expect(find.descendant(of: bar, matching: find.byType(IconButton)), findsNWidgets(2));
      expect(find.descendant(of: bar, matching: find.byType(CameraGroupPill)), findsOneWidget);
    });

    testWidgets('group pill: wide, no outline, centred, long names ellipsized', (t) async {
      _phone(t, const Size(440, 956));
      const long = 'Kampeerweekend Ardennen met de hele vriendengroep · 12';
      await t.pumpWidget(_screen(group: long));
      final body = find.byKey(const ValueKey('camera-group-pill-body'));
      final deco = t.widget<AnimatedContainer>(body).decoration! as BoxDecoration;
      expect(deco.border, isNull);
      expect(deco.color, CameraGroupPill.fill);
      expect(t.getSize(body).width, greaterThan(250), reason: 'uses the room flash and flip left');
      expect(t.getCenter(body).dx, closeTo(220, 1));
      expect(t.widget<Text>(find.text(long)).overflow, TextOverflow.ellipsis);
      // darkens while pressed
      final g = await t.startGesture(t.getCenter(body));
      await t.pumpAndSettle();
      expect((t.widget<AnimatedContainer>(body).decoration! as BoxDecoration).color, CameraGroupPill.fillPressed);
      await g.up();
      await t.pumpAndSettle();
    });

    testWidgets('every camera name fits the selector on a small phone without overflow', (t) async {
      _phone(t, const Size(320, 568));
      for (final style in CameraStyle.all) {
        await t.pumpWidget(localizedApp(
          home: Scaffold(
            body: CameraControlsRow(
              flash: FlashButton(setting: FlashSetting.on, onPressed: () {}),
              selector: CameraPickerButton(style: style, onTap: () {}),
              flip: CameraFlipButton(front: false, onPressed: () {}),
            ),
          ),
        ));
        expect(t.takeException(), isNull, reason: style.id);
      }
    });
  });

  group('flip', () {
    test('never while recording, counting down, capturing or already flipping', () {
      expect(canFlipCamera(cameras: 2, recording: false, countingDown: false, busy: false), isTrue);
      expect(canFlipCamera(cameras: 1, recording: false, countingDown: false, busy: false), isFalse);
      expect(canFlipCamera(cameras: 2, recording: true, countingDown: false, busy: false), isFalse);
      expect(canFlipCamera(cameras: 2, recording: false, countingDown: true, busy: false), isFalse);
      expect(canFlipCamera(cameras: 2, recording: false, countingDown: false, busy: true), isFalse);
      expect(canFlipCamera(cameras: 2, recording: false, countingDown: false, busy: false, switching: true), isFalse);
    });

    test('goes to the camera facing the other way', () {
      const back = CameraDescription(name: '0', lensDirection: CameraLensDirection.back, sensorOrientation: 90);
      const wide = CameraDescription(name: '2', lensDirection: CameraLensDirection.back, sensorOrientation: 90);
      const front = CameraDescription(name: '1', lensDirection: CameraLensDirection.front, sensorOrientation: 270);
      expect(flipTargetIndex([back, wide, front], 0), 2);
      expect(flipTargetIndex([back, wide, front], 1), 2);
      expect(flipTargetIndex([back, wide, front], 2), 0);
      expect(flipTargetIndex([back, wide], 0), 1, reason: 'no front camera: next one');
      expect(flipTargetIndex([back], 0), 0);
    });

    testWidgets('double tap on the viewfinder flips; one tap does not; the shutter is never fired', (t) async {
      _phone(t, const Size(390, 844));
      var flips = 0;
      var shots = 0;
      await t.pumpWidget(_screen(onDoubleTap: () => flips++, onShutter: () => shots++));
      final vf = find.byKey(_vf);
      await t.tap(vf);
      await t.pump(kDoubleTapTimeout + const Duration(milliseconds: 50));
      expect(flips, 0);
      await t.tap(vf);
      await t.pump(const Duration(milliseconds: 60));
      await t.tap(vf);
      await t.pumpAndSettle();
      expect(flips, 1);
      expect(shots, 0);
    });

    testWidgets('single tap (focus) still works next to the double tap', (t) async {
      var taps = 0;
      var doubles = 0;
      await t.pumpWidget(localizedApp(
        home: ViewfinderFlip(flips: 0, onTap: () => taps++, onDoubleTap: () => doubles++, child: const SizedBox.expand()),
      ));
      await t.tap(find.byKey(_vf));
      await t.pump(kDoubleTapTimeout + const Duration(milliseconds: 50));
      expect((taps, doubles), (1, 0));
    });

    testWidgets('ignored while recording: the screen passes no double-tap handler', (t) async {
      var flips = 0;
      var recording = true;
      late StateSetter set;
      await t.pumpWidget(localizedApp(
        home: StatefulBuilder(builder: (context, setState) {
          set = setState;
          // same wiring as CameraScreen
          final canFlip = canFlipCamera(cameras: 2, recording: recording, countingDown: false, busy: false);
          return ViewfinderFlip(flips: 0, onDoubleTap: canFlip ? () => flips++ : null, child: const SizedBox.expand());
        }),
      ));
      Future<void> doubleTap() async {
        await t.tap(find.byKey(_vf));
        await t.pump(const Duration(milliseconds: 60));
        await t.tap(find.byKey(_vf));
        await t.pumpAndSettle();
      }

      await doubleTap();
      expect(flips, 0);
      set(() => recording = false);
      await t.pump();
      await doubleTap();
      expect(flips, 1);
    });

    testWidgets('a flip turns the viewfinder card in 3D and settles flat', (t) async {
      Widget vf(int n) => localizedApp(home: ViewfinderFlip(flips: n, child: const SizedBox.expand(key: ValueKey('vf-child'))));
      await t.pumpWidget(vf(0));
      Transform? turning() {
        final f = find.ancestor(of: find.byKey(const ValueKey('vf-child')), matching: find.byType(Transform));
        return f.evaluate().isEmpty ? null : t.widget<Transform>(f.first);
      }

      expect(turning(), isNull, reason: 'no transform at rest');
      await t.pumpWidget(vf(1));
      await t.pump(ViewfinderFlip.duration ~/ 3);
      final m = turning()!.transform;
      expect(m.entry(0, 0), lessThan(0.9), reason: 'rotated around Y');
      await t.pumpAndSettle();
      expect(turning(), isNull);
    });

    testWidgets('flip button: 44pt+, disabled without a handler, turns for the selfie camera', (t) async {
      var taps = 0;
      await t.pumpWidget(localizedApp(home: Scaffold(body: Center(child: CameraFlipButton(front: false, onPressed: () => taps++)))));
      await t.tap(find.byKey(_flip));
      expect(taps, 1);
      expect(t.getSize(find.byKey(_flip)).width, greaterThanOrEqualTo(44));
      expect(find.byWidgetPredicate((w) => w is Tooltip && w.message == 'Wissel tussen voor- en achtercamera'), findsOneWidget);
      await t.pumpWidget(localizedApp(home: const Scaffold(body: Center(child: CameraFlipButton(front: true, onPressed: null)))));
      await t.pumpAndSettle();
      expect(t.widget<AnimatedRotation>(find.byType(AnimatedRotation)).turns, 0.5);
      await t.tap(find.byKey(_flip));
      expect(taps, 1);
    });
  });
}
