import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/theme.dart';
import '../../l10n/l10n.dart';
import '../../l10n/languages.dart';
import '../../main.dart';
import '../notifications/push.dart';

/// The app language picked in Settings, or null to follow the phone.
/// main.dart gives it to MaterialApp.locale, so a change applies at once.
final appLanguageProvider = NotifierProvider<AppLanguageController, Locale?>(AppLanguageController.new);

class AppLanguageController extends Notifier<Locale?> {
  @override
  Locale? build() {
    try {
      return L10n.parseTag(ref.read(prefsProvider).language);
    } catch (_) {
      return null; // no prefs (widget tests of single screens): the phone's language
    }
  }

  /// [locale] null = the phone's language.
  void choose(Locale? locale) {
    if (locale == state && (locale != null || ref.read(prefsProvider).language == null)) return;
    ref.read(prefsProvider).language = locale == null ? null : L10n.tagOf(locale);
    state = locale;
    // Pushes come from the server: tell it the new language.
    ref.read(pushProvider).updateLocale(locale ?? systemLocale()).ignore();
  }
}

/// The app language the phone's settings give (what "System" means).
Locale systemLocale() => L10n.resolve(WidgetsBinding.instance.platformDispatcher.locales);

/// "System (Nederlands)" or "Deutsch": the current choice, for the Settings
/// row and the welcome screen.
String currentLanguageLabel(BuildContext context, Locale? chosen) {
  if (chosen != null) return languageFor(chosen).nativeName;
  return context.l10n.languageSystemCurrent(languageFor(systemLocale()).nativeName);
}

/// Opens the language picker.
Future<void> openLanguagePicker(BuildContext context) =>
    Navigator.of(context).push(MaterialPageRoute<void>(builder: (_) => const LanguageScreen()));

/// Searchable list: "System language" first, then every app language in its
/// own name, with the English name under it.
class LanguageScreen extends ConsumerStatefulWidget {
  const LanguageScreen({super.key});
  @override
  ConsumerState<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends ConsumerState<LanguageScreen> {
  final _search = TextEditingController();
  String _query = '';

  @override
  void dispose() {
    _search.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;
    final chosen = ref.watch(appLanguageProvider);
    final matches = appLanguages.where((a) => a.matches(_query)).toList();
    final showSystem = _query.trim().isEmpty;

    Widget row({required String title, String? subtitle, required bool selected, required VoidCallback onTap, Key? key}) => InkWell(
          key: key,
          onTap: onTap,
          child: Container(
            padding: const EdgeInsetsDirectional.fromSTEB(22, 12, 18, 12),
            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
            child: Row(children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(title, style: CT.text(16, weight: FontWeight.w500)),
                  if (subtitle != null) Text(subtitle, style: CT.text(12, color: CT.muted)),
                ]),
              ),
              if (selected) const Icon(Icons.check_rounded, color: CT.accent),
            ]),
          ),
        );

    return Scaffold(
      appBar: AppBar(title: Text(l.language, style: CT.title(18))),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 4, 16, 8),
          child: TextField(
            controller: _search,
            onChanged: (v) => setState(() => _query = v),
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              hintText: l.languageSearchHint,
              prefixIcon: const Icon(Icons.search),
              filled: true,
              fillColor: CT.paper,
              isDense: true,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: CT.line)),
              enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: CT.line)),
            ),
          ),
        ),
        Expanded(
          child: ListView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.only(bottom: 32),
            children: [
              if (showSystem)
                row(
                  key: const ValueKey('language-system'),
                  title: l.languageSystem,
                  subtitle: languageFor(systemLocale()).nativeName,
                  selected: chosen == null,
                  onTap: () => _choose(null),
                ),
              for (final a in matches)
                row(
                  key: ValueKey('language-${a.tag}'),
                  title: a.nativeName,
                  subtitle: a.englishName == a.nativeName ? null : a.englishName,
                  selected: chosen != null && L10n.tagOf(chosen) == a.tag,
                  onTap: () => _choose(a.locale),
                ),
              if (matches.isEmpty)
                Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(l.languageNoResults, textAlign: TextAlign.center, style: CT.text(14, color: CT.muted)),
                ),
            ],
          ),
        ),
      ]),
    );
  }

  void _choose(Locale? locale) {
    ref.read(appLanguageProvider.notifier).choose(locale);
    Navigator.of(context).maybePop();
  }
}
