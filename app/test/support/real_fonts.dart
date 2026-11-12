import 'dart:convert';

import 'package:flutter/services.dart';

/// Loads the app's real fonts (Inter, Inter Display, Material Icons) from the
/// asset bundle, so text in widget tests has its real size instead of the
/// square test font.
Future<void> loadRealFonts() async {
  final manifest = jsonDecode(await rootBundle.loadString('FontManifest.json')) as List;
  for (final entry in manifest.cast<Map<String, dynamic>>()) {
    final loader = FontLoader(entry['family'] as String);
    for (final font in (entry['fonts'] as List).cast<Map<String, dynamic>>()) {
      loader.addFont(rootBundle.load(font['asset'] as String));
    }
    await loader.load();
  }
}
