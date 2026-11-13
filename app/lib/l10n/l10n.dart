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

  /// Starts in the language picked in Settings (null = the phone's), before
  /// the first frame, so code without a BuildContext matches the UI at once.
  static void init(Locale? chosen) => setLocale(chosen ?? resolve(PlatformDispatcher.instance.locales));

  @visibleForTesting
  static void setLocale(Locale locale) {
    _locale = locale;
    _current = lookupAppLocalizations(locale);
    Intl.defaultLocale = intlLocaleFor(locale);
  }

  /// Picks the app language for the device's preferred languages: the first
  /// one we support wins (Dutch stays Dutch), anything else gets English.
  /// Brazilian Portuguese is its own language; other Portuguese gets pt-PT.
  /// Norwegian (no / nn) uses Bokmål. Chinese in Traditional script (zh-Hant,
  /// or Taiwan / Hong Kong / Macau) gets Traditional, all other Chinese
  /// Simplified. Old codes (iw, in, tl) map to he, id and fil.
  static Locale resolve(List<Locale>? preferred) {
    for (final l in preferred ?? const <Locale>[]) {
      final lang = switch (l.languageCode.toLowerCase()) {
        'no' || 'nn' || 'nb' => 'nb',
        'iw' => 'he',
        'in' => 'id',
        'tl' => 'fil',
        final c => c,
      };
      final country = (l.countryCode ?? '').toUpperCase();
      if (lang == 'pt') {
        return country == 'BR' ? const Locale('pt', 'BR') : const Locale('pt');
      }
      if (lang == 'zh') {
        final script = l.scriptCode?.toLowerCase();
        final traditional = script == 'hant' || (script == null && const {'TW', 'HK', 'MO'}.contains(country));
        return traditional ? traditionalChinese : const Locale('zh');
      }
      for (final s in supportedLocales) {
        if (s.languageCode == lang && s.countryCode == null && s.scriptCode == null) return s;
      }
    }
    return const Locale('en');
  }

  /// zh-Hant: Traditional Chinese (Taiwan, Hong Kong).
  static const traditionalChinese = Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');

  /// The stored form of an app language: "nl", "pt_BR", "zh_Hant".
  static String tagOf(Locale l) => [l.languageCode, ?l.scriptCode, ?l.countryCode].join('_');

  /// The other way around; null for anything we don't support.
  static Locale? parseTag(String? tag) {
    if (tag == null || tag.isEmpty) return null;
    for (final s in supportedLocales) {
      if (tagOf(s) == tag) return s;
    }
    return null;
  }

  /// For MaterialApp.localeListResolutionCallback.
  static Locale resolveList(List<Locale>? preferred, Iterable<Locale> _) => resolve(preferred);

  static String intlLocaleFor(Locale l) {
    return switch (l.languageCode) {
      'pt' => l.countryCode == 'BR' ? 'pt_BR' : 'pt_PT',
      'zh' => l.scriptCode == 'Hant' ? 'zh_TW' : 'zh_CN',
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
