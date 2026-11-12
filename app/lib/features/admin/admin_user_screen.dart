import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import 'admin_api.dart';

/// Beheer > Gebruiker: details, Pro geven / intrekken, blokkeren.
class AdminUserScreen extends ConsumerStatefulWidget {
  const AdminUserScreen({super.key, required this.userId});
  final String userId;

  @override
  ConsumerState<AdminUserScreen> createState() => _AdminUserScreenState();
}

class _AdminUserScreenState extends ConsumerState<AdminUserScreen> {
  AdminUser? _user;
  String? _error;
  bool _busy = false;

  AdminApi get _api => ref.read(adminApiProvider);

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final u = await _api.user(widget.userId);
      if (!mounted) return;
      setState(() {
        _user = u;
        _error = null;
      });
    } catch (e) {
      if (mounted) setState(() => _error = ApiException.from(e).message);
    }
  }

  Future<void> _run(Future<AdminUser> Function() call, String done) async {
    setState(() => _busy = true);
    try {
      final u = await call();
      if (!mounted) return;
      setState(() => _user = u);
      showMessage(context, done);
      // My own Pro / role may have changed.
      if (u.id == ref.read(authProvider).value?.id) await ref.read(authProvider.notifier).refresh();
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  Future<void> _grant(GrantDuration d) async {
    DateTime? until;
    if (d == GrantDuration.custom) {
      final now = DateTime.now();
      final picked = await showDatePicker(
        context: context,
        initialDate: now.add(const Duration(days: 30)),
        firstDate: now.add(const Duration(days: 1)),
        lastDate: DateTime(now.year + 10),
        locale: const Locale('nl'),
      );
      if (picked == null || !mounted) return;
      // Pro runs to the end of the chosen day.
      until = DateTime(picked.year, picked.month, picked.day, 23, 59, 59);
    }
    final reason = await _askReason(d, until);
    if (reason == null) return;
    await _run(
      () => _api.grantPro(widget.userId, duration: d, until: until, reason: reason),
      d == GrantDuration.lifetime ? 'Levenslang Pro gegeven' : 'Pro gegeven',
    );
  }

  Future<String?> _askReason(GrantDuration d, DateTime? until) {
    final c = TextEditingController();
    final what = switch (d) {
      GrantDuration.custom => 'tot ${Fmt.shortYear(until!)}',
      GrantDuration.lifetime => 'levenslang',
      _ => 'voor ${d.label}',
    };
    return showDialog<String>(
      context: context,
      builder: (dialog) => StatefulBuilder(
        builder: (dialog, setLocal) => AlertDialog(
          title: Text('Pro geven $what', style: CT.title(20)),
          content: TextField(
            controller: c,
            autofocus: true,
            maxLength: 200,
            onChanged: (_) => setLocal(() {}),
            decoration: const InputDecoration(hintText: 'Reden, bijv. vriend, tester, influencer'),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialog), child: Text('Annuleer', style: CT.text(15, color: CT.muted))),
            TextButton(
              onPressed: c.text.trim().isEmpty ? null : () => Navigator.pop(dialog, c.text.trim()),
              child: Text('Geef Pro', style: CT.text(15, weight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _revoke() async {
    if (!await confirm(context,
        title: 'Cadeau intrekken?',
        message: 'Het gegeven Pro stopt meteen. Een eigen abonnement blijft gewoon lopen.',
        ok: 'Intrekken',
        danger: true)) {
      return;
    }
    await _run(() => _api.revokePro(widget.userId), 'Cadeau ingetrokken');
  }

  Future<void> _toggleBan(AdminUser u) async {
    if (u.banned) {
      if (!await confirm(context, title: 'Blokkade opheffen?', message: '${u.name} kan weer inloggen.', ok: 'Opheffen')) return;
      await _run(() => _api.setBanned(widget.userId, banned: false), 'Blokkade opgeheven');
      return;
    }
    if (!await confirm(context,
        title: '${u.name} blokkeren?',
        message: 'Dit account kan niet meer inloggen en de app niet meer gebruiken. Foto\'s blijven staan.',
        ok: 'Blokkeer',
        danger: true)) {
      return;
    }
    await _run(() => _api.setBanned(widget.userId, banned: true, reason: 'Via Beheer'), 'Account geblokkeerd');
  }

  @override
  Widget build(BuildContext context) {
    final u = _user;
    return Scaffold(
      appBar: AppBar(title: Text('Gebruiker', style: CT.title(20))),
      body: u == null
          ? (_error == null
              ? const Center(child: CircularProgressIndicator(color: CT.ink))
              : EmptyState(title: 'Laden lukte niet', message: _error!))
          : RefreshIndicator(color: CT.ink, onRefresh: _load, child: _body(u)),
    );
  }

  Widget _body(AdminUser u) {
    final me = ref.watch(authProvider).value;
    final isMe = me?.id == u.id;
    final initial = u.name.isEmpty ? '?' : String.fromCharCode(u.name.runes.first).toUpperCase();
    Widget fact(String label, String value) => SettingRow(title: value, subtitle: label);

    return ListView(padding: const EdgeInsets.fromLTRB(22, 8, 22, 40), children: [
      Row(children: [
        Avatar(initial: initial, color: parseColor(u.avatarColor), size: 52),
        const SizedBox(width: 14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(u.name, style: CT.title(24)),
            Text(u.email.isEmpty ? 'Geen e-mail' : '${u.email}${u.emailVerified ? '' : ' (niet bevestigd)'}',
                style: CT.text(13, color: CT.muted)),
          ]),
        ),
      ]),
      if (u.banned)
        Container(
          margin: const EdgeInsets.only(top: 14),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: CT.warnBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: CT.accent)),
          child: Text('Geblokkeerd${u.bannedReason.isNotEmpty ? ': ${u.bannedReason}' : ''}', style: CT.text(14, color: CT.accent, weight: FontWeight.w600)),
        ),
      const SectionLabel('Account'),
      fact('Rol', u.isAdmin ? 'Beheerder' : 'Gebruiker'),
      fact('Aangemaakt', u.createdAt == null ? 'Onbekend' : Fmt.shortYear(u.createdAt!)),
      fact('Inloggen met', u.signIns.isEmpty ? 'Onbekend' : u.signIns.map((s) => switch (s) { 'apple' => 'Apple', 'google' => 'Google', _ => 'E-mail' }).join(', ')),
      fact('Groepen', '${u.groupsCount}'),
      fact('Foto\'s en video\'s', '${u.photosCount}'),
      const SectionLabel('Pro'),
      fact('Status', u.proText),
      if (u.subscriptionActive)
        fact('Abonnement', u.subscriptionExpiresAt == null ? 'Actief' : 'Actief tot ${Fmt.shortYear(u.subscriptionExpiresAt!)}'),
      if (u.hasGrant)
        fact(
          'Cadeau${u.grantedByName != null ? ' van ${u.grantedByName}' : ''}${u.grantReason.isNotEmpty ? ': ${u.grantReason}' : ''}',
          !u.grantActive
              ? 'Verlopen${u.grantUntil != null ? ' op ${Fmt.shortYear(u.grantUntil!)}' : ''}'
              : (u.grantUntil == null ? 'Levenslang' : 'Tot ${Fmt.shortYear(u.grantUntil!)}'),
        ),
      const SizedBox(height: 14),
      Text('Pro geven', style: CT.text(14, weight: FontWeight.w600)),
      const SizedBox(height: 4),
      Text('Werkt ook voor de groepen van deze persoon: één Pro in de groep = Pro voor iedereen in die groep.',
          style: CT.text(12, color: CT.muted)),
      const SizedBox(height: 10),
      Wrap(spacing: 8, runSpacing: 8, children: [
        for (final d in GrantDuration.values)
          CTChip(d.label, icon: d == GrantDuration.custom ? Icons.event : null, onTap: _busy ? null : () => _grant(d)),
      ]),
      if (u.hasGrant) ...[
        const SizedBox(height: 14),
        CTButton('Cadeau intrekken', kind: CTButtonKind.outline, compact: true, loading: _busy, onTap: _revoke),
      ],
      const SectionLabel('Moderatie'),
      if (isMe || (u.isAdmin && !u.banned))
        Text(isMe ? 'Je kunt jezelf niet blokkeren.' : 'Een beheerder kan niet geblokkeerd worden.', style: CT.text(13, color: CT.muted))
      else
        CTButton(
          u.banned ? 'Blokkade opheffen' : 'Account blokkeren',
          kind: u.banned ? CTButtonKind.dark : CTButtonKind.primary,
          compact: true,
          loading: _busy,
          onTap: () => _toggleBan(u),
        ),
    ]);
  }
}
