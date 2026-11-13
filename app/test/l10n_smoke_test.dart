import 'package:camtrip/core/api.dart';
import 'package:camtrip/core/storage.dart';
import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/auth/email_auth_screen.dart';
import 'package:camtrip/features/auth/onboarding_screen.dart';
import 'package:camtrip/features/gallery/gallery_screen.dart';
import 'package:camtrip/features/groups/albums_screen.dart';
import 'package:camtrip/features/groups/create_group_screen.dart';
import 'package:camtrip/features/groups/group_settings_screen.dart';
import 'package:camtrip/features/groups/invite_screen.dart';
import 'package:camtrip/features/premium/paywall_screen.dart';
import 'package:camtrip/features/settings/settings_screen.dart';
import 'package:camtrip/features/upload/queue_screen.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/l10n/l10n.dart';
import 'package:camtrip/main.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'support/l10n.dart';
import 'support/real_fonts.dart';

// Pumps the onboarding and the screens that do not need the camera in a few
// languages on the smallest supported phone (iPhone SE, 375x667), with real
// fonts: no exceptions and no overflow, even with longer translations.

const _locales = [Locale('en'), Locale('de'), Locale('ja')];

class _SignedOut extends AuthController {
  @override
  Future<AppUser?> build() async => null;
}

class _SignedIn extends AuthController {
  @override
  Future<AppUser?> build() async => AppUser(
        id: 'me',
        name: 'Alexander',
        email: 'alexander@example.com',
        avatarColor: '#d9472b',
        isPro: false,
        notifyNewPhotos: true,
        notifyRecap: true,
        blockedUserIds: const ['x'],
      );
}

/// No disk, no connectivity plugin.
class _EmptyQueue extends UploadQueue {
  @override
  List<UploadItem> build() => const [];
}

Map<String, dynamic> _group(String id, {String name = "Mallorca '27", String role = 'admin', int? limit = 10}) => {
      'id': id,
      'name': name,
      'type': 'vacation',
      'startDate': '2027-07-12T00:00:00.000Z',
      'endDate': '2027-07-19T21:59:00.000Z',
      'code': 'K7F2QX',
      'status': 'active',
      'photoCount': 128,
      'videoCount': 4,
      'hiddenCount': 2,
      'myRole': role,
      'ownerId': 'me',
      'memberLimit': limit,
      'isProGroup': true,
      'proSource': 'group',
      'proBy': {'id': 'u2', 'name': 'Konstantinopel'},
      'members': [
        {'id': 'me', 'name': 'Alexander', 'role': 'admin'},
        {'id': 'u2', 'name': 'Konstantinopel', 'role': 'member'},
        {'id': 'x', 'name': 'Maximiliane', 'role': 'member'},
      ],
    };

class _Api extends Api {
  _Api() : super(SessionStorage());

  @override
  Future<Map<String, dynamic>> get(String path, {Map<String, dynamic>? query}) async => switch (path) {
        '/groups' => {
            'groups': [_group('g1'), _group('g2', name: 'Een hele lange groepsnaam voor het weekend weg'), _group('g3', role: 'member')],
          },
        '/groups/g1' => {'group': _group('g1')},
        _ => <String, dynamic>{'photos': <dynamic>[], 'nextCursor': null},
      };
}

void main() {
  setUpAll(() async {
    await loadRealFonts();
    await initializeDateFormatting();
    PackageInfo.setMockInitialValues(appName: 'CamTrip', packageName: 'app.camtrip', version: '1.0.0', buildNumber: '1', buildSignature: '');
  });
  tearDownAll(useDutch);

  Future<void> pumpScreen(WidgetTester tester, Locale locale, Widget screen, {bool signedIn = true}) async {
    tester.view.physicalSize = const Size(375, 667) * 3;
    tester.view.devicePixelRatio = 3;
    tester.view.padding = const FakeViewPadding(top: 60);
    addTearDown(tester.view.reset);
    SharedPreferences.setMockInitialValues({'active_group': 'g1'});
    final prefs = Prefs(await SharedPreferences.getInstance());
    await tester.pumpWidget(ProviderScope(
      overrides: [
        prefsProvider.overrideWithValue(prefs),
        apiProvider.overrideWithValue(_Api()),
        authProvider.overrideWith(signedIn ? _SignedIn.new : _SignedOut.new),
        uploadQueueProvider.overrideWith(_EmptyQueue.new),
      ],
      child: localizedApp(locale: locale, theme: CT.theme(), home: screen),
    ));
    // Let the fake API answer; no pumpAndSettle (spinners never settle).
    for (var i = 0; i < 6; i++) {
      await tester.pump(const Duration(milliseconds: 200));
    }
  }

  void expectClean(WidgetTester tester, String what) => expect(tester.takeException(), isNull, reason: what);

  for (final locale in _locales) {
    group('$locale at 375x667', () {
      testWidgets('onboarding, all slides and the sign-in step', (tester) async {
        await pumpScreen(tester, locale, const OnboardingScreen(pendingCode: 'K7F2QX'), signedIn: false);
        expect(L10n.locale, locale);
        for (var page = 0; page < 3; page++) {
          await tester.pumpAndSettle();
          expectClean(tester, 'slide ${page + 1}');
          if (page < 2) await tester.drag(find.byType(PageView), const Offset(-375, 0));
        }
        final l = lookupAppLocalizations(locale);
        expect(find.text(l.createAccount), findsOneWidget);
        expect(find.text(l.signIn), findsOneWidget);
      });

      testWidgets('e-mail sign-in in every mode, with validation errors', (tester) async {
        for (final mode in EmailAuthMode.values) {
          await pumpScreen(tester, locale, EmailAuthScreen(key: ValueKey(mode), initialMode: mode), signedIn: false);
          final submit = find.byType(InkWell).last;
          await tester.ensureVisible(submit);
          await tester.tap(submit, warnIfMissed: false);
          await tester.pumpAndSettle();
          expectClean(tester, '$mode');
        }
      });

      final l = lookupAppLocalizations(locale);
      // Each screen, with a text that proves it is shown in [locale].
      final screens = <String, (Widget, String)>{
        'albums': (const AlbumsScreen(), l.yourAlbums),
        'new group': (const CreateGroupScreen(), l.newGroup),
        'invite': (const InviteScreen(groupId: 'g1', justCreated: true), l.inviteFriends),
        'group settings': (const GroupSettingsScreen(groupId: 'g1'), l.finishTrip),
        'gallery (empty)': (const GalleryScreen(groupId: 'g1'), l.noPhotosTitle),
        'upload queue': (const QueueScreen(), l.queueAllShared),
        'settings': (const SettingsScreen(), l.settings),
        'paywall': (const PaywallScreen(), l.paywallSubtitle),
      };
      for (final s in screens.entries) {
        testWidgets(s.key, (tester) async {
          final (screen, text) = s.value;
          await pumpScreen(tester, locale, screen);
          expectClean(tester, s.key);
          expect(find.text(text), findsWidgets, reason: s.key);
          // Scroll to the end so every row gets laid out.
          final scrollables = find.byType(Scrollable);
          if (scrollables.evaluate().isNotEmpty) {
            await tester.fling(scrollables.first, const Offset(0, -2000), 3000);
            await tester.pump(const Duration(seconds: 1));
            expectClean(tester, '${s.key} scrolled');
          }
        });
      }
    });
  }
}
