import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import 'auth_controller.dart';
import 'auth_validators.dart';

enum EmailAuthMode {
  register,
  login,
  forgot,
  reset;

  static EmailAuthMode parse(String? v) => EmailAuthMode.values.firstWhere((m) => m.name == v, orElse: () => EmailAuthMode.register);
}

/// Account aanmaken / inloggen / wachtwoord vergeten / nieuwe code, in one
/// screen that switches mode in place (the e-mail carries over). On success
/// the router leaves the welcome flow by itself.
class EmailAuthScreen extends ConsumerStatefulWidget {
  const EmailAuthScreen({super.key, this.initialMode = EmailAuthMode.register});
  final EmailAuthMode initialMode;

  @override
  ConsumerState<EmailAuthScreen> createState() => _EmailAuthScreenState();
}

class _EmailAuthScreenState extends ConsumerState<EmailAuthScreen> {
  final _form = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  final _code = TextEditingController();
  late EmailAuthMode _mode = widget.initialMode;
  bool _busy = false;
  bool _showPassword = false;
  AutovalidateMode _autovalidate = AutovalidateMode.disabled;

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    _password.dispose();
    _code.dispose();
    super.dispose();
  }

  void _switch(EmailAuthMode mode) {
    setState(() {
      _mode = mode;
      _autovalidate = AutovalidateMode.disabled;
      _password.clear();
      if (mode != EmailAuthMode.reset) _code.clear();
    });
    _form.currentState?.reset();
  }

  (String, String) get _copy => switch (_mode) {
        EmailAuthMode.register => ('Account aanmaken', 'Zo zien je vrienden wie de foto\'s maakt.'),
        EmailAuthMode.login => ('Inloggen', 'Welkom terug.'),
        EmailAuthMode.forgot => ('Wachtwoord vergeten', 'We mailen je een code van 6 cijfers om een nieuw wachtwoord in te stellen.'),
        EmailAuthMode.reset => ('Nieuw wachtwoord', 'Vul de code uit de mail in die we naar ${_email.text.trim()} stuurden. Zie je niets? Kijk ook in je spam.'),
      };

  String get _submitLabel => switch (_mode) {
        EmailAuthMode.register => 'Account aanmaken',
        EmailAuthMode.login => 'Inloggen',
        EmailAuthMode.forgot => 'Stuur code',
        EmailAuthMode.reset => 'Wachtwoord opslaan',
      };

  Future<void> _submit() async {
    if (_busy) return;
    if (!(_form.currentState?.validate() ?? false)) {
      setState(() => _autovalidate = AutovalidateMode.onUserInteraction);
      return;
    }
    FocusScope.of(context).unfocus();
    final auth = ref.read(authProvider.notifier);
    setState(() => _busy = true);
    try {
      switch (_mode) {
        case EmailAuthMode.register:
          await auth.register(name: _name.text, email: _email.text, password: _password.text);
          TextInput.finishAutofillContext();
        case EmailAuthMode.login:
          await auth.signInWithEmail(email: _email.text, password: _password.text);
          TextInput.finishAutofillContext();
        case EmailAuthMode.forgot:
          await auth.requestPasswordReset(_email.text);
          if (mounted) {
            _switch(EmailAuthMode.reset);
            showMessage(context, 'Als er een account bij dit adres hoort, staat de code in je mail.');
          }
        case EmailAuthMode.reset:
          await auth.resetPassword(email: _email.text, code: _code.text, password: _password.text);
          TextInput.finishAutofillContext();
      }
    } on ApiException catch (e) {
      if (mounted) showMessage(context, e.message);
    } catch (e) {
      debugPrint('email auth failed: $e');
      if (mounted) showMessage(context, 'Er ging iets mis. Probeer het opnieuw.');
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final (title, subtitle) = _copy;
    final needsName = _mode == EmailAuthMode.register;
    final needsPassword = _mode != EmailAuthMode.forgot;
    final newPassword = _mode == EmailAuthMode.register || _mode == EmailAuthMode.reset;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new_rounded, size: 20),
          tooltip: 'Terug',
          onPressed: () {
            // Within the password-reset steps "back" goes to sign-in first.
            if (_mode == EmailAuthMode.forgot || _mode == EmailAuthMode.reset) {
              _switch(EmailAuthMode.login);
            } else {
              Navigator.of(context).maybePop();
            }
          },
        ),
      ),
      body: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          behavior: HitTestBehavior.translucent,
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
            child: AutofillGroup(
              child: Form(
                key: _form,
                autovalidateMode: _autovalidate,
                child: Column(crossAxisAlignment: CrossAxisAlignment.stretch, children: [
                  Text(title, style: CT.title(30)),
                  const SizedBox(height: 8),
                  Text(subtitle, style: CT.text(15, color: CT.muted)),
                  const SizedBox(height: 26),
                  if (needsName) ...[
                    _Field(
                      key: const ValueKey('name'),
                      label: 'Naam',
                      controller: _name,
                      validator: AuthValidators.name,
                      autofillHints: const [AutofillHints.name],
                      textCapitalization: TextCapitalization.words,
                      maxLength: 40,
                    ),
                    const SizedBox(height: 14),
                  ],
                  _Field(
                    key: const ValueKey('email'),
                    label: 'E-mailadres',
                    controller: _email,
                    validator: AuthValidators.email,
                    keyboardType: TextInputType.emailAddress,
                    autofillHints: const [AutofillHints.email, AutofillHints.username],
                    enabled: _mode != EmailAuthMode.reset,
                    action: _mode == EmailAuthMode.forgot ? TextInputAction.done : TextInputAction.next,
                    onSubmitted: _mode == EmailAuthMode.forgot ? (_) => _submit() : null,
                  ),
                  if (_mode == EmailAuthMode.reset) ...[
                    const SizedBox(height: 14),
                    _Field(
                      key: const ValueKey('code'),
                      label: 'Code uit de mail',
                      controller: _code,
                      validator: AuthValidators.code,
                      keyboardType: TextInputType.number,
                      autofillHints: const [AutofillHints.oneTimeCode],
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(6)],
                      autofocus: true,
                    ),
                  ],
                  if (needsPassword) ...[
                    const SizedBox(height: 14),
                    _Field(
                      key: ValueKey(newPassword ? 'new-password' : 'password'),
                      label: _mode == EmailAuthMode.reset ? 'Nieuw wachtwoord' : 'Wachtwoord',
                      helper: newPassword ? 'Minstens ${AuthValidators.passwordMin} tekens' : null,
                      controller: _password,
                      validator: newPassword ? AuthValidators.newPassword : AuthValidators.password,
                      obscure: !_showPassword,
                      autofillHints: [newPassword ? AutofillHints.newPassword : AutofillHints.password],
                      action: TextInputAction.done,
                      onSubmitted: (_) => _submit(),
                      suffix: IconButton(
                        tooltip: _showPassword ? 'Verberg wachtwoord' : 'Toon wachtwoord',
                        icon: Icon(_showPassword ? Icons.visibility_off_outlined : Icons.visibility_outlined, color: CT.muted),
                        onPressed: () => setState(() => _showPassword = !_showPassword),
                      ),
                    ),
                  ],
                  if (_mode == EmailAuthMode.login)
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: _busy ? null : () => _switch(EmailAuthMode.forgot),
                        style: TextButton.styleFrom(foregroundColor: CT.ink),
                        child: Text('Wachtwoord vergeten?', style: CT.text(14, weight: FontWeight.w600)),
                      ),
                    )
                  else
                    const SizedBox(height: 22),
                  CTButton(_submitLabel, loading: _busy, onTap: _submit),
                  const SizedBox(height: 14),
                  _footer(),
                ]),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _footer() {
    Widget link(String text, String action, VoidCallback onTap) => Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(text, style: CT.text(14, color: CT.muted)),
          TextButton(
            onPressed: _busy ? null : onTap,
            style: TextButton.styleFrom(foregroundColor: CT.accent, padding: const EdgeInsets.symmetric(horizontal: 6)),
            child: Text(action, style: CT.text(14, color: CT.accent, weight: FontWeight.w600)),
          ),
        ]);
    return switch (_mode) {
      EmailAuthMode.register => link('Heb je al een account?', 'Inloggen', () => _switch(EmailAuthMode.login)),
      EmailAuthMode.login => link('Nieuw bij CamTrip?', 'Account aanmaken', () => _switch(EmailAuthMode.register)),
      EmailAuthMode.forgot => link('Weet je het weer?', 'Inloggen', () => _switch(EmailAuthMode.login)),
      EmailAuthMode.reset => link('Geen code gekregen?', 'Opnieuw sturen', () => _switch(EmailAuthMode.forgot)),
    };
  }
}

class _Field extends StatelessWidget {
  const _Field({
    super.key,
    required this.label,
    required this.controller,
    required this.validator,
    this.helper,
    this.keyboardType,
    this.autofillHints,
    this.obscure = false,
    this.suffix,
    this.action = TextInputAction.next,
    this.onSubmitted,
    this.textCapitalization = TextCapitalization.none,
    this.inputFormatters,
    this.maxLength,
    this.enabled = true,
    this.autofocus = false,
  });

  final String label;
  final String? helper;
  final TextEditingController controller;
  final String? Function(String?) validator;
  final TextInputType? keyboardType;
  final Iterable<String>? autofillHints;
  final bool obscure;
  final Widget? suffix;
  final TextInputAction action;
  final ValueChanged<String>? onSubmitted;
  final TextCapitalization textCapitalization;
  final List<TextInputFormatter>? inputFormatters;
  final int? maxLength;
  final bool enabled;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(label.toUpperCase(), style: CT.label),
      const SizedBox(height: 6),
      TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        autofillHints: enabled ? autofillHints : null,
        obscureText: obscure,
        enableSuggestions: !obscure && keyboardType != TextInputType.emailAddress,
        autocorrect: false,
        textInputAction: action,
        onFieldSubmitted: onSubmitted,
        textCapitalization: textCapitalization,
        inputFormatters: inputFormatters,
        maxLength: maxLength,
        enabled: enabled,
        autofocus: autofocus,
        style: CT.text(16),
        decoration: InputDecoration(
          helperText: helper,
          helperStyle: CT.text(12, color: CT.muted),
          counterText: '',
          suffixIcon: suffix,
          errorBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: CT.accent, width: 1.5)),
          focusedErrorBorder:
              OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: CT.accent, width: 1.5)),
          disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: CT.line, width: 1.5)),
          errorStyle: CT.text(12, color: CT.accent),
        ),
      ),
    ]);
  }
}
