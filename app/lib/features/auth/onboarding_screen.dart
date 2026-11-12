import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/api.dart';
import '../../core/config.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import 'auth_controller.dart';

const _scenes = [
  [Color(0xFFF59E5B), Color(0xFFF7C27A), Color(0xFF3D7EA6), Color(0xFFE9D2A4)],
  [Color(0xFFFFB36B), Color(0xFFFFD9A0), Color(0xFF3A2A22), Color(0xFFF0A868)],
  [Color(0xFF3FC1D3), Color(0xFF1F8FB0), Color(0xFFF3E5C8), Color(0xFFE7D1AA)],
];

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
  bool _busy = false;

  static const _slides = [
    ('Eén rolletje\nvoor de hele groep.', 'Schiet met een retro-camera. Iedereen ziet je foto\'s direct, en ze staan meteen in je eigen album.'),
    ('Geen gedoe met\ndoorsturen.', 'Maak een groep, deel de code, klaar. Nooit meer "stuur je die foto\'s nog even?"'),
    ('Na afloop een\nrecap-video.', 'CamTrip maakt een video met muziek van jullie mooiste momenten.'),
  ];

  Future<void> _signIn(Future<void> Function() fn) async {
    setState(() => _busy = true);
    try {
      await fn();
    } on SignInWithAppleAuthorizationException catch (e) {
      if (e.code != AuthorizationErrorCode.canceled && mounted) showMessage(context, 'Inloggen met Apple lukte niet');
    } on GoogleSignInException catch (e) {
      if (e.code != GoogleSignInExceptionCode.canceled && mounted) showMessage(context, 'Inloggen met Google lukte niet');
    } on ApiException catch (e) {
      if (mounted) showMessage(context, e.message);
    } catch (e) {
      if (mounted) showMessage(context, 'Inloggen lukte niet');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.read(authProvider.notifier);
    final last = _page == _slides.length - 1;
    return Scaffold(
      body: SafeArea(
        child: Column(children: [
          SizedBox(height: 360, child: _prints()),
          Expanded(
            child: PageView.builder(
              controller: _pages,
              itemCount: _slides.length,
              onPageChanged: (i) => setState(() => _page = i),
              itemBuilder: (_, i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 28),
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  if (widget.pendingCode != null && i == 0) ...[
                    Text('Je bent uitgenodigd! Log in om mee te doen.', style: CT.text(14, color: CT.accent, weight: FontWeight.w600)),
                    const SizedBox(height: 8),
                  ],
                  Text(_slides[i].$1, style: CT.title(32)),
                  const SizedBox(height: 12),
                  Text(_slides[i].$2, style: CT.text(16, color: const Color(0xFF555550))),
                ]),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(28, 0, 28, 14),
            child: Row(children: [
              for (var i = 0; i < _slides.length; i++)
                AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  margin: const EdgeInsets.only(right: 6),
                  width: i == _page ? 24 : 6,
                  height: 6,
                  decoration: BoxDecoration(color: i == _page ? CT.ink : const Color(0xFFDDDDDD), borderRadius: BorderRadius.circular(3)),
                ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 8),
            child: !last
                ? CTButton('Verder', onTap: () => _pages.nextPage(duration: const Duration(milliseconds: 280), curve: Curves.easeOut))
                : Column(children: [
                    if (Platform.isIOS) ...[
                      CTButton('Doorgaan met Apple', icon: Icons.apple, loading: _busy, onTap: () => _signIn(auth.signInWithApple)),
                      const SizedBox(height: 10),
                    ],
                    CTButton('Doorgaan met Google',
                        kind: CTButtonKind.ghost, icon: Icons.g_mobiledata_rounded, loading: _busy && !Platform.isIOS, onTap: () => _signIn(auth.signInWithGoogle)),
                    if (!Platform.isIOS) const SizedBox(height: 4),
                  ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 4, 30, 12),
            child: GestureDetector(
              onTap: () => launchUrl(Uri.parse(AppConfig.privacyUrl)),
              child: Text(
                'Door verder te gaan ga je akkoord met de voorwaarden en het privacybeleid.',
                textAlign: TextAlign.center,
                style: CT.text(12, color: CT.muted),
              ),
            ),
          ),
        ]),
      ),
    );
  }

  Widget _prints() {
    Widget scene(List<Color> c) => Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: c, stops: const [0, 0.45, 0.46, 1]),
          ),
        );
    return Stack(children: [
      Positioned(left: 26, top: 40, width: 170, child: InstantPrint(rotation: -8, caption: Text('Mallorca · dag 2', style: CT.text(11, color: CT.muted)), child: scene(_scenes[0]))),
      Positioned(right: 26, top: 16, width: 160, child: InstantPrint(rotation: 6, caption: Text('Golden hour', style: CT.text(11, color: CT.muted)), child: scene(_scenes[1]))),
      Positioned(left: 100, top: 170, width: 180, child: InstantPrint(rotation: -2, caption: Text('zwembad ☀', style: CT.text(11, color: CT.muted)), child: scene(_scenes[2]))),
    ]);
  }
}
