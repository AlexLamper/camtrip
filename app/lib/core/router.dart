import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../features/admin/admin_screen.dart';
import '../features/admin/admin_user_screen.dart';
import '../features/auth/auth_controller.dart';
import '../features/auth/email_auth_screen.dart';
import '../features/auth/onboarding_screen.dart';
import '../features/camera/camera_screen.dart';
import '../features/gallery/all_photos_screen.dart';
import '../features/gallery/gallery_screen.dart';
import '../features/gallery/hidden_photos_screen.dart';
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

// Page transitions. Routes built with `builder:` get a MaterialPage, which
// uses the theme's pageTransitionsTheme (Cupertino slide + swipe-back on iOS,
// shared-axis fade on Android). Use these helpers in `pageBuilder:` for the rest.

/// Modal-like screens (camera, paywall, invite, ...): a fullscreen dialog
/// that slides up from the bottom. Gets a close button instead of a back arrow.
Page<void> modalPage(GoRouterState state, Widget child) => CustomTransitionPage<void>(
      key: state.pageKey,
      name: state.name,
      arguments: state.extra,
      fullscreenDialog: true,
      transitionDuration: CT.transitionDuration,
      reverseTransitionDuration: const Duration(milliseconds: 250),
      transitionsBuilder: (_, animation, _, child) => SlideTransition(
        position: Tween(begin: const Offset(0, 1), end: Offset.zero)
            .animate(CurvedAnimation(parent: animation, curve: CT.transitionCurve, reverseCurve: Curves.easeInCubic)),
        child: child,
      ),
      child: child,
    );

/// A page that fades in with a slight upward slide, for screens that should
/// not use the push-style transition (e.g. replacing the root).
Page<void> fadePage(GoRouterState state, Widget child) => CustomTransitionPage<void>(
      key: state.pageKey,
      name: state.name,
      arguments: state.extra,
      transitionDuration: CT.transitionDuration,
      transitionsBuilder: (_, animation, _, child) {
        final curved = CurvedAnimation(parent: animation, curve: CT.transitionCurve);
        return FadeTransition(
          opacity: curved,
          child: SlideTransition(position: Tween(begin: const Offset(0, 0.03), end: Offset.zero).animate(curved), child: child),
        );
      },
      child: child,
    );

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
      final inWelcome = loc == '/welcome' || loc.startsWith('/welcome/');
      if (!signedIn) return inWelcome ? null : '/welcome';
      if (inWelcome || loc == '/splash') return '/';
      return null;
    },
    routes: [
      GoRoute(path: '/splash', pageBuilder: (_, s) => NoTransitionPage(key: s.pageKey, child: const _Splash())),
      GoRoute(
        path: '/welcome',
        builder: (_, _) => const OnboardingScreen(),
        routes: [
          // /welcome/email?mode=register|login|forgot|reset
          GoRoute(
            path: 'email',
            builder: (_, s) => EmailAuthScreen(initialMode: EmailAuthMode.parse(s.uri.queryParameters['mode'])),
          ),
        ],
      ),
      GoRoute(path: '/', builder: (_, _) => const AlbumsScreen()),
      GoRoute(path: '/new', pageBuilder: (_, s) => modalPage(s, const CreateGroupScreen())),
      GoRoute(path: '/camera', pageBuilder: (_, s) => modalPage(s, const CameraScreen())),
      GoRoute(path: '/pro', pageBuilder: (_, s) => modalPage(s, const PaywallScreen())),
      GoRoute(path: '/settings', builder: (_, _) => const SettingsScreen()),
      // Instellingen > Beheer (app admins only; the screen and the API both check).
      // ?tab=reports opens Meldingen (from a "Nieuwe melding" push).
      GoRoute(
        path: '/admin',
        builder: (_, s) => AdminScreen(initialTab: s.uri.queryParameters['tab'] == 'reports' ? AdminScreen.reportsTab : 0),
      ),
      GoRoute(path: '/admin/user/:id', builder: (_, s) => AdminUserScreen(userId: s.pathParameters['id']!)),
      GoRoute(path: '/queue', builder: (_, _) => const QueueScreen()),
      // "Alle foto's": every photo the user made, from every album.
      GoRoute(path: '/photos', builder: (_, _) => const AllPhotosScreen()),
      GoRoute(path: '/group/:id', builder: (_, s) => GalleryScreen(groupId: s.pathParameters['id']!)),
      GoRoute(
        path: '/group/:id/invite',
        pageBuilder: (_, s) =>
            modalPage(s, InviteScreen(groupId: s.pathParameters['id']!, justCreated: s.uri.queryParameters['new'] == '1')),
      ),
      GoRoute(path: '/group/:id/settings', builder: (_, s) => GroupSettingsScreen(groupId: s.pathParameters['id']!)),
      GoRoute(path: '/group/:id/hidden', builder: (_, s) => HiddenPhotosScreen(groupId: s.pathParameters['id']!)),
      GoRoute(
        path: '/group/:id/recap',
        pageBuilder: (_, s) => modalPage(s, RecapScreen(groupId: s.pathParameters['id']!)),
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

/// Only shown in the rare case the keychain could not be read before the first
/// frame (main() normally decides the start screen synchronously). A plain
/// background that matches the native launch screen, so nothing flashes.
class _Splash extends StatelessWidget {
  const _Splash();
  @override
  Widget build(BuildContext context) => const ColoredBox(color: CT.bg, child: SizedBox.expand());
}
