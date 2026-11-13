@Tags(['visual'])
library;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/camera/camera_layout.dart';
import 'package:camtrip/features/camera/camera_picker_sheet.dart';
import 'package:camtrip/features/camera/camera_settings.dart';
import 'package:camtrip/features/camera/flash_control.dart';
import 'package:camtrip/features/camera/shutter_button.dart';
import 'package:camtrip/features/camera/styles.dart';
import 'package:camtrip/features/camera/viewfinder_overlays.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/l10n.dart';
import 'support/real_fonts.dart';

const _photo = 'assets/images/onboarding/s3_mountains.jpg';

/// Renders the camera screen's chrome around a still photo standing in for
/// the live preview, with real fonts, to PNG.
/// Run with: CAMTRIP_PREVIEW=/tmp/camera_layout flutter test test/camera_layout_preview_test.dart
void main() {
  final out = Platform.environment['CAMTRIP_PREVIEW'];
  setUpAll(loadRealFonts);

  final cases = <(String, Size, double, double, FlashSetting, CameraStyle, String)>[
    ('preview_v2', const Size(440, 956), 62, 34, FlashSetting.auto, CameraStyle.defaultStyle, 'Zomer in Zeeland · 6'),
    ('preview', const Size(440, 956), 62, 34, FlashSetting.auto, CameraStyle.defaultStyle, 'Zomer in Zeeland · 6'),
    ('preview_small', const Size(375, 667), 20, 0, FlashSetting.on, CameraStyle.defaultStyle, 'Kampeerweekend Ardennen met de hele vriendengroep · 12'),
    ('preview_instant', const Size(390, 844), 47, 34, FlashSetting.off, CameraStyle.instant, 'Texel · 4'),
  ];

  for (final (name, size, top, bottom, flash, style, group) in cases) {
    testWidgets('preview $name', (tester) async {
      tester.view.physicalSize = size * 3;
      tester.view.devicePixelRatio = 3;
      tester.view.padding = FakeViewPadding(top: top * 3, bottom: bottom * 3);
      addTearDown(tester.view.reset);
      debugDisableShadows = false;
      addTearDown(() => debugDisableShadows = true);
      final key = GlobalKey();
      late BuildContext ctx;

      await tester.pumpWidget(RepaintBoundary(
        key: key,
        child: localizedApp(
          theme: CT.theme(),
          debugShowCheckedModeBanner: false,
          home: Builder(builder: (context) {
            ctx = context;
            return Scaffold(
              backgroundColor: CT.bg,
              body: SafeArea(
                child: CameraScreenLayout(
                  topBar: CameraTopBar(groupPill: CameraGroupPill(label: group, onTap: () {}), onClose: () {}, onSettings: () {}),
                  viewfinder: ViewfinderFlip(
                    flips: 0,
                    onDoubleTap: () {},
                    child: ViewfinderFrame(
                      instant: style.frame == FrameKind.instant,
                      caption: '13 nov · ${group.split(' · ').first}',
                      child: StyleSample(style, photo: _photo),
                    ),
                  ),
                  controls: CameraControlsRow(
                    flash: FlashButton(setting: flash, onPressed: () {}),
                    selector: CameraPickerButton(style: style, onTap: () {}),
                    flip: CameraFlipButton(front: false, onPressed: () {}),
                  ),
                  modeSwitch: CameraModeSwitch(videoMode: false, onChanged: (_) {}),
                  // v2: the last shot shows a real photo and the quick timer is on 3 s
                  lastShot: LastShotThumb(image: name == 'preview_v2' ? const AssetImage(_photo) : null, pending: 2),
                  shutter: const ShutterButton(videoMode: false, recording: false, busy: false),
                  timer: CameraTimerButton(timer: name == 'preview_v2' ? ShutterTimer.three : ShutterTimer.off, onPressed: () {}),
                ),
              ),
            );
          }),
        ),
      ));
      await tester.runAsync(() async {
        await precacheImage(AssetImage(style.art), ctx);
        await precacheImage(const AssetImage(_photo), ctx);
        await precacheImage(const AssetImage('assets/images/light_leak.png'), ctx);
        await precacheImage(const AssetImage('assets/images/grain.png'), ctx);
      });
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      if (out != null) {
        final boundary = key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
        final bytes = await tester.runAsync(() async {
          final image = await boundary.toImage(pixelRatio: 2);
          return (await image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
        });
        Directory(out).createSync(recursive: true);
        File('$out/$name.png').writeAsBytesSync(bytes!);
      }
    });
  }
}
