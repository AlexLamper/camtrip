@Tags(['visual'])
library;

import 'dart:io';
import 'dart:ui' as ui;

import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/camera/camera_picker_sheet.dart';
import 'package:camtrip/features/camera/styles.dart';
import 'package:camtrip/features/premium/pro_gate.dart';
import 'package:camtrip/l10n/l10n.dart';
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

      await tester.pumpWidget(
        RepaintBoundary(
          key: key,
          child: localizedApp(
            locale: locale,
            theme: CT.theme(),
            debugShowCheckedModeBanner: false,
            home: Builder(
              builder: (context) {
                ctx = context;
                return Scaffold(
                  backgroundColor: CT.bg,
                  body: Center(
                    child: CameraPickerButton(style: CameraStyle.instant, onTap: () {}),
                  ),
                );
              },
            ),
          ),
        ),
      );
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
        if (locale == dutch) await shot('preview_compact');
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

  // Every language at a small phone (375x667), at normal and large text:
  // no layout overflow, and no camera name cut off or shrunk much.
  for (final scale in [1.0, 1.3]) {
    testWidgets('picker fits every language at 375x667, text x$scale', (tester) async {
      tester.view.physicalSize = const Size(375, 667) * 2;
      tester.view.devicePixelRatio = 2;
      addTearDown(tester.view.reset);
      final cut = <String>[];
      var smallestName = 1.0;
      var cards = 0;
      final key = GlobalKey();
      for (final locale in L10n.supportedLocales) {
        await tester.pumpWidget(
          RepaintBoundary(
            key: key,
            child: localizedApp(
              locale: locale,
              debugShowCheckedModeBanner: false,
              theme: CT.theme(),
              builder: (context, child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(scale)),
                child: child!,
              ),
              home: Scaffold(
                backgroundColor: CT.bg,
                body: SafeArea(
                  child: CameraPickerSheet(key: ValueKey(locale), current: CameraStyle.instant, gate: const ProGate(personal: false)),
                ),
              ),
            ),
          ),
        );
        await tester.pump();
        final seen = <String>{};
        void check() {
          expect(tester.takeException(), isNull, reason: '$locale x$scale');
          for (final card in find.byType(CameraCard).evaluate()) {
            final style = (card.widget as CameraCard).style;
            if (!seen.add(style.id)) continue;
            cards++;
            final texts = find.descendant(of: find.byWidget(card.widget), matching: find.byType(RichText));
            for (final t in texts.evaluate()) {
              final p = t.renderObject! as RenderParagraph;
              final text = p.text.toPlainText();
              if (text == style.name) {
                // the name sits in a FittedBox that scales it down to fit the card
                final fitted = tester.getSize(find.ancestor(of: find.byWidget(t.widget), matching: find.byType(FittedBox)).first);
                final shrink = fitted.width / p.size.width;
                if (shrink < smallestName) smallestName = shrink;
                // never cut off, and never drawn much smaller than the normal 13pt
                if (p.didExceedMaxLines || 13 * scale * shrink < 11.5) cut.add('$locale: $text (${(shrink * 100).round()}%)');
              }
            }
          }
        }

        check();
        if (out != null && (locale.languageCode == 'de' || locale.languageCode == 'tr')) {
          final boundary = key.currentContext!.findRenderObject()! as RenderRepaintBoundary;
          final bytes = await tester.runAsync(() async {
            final image = await boundary.toImage(pixelRatio: 2);
            return (await image.toByteData(format: ui.ImageByteFormat.png))!.buffer.asUint8List();
          });
          Directory(out).createSync(recursive: true);
          File('$out/preview_compact_375_${locale.languageCode}_x$scale.png').writeAsBytesSync(bytes!);
        }
        for (var i = 0; i < 6; i++) {
          await tester.drag(find.byType(CustomScrollView), const Offset(0, -300));
          await tester.pumpAndSettle();
          check();
        }
        expect(seen.length, CameraStyle.all.length, reason: 'all cards built in $locale');
      }
      // ignore: avoid_print
      print('x$scale: $cards cards checked, smallest name drawn at ${(smallestName * 100).round()}%');
      expect(cut, isEmpty, reason: 'camera names cut off');
    });
  }
}
