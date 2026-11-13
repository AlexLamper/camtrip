import 'dart:io';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/api.dart';
import '../../core/config.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../settings/language_screen.dart';
import 'auth_controller.dart';
import 'onboarding_slides.dart';

/// Welcome + sign-in in one screen: three slides, then Apple / Google.
class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key, this.pendingCode});
  final String? pendingCode;
  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final _pages = PageController();
  int _page = 0;
  String? _busyWith; // 'apple' / 'google' while that sign-in runs

  static const _slideCount = 3;

  (String, String) _slide(AppLocalizations l, int i) => switch (i) {
        0 => (l.onboarding1Title, l.onboarding1Body),
        1 => (l.onboarding2Title, l.onboarding2Body),
        _ => (l.onboarding3Title, l.onboarding3Body),
      };

  Future<void> _signIn(String which, Future<void> Function() fn) async {
    setState(() => _busyWith = which);
    try {
      await fn();
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code != AuthorizationErrorCode.canceled && mounted) showMessage(context, context.l10n.signInAppleFailed);
    } on GoogleSignInException catch (e) {
      if (e.code != GoogleSignInExceptionCode.canceled && mounted) showMessage(context, context.l10n.signInGoogleFailed);
    } on ApiException catch (e) {
      if (mounted) showMessage(context, e.message);
    } catch (e) {
      debugPrint('sign-in failed: $e');
      if (mounted) showMessage(context, context.l10n.signInFailed);
    } finally {
      if (mounted) setState(() => _busyWith = null);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.read(authProvider.notifier);
    final l = context.l10n;
    final last = _page == _slideCount - 1;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          // Language first, so new people can switch before signing up.
          Align(alignment: AlignmentDirectional.centerEnd, child: _LanguageButton(label: currentLanguageLabel(context, ref.watch(appLanguageProvider)))),
          // Each slide: its visual takes the free space, the text keeps its own height.
          Expanded(
            child: PageView.builder(
              controller: _pages,
              itemCount: _slideCount,
              onPageChanged: (i) => setState(() => _page = i),
              itemBuilder: (_, i) => OnboardingSlide(
                index: i,
                title: _slide(l, i).$1,
                body: _slide(l, i).$2,
                header: widget.pendingCode != null && i == 0
                    ? Text(l.onboardingInvited, style: CT.text(14, color: CT.accent, weight: FontWeight.w600))
                    : null,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 14),
            child: Row(children: [
              for (var i = 0; i < _slideCount; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsetsDirectional.only(end: 6),
                  width: i == _page ? 24 : 6,
                  height: 6,
                  decoration: BoxDecoration(color: i == _page ? CT.ink : const Color(0xFFDDDDDD), borderRadius: BorderRadius.circular(3)),
                ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 8),
            child: !last
                ? CTButton(l.next, onTap: () => _pages.nextPage(duration: const Duration(milliseconds: 280), curve: Curves.easeOut))
                : _signInButtons(auth),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 4, 30, 12),
            child: Text.rich(
              TextSpan(children: [
                TextSpan(text: l.legalPrefix),
                TextSpan(
                  text: l.legalTerms,
                  style: const TextStyle(decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse(AppConfig.termsUrl)),
                ),
                TextSpan(text: l.legalAnd),
                TextSpan(
                  text: l.legalPrivacy,
                  style: const TextStyle(decoration: TextDecoration.underline),
                  recognizer: TapGestureRecognizer()..onTap = () => launchUrl(Uri.parse(AppConfig.privacyUrl)),
                ),
                TextSpan(text: l.legalSuffix),
              ]),
              textAlign: TextAlign.center,
              style: CT.text(12, color: CT.muted),
            ),
          ),
        ]),
      ),
    );
  }

  /// Last step: e-mail account first (best for new people), then sign-in,
  /// then Apple / Google. Google only shows once its client ids are set.
  Widget _signInButtons(AuthController auth) {
    final apple = Platform.isIOS;
    final google = AppConfig.googleSignInAvailable;
    final l = context.l10n;
    Widget appleButton() => CTButton(l.continueWithApple,
        kind: CTButtonKind.ghost, compact: true, icon: Icons.apple, loading: _busyWith == 'apple', onTap: _busyWith != null ? null : () => _signIn('apple', auth.signInWithApple));
    Widget googleButton() => CTButton(l.continueWithGoogle,
        kind: CTButtonKind.ghost, compact: true, icon: Icons.g_mobiledata_rounded, loading: _busyWith == 'google', onTap: _busyWith != null ? null : () => _signIn('google', auth.signInWithGoogle));
    return Column(children: [
      CTButton(l.createAccount, onTap: _busyWith != null ? null : () => context.push('/welcome/email?mode=register')),
      const SizedBox(height: 8),
      CTButton(l.signIn, kind: CTButtonKind.ghost, compact: true, onTap: _busyWith != null ? null : () => context.push('/welcome/email?mode=login')),
      if (apple || google) ...[
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: Row(children: [
            const Expanded(child: Divider(color: CT.line, thickness: 1)),
            Padding(padding: const EdgeInsets.symmetric(horizontal: 12), child: Text(l.or, style: CT.text(12, color: CT.muted))),
            const Expanded(child: Divider(color: CT.line, thickness: 1)),
          ]),
        ),
        if (apple) appleButton(),
        if (apple && google) const SizedBox(height: 8),
        if (google) googleButton(),
      ],
    ]);
  }
}

/// Globe + current language, top right of the welcome screen.
class _LanguageButton extends StatelessWidget {
  const _LanguageButton({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 4, 12, 0),
      child: Semantics(
        button: true,
        label: '${context.l10n.language}: $label',
        excludeSemantics: true,
        child: InkWell(
          key: const ValueKey('onboarding-language'),
          borderRadius: BorderRadius.circular(18),
          onTap: () => openLanguagePicker(context),
          child: ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 36, maxWidth: 240),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
              child: Row(mainAxisSize: MainAxisSize.min, children: [
                const Icon(Icons.language_rounded, size: 18, color: CT.muted),
                const SizedBox(width: 6),
                Flexible(child: Text(label, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(13, color: CT.muted, weight: FontWeight.w500))),
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
