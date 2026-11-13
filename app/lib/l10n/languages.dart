import 'package:flutter/widgets.dart';

import 'l10n.dart';

/// One app language for the language picker.
class AppLanguage {
  const AppLanguage(this.tag, this.nativeName, this.englishName);

  /// As stored in the prefs: "nl", "pt_BR", "zh_Hant" (see [L10n.tagOf]).
  final String tag;

  /// The language in its own name (endonym): "Deutsch", "日本語".
  final String nativeName;

  /// The English name, shown under the native name.
  final String englishName;

  Locale get locale => L10n.parseTag(tag)!;

  bool matches(String query) {
    final q = query.trim().toLowerCase();
    if (q.isEmpty) return true;
    return nativeName.toLowerCase().contains(q) || englishName.toLowerCase().contains(q) || tag.toLowerCase().startsWith(q);
  }
}

/// Every language the app is translated into, in the order of the picker:
/// alphabetical by native name, Latin script first, then the other scripts.
const appLanguages = <AppLanguage>[
  AppLanguage('id', 'Bahasa Indonesia', 'Indonesian'),
  AppLanguage('ms', 'Bahasa Melayu', 'Malay'),
  AppLanguage('ca', 'Català', 'Catalan'),
  AppLanguage('cs', 'Čeština', 'Czech'),
  AppLanguage('da', 'Dansk', 'Danish'),
  AppLanguage('de', 'Deutsch', 'German'),
  AppLanguage('et', 'Eesti', 'Estonian'),
  AppLanguage('en', 'English', 'English'),
  AppLanguage('es', 'Español', 'Spanish'),
  AppLanguage('fil', 'Filipino', 'Filipino'),
  AppLanguage('fr', 'Français', 'French'),
  AppLanguage('hr', 'Hrvatski', 'Croatian'),
  AppLanguage('it', 'Italiano', 'Italian'),
  AppLanguage('lv', 'Latviešu', 'Latvian'),
  AppLanguage('lt', 'Lietuvių', 'Lithuanian'),
  AppLanguage('hu', 'Magyar', 'Hungarian'),
  AppLanguage('nl', 'Nederlands', 'Dutch'),
  AppLanguage('nb', 'Norsk bokmål', 'Norwegian'),
  AppLanguage('pl', 'Polski', 'Polish'),
  AppLanguage('pt_BR', 'Português (Brasil)', 'Portuguese (Brazil)'),
  AppLanguage('pt', 'Português (Portugal)', 'Portuguese (Portugal)'),
  AppLanguage('ro', 'Română', 'Romanian'),
  AppLanguage('sk', 'Slovenčina', 'Slovak'),
  AppLanguage('sl', 'Slovenščina', 'Slovenian'),
  AppLanguage('fi', 'Suomi', 'Finnish'),
  AppLanguage('sv', 'Svenska', 'Swedish'),
  AppLanguage('vi', 'Tiếng Việt', 'Vietnamese'),
  AppLanguage('tr', 'Türkçe', 'Turkish'),
  AppLanguage('el', 'Ελληνικά', 'Greek'),
  AppLanguage('bg', 'Български', 'Bulgarian'),
  AppLanguage('ru', 'Русский', 'Russian'),
  AppLanguage('uk', 'Українська', 'Ukrainian'),
  AppLanguage('he', 'עברית', 'Hebrew'),
  AppLanguage('ar', 'العربية', 'Arabic'),
  AppLanguage('hi', 'हिन्दी', 'Hindi'),
  AppLanguage('th', 'ไทย', 'Thai'),
  AppLanguage('ko', '한국어', 'Korean'),
  AppLanguage('ja', '日本語', 'Japanese'),
  AppLanguage('zh', '简体中文', 'Chinese (Simplified)'),
  AppLanguage('zh_Hant', '繁體中文', 'Chinese (Traditional)'),
];

/// The picker entry for [locale] (English if unknown).
AppLanguage languageFor(Locale locale) {
  final tag = L10n.tagOf(locale);
  return appLanguages.firstWhere((l) => l.tag == tag, orElse: () => appLanguages.firstWhere((l) => l.tag == 'en'));
}
