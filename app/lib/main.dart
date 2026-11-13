import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/router.dart';
import 'core/storage.dart';
import 'core/theme.dart';
import 'core/api.dart';
import 'features/auth/auth_controller.dart';
import 'features/auth/onboarding_slides.dart';
import 'features/groups/join_sheet.dart';
import 'features/notifications/push.dart';
import 'features/premium/premium_controller.dart';
import 'features/upload/upload_queue.dart';
import 'l10n/l10n.dart';
import 'models/models.dart';

/// Device preferences, loaded before the first frame.
final prefsProvider = Provider<Prefs>((ref) => throw UnimplementedError('overridden in main'));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);

  // Only local, fast reads before the first frame (all in parallel): prefs
  // (cached profile + groups), the session token from the keychain and the
  // date names. Never the network - the start screen is decided from these.
  final session = SessionStorage();
  final (prefs, _, _) = await (
    Prefs.load(),
    session.token().timeout(const Duration(seconds: 2), onTimeout: () => null).catchError((Object _) => null),
    initializeDateFormatting(), // date names for every app language (in-memory)
  ).wait;

  final container = ProviderContainer(overrides: [
    prefsProvider.overrideWithValue(prefs),
    sessionStorageProvider.overrideWithValue(session),
  ]);

  runApp(UncontrolledProviderScope(container: container, child: const CamTripApp()));

  // Everything else waits until the first frame is on screen.
  WidgetsBinding.instance.addPostFrameCallback((_) {
    unawaited(container.read(premiumProvider.notifier).configure());
    if (container.read(authProvider).value == null) _precacheOnboarding();
  });
}

/// The first onboarding slide's photos, so they don't pop in.
void _precacheOnboarding() {
  final ctx = rootNavigatorKey.currentContext;
  if (ctx == null) return;
  for (final a in const [OnboardingPhotos.beach, OnboardingPhotos.campfire, OnboardingPhotos.friends]) {
    unawaited(precacheImage(AssetImage(a), ctx));
  }
}

class CamTripApp extends ConsumerStatefulWidget {
  const CamTripApp({super.key});
  @override
  ConsumerState<CamTripApp> createState() => _CamTripAppState();
}

class _CamTripAppState extends ConsumerState<CamTripApp> {
  StreamSubscription<Uri>? _links;
  StreamSubscription<PushOpen>? _pushOpens;
  String? _pendingCode;

  @override
  void initState() {
    super.initState();
    final appLinks = AppLinks();
    _links = appLinks.uriLinkStream.listen(_handleLink);
    _pushOpens = ref.read(pushOpenProvider).stream.listen((open) async {
      // A tap can come in at launch, before the profile is loaded.
      AppUser? user;
      try {
        user = await ref.read(authProvider.future);
      } catch (_) {}
      if (!mounted) return;
      final route = open.route(isAdmin: user?.isAppAdmin ?? false);
      if (route != null) ref.read(routerProvider).push(route);
    });
    ref.read(pushProvider); // registers the APNs channel handler
    // Keep the upload queue alive for the whole session.
    ref.read(uploadQueueProvider);
  }

  @override
  void dispose() {
    _links?.cancel();
    _pushOpens?.cancel();
    super.dispose();
  }

  /// https://camtrip.app/j/CODE or camtrip://join/CODE
  void _handleLink(Uri uri) {
    final code = parseInvite(uri.toString());
    if (code == null) return;
    if (ref.read(authProvider).value == null) {
      _pendingCode = code; // joined right after sign-in
      return;
    }
    _openJoin(code);
  }

  void _openJoin(String code) {
    final ctx = rootNavigatorKey.currentContext;
    if (ctx != null) {
      showJoinSheet(ctx, code: code);
    } else {
      // A launch link can arrive before the first frame.
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final ctx = rootNavigatorKey.currentContext;
        if (ctx != null) showJoinSheet(ctx, code: code);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(authProvider, (prev, next) {
      final signedIn = prev?.value == null && next.value != null;
      if (signedIn) {
        ref.read(uploadQueueProvider.notifier).process();
        final code = _pendingCode;
        if (code != null) {
          _pendingCode = null;
          Future.delayed(const Duration(milliseconds: 600), () => _openJoin(code));
        }
      }
    });

    return MaterialApp.router(
      title: 'CamTrip',
      debugShowCheckedModeBanner: false,
      theme: CT.theme(),
      routerConfig: ref.watch(routerProvider),
      // Follows the phone's language: one of ours, otherwise English.
      supportedLocales: L10n.supportedLocales,
      localeListResolutionCallback: L10n.resolveList,
      localizationsDelegates: L10n.delegates,
    );
  }
}
