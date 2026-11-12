/// Form checks for the e-mail sign-in screens. Pure functions (no Flutter), so
/// they are easy to test. Each returns a Dutch message, or null when valid.
/// The server checks the same rules again.
class AuthValidators {
  AuthValidators._();

  static const int passwordMin = 8;

  static final _email = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]{2,}$');

  static String? name(String? v) {
    final s = (v ?? '').trim();
    if (s.isEmpty) return 'Vul je naam in';
    if (s.length > 40) return 'Maximaal 40 tekens';
    return null;
  }

  static String? email(String? v) {
    final s = (v ?? '').trim();
    if (s.isEmpty) return 'Vul je e-mailadres in';
    if (s.length > 254 || !_email.hasMatch(s)) return 'Dit e-mailadres klopt niet';
    return null;
  }

  /// For a new password (register / reset).
  static String? newPassword(String? v) {
    final s = v ?? '';
    if (s.isEmpty) return 'Kies een wachtwoord';
    if (s.length < passwordMin) return 'Minstens $passwordMin tekens';
    if (s.length > 200) return 'Dit wachtwoord is te lang';
    return null;
  }

  /// For signing in: only checks that something was typed.
  static String? password(String? v) => (v ?? '').isEmpty ? 'Vul je wachtwoord in' : null;

  static String? code(String? v) {
    final s = (v ?? '').replaceAll(RegExp(r'\s'), '');
    if (s.isEmpty) return 'Vul de code uit de mail in';
    if (!RegExp(r'^\d{6}$').hasMatch(s)) return 'De code bestaat uit 6 cijfers';
    return null;
  }
}
