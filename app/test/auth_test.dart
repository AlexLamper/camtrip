import 'package:camtrip/core/config.dart';
import 'package:camtrip/features/auth/auth_controller.dart';
import 'package:camtrip/features/auth/auth_validators.dart';
import 'package:camtrip/features/auth/email_auth_screen.dart';
import 'package:camtrip/features/auth/onboarding_screen.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/l10n.dart';

/// Signed-out session that never touches storage or the network.
class _SignedOut extends AuthController {
  @override
  Future<AppUser?> build() async => null;
}

Widget _app(Widget child) => ProviderScope(
      overrides: [authProvider.overrideWith(_SignedOut.new)],
      child: localizedApp(home: child),
    );

void main() {
  setUpAll(useDutch);
  group('AuthValidators', () {
    test('name', () {
      expect(AuthValidators.name(''), 'Vul je naam in');
      expect(AuthValidators.name('   '), 'Vul je naam in');
      expect(AuthValidators.name('x' * 41), 'Maximaal 40 tekens');
      expect(AuthValidators.name(' Alex '), isNull);
    });

    test('email', () {
      expect(AuthValidators.email(null), 'Vul je e-mailadres in');
      expect(AuthValidators.email('alex'), 'Dit e-mailadres klopt niet');
      expect(AuthValidators.email('alex@camtrip'), 'Dit e-mailadres klopt niet');
      expect(AuthValidators.email('a lex@camtrip.app'), 'Dit e-mailadres klopt niet');
      expect(AuthValidators.email(' Alex@CamTrip.app '), isNull);
    });

    test('new password needs 8 characters', () {
      expect(AuthValidators.newPassword(''), 'Kies een wachtwoord');
      expect(AuthValidators.newPassword('1234567'), 'Minstens 8 tekens');
      expect(AuthValidators.newPassword('12345678'), isNull);
      expect(AuthValidators.newPassword('x' * 201), 'Dit wachtwoord is te lang');
    });

    test('sign-in password only has to be filled in', () {
      expect(AuthValidators.password(''), 'Vul je wachtwoord in');
      expect(AuthValidators.password('kort'), isNull);
    });

    test('reset code', () {
      expect(AuthValidators.code(''), 'Vul de code uit de mail in');
      expect(AuthValidators.code('12345'), 'De code bestaat uit 6 cijfers');
      expect(AuthValidators.code('12a456'), 'De code bestaat uit 6 cijfers');
      expect(AuthValidators.code('012 345'), isNull);
    });
  });

  test('EmailAuthMode.parse falls back to register', () {
    expect(EmailAuthMode.parse('login'), EmailAuthMode.login);
    expect(EmailAuthMode.parse('reset'), EmailAuthMode.reset);
    expect(EmailAuthMode.parse(null), EmailAuthMode.register);
    expect(EmailAuthMode.parse('nope'), EmailAuthMode.register);
  });

  test('Google is only offered when its client id is configured', () {
    expect(AppConfig.googleSignInConfigured(TargetPlatform.iOS), AppConfig.googleIosClientId.isNotEmpty);
    expect(AppConfig.googleSignInConfigured(TargetPlatform.android), AppConfig.googleServerClientId.isNotEmpty);
    expect(AppConfig.googleSignInConfigured(TargetPlatform.linux), isFalse);
  });

  group('EmailAuthScreen', () {
    testWidgets('register shows Dutch validation messages', (tester) async {
      await tester.pumpWidget(_app(const EmailAuthScreen()));
      expect(find.text('Account aanmaken'), findsNWidgets(2)); // title + button
      await tester.tap(find.widgetWithText(InkWell, 'Account aanmaken'));
      await tester.pump();
      expect(find.text('Vul je naam in'), findsOneWidget);
      expect(find.text('Vul je e-mailadres in'), findsOneWidget);
      expect(find.text('Kies een wachtwoord'), findsOneWidget);

      await tester.enterText(find.byType(TextFormField).at(0), 'Alex');
      await tester.enterText(find.byType(TextFormField).at(1), 'alex@');
      await tester.enterText(find.byType(TextFormField).at(2), 'kort');
      await tester.pumpAndSettle(); // helper text fades out for the error
      expect(find.text('Vul je naam in'), findsNothing);
      expect(find.text('Dit e-mailadres klopt niet'), findsOneWidget);
      expect(find.text('Minstens 8 tekens'), findsOneWidget);
    });

    testWidgets('password can be shown and hidden', (tester) async {
      await tester.pumpWidget(_app(const EmailAuthScreen(initialMode: EmailAuthMode.login)));
      TextField pw() => tester.widget<TextField>(find.byType(TextField).last);
      expect(pw().obscureText, isTrue);
      await tester.tap(find.byTooltip('Toon wachtwoord'));
      await tester.pump();
      expect(pw().obscureText, isFalse);
      await tester.tap(find.byTooltip('Verberg wachtwoord'));
      await tester.pump();
      expect(pw().obscureText, isTrue);
    });

    testWidgets('login links to forgot password, which asks only for the e-mail', (tester) async {
      await tester.pumpWidget(_app(const EmailAuthScreen(initialMode: EmailAuthMode.login)));
      expect(find.byType(TextFormField), findsNWidgets(2));
      await tester.tap(find.text('Wachtwoord vergeten?'));
      await tester.pumpAndSettle();
      expect(find.text('Wachtwoord vergeten'), findsOneWidget);
      expect(find.byType(TextFormField), findsOneWidget);
      await tester.tap(find.widgetWithText(InkWell, 'Stuur code'));
      await tester.pump();
      expect(find.text('Vul je e-mailadres in'), findsOneWidget);
    });

    testWidgets('reset asks for the 6-digit code and a new password', (tester) async {
      await tester.pumpWidget(_app(const EmailAuthScreen(initialMode: EmailAuthMode.reset)));
      expect(find.byType(TextFormField), findsNWidgets(3));
      await tester.enterText(find.byType(TextFormField).at(1), '12ab3');
      await tester.tap(find.widgetWithText(InkWell, 'Wachtwoord opslaan'));
      await tester.pump();
      expect(find.text('De code bestaat uit 6 cijfers'), findsOneWidget); // letters filtered: "123"
      expect(find.text('Kies een wachtwoord'), findsOneWidget);
    });

    testWidgets('switching between register and login', (tester) async {
      await tester.pumpWidget(_app(const EmailAuthScreen()));
      await tester.tap(find.widgetWithText(TextButton, 'Inloggen'));
      await tester.pumpAndSettle();
      expect(find.text('Welkom terug.'), findsOneWidget);
      expect(find.byType(TextFormField), findsNWidgets(2));
      await tester.tap(find.widgetWithText(TextButton, 'Account aanmaken'));
      await tester.pumpAndSettle();
      expect(find.byType(TextFormField), findsNWidgets(3));
    });
  });

  testWidgets('onboarding last step offers account, sign-in and no unconfigured Google', (tester) async {
    tester.view.physicalSize = const Size(390 * 3, 844 * 3);
    tester.view.devicePixelRatio = 3;
    addTearDown(tester.view.reset);
    await tester.pumpWidget(_app(const OnboardingScreen()));
    await tester.pump();
    final pages = find.byType(PageView);
    for (var i = 0; i < 2; i++) {
      await tester.drag(pages, const Offset(-400, 0));
      await tester.pumpAndSettle();
    }
    expect(find.text('Account aanmaken'), findsOneWidget);
    expect(find.text('Inloggen'), findsOneWidget);
    expect(find.text('Doorgaan met Google'), AppConfig.googleSignInAvailable ? findsOneWidget : findsNothing);
    expect(tester.takeException(), isNull);
  });
}
