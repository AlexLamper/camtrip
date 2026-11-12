import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_scanner/mobile_scanner.dart';

import '../../core/api.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import 'groups_controller.dart';

/// Extracts a group code from a typed code, a camtrip.app/j/CODE link or camtrip://join/CODE.
String? parseInvite(String raw) {
  final s = raw.trim();
  final link = RegExp(r'(?:/j/|join/|[?&]code=)([A-Za-z0-9]{4,8})(?![A-Za-z0-9])').firstMatch(s);
  if (link != null) return link.group(1)!.toUpperCase();
  // Any other link is not an invite (e.g. a QR code of a random website).
  if (s.contains('://') || s.contains('/')) return null;
  final code = s.toUpperCase().replaceAll(RegExp(r'[^A-Z0-9]'), '');
  return code.length >= 4 && code.length <= 8 ? code : null;
}

Future<void> showJoinSheet(BuildContext context, {String? code}) => showModalBottomSheet<void>(
      context: context,
      isScrollControlled: true,
      builder: (_) => JoinSheet(initialCode: code),
    );

class JoinSheet extends ConsumerStatefulWidget {
  const JoinSheet({super.key, this.initialCode});
  final String? initialCode;
  @override
  ConsumerState<JoinSheet> createState() => _JoinSheetState();
}

class _JoinSheetState extends ConsumerState<JoinSheet> {
  late final TextEditingController _code = TextEditingController(text: widget.initialCode ?? '');
  bool _scan = false;
  bool _busy = false;
  String? _error;

  @override
  void initState() {
    super.initState();
    if (widget.initialCode != null) WidgetsBinding.instance.addPostFrameCallback((_) => _join());
  }

  @override
  void dispose() {
    _code.dispose();
    super.dispose();
  }

  Future<void> _join([String? value]) async {
    final code = parseInvite(value ?? _code.text);
    if (code == null) {
      setState(() => _error = 'Vul de code van 6 tekens in');
      return;
    }
    setState(() {
      _busy = true;
      _error = null;
      _scan = false;
      _code.text = code;
    });
    try {
      final g = await ref.read(groupsProvider.notifier).join(code);
      if (!mounted) return;
      Navigator.pop(context);
      HapticFeedback.mediumImpact();
      GoRouter.of(context).push('/group/${g.id}');
    } on ApiException catch (e) {
      if (mounted) setState(() => _error = e.message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(22, 0, 22, MediaQuery.of(context).viewInsets.bottom + 24),
      child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.stretch, children: [
        Text('Join een groep', style: CT.title(24)),
        const SizedBox(height: 4),
        Text('Vul de code van je vrienden in, of scan hun QR-code.', style: CT.text(14, color: CT.muted)),
        const SizedBox(height: 18),
        if (_scan)
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: SizedBox(
              height: 280,
              child: MobileScanner(
                onDetect: (capture) {
                  final v = capture.barcodes.firstOrNull?.rawValue;
                  if (v != null && parseInvite(v) != null && !_busy) _join(v);
                },
              ),
            ),
          )
        else
          TextField(
            controller: _code,
            autofocus: widget.initialCode == null,
            textCapitalization: TextCapitalization.characters,
            textAlign: TextAlign.center,
            maxLength: 8,
            style: CT.title(30).copyWith(letterSpacing: 8),
            decoration: const InputDecoration(hintText: 'K7F2QX', counterText: ''),
            onSubmitted: (_) => _join(),
          ),
        if (_error != null) ...[
          const SizedBox(height: 10),
          Text(_error!, textAlign: TextAlign.center, style: CT.text(14, color: CT.accent, weight: FontWeight.w500)),
        ],
        const SizedBox(height: 16),
        Row(children: [
          Expanded(
            child: CTButton(_scan ? 'Typ code' : 'Scan QR', kind: CTButtonKind.outline, icon: _scan ? Icons.keyboard : Icons.qr_code_scanner,
                onTap: () => setState(() => _scan = !_scan)),
          ),
          const SizedBox(width: 10),
          Expanded(child: CTButton('Join', kind: CTButtonKind.primary, loading: _busy, onTap: _join)),
        ]),
      ]),
    );
  }
}
