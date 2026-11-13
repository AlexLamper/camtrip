import 'dart:convert';
import 'dart:io';

import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/format.dart';
import 'package:camtrip/l10n/l10n.dart';
import 'package:camtrip/l10n/languages.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

/// Every ARB in lib/l10n, by file name.
Map<String, Map<String, dynamic>> _arbs() => {
      for (final f in Directory('lib/l10n').listSync().whereType<File>().where((f) => f.path.endsWith('.arb')))
        f.uri.pathSegments.last: jsonDecode(f.readAsStringSync()) as Map<String, dynamic>,
    };

/// Placeholder names in an ICU message: "{name}", "{name, plural, ...}" and
/// the placeholders inside plural/select branches.
Set<String> _placeholdersIn(String message) {
  final found = <String>{};
  // Splits text into the contents of its top-level {...} groups.
  Iterable<String> groups(String text) sync* {
    var depth = 0, start = -1;
    for (var i = 0; i < text.length; i++) {
      if (text[i] == '{') {
        if (depth++ == 0) start = i + 1;
      } else if (text[i] == '}' && --depth == 0) {
        yield text.substring(start, i);
      }
    }
  }

  void scan(String text) {
    for (final g in groups(text)) {
      final simple = RegExp(r'^\s*(\w+)\s*$').firstMatch(g);
      final complex = RegExp(r'^\s*(\w+)\s*,\s*(?:plural|select)\s*,(.*)$', dotAll: true).firstMatch(g);
      if (simple != null) {
        found.add(simple.group(1)!);
      } else if (complex != null) {
        found.add(complex.group(1)!);
        groups(complex.group(2)!).forEach(scan);
      }
    }
  }

  scan(message);
  return found;
}

/// Every app language (ARB file suffix).
const _languages = [
  'nl', 'en', 'de', 'fr', 'es', 'it', 'pt', 'pt_BR', 'pl', 'sv', 'da', 'nb', 'fi', 'cs', 'tr', 'ja', 'ko', 'zh', //
  'zh_Hant', 'uk', 'ru', 'ro', 'hu', 'el', 'bg', 'hr', 'sk', 'sl', 'lt', 'lv', 'et', 'ca', 'id', 'ms', 'vi', 'th', //
  'hi', 'ar', 'he', 'fil',
];

void main() {
  final arbs = _arbs();
  final template = arbs['app_en.arb']!;
  final keys = template.keys.where((k) => !k.startsWith('@')).toSet();

  /// Messages where a language may use one placeholder instead of another
  /// (e.g. "July 12-19" uses the month name, "7月12日～19日" the month number).
  const alternatives = {
    'dateRangeSameMonth': [
      {'startDay'},
      {'endDay', 'endDate'},
    ],
  };

  group('ARB files', () {
    test('all 40 languages are there, each in the language picker', () {
      expect(arbs.keys.toSet(), {for (final l in _languages) 'app_$l.arb'});
      expect(AppLocalizations.supportedLocales, hasLength(_languages.length));
      expect(appLanguages.map((a) => a.tag).toSet(), _languages.toSet());
      for (final a in appLanguages) {
        expect(L10n.tagOf(a.locale), a.tag);
        expect(lookupAppLocalizations(a.locale).localeName, isNotEmpty);
      }
    });

    test('Flutter has Material, Cupertino and date formatting for every language', () async {
      await initializeDateFormatting();
      for (final l in AppLocalizations.supportedLocales) {
        expect(GlobalMaterialLocalizations.delegate.isSupported(l), isTrue, reason: '$l material');
        expect(GlobalCupertinoLocalizations.delegate.isSupported(l), isTrue, reason: '$l cupertino');
        expect(DateFormat.MMMMEEEEd(L10n.intlLocaleFor(l)).format(DateTime(2027, 7, 13)), isNotEmpty, reason: '$l intl');
      }
    });

    for (final entry in arbs.entries) {
      test('${entry.key} has exactly the template keys', () {
        final own = entry.value.keys.where((k) => !k.startsWith('@')).toSet();
        expect(own.difference(keys), isEmpty, reason: 'keys not in app_en.arb');
        expect(keys.difference(own), isEmpty, reason: 'keys missing');
        final locale = entry.key.substring(4, entry.key.length - 4);
        expect(entry.value['@@locale'], locale);
      });

      test('${entry.key} uses every placeholder and no unknown ones', () {
        for (final key in keys) {
          final message = entry.value[key] as String;
          final declared = ((template['@$key'] as Map?)?['placeholders'] as Map?)?.keys.cast<String>().toSet() ?? <String>{};
          final used = _placeholdersIn(message);
          expect(used.difference(declared), isEmpty, reason: '$key: unknown placeholder in "$message"');
          final groups = alternatives[key];
          if (groups != null) {
            expect(used.containsAll(groups.first), isTrue, reason: '$key: "$message"');
            expect(used.intersection(groups.last), isNotEmpty, reason: '$key: "$message"');
          } else {
            expect(used, declared, reason: '$key: missing placeholder in "$message"');
          }
          if (message.contains(', plural,')) expect(message, contains('other{'), reason: '$key needs an "other" case');
        }
      });

      test('${entry.key} uses plain hyphens, no long dashes', () {
        for (final key in keys) {
          expect(entry.value[key], isNot(matches(RegExp('[–—]'))), reason: key);
        }
      });

      test('${entry.key} keeps the brand name', () {
        expect(entry.value['welcomePro'], contains('CamTrip Pro'));
        expect(entry.value['legalAnnual'], contains('CamTrip Pro'));
      });
    }
  });

  group('locale resolution', () {
    Locale r(List<Locale>? l) => L10n.resolve(l);

    test('Dutch devices get Dutch', () => expect(r([const Locale('nl', 'NL')]), const Locale('nl')));
    test('a supported language wins, regardless of region', () => expect(r([const Locale('fr', 'CA')]), const Locale('fr')));
    test('unsupported languages fall back to English', () => expect(r([const Locale('sw', 'KE')]), const Locale('en')));
    test('the first supported preferred language is used', () {
      expect(r([const Locale('sw'), const Locale('de', 'AT'), const Locale('nl')]), const Locale('de'));
      expect(r([const Locale('ru', 'RU')]), const Locale('ru'));
      expect(r([const Locale('ar', 'EG')]), const Locale('ar'));
      expect(r([const Locale('fil', 'PH')]), const Locale('fil'));
    });
    test('old language codes', () {
      expect(r([const Locale('iw')]), const Locale('he'));
      expect(r([const Locale('in')]), const Locale('id'));
      expect(r([const Locale('tl')]), const Locale('fil'));
    });
    test('Brazilian Portuguese is separate from pt-PT', () {
      expect(r([const Locale('pt', 'BR')]), const Locale('pt', 'BR'));
      expect(r([const Locale('pt', 'PT')]), const Locale('pt'));
      expect(r([const Locale('pt', 'AO')]), const Locale('pt'));
    });
    test('Norwegian variants use Bokmål', () {
      expect(r([const Locale('no')]), const Locale('nb'));
      expect(r([const Locale('nn')]), const Locale('nb'));
    });
    test('Traditional Chinese for Hant, Taiwan, Hong Kong and Macau; else Simplified', () {
      const hant = Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant');
      expect(r([const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant', countryCode: 'TW')]), hant);
      expect(r([const Locale('zh', 'TW')]), hant);
      expect(r([const Locale('zh', 'HK')]), hant);
      expect(r([const Locale('zh', 'MO')]), hant);
      expect(r([hant]), hant);
      expect(r([const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hans', countryCode: 'HK')]), const Locale('zh'));
      expect(r([const Locale('zh', 'CN')]), const Locale('zh'));
      expect(r([const Locale('zh')]), const Locale('zh'));
      expect(L10n.intlLocaleFor(hant), 'zh_TW');
    });
    test('stored language tags', () {
      for (final l in L10n.supportedLocales) {
        expect(L10n.parseTag(L10n.tagOf(l)), l);
      }
      expect(L10n.tagOf(L10n.traditionalChinese), 'zh_Hant');
      expect(L10n.tagOf(const Locale('pt', 'BR')), 'pt_BR');
      expect(L10n.parseTag('xx'), isNull);
      expect(L10n.parseTag(null), isNull);
    });
    test('no languages at all gives English', () => expect(r(null), const Locale('en')));
  });

  group('formatting follows the language', () {
    setUpAll(initializeDateFormatting);
    tearDown(() => L10n.setLocale(const Locale('nl')));

    final d = DateTime(2027, 7, 13, 9, 5);
    test('Dutch keeps the original look', () {
      L10n.setLocale(const Locale('nl'));
      expect(Fmt.day(d), 'Dinsdag 13 juli');
      expect(Fmt.range(DateTime(2027, 7, 12), DateTime(2027, 7, 19)), '12-19 juli');
      expect(Fmt.time(d), '09:05');
    });
    test('English, German, Japanese', () {
      L10n.setLocale(const Locale('en'));
      expect(Fmt.day(d), 'Tuesday, July 13');
      expect(Fmt.range(DateTime(2027, 7, 12), DateTime(2027, 7, 19)), 'July 12-19');
      L10n.setLocale(const Locale('de'));
      expect(Fmt.range(DateTime(2027, 7, 12), DateTime(2027, 7, 19)), '12.-19. Juli');
      L10n.setLocale(const Locale('ja'));
      expect(Fmt.range(DateTime(2027, 7, 12), DateTime(2027, 7, 19)), '7月12日～19日');
      L10n.setLocale(const Locale('fi'));
      expect(Fmt.range(DateTime(2027, 7, 12), DateTime(2027, 7, 19)), '12.-19. heinäkuuta');
      L10n.setLocale(const Locale('pl'));
      expect(Fmt.range(DateTime(2027, 7, 12), DateTime(2027, 7, 19)), '12-19 lipca');
    });
    test('plurals', () {
      L10n.setLocale(const Locale('ru'));
      expect([1, 2, 5, 21].map(L10n.current.periodDays), ['1 день', '2 дня', '5 дней', '21 день']);
      L10n.setLocale(const Locale('uk'));
      expect([1, 3, 11].map(L10n.current.membersCount), ['1 учасник', '3 учасники', '11 учасників']);
      L10n.setLocale(const Locale('ar'));
      expect([0, 1, 2, 3, 11, 100].map(L10n.current.photosCount), ['لا صور', 'صورة واحدة', 'صورتان', '3 صور', '11 صورة', '100 صورة']);
      L10n.setLocale(const Locale('he'));
      expect([1, 2, 5].map(L10n.current.periodDays), ['יום אחד', 'יומיים', '5 ימים']);
      L10n.setLocale(const Locale('sl'));
      expect([1, 2, 3, 5].map(L10n.current.photosCount), ['1 fotka', '2 fotki', '3 fotke', '5 fotk']);
      L10n.setLocale(const Locale('pl'));
      expect([1, 2, 5, 22].map(L10n.current.photosCount), ['1 zdjęcie', '2 zdjęcia', '5 zdjęć', '22 zdjęcia']);
      L10n.setLocale(const Locale('en'));
      expect([1, 3].map(L10n.current.photosCount), ['1 photo', '3 photos']);
    });
  });

  group('server errors', () {
    tearDown(() => L10n.setLocale(const Locale('nl')));

    test('known codes are shown in the app language', () {
      L10n.setLocale(const Locale('en'));
      expect(localizeServerError('invalid_credentials', 'E-mailadres of wachtwoord klopt niet'), 'E-mail address or password is incorrect');
      expect(localizeServerError('rate_limited', 'Te veel pogingen.'), contains('15 minutes'));
      expect(localizeServerError('group_full', 'Deze groep zit vol (max. 10 leden).'), contains('max. 10'));
      expect(localizeServerError('email_taken', 'Er bestaat al een account met dit e-mailadres. Log in met Apple.'), endsWith('Sign in with Apple.'));
      expect(localizeServerError(null, 'Foto niet gevonden'), 'Photo not found');
    });
    test('unknown messages fall back to the server text', () {
      L10n.setLocale(const Locale('de'));
      expect(localizeServerError('something_new', 'Iets nieuws'), 'Iets nieuws');
    });
  });
}
