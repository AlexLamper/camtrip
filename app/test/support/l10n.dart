import 'package:camtrip/l10n/l10n.dart';
import 'package:flutter/material.dart';

/// Dutch is the app's source language; most tests look for the Dutch text.
const dutch = Locale('nl');

/// Makes [L10n.current] (strings used outside widgets) Dutch for a test file.
void useDutch() => L10n.setLocale(dutch);

/// A MaterialApp with the app's localizations, in [locale] (Dutch by default).
MaterialApp localizedApp({
  Widget? home,
  Locale locale = dutch,
  ThemeData? theme,
  TransitionBuilder? builder,
  bool debugShowCheckedModeBanner = true,
}) =>
    MaterialApp(
      home: home,
      theme: theme,
      builder: builder,
      debugShowCheckedModeBanner: debugShowCheckedModeBanner,
      locale: locale,
      supportedLocales: L10n.supportedLocales,
      localizationsDelegates: L10n.delegates,
    );
