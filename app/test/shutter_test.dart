import 'package:camtrip/core/router.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/camera/shutter_button.dart';
import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:go_router/go_router.dart';

Widget _wrap(Widget child) => MaterialApp(home: Scaffold(body: Center(child: child)));

BoxDecoration _disc(WidgetTester t) =>
    (t.widget<AnimatedContainer>(find.byKey(const ValueKey('shutter-disc'))).decoration ?? const BoxDecoration()) as BoxDecoration;

void main() {
  group('ShutterButton', () {
    testWidgets('photo mode is an ink disc in a white ring, not red', (t) async {
      await t.pumpWidget(_wrap(const ShutterButton(videoMode: false, recording: false, busy: false)));
      expect(_disc(t).color, ShutterColors.photo);
      expect(_disc(t).color, CT.ink);
      expect(_disc(t).color, isNot(CT.accent));
      final ring = t.widget<Container>(find.byKey(const ValueKey('shutter-ring'))).decoration as BoxDecoration;
      expect(ring.color, Colors.white);
    });

    testWidgets('video mode is a red disc', (t) async {
      await t.pumpWidget(_wrap(const ShutterButton(videoMode: true, recording: false, busy: false)));
      expect(_disc(t).color, CT.accent);
      expect(_disc(t).borderRadius, BorderRadius.circular(32));
    });

    testWidgets('recording is a red rounded square with a timer', (t) async {
      await t.pumpWidget(_wrap(const ShutterButton(
        videoMode: true,
        recording: true,
        busy: false,
        elapsed: Duration(seconds: 65),
      )));
      await t.pumpAndSettle();
      final disc = _disc(t);
      expect(disc.color, CT.accent);
      expect(disc.borderRadius, BorderRadius.circular(8));
      expect(t.getSize(find.byKey(const ValueKey('shutter-disc'))), const Size(32, 32));
      expect(find.text('1:05'), findsOneWidget);
    });

    testWidgets('animates from photo to video', (t) async {
      await t.pumpWidget(_wrap(const ShutterButton(videoMode: false, recording: false, busy: false)));
      await t.pumpWidget(_wrap(const ShutterButton(videoMode: true, recording: false, busy: false)));
      await t.pump(const Duration(milliseconds: 100));
      final mid = t.widget<DecoratedBox>(
        find.descendant(of: find.byKey(const ValueKey('shutter-disc')), matching: find.byType(DecoratedBox)).first,
      );
      final midColor = (mid.decoration as BoxDecoration).color!;
      expect(midColor, isNot(CT.ink));
      expect(midColor, isNot(CT.accent));
      await t.pumpAndSettle();
      final end = t.widget<DecoratedBox>(
        find.descendant(of: find.byKey(const ValueKey('shutter-disc')), matching: find.byType(DecoratedBox)).first,
      );
      expect((end.decoration as BoxDecoration).color, CT.accent);
    });

    testWidgets('hit target is at least 44pt', (t) async {
      await t.pumpWidget(_wrap(const ShutterButton(videoMode: false, recording: false, busy: false)));
      final size = t.getSize(find.byType(ShutterButton));
      expect(size.width, greaterThanOrEqualTo(44));
      expect(size.height, greaterThanOrEqualTo(44));
    });

    test('elapsed format', () {
      expect(ShutterButton.formatElapsed(const Duration(seconds: 7)), '0:07');
      expect(ShutterButton.formatElapsed(const Duration(seconds: 60)), '1:00');
    });
  });

  group('CameraModeSwitch', () {
    testWidgets('switches mode and has 44pt targets', (t) async {
      bool? picked;
      await t.pumpWidget(_wrap(CameraModeSwitch(videoMode: false, onChanged: (v) => picked = v)));
      expect(t.getSize(find.text('VIDEO')).height, lessThan(44));
      final target = find.ancestor(of: find.text('VIDEO'), matching: find.byType(ConstrainedBox)).first;
      expect(t.getSize(target).height, greaterThanOrEqualTo(44));
      await t.tap(find.text('VIDEO'));
      expect(picked, isTrue);
    });

    testWidgets('disabled while recording', (t) async {
      bool? picked;
      await t.pumpWidget(_wrap(CameraModeSwitch(videoMode: true, enabled: false, onChanged: (v) => picked = v)));
      await t.tap(find.text('FOTO'));
      expect(picked, isNull);
    });
  });

  group('transitions', () {
    test('theme uses Cupertino on iOS and shared-axis fade on Android', () {
      final b = CT.theme().pageTransitionsTheme.builders;
      expect(b[TargetPlatform.iOS], isA<CupertinoPageTransitionsBuilder>());
      expect(b[TargetPlatform.android], isA<SharedAxisFadePageTransitionsBuilder>());
    });

    testWidgets('modalPage is a fullscreen dialog that slides up', (t) async {
      final router = GoRouter(routes: [
        GoRoute(path: '/', builder: (_, _) => const Scaffold(body: Text('home'))),
        GoRoute(path: '/m', pageBuilder: (_, s) => modalPage(s, const Scaffold(body: Text('modal')))),
      ]);
      await t.pumpWidget(MaterialApp.router(theme: CT.theme(), routerConfig: router));
      router.push('/m');
      await t.pump();
      await t.pump(const Duration(milliseconds: 100));
      final mid = t.getTopLeft(find.text('modal')).dy;
      expect(mid, greaterThan(0));
      await t.pumpAndSettle();
      expect(t.getTopLeft(find.text('modal')).dy, lessThan(mid));
      final route = ModalRoute.of(t.element(find.text('modal')))! as PageRoute;
      expect(route.fullscreenDialog, isTrue);
    });
  });
}
