import 'package:flutter/cupertino.dart' show CupertinoPageTransitionsBuilder;
import 'package:flutter/material.dart';

/// Design "E - Instant Wit": white/cream, ink, one orange-red accent, and
/// every photo shown as an instant print.
class CT {
  CT._();

  static const bg = Color(0xFFFBFAF7);
  static const paper = Colors.white;
  static const ink = Color(0xFF1D1D1B);
  static const muted = Color(0xFF777770);
  static const line = Color(0xFFE6E2D9);
  static const accent = Color(0xFFD9472B);
  static const accentDark = Color(0xFFB8361E);
  static const cream = Color(0xFFF3ECE0);
  static const warnBg = Color(0xFFFFF4E5);
  static const warn = Color(0xFFEF8A2C);
  static const success = Color(0xFF3C8D5A);

  static const display = 'InterDisplay';
  static const body = 'Inter';

  static TextStyle title(double size, {Color color = ink, FontWeight weight = FontWeight.w700}) =>
      TextStyle(fontFamily: display, fontSize: size, fontWeight: weight, letterSpacing: -0.4, height: 1.1, color: color);

  static TextStyle text(double size, {Color color = ink, FontWeight weight = FontWeight.w400, double height = 1.4}) =>
      TextStyle(fontFamily: body, fontSize: size, fontWeight: weight, color: color, height: height);

  static const label = TextStyle(fontFamily: body, fontSize: 12, fontWeight: FontWeight.w600, color: Color(0xFF888880), letterSpacing: 0.4);

  static List<BoxShadow> printShadow = const [BoxShadow(color: Color(0x1F000000), blurRadius: 12, offset: Offset(0, 3))];
  static List<BoxShadow> cardShadow = const [BoxShadow(color: Color(0x12000000), blurRadius: 12, offset: Offset(0, 3))];

  static ThemeData theme() {
    final base = ThemeData(
      useMaterial3: true,
      fontFamily: body,
      scaffoldBackgroundColor: bg,
      colorScheme: ColorScheme.fromSeed(seedColor: accent, primary: accent, surface: bg, brightness: Brightness.light),
    );
    return base.copyWith(
      appBarTheme: const AppBarTheme(
        backgroundColor: bg,
        foregroundColor: ink,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(fontFamily: body, fontSize: 16, fontWeight: FontWeight.w600, color: ink),
      ),
      snackBarTheme: const SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: ink,
        contentTextStyle: TextStyle(fontFamily: body, color: Colors.white, fontSize: 14),
      ),
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.all(Colors.white),
        trackColor: WidgetStateProperty.resolveWith((s) => s.contains(WidgetState.selected) ? success : const Color(0xFFDDDDDD)),
        trackOutlineColor: WidgetStateProperty.all(Colors.transparent),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: paper,
        contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
        enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: line, width: 1.5)),
        focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: ink, width: 1.5)),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
      ),
      bottomSheetTheme: const BottomSheetThemeData(backgroundColor: bg, showDragHandle: true),
      dialogTheme: const DialogThemeData(backgroundColor: bg),
      pageTransitionsTheme: pageTransitions,
    );
  }

  /// iOS/macOS: native Cupertino slide with swipe-back. Android and others:
  /// a light shared-axis fade (fade + slight horizontal slide).
  static const pageTransitions = PageTransitionsTheme(
    builders: {
      TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.macOS: CupertinoPageTransitionsBuilder(),
      TargetPlatform.android: SharedAxisFadePageTransitionsBuilder(),
      TargetPlatform.fuchsia: SharedAxisFadePageTransitionsBuilder(),
      TargetPlatform.linux: SharedAxisFadePageTransitionsBuilder(),
      TargetPlatform.windows: SharedAxisFadePageTransitionsBuilder(),
    },
  );

  /// Shared timing for app transitions.
  static const transitionDuration = Duration(milliseconds: 300);
  static const transitionCurve = Curves.easeOutCubic;
}

/// Fade-through / shared-axis style page transition: the new page fades in
/// while sliding a little from the right, the old page slides a little to
/// the left. Cheap (opacity + translate only).
class SharedAxisFadePageTransitionsBuilder extends PageTransitionsBuilder {
  const SharedAxisFadePageTransitionsBuilder();

  @override
  Duration get transitionDuration => CT.transitionDuration;

  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 250);

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    final inCurve = CurvedAnimation(parent: animation, curve: CT.transitionCurve, reverseCurve: Curves.easeInCubic);
    final outCurve = CurvedAnimation(parent: secondaryAnimation, curve: CT.transitionCurve, reverseCurve: Curves.easeInCubic);
    // The outgoing page only slides (no fade), so two opaque pages never
    // fade at the same time and the background never shows through.
    return SlideTransition(
      position: Tween(begin: Offset.zero, end: const Offset(-0.06, 0)).animate(outCurve),
      child: FadeTransition(
        opacity: CurvedAnimation(parent: animation, curve: const Interval(0.2, 1, curve: Curves.easeOut)),
        child: SlideTransition(
          position: Tween(begin: const Offset(0.08, 0), end: Offset.zero).animate(inCurve),
          child: child,
        ),
      ),
    );
  }
}
