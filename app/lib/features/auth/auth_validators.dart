import '../../l10n/l10n.dart';

/// Form checks for the e-mail sign-in screens. Pure functions (no widgets), so
/// they are easy to test. Each returns a message in the app's language (or in
/// [l] when given), or null when valid. The server checks the same rules again.
class AuthValidators {
  AuthValidators._();

  static const int passwordMin = 8;

  static final _email = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]{2,}$');

  static String? name(String? v, [AppLocalizations? l]) {
    l ??= L10n.current;
    final s = (v ?? '').trim();
    if (s.isEmpty) return l.validationNameRequired;
    if (s.length > 40) return l.validationMaxChars(40);
    return null;
  }

  static String? email(String? v, [AppLocalizations? l]) {
    l ??= L10n.current;
    final s = (v ?? '').trim();
    if (s.isEmpty) return l.validationEmailRequired;
    if (s.length > 254 || !_email.hasMatch(s)) return l.validationEmailInvalid;
    return null;
  }

  /// For a new password (register / reset).
  static String? newPassword(String? v, [AppLocalizations? l]) {
    l ??= L10n.current;
    final s = v ?? '';
    if (s.isEmpty) return l.validationPasswordRequired;
    if (s.length < passwordMin) return l.validationMinChars(passwordMin);
    if (s.length > 200) return l.validationPasswordTooLong;
    return null;
  }

  /// For signing in: only checks that something was typed.
  static String? password(String? v, [AppLocalizations? l]) =>
      (v ?? '').isEmpty ? (l ?? L10n.current).validationPasswordEmpty : null;

  static String? code(String? v, [AppLocalizations? l]) {
    l ??= L10n.current;
    final s = (v ?? '').replaceAll(RegExp(r'\s'), '');
    if (s.isEmpty) return l.validationCodeRequired;
    if (!RegExp(r'^\d{6}$').hasMatch(s)) return l.validationCodeDigits;
    return null;
  }
}
