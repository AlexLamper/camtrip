import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';

import 'app_localizations.dart';

export 'app_localizations.dart';

/// App-wide access to the UI language.
///
/// Widgets use `context.l10n`. Code without a [BuildContext] (controllers,
/// models, the API client) uses [L10n.current], which always matches the
/// language the app is shown in: [L10n.delegate] updates it whenever
/// Flutter loads the strings for a locale.
class L10n {
  L10n._();

  static Locale _locale = resolve(PlatformDispatcher.instance.locales);
  static AppLocalizations? _current;

  /// The language the app is shown in.
  static Locale get locale => _locale;

  /// Strings for [locale], for code that has no BuildContext.
  static AppLocalizations get current => _current ??= lookupAppLocalizations(_locale);

  /// The locale name for package:intl (DateFormat, NumberFormat), e.g. "pt_BR".
  static String get intlLocale => intlLocaleFor(_locale);

  static const supportedLocales = AppLocalizations.supportedLocales;

  /// Use this list instead of `AppLocalizations.localizationsDelegates`, so
  /// [current] and `Intl.defaultLocale` follow the shown language.
  static const List<LocalizationsDelegate<dynamic>> delegates = [
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  static const LocalizationsDelegate<AppLocalizations> delegate = _TrackingDelegate();

  @visibleForTesting
  static void setLocale(Locale locale) {
    _locale = locale;
    _current = lookupAppLocalizations(locale);
    Intl.defaultLocale = intlLocaleFor(locale);
  }

  /// Picks the app language for the device's preferred languages: the first
  /// one we support wins (Dutch stays Dutch), anything else gets English.
  /// Brazilian Portuguese is its own language; other Portuguese gets pt-PT.
  /// Norwegian (no / nn) uses Bokmål, every Chinese variant Simplified.
  static Locale resolve(List<Locale>? preferred) {
    for (final l in preferred ?? const <Locale>[]) {
      final lang = switch (l.languageCode.toLowerCase()) {
        'no' || 'nn' || 'nb' => 'nb',
        final c => c,
      };
      if (lang == 'pt') {
        return (l.countryCode ?? '').toUpperCase() == 'BR' ? const Locale('pt', 'BR') : const Locale('pt');
      }
      for (final s in supportedLocales) {
        if (s.languageCode == lang && s.countryCode == null) return s;
      }
    }
    return const Locale('en');
  }

  /// For MaterialApp.localeListResolutionCallback.
  static Locale resolveList(List<Locale>? preferred, Iterable<Locale> _) => resolve(preferred);

  static String intlLocaleFor(Locale l) {
    return switch (l.languageCode) {
      'pt' => l.countryCode == 'BR' ? 'pt_BR' : 'pt_PT',
      'zh' => 'zh_CN',
      _ => l.languageCode,
    };
  }
}

class _TrackingDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _TrackingDelegate();

  @override
  bool isSupported(Locale locale) => AppLocalizations.delegate.isSupported(locale);

  @override
  Future<AppLocalizations> load(Locale locale) {
    L10n.setLocale(locale);
    return SynchronousFuture(L10n.current);
  }

  @override
  bool shouldReload(_TrackingDelegate old) => false;
}

extension L10nContext on BuildContext {
  /// The strings for the language this widget is shown in.
  AppLocalizations get l10n => AppLocalizations.of(this);
}
