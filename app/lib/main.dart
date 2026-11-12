import 'dart:async';

import 'package:app_links/app_links.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'core/router.dart';
import 'core/storage.dart';
import 'core/theme.dart';
import 'features/auth/auth_controller.dart';
import 'features/groups/join_sheet.dart';
import 'features/notifications/push.dart';
import 'features/premium/premium_controller.dart';
import 'features/upload/upload_queue.dart';

/// Device preferences, loaded before the first frame.
final prefsProvider = Provider<Prefs>((ref) => throw UnimplementedError('overridden in main'));

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeDateFormatting('nl_NL');
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
  final prefs = await Prefs.load();

  final container = ProviderContainer(overrides: [prefsProvider.overrideWithValue(prefs)]);
  unawaited(container.read(premiumProvider.notifier).configure());

  runApp(UncontrolledProviderScope(container: container, child: const CamTripApp()));
}

class CamTripApp extends ConsumerStatefulWidget {
  const CamTripApp({super.key});
  @override
  ConsumerState<CamTripApp> createState() => _CamTripAppState();
}

class _CamTripAppState extends ConsumerState<CamTripApp> {
  StreamSubscription<Uri>? _links;
  StreamSubscription<String>? _pushOpens;
  String? _pendingCode;

  @override
  void initState() {
    super.initState();
    final appLinks = AppLinks();
    _links = appLinks.uriLinkStream.listen(_handleLink);
    _pushOpens = ref.read(pushOpenProvider).stream.listen((groupId) => ref.read(routerProvider).push('/group/$groupId'));
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
    if (ctx != null) showJoinSheet(ctx, code: code);
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
      locale: const Locale('nl'),
      supportedLocales: const [Locale('nl'), Locale('en')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
    );
  }
}
