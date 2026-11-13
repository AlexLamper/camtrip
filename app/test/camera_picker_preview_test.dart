@Tags(['visual'])
library;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/camera/camera_picker_sheet.dart';
import 'package:camtrip/features/camera/styles.dart';
import 'package:camtrip/features/premium/pro_gate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/l10n.dart';
import 'support/real_fonts.dart';

/// Renders the camera picker with real fonts and images to PNG.
/// Run with: CAMTRIP_PREVIEW=/tmp/camera_picker flutter test test/camera_picker_preview_test.dart
void main() {
  final out = Platform.environment['CAMTRIP_PREVIEW'];
  setUpAll(loadRealFonts);

  for (final locale in [dutch, const Locale('en'), const Locale('ja')]) {
    testWidgets('preview picker ${locale.languageCode}', (tester) async {
      tester.view.physicalSize = const Size(390, 844) * 3;
      tester.view.devicePixelRatio = 3;
      tester.view.padding = const FakeViewPadding(top: 47 * 3, bottom: 34 * 3);
      addTearDown(tester.view.reset);
      debugDisableShadows = false;
      addTearDown(() => debugDisableShadows = true);
      final key = GlobalKey();
      late BuildContext ctx;

      await tester.pumpWidget(RepaintBoundary(
        key: key,
        child: localizedApp(
          locale: locale,
          theme: CT.theme(),
          debugShowCheckedModeBanner: false,
          home: Builder(builder: (context) {
            ctx = context;
            return Scaffold(
              backgroundColor: CT.bg,
              body: Center(child: CameraPickerButton(style: CameraStyle.instant, onTap: () {})),
            );
          }),
        ),
      ));
      await tester.runAsync(() async {
        for (final s in CameraStyle.all) {
          await precacheImage(AssetImage(s.art), ctx);
        }
        await precacheImage(const AssetImage(cameraPickerSamplePhoto), ctx);
        await precacheImage(const AssetImage('assets/images/light_leak.png'), ctx);
        await precacheImage(const AssetImage('assets/images/grain.png'), ctx);
      });
      showCameraPicker(ctx, current: CameraStyle.instant, gate: const ProGate(personal: false));
      await tester.pumpAndSettle();
      await tester.runAsync(() => Future<void>.delayed(const Duration(milliseconds: 300)));
      await tester.pumpAndSettle();
      expect(tester.takeException(), isNull);

      if (out != null) {
        Future<void> shot(String name) async {
          final boundary = key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
          final bytes = await tester.runAsync(() async {
            final image = await boundary.toImage(pixelRatio: 3);
            return (await image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
          });
          Directory(out).createSync(recursive: true);
          File('$out/$name.png').writeAsBytesSync(bytes!);
        }

        final suffix = locale.languageCode == 'nl' ? '' : '_${locale.languageCode}';
        await shot('preview$suffix');
        for (var i = 0; i < 3; i++) {
          await tester.drag(find.byType(CustomScrollView), const Offset(0, -500));
          await tester.pumpAndSettle();
        }
        await shot('preview${suffix}_scrolled');
        await tester.drag(find.byType(CustomScrollView), const Offset(0, -2000));
        await tester.pumpAndSettle();
        await shot('preview${suffix}_end');
      }
    });
  }
}
