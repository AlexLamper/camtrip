import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/auth/auth_controller.dart';
import '../features/auth/onboarding_screen.dart';
import '../features/camera/camera_screen.dart';
import '../features/gallery/gallery_screen.dart';
import '../features/gallery/photo_screen.dart';
import '../features/groups/albums_screen.dart';
import '../features/groups/create_group_screen.dart';
import '../features/groups/group_settings_screen.dart';
import '../features/groups/invite_screen.dart';
import '../features/premium/paywall_screen.dart';
import '../features/recap/recap_screen.dart';
import '../features/settings/settings_screen.dart';
import '../features/upload/queue_screen.dart';
import 'theme.dart';

final rootNavigatorKey = GlobalKey<NavigatorState>();

/// Refreshes the router when the session changes.
class _AuthListenable extends ChangeNotifier {
  _AuthListenable(Ref ref) {
    ref.listen(authProvider, (_, _) => notifyListeners());
  }
}

final routerProvider = Provider<GoRouter>((ref) {
  final listenable = _AuthListenable(ref);
  return GoRouter(
    navigatorKey: rootNavigatorKey,
    refreshListenable: listenable,
    redirect: (context, state) {
      final auth = ref.read(authProvider);
      final loc = state.matchedLocation;
      if (auth.isLoading && !auth.hasValue) return loc == '/splash' ? null : '/splash';
      final signedIn = auth.value != null;
      if (!signedIn) return loc == '/welcome' ? null : '/welcome';
      if (loc == '/welcome' || loc == '/splash') return '/';
      return null;
    },
    routes: [
      GoRoute(path: '/splash', builder: (_, _) => const _Splash()),
      GoRoute(path: '/welcome', builder: (_, _) => const OnboardingScreen()),
      GoRoute(path: '/', builder: (_, _) => const AlbumsScreen()),
      GoRoute(path: '/new', pageBuilder: (_, _) => const MaterialPage(fullscreenDialog: true, child: CreateGroupScreen())),
      GoRoute(path: '/camera', pageBuilder: (_, _) => const MaterialPage(fullscreenDialog: true, child: CameraScreen())),
      GoRoute(path: '/pro', pageBuilder: (_, _) => const MaterialPage(fullscreenDialog: true, child: PaywallScreen())),
      GoRoute(path: '/settings', builder: (_, _) => const SettingsScreen()),
      GoRoute(path: '/queue', builder: (_, _) => const QueueScreen()),
      GoRoute(path: '/group/:id', builder: (_, s) => GalleryScreen(groupId: s.pathParameters['id']!)),
      GoRoute(
        path: '/group/:id/invite',
        builder: (_, s) => InviteScreen(groupId: s.pathParameters['id']!, justCreated: s.uri.queryParameters['new'] == '1'),
      ),
      GoRoute(path: '/group/:id/settings', builder: (_, s) => GroupSettingsScreen(groupId: s.pathParameters['id']!)),
      GoRoute(
        path: '/group/:id/recap',
        pageBuilder: (_, s) => MaterialPage(fullscreenDialog: true, child: RecapScreen(groupId: s.pathParameters['id']!)),
      ),
      GoRoute(
        path: '/group/:id/photo/:photoId',
        builder: (_, s) => PhotoScreen(
          groupId: s.pathParameters['id']!,
          photoId: s.pathParameters['photoId']!,
          initialIndex: s.extra is int ? s.extra as int : null,
        ),
      ),
    ],
  );
});

class _Splash extends StatelessWidget {
  const _Splash();
  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: CT.bg,
        body: Center(
          child: ClipRRect(borderRadius: BorderRadius.circular(26), child: Image.asset('assets/images/logo_icon.png', width: 110)),
        ),
      );
}
