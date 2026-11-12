import 'package:flutter/foundation.dart';

/// Build-time configuration. Everything can be overridden with
/// `--dart-define=KEY=value` (CI does this), so no secrets live in git.
class AppConfig {
  AppConfig._();

  static const String siteUrl = String.fromEnvironment('SITE_URL', defaultValue: 'https://camtrip.app');

  static const String _apiOverride = String.fromEnvironment('API_BASE_URL', defaultValue: '');

  static String get apiBaseUrl => _apiOverride.isNotEmpty ? _apiOverride : '$siteUrl/api/mobile';

  static const String privacyUrl = '$siteUrl/privacy';
  static const String termsUrl = '$siteUrl/voorwaarden';
  static const String appleEulaUrl = 'https://www.apple.com/legal/internet-services/itunes/dev/stdeula/';
  static const String supportEmail = 'support@camtrip.app';

  /// Google OAuth "web" client id: needed as serverClientId on Android so the
  /// id token is issued for our backend.
  static const String googleServerClientId = String.fromEnvironment('GOOGLE_SERVER_CLIENT_ID', defaultValue: '');

  /// iOS OAuth client id for Google Sign-In.
  static const String googleIosClientId = String.fromEnvironment('GOOGLE_IOS_CLIENT_ID', defaultValue: '');

  static String inviteUrl(String code) => '$siteUrl/j/${code.toUpperCase()}';

  static String inviteMessage(String groupName, String code) => [
        'Doe je mee met "$groupName" op CamTrip? Dan zien we elkaars foto\'s meteen.',
        '',
        inviteUrl(code),
        '',
        'Of vul de code in: ${code.toUpperCase()}',
      ].join('\n');

  static bool get isDebug => kDebugMode;
}

/// RevenueCat public SDK keys. Safe to ship in the binary (that is how
/// RevenueCat works); purchases are validated by Apple/Google + RevenueCat.
class RevenueCatConfig {
  RevenueCatConfig._();

  static const String appleKey = String.fromEnvironment('REVENUECAT_APPLE_KEY', defaultValue: '');
  static const String googleKey = String.fromEnvironment('REVENUECAT_GOOGLE_KEY', defaultValue: '');
  static const String testKey = String.fromEnvironment('REVENUECAT_TEST_KEY', defaultValue: '');

  static const String proEntitlement = 'pro';

  static String sdkKey() {
    if (kIsWeb) return '';
    if (!kReleaseMode && testKey.isNotEmpty) return testKey;
    return defaultTargetPlatform == TargetPlatform.iOS ? appleKey : googleKey;
  }
}
