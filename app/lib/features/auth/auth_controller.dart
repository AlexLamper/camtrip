import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../core/api.dart';
import '../../core/config.dart';
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
  Future<AppUser?> build() async {
    ref.read(unauthorizedHandlerProvider).callback = () {
      if (state.value != null) unawaited(signOut());
    };
    return _restore();
  }

  Future<AppUser?> _restore() async {
    final token = await ref.read(sessionStorageProvider).token();
    if (token == null) return null;
    try {
      final res = await _api.get('/me');
      final user = AppUser.fromJson(res['user'] as Map<String, dynamic>);
      unawaited(_afterSignIn(user));
      return user;
    } on ApiException catch (e) {
      if (e.isUnauthorized || e.isBanned) {
        await ref.read(sessionStorageProvider).clear();
        return null;
      }
      // Offline at launch: keep the session, show what we have. The camera and
      // upload queue work without a profile.
      return AppUser(
        id: '',
        name: '',
        email: '',
        avatarColor: '#d9472b',
        isPro: false,
        notifyNewPhotos: true,
        notifyRecap: true,
      );
    }
  }

  Future<void> _afterSignIn(AppUser user) async {
    if (user.id.isEmpty) return;
    try {
      await ref.read(premiumProvider.notifier).onSignedIn(user.id);
    } catch (_) {}
    try {
      await ref.read(pushProvider).register();
    } catch (_) {}
  }

  Future<void> _accept(Map<String, dynamic> res) async {
    await ref.read(sessionStorageProvider).save(res['token'] as String);
    final user = AppUser.fromJson(res['user'] as Map<String, dynamic>);
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
      state = AsyncData(AppUser.fromJson(res['user'] as Map<String, dynamic>));
    } catch (_) {}
  }

  Future<void> updateProfile({String? name, bool? notifyNewPhotos, bool? notifyRecap}) async {
    final res = await _api.patch('/me', {
      'name': ?name,
      if (notifyNewPhotos != null || notifyRecap != null)
        'settings': {'notifyNewPhotos': ?notifyNewPhotos, 'notifyRecap': ?notifyRecap},
    });
    state = AsyncData(AppUser.fromJson(res['user'] as Map<String, dynamic>));
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
    state = AsyncData(AppUser.fromJson(res['user'] as Map<String, dynamic>));
    ref.invalidate(galleryProvider); // every gallery reloads without their photos
  }

  Future<void> unblock(String userId) async {
    final res = await _api.delete('/me/blocks/$userId');
    state = AsyncData(AppUser.fromJson(res['user'] as Map<String, dynamic>));
    ref.invalidate(galleryProvider);
  }

  Future<List<Member>> blockedUsers() async {
    final res = await _api.get('/me/blocks');
    return ((res['users'] as List?) ?? const []).map((u) => Member.fromJson(u as Map<String, dynamic>)).toList();
  }
}
