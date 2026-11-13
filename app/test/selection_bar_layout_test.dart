import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/gallery/photo_actions.dart';
import 'package:camtrip/features/groups/albums_screen.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/l10n/app_localizations.dart';
import 'package:camtrip/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show RenderParagraph;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'all_photos_test.dart' show Me, NoQueue, PagedApi, colorThumb, photosJson;
import 'support/l10n.dart';
import 'support/real_fonts.dart';

/// The selection action bar (Opslaan, Delen, Favoriet, Verbergen,
/// Verwijderen) with the real fonts: in order, every label whole inside its
/// slot, on the smallest common phone (375x667), in long-word languages and
/// with larger text.
void main() {
  setUpAll(loadRealFonts);

  group('action bar fits at 375x667', () {
    // nl/de/fi first (longest words), then the rest of the 18 languages.
    for (final lang in ['nl', 'de', 'fi', 'en', 'fr', 'es', 'it', 'pt', 'pt_BR', 'sv', 'da', 'nb', 'pl', 'cs', 'tr', 'ja', 'ko', 'zh']) {
      for (final scale in [1.0, 1.3]) {
        for (final favoriteOn in [true, false]) {
          testWidgets('$lang, text x$scale, favoriteOn=$favoriteOn', (tester) async {
            tester.view.physicalSize = const Size(375, 667) * 2;
            tester.view.devicePixelRatio = 2;
            addTearDown(tester.view.reset);
            await tester.pumpWidget(
              localizedApp(
                locale: lang == 'pt_BR' ? const Locale('pt', 'BR') : Locale(lang),
                theme: CT.theme(),
                builder: (c, child) => MediaQuery(
                  data: MediaQuery.of(c).copyWith(textScaler: TextScaler.linear(scale)),
                  child: child!,
                ),
                home: Scaffold(
                  body: Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 10, 16, 12),
                      child: SelectionActionBar(
                        count: 2,
                        favoriteOn: favoriteOn,
                        onSave: () {},
                        onShare: () {},
                        onFavorite: () {},
                        onHide: () {},
                        onDelete: () {},
                      ),
                    ),
                  ),
                ),
              ),
            );
            await tester.pumpAndSettle();
            expect(tester.takeException(), isNull);
            const keys = ['sel-save', 'sel-share', 'sel-favorite', 'sel-hide', 'sel-delete'];
            final rects = [for (final k in keys) tester.getRect(find.byKey(Key(k)))];
            for (var i = 0; i < rects.length; i++) {
              final r = rects[i];
              expect(r.left, greaterThanOrEqualTo(16), reason: keys[i]);
              expect(r.right, lessThanOrEqualTo(375 - 16), reason: keys[i]);
              if (i > 0) expect(r.left, greaterThanOrEqualTo(rects[i - 1].right - 0.01), reason: 'order ${keys[i]}');
              // The label is drawn whole inside its own slot: at most two
              // lines, a word is never broken, nothing is cut off.
              final text = find.descendant(of: find.byKey(Key(keys[i])), matching: find.byType(Text));
              final tr = tester.getRect(text);
              expect(tr.left, greaterThanOrEqualTo(r.left - 0.01), reason: keys[i]);
              expect(tr.right, lessThanOrEqualTo(r.right + 0.01), reason: keys[i]);
              final para = tester.renderObject<RenderParagraph>(text);
              expect(para.didExceedMaxLines, isFalse, reason: keys[i]);
              final label = tester.widget<Text>(text).data!;
              final lines = (tr.height / (tester.widget<Text>(text).style!.fontSize! * scale * 1.2)).round();
              expect(lines, lessThanOrEqualTo(label.contains(' ') ? 2 : 1), reason: '$label: $lines lines');
            }
            // One size for all labels, so the row looks even; readable (>= 9 px).
            final sizes = {
              for (final k in keys) tester.widget<Text>(find.descendant(of: find.byKey(Key(k)), matching: find.byType(Text))).style!.fontSize! * scale,
            };
            expect(sizes.length, 1, reason: '$sizes');
            expect(sizes.single, greaterThanOrEqualTo(9));
            final bar = tester.getRect(find.byType(SelectionActionBar));
            expect(bar.height, lessThan(90));
          });
        }
      }
    }
  });

  group('home header with "Selecteer" at 375 wide', () {
    // nl/fi/de keep the full chip; fr/es/pl get the icon-only chip so the
    // title is not cut off.
    for (final (lang, compact) in [('nl', false), ('de', false), ('fi', false), ('fr', true), ('es', true), ('pl', true)]) {
      testWidgets(lang, (tester) async {
        tester.view.physicalSize = const Size(375, 667) * 2;
        tester.view.devicePixelRatio = 2;
        addTearDown(tester.view.reset);
        SharedPreferences.setMockInitialValues({});
        final prefs = Prefs(await SharedPreferences.getInstance());
        await tester.pumpWidget(
          ProviderScope(
            overrides: [
              prefsProvider.overrideWithValue(prefs),
              apiProvider.overrideWithValue(
                PagedApi([
                  {'photos': photosJson(6), 'nextCursor': null},
                ]),
              ),
              authProvider.overrideWith(Me.new),
              uploadQueueProvider.overrideWith(NoQueue.new),
            ],
            child: localizedApp(
              locale: Locale(lang),
              theme: CT.theme(),
              home: AlbumsScreen(initialTab: HomeTab.photos, photoThumbBuilder: colorThumb),
            ),
          ),
        );
        await tester.pumpAndSettle();
        expect(tester.takeException(), isNull);
        final chip = find.byKey(const Key('home-select'));
        expect(find.descendant(of: chip, matching: find.byType(Text)), compact ? findsNothing : findsOneWidget);
        if (compact) expect(find.ancestor(of: chip, matching: find.byType(Tooltip)), findsOneWidget);
        final title = tester.renderObject<RenderParagraph>(find.text(lookupAppLocalizations(Locale(lang)).allPhotosTitle).first);
        expect(title.didExceedMaxLines, isFalse);
        expect((title.text as TextSpan).style!.fontSize, greaterThanOrEqualTo(24));

        // The chip still toggles selection mode.
        await tester.tap(chip);
        await tester.pumpAndSettle();
        expect(find.byKey(const Key('sel-share')), findsOneWidget);
      });
    }
  });
}
