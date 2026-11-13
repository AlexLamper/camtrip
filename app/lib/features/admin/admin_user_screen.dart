import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
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
    final l = context.l10n;
    DateTime? until;
    if (d == GrantDuration.custom) {
      final now = DateTime.now();
      final picked = await showDatePicker(
        context: context,
        initialDate: now.add(const Duration(days: 30)),
        firstDate: now.add(const Duration(days: 1)),
        lastDate: DateTime(now.year + 10),
      );
      if (picked == null || !mounted) return;
      // Pro runs to the end of the chosen day.
      until = DateTime(picked.year, picked.month, picked.day, 23, 59, 59);
    }
    final reason = await _askReason(d, until);
    if (reason == null) return;
    await _run(
      () => _api.grantPro(widget.userId, duration: d, until: until, reason: reason),
      d == GrantDuration.lifetime ? l.adminLifetimeProGiven : l.adminProGiven,
    );
  }

  Future<String?> _askReason(GrantDuration d, DateTime? until) {
    final c = TextEditingController();
    final l = context.l10n;
    final title = switch (d) {
      GrantDuration.custom => l.adminGiveProUntil(Fmt.shortYear(until!)),
      GrantDuration.lifetime => l.adminGiveProLifetime,
      _ => l.adminGiveProFor(d.label),
    };
    return showDialog<String>(
      context: context,
      builder: (dialog) => StatefulBuilder(
        builder: (dialog, setLocal) => AlertDialog(
          title: Text(title, style: CT.title(20)),
          content: TextField(
            controller: c,
            autofocus: true,
            maxLength: 200,
            onChanged: (_) => setLocal(() {}),
            decoration: InputDecoration(hintText: l.adminReasonHint),
          ),
          actions: [
            TextButton(onPressed: () => Navigator.pop(dialog), child: Text(l.cancel, style: CT.text(15, color: CT.muted))),
            TextButton(
              onPressed: c.text.trim().isEmpty ? null : () => Navigator.pop(dialog, c.text.trim()),
              child: Text(l.adminGivePro, style: CT.text(15, weight: FontWeight.w600)),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _revoke() async {
    final l = context.l10n;
    if (!await confirm(context,
        title: l.adminRevokeTitle,
        message: l.adminRevokeMessage,
        ok: l.adminRevoke,
        danger: true)) {
      return;
    }
    await _run(() => _api.revokePro(widget.userId), l.adminGiftRevoked);
  }

  Future<void> _toggleBan(AdminUser u) async {
    if (u.banned) {
      if (!await confirm(context, title: context.l10n.adminUnbanTitle, message: context.l10n.adminUnbanMessage(u.name), ok: context.l10n.unblockShort)) return;
      if (!mounted) return;
      await _run(() => _api.setBanned(widget.userId, banned: false), context.l10n.adminUnbanned);
      return;
    }
    if (!await confirm(context,
        title: context.l10n.blockTitle(u.name),
        message: context.l10n.adminBanUserMessage,
        ok: context.l10n.block,
        danger: true)) {
      return;
    }
    if (!mounted) return;
    await _run(() => _api.setBanned(widget.userId, banned: true, reason: 'Via Beheer'), context.l10n.adminAccountBlocked);
  }

  @override
  Widget build(BuildContext context) {
    final u = _user;
    return Scaffold(
      appBar: AppBar(title: Text(context.l10n.adminUser, style: CT.title(20))),
      body: u == null
          ? (_error == null
              ? const Center(child: CircularProgressIndicator(color: CT.ink))
              : EmptyState(title: context.l10n.loadFailed, message: _error!))
          : RefreshIndicator(color: CT.ink, onRefresh: _load, child: _body(u)),
    );
  }

  Widget _body(AdminUser u) {
    final me = ref.watch(authProvider).value;
    final isMe = me?.id == u.id;
    final initial = u.name.isEmpty ? '?' : String.fromCharCode(u.name.runes.first).toUpperCase();
    Widget fact(String label, String value) => SettingRow(title: value, subtitle: label);
    final l = context.l10n;

    return ListView(padding: const EdgeInsets.fromLTRB(22, 8, 22, 40), children: [
      Row(children: [
        Avatar(initial: initial, color: parseColor(u.avatarColor), size: 52),
        const SizedBox(width: 14),
        Expanded(
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(u.name, style: CT.title(24)),
            Text(u.email.isEmpty ? l.noEmail : '${u.email}${u.emailVerified ? '' : ' (${l.adminNotVerified})'}',
                style: CT.text(13, color: CT.muted)),
          ]),
        ),
      ]),
      if (u.banned)
        Container(
          margin: const EdgeInsets.only(top: 14),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(color: CT.warnBg, borderRadius: BorderRadius.circular(12), border: Border.all(color: CT.accent)),
          child: Text('${l.blockedTitle}${u.bannedReason.isNotEmpty ? ': ${u.bannedReason}' : ''}', style: CT.text(14, color: CT.accent, weight: FontWeight.w600)),
        ),
      SectionLabel(l.account),
      fact(l.adminRole, u.isAdmin ? l.proSourceAdmin : l.adminUser),
      fact(l.adminCreated, u.createdAt == null ? l.unknown : Fmt.shortYear(u.createdAt!)),
      fact(l.adminSignInWith, u.signIns.isEmpty ? l.unknown : u.signIns.map((s) => switch (s) { 'apple' => 'Apple', 'google' => 'Google', _ => l.adminEmailMethod }).join(', ')),
      fact(l.adminGroups, '${u.groupsCount}'),
      fact(l.adminPhotosAndVideos, '${u.photosCount}'),
      const SectionLabel('Pro'),
      fact(l.adminStatus, u.proText),
      if (u.subscriptionActive)
        fact(l.proSourceSubscription, u.subscriptionExpiresAt == null ? l.adminActive : l.adminActiveUntil(Fmt.shortYear(u.subscriptionExpiresAt!))),
      if (u.hasGrant)
        fact(
          '${u.grantedByName != null ? l.adminGiftFrom(u.grantedByName!) : l.proSourceGift}${u.grantReason.isNotEmpty ? ': ${u.grantReason}' : ''}',
          !u.grantActive
              ? (u.grantUntil != null ? l.adminExpiredOn(Fmt.shortYear(u.grantUntil!)) : l.adminExpired)
              : (u.grantUntil == null ? l.lifetime : l.adminUntil(Fmt.shortYear(u.grantUntil!))),
        ),
      const SizedBox(height: 14),
      Text(l.adminGiveProTitle, style: CT.text(14, weight: FontWeight.w600)),
      const SizedBox(height: 4),
      Text(l.adminGiveProNote,
          style: CT.text(12, color: CT.muted)),
      const SizedBox(height: 10),
      Wrap(spacing: 8, runSpacing: 8, children: [
        for (final d in GrantDuration.values)
          CTChip(d.label, icon: d == GrantDuration.custom ? Icons.event : null, onTap: _busy ? null : () => _grant(d)),
      ]),
      if (u.hasGrant) ...[
        const SizedBox(height: 14),
        CTButton(l.adminRevokeGift, kind: CTButtonKind.outline, compact: true, loading: _busy, onTap: _revoke),
      ],
      SectionLabel(l.adminModeration),
      if (isMe || (u.isAdmin && !u.banned))
        Text(isMe ? l.adminCannotBanSelf : l.adminCannotBanAdmin, style: CT.text(13, color: CT.muted))
      else
        CTButton(
          u.banned ? l.adminUnban : l.adminBanAccount,
          kind: u.banned ? CTButtonKind.dark : CTButtonKind.primary,
          compact: true,
          loading: _busy,
          onTap: () => _toggleBan(u),
        ),
    ]);
  }
}
