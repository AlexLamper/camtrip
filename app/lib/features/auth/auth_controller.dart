import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../core/api.dart';
import '../../core/config.dart';
import '../../core/storage.dart';
import '../../main.dart';
import '../../models/models.dart';
import '../premium/premium_controller.dart';
import '../gallery/gallery_controller.dart';
import '../notifications/push.dart';
import '../upload/upload_queue.dart';
import '../../l10n/l10n.dart';

/// Session state. `null` = signed out. Loading only during restore / sign-in.
final authProvider = AsyncNotifierProvider<AuthController, AppUser?>(AuthController.new);

class AuthController extends AsyncNotifier<AppUser?> {
  bool _googleReady = false;

  Api get _api => ref.read(apiProvider);

  @override
  FutureOr<AppUser?> build() {
    ref.read(unauthorizedHandlerProvider).callback = () {
      if (state.value != null) unawaited(signOut());
    };
    // main() reads the keychain before the first frame, so the start screen is
    // known synchronously: no splash, and never waiting for the network.
    final storage = ref.read(sessionStorageProvider);
    if (storage.loaded) return _startFrom(storage.cachedToken);
    return storage.token().then(_startFrom);
  }

  Prefs? get _prefs {
    try {
      return ref.read(prefsProvider);
    } catch (_) {
      return null; // tests without prefs
    }
  }

  /// Signed in: the last known profile (or a placeholder) right away, and
  /// `/me` in the background. Signed out: null, so onboarding shows at once.
  AppUser? _startFrom(String? token) {
    if (token == null) return null;
    final json = _prefs?.cachedUser;
    AppUser? cached;
    if (json != null) {
      try {
        cached = AppUser.fromJson(json);
      } catch (_) {}
    }
    Timer.run(() => unawaited(_revalidate()));
    // Offline without a cached profile: keep the session, show what we have.
    // The camera and upload queue work without a profile.
    return cached ??
        AppUser(
          id: '',
          name: '',
          email: '',
          avatarColor: '#d9472b',
          isPro: false,
          notifyNewPhotos: true,
          notifyRecap: true,
        );
  }

  /// Background `/me` after a cached start. A 401 / ban signs out through the
  /// unauthorized handler; offline keeps the cached session.
  Future<void> _revalidate() async {
    try {
      final res = await _api.get('/me');
      if (!ref.mounted) return;
      final user = _userFrom(res);
      state = AsyncData(user);
      unawaited(_afterSignIn(user));
    } catch (_) {}
  }

  /// Parses `res['user']` and remembers it for the next cold start.
  AppUser _userFrom(Map<String, dynamic> res) {
    final json = res['user'] as Map<String, dynamic>;
    final user = AppUser.fromJson(json);
    _prefs?.cachedUser = json;
    return user;
  }

  Future<void> _afterSignIn(AppUser user) async {
    if (user.id.isEmpty) return;
    try {
      await ref.read(pushProvider).register();
    } catch (_) {}
    try {
      await _premiumConfigured();
      await ref.read(premiumProvider.notifier).onSignedIn(user.id);
    } catch (_) {}
  }

  /// RevenueCat is configured after the first frame; wait for it (bounded).
  Future<void> _premiumConfigured() async {
    if (ref.read(premiumProvider).configured) return;
    final done = Completer<void>();
    final sub = ref.listen(premiumProvider.select((s) => s.configured), (_, ok) {
      if (ok && !done.isCompleted) done.complete();
    });
    try {
      await done.future.timeout(const Duration(seconds: 10));
    } catch (_) {
    } finally {
      sub.close();
    }
  }

  Future<void> _accept(Map<String, dynamic> res) async {
    await ref.read(sessionStorageProvider).save(res['token'] as String);
    final user = _userFrom(res);
    state = AsyncData(user);
    unawaited(_afterSignIn(user));
  }

  Future<void> signInWithApple() async {
    final cred = await SignInWithApple.getAppleIDCredential(
      scopes: [AppleIDAuthorizationScopes.email, AppleIDAuthorizationScopes.fullName],
    );
    final token = cred.identityToken;
    if (token == null) throw ApiException(L10n.current.signInAppleFailed);
    final res = await _api.post('/auth/apple', {
      'identityToken': token,
      // Lets the server get a refresh token it can revoke when the account is deleted.
      'authorizationCode': cred.authorizationCode,
      'givenName': ?cred.givenName,
      'familyName': ?cred.familyName,
      'email': ?cred.email,
    });
    await _accept(res);
  }

  Future<void> _initGoogle() async {
    if (_googleReady) return;
    await GoogleSignIn.instance.initialize(
      clientId: defaultTargetPlatform == TargetPlatform.iOS && AppConfig.googleIosClientId.isNotEmpty ? AppConfig.googleIosClientId : null,
      serverClientId: AppConfig.googleServerClientId.isEmpty ? null : AppConfig.googleServerClientId,
    );
    _googleReady = true;
  }

  Future<void> signInWithGoogle() async {
    // The button is hidden when unconfigured; this guards any other caller.
    if (!AppConfig.googleSignInAvailable) throw ApiException(L10n.current.googleSignInUnavailable);
    await _initGoogle();
    final account = await GoogleSignIn.instance.authenticate();
    final idToken = account.authentication.idToken;
    if (idToken == null) throw ApiException(L10n.current.signInGoogleFailed);
    final res = await _api.post('/auth/google', {'idToken': idToken});
    await _accept(res);
  }

  // ---- E-mail + password ----

  /// Creates an e-mail account and signs in.
  Future<void> register({required String name, required String email, required String password}) async {
    final res = await _api.post('/auth/register', {'name': name.trim(), 'email': email.trim(), 'password': password});
    await _accept(res);
  }

  Future<void> signInWithEmail({required String email, required String password}) async {
    final res = await _api.post('/auth/login', {'email': email.trim(), 'password': password});
    await _accept(res);
  }

  /// Asks the server to push a 6-digit code to devices where this account is
  /// still signed in (no e-mail). Always succeeds when the request
  /// went through, whether or not the address has an account.
  Future<void> requestPasswordReset(String email) async {
    await _api.post('/auth/forgot', {'email': email.trim()});
  }

  /// Sets a new password with the code from the push and signs in.
  Future<void> resetPassword({required String email, required String code, required String password}) async {
    final res = await _api.post('/auth/reset', {'email': email.trim(), 'code': code.trim(), 'password': password});
    await _accept(res);
  }

  Future<void> refresh() async {
    try {
      final res = await _api.get('/me');
      state = AsyncData(_userFrom(res));
    } catch (_) {}
  }

  Future<void> updateProfile({String? name, bool? notifyNewPhotos, bool? notifyRecap}) async {
    final res = await _api.patch('/me', {
      'name': ?name,
      if (notifyNewPhotos != null || notifyRecap != null)
        'settings': {'notifyNewPhotos': ?notifyNewPhotos, 'notifyRecap': ?notifyRecap},
    });
    state = AsyncData(_userFrom(res));
  }

  Future<void> signOut() async {
    try {
      await ref.read(pushProvider).unregister();
    } catch (_) {}
    try {
      await ref.read(premiumProvider.notifier).onSignedOut();
    } catch (_) {}
    if (_googleReady) {
      try {
        await GoogleSignIn.instance.signOut();
      } catch (_) {}
    }
    await ref.read(sessionStorageProvider).clear();
    _prefs
      ?..cachedUser = null
      ..cachedGroups = null;
    state = const AsyncData(null);
  }

  Future<void> deleteAccount() async {
    await _api.delete('/me');
    // Nothing of this account may be uploaded later under another sign-in.
    await ref.read(uploadQueueProvider.notifier).clear();
    await signOut();
  }

  /// "Lid blokkeren": hides every photo of [userId] for this account.
  Future<void> block(String userId) async {
    final res = await _api.post('/me/blocks', {'userId': userId});
    state = AsyncData(_userFrom(res));
    ref.invalidate(galleryProvider); // every gallery reloads without their photos
  }

  Future<void> unblock(String userId) async {
    final res = await _api.delete('/me/blocks/$userId');
    state = AsyncData(_userFrom(res));
    ref.invalidate(galleryProvider);
  }

  Future<List<Member>> blockedUsers() async {
    final res = await _api.get('/me/blocks');
    return ((res['users'] as List?) ?? const []).map((u) => Member.fromJson(u as Map<String, dynamic>)).toList();
  }
}
