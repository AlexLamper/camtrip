import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/api.dart';
import '../../core/config.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../main.dart';
import '../../models/models.dart';
import '../admin/admin_api.dart';
import '../auth/auth_controller.dart';
import '../premium/premium_controller.dart';
import 'language_screen.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});
  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  String _version = '';

  @override
  void initState() {
    super.initState();
    PackageInfo.fromPlatform().then((i) => mounted ? setState(() => _version = '${i.version} (${i.buildNumber})') : null);
  }

  Future<void> _rename() async {
    final user = ref.read(authProvider).value;
    final c = TextEditingController(text: user?.name ?? '');
    final l = context.l10n;
    final name = await showDialog<String>(
      context: context,
      builder: (d) => AlertDialog(
        title: Text(l.yourName, style: CT.title(20)),
        content: TextField(controller: c, autofocus: true, maxLength: 40, textCapitalization: TextCapitalization.words),
        actions: [
          TextButton(onPressed: () => Navigator.pop(d), child: Text(l.cancel)),
          TextButton(onPressed: () => Navigator.pop(d, c.text.trim()), child: Text(l.save)),
        ],
      ),
    );
    if (name == null || name.isEmpty) return;
    try {
      await ref.read(authProvider.notifier).updateProfile(name: name);
    } on ApiException catch (e) {
      if (mounted) showMessage(context, e.message);
    }
  }

  Future<void> _blocked() async {
    await showModalBottomSheet<void>(context: context, isScrollControlled: true, builder: (_) => const _BlockedSheet());
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authProvider).value;
    final isPro = ref.watch(isProProvider);
    final prefs = ref.watch(prefsProvider);
    final l = context.l10n;

    Widget toggle(String title, bool value, ValueChanged<bool> onChanged, {String? subtitle}) =>
        SettingRow(title: title, subtitle: subtitle, trailing: Switch(value: value, onChanged: (v) => setState(() => onChanged(v))));

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: ListView(padding: const EdgeInsets.fromLTRB(22, 0, 22, 40), children: [
        Text(l.settings, style: CT.title(30)),
        const SizedBox(height: 16),
        GestureDetector(
          onTap: _rename,
          child: Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(16), boxShadow: CT.cardShadow),
            child: Row(children: [
              if (user != null) Avatar(initial: user.initial, color: user.color, size: 44),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(user?.name.isNotEmpty == true ? user!.name : l.you, style: CT.text(16, weight: FontWeight.w600)),
                  Text(user?.email.isNotEmpty == true ? user!.email : l.tapToChangeName, style: CT.text(12, color: CT.muted)),
                ]),
              ),
              if (isPro)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(color: const Color(0xFFF2C230), borderRadius: BorderRadius.circular(8)),
                  child: Text('PRO', style: CT.text(11, weight: FontWeight.w700)),
                ),
            ]),
          ),
        ),
        if (!isPro) ...[
          const SizedBox(height: 12),
          CTButton(l.getCamTripPro, kind: CTButtonKind.primary, icon: Icons.star_rounded, onTap: () => context.push('/pro')),
        ],
        SectionLabel(l.photos),
        toggle(l.saveOwnPhotos, prefs.saveOwnToAlbum, (v) => prefs.saveOwnToAlbum = v),
        toggle(l.autoSaveOthers, prefs.autoSaveOthers, (v) => prefs.autoSaveOthers = v),
        toggle(l.wifiOnlyTitle, prefs.wifiOnly, (v) => prefs.wifiOnly = v),
        toggle(l.videosWifiOnlyTitle, prefs.videosWifiOnly, (v) => prefs.videosWifiOnly = v, subtitle: l.videosWifiOnlySubtitle),
        toggle(l.dateStamp, prefs.dateStamp, (v) => prefs.dateStamp = v),
        SettingRow(title: l.uploadQueue, trailing: const Icon(Icons.chevron_right), onTap: () => context.push('/queue')),
        SectionLabel(l.notifications),
        toggle(l.notifyNewPhotos, user?.notifyNewPhotos ?? true,
            (v) => ref.read(authProvider.notifier).updateProfile(notifyNewPhotos: v).ignore()),
        toggle(l.notifyRecapReady, user?.notifyRecap ?? true, (v) => ref.read(authProvider.notifier).updateProfile(notifyRecap: v).ignore()),
        if (user?.isAppAdmin ?? false) ...[
          SectionLabel(l.camTripTeam),
          SettingRow(
            title: l.manage,
            subtitle: l.adminEntrySubtitle,
            trailing: Row(mainAxisSize: MainAxisSize.min, children: [
              _OpenReportsBadge(count: ref.watch(adminOpenReportsProvider).value ?? 0),
              const Icon(Icons.chevron_right),
            ]),
            onTap: () async {
              await context.push('/admin');
              if (mounted) ref.invalidate(adminOpenReportsProvider);
            },
          ),
        ],
        SectionLabel(l.account),
        SettingRow(
          key: const ValueKey('settings-language'),
          title: l.language,
          subtitle: currentLanguageLabel(context, ref.watch(appLanguageProvider)),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => openLanguagePicker(context),
        ),
        SettingRow(
          title: l.manageSubscription,
          trailing: const Icon(Icons.chevron_right),
          onTap: () => launchUrl(
            Uri.parse(Platform.isIOS ? 'https://apps.apple.com/account/subscriptions' : 'https://play.google.com/store/account/subscriptions'),
            mode: LaunchMode.externalApplication,
          ),
        ),
        SettingRow(title: l.restorePurchases, onTap: () async {
          try {
            final ok = await ref.read(premiumProvider.notifier).restore();
            if (context.mounted) showMessage(context, ok ? l.proRestored : l.noPurchaseFound);
          } on ApiException catch (e) {
            if (context.mounted) showMessage(context, e.message);
          }
        }),
        SettingRow(
          title: l.blockedPeople,
          subtitle: (user?.blockedUserIds.isEmpty ?? true) ? l.nobody : l.peopleCount(user!.blockedUserIds.length),
          trailing: const Icon(Icons.chevron_right),
          onTap: _blocked,
        ),
        SettingRow(title: l.privacyPolicy, trailing: const Icon(Icons.open_in_new, size: 18), onTap: () => launchUrl(Uri.parse(AppConfig.privacyUrl))),
        SettingRow(title: l.terms, trailing: const Icon(Icons.open_in_new, size: 18), onTap: () => launchUrl(Uri.parse(AppConfig.termsUrl))),
        SettingRow(title: l.contact, subtitle: AppConfig.supportEmail, onTap: () => launchUrl(Uri.parse('mailto:${AppConfig.supportEmail}'))),
        SettingRow(
          title: l.signOut,
          color: CT.accent,
          onTap: () async {
            await ref.read(authProvider.notifier).signOut();
            if (context.mounted) context.go('/');
          },
        ),
        SettingRow(
          title: l.deleteAccount,
          subtitle: l.deleteAccountSubtitle,
          color: CT.accent,
          divider: false,
          onTap: () async {
            if (!await confirm(context,
                title: l.deleteAccountTitle,
                message: l.deleteAccountMessage,
                ok: l.remove,
                danger: true)) {
              return;
            }
            try {
              await ref.read(authProvider.notifier).deleteAccount();
              if (context.mounted) context.go('/');
            } on ApiException catch (e) {
              if (context.mounted) showMessage(context, e.message);
            }
          },
        ),
        const SizedBox(height: 24),
        Center(child: Text('CamTrip $_version', style: CT.text(12, color: CT.muted))),
      ]),
    );
  }
}

/// Lists blocked people with a way to unblock them.
class _BlockedSheet extends ConsumerStatefulWidget {
  const _BlockedSheet();
  @override
  ConsumerState<_BlockedSheet> createState() => _BlockedSheetState();
}

class _BlockedSheetState extends ConsumerState<_BlockedSheet> {
  List<Member>? _users;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final users = await ref.read(authProvider.notifier).blockedUsers();
      if (mounted) setState(() => _users = users);
    } catch (e) {
      if (mounted) setState(() => _error = ApiException.from(e).message);
    }
  }

  Future<void> _unblock(Member m) async {
    try {
      await ref.read(authProvider.notifier).unblock(m.id);
      if (mounted) setState(() => _users = _users?.where((u) => u.id != m.id).toList());
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final users = _users;
    final l = context.l10n;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(l.blockedTitle, style: CT.title(22)),
          const SizedBox(height: 4),
          Text(l.blockedSubtitle, style: CT.text(13, color: CT.muted)),
          const SizedBox(height: 12),
          if (_error != null)
            Text(_error!, style: CT.text(14, color: CT.accent))
          else if (users == null)
            const Padding(padding: EdgeInsets.all(20), child: Center(child: CircularProgressIndicator(color: CT.ink)))
          else if (users.isEmpty)
            Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text(l.blockedNone, style: CT.text(15)))
          else
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
              child: ListView(shrinkWrap: true, children: [
                for (final m in users)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Avatar.member(m, size: 34),
                    title: Text(m.name, style: CT.text(16, weight: FontWeight.w500)),
                    trailing: TextButton(onPressed: () => _unblock(m), child: Text(l.unblockShort)),
                  ),
              ]),
            ),
        ]),
      ),
    );
  }
}

/// Red count of open reports next to "Beheer"; nothing when there are none.
class _OpenReportsBadge extends StatelessWidget {
  const _OpenReportsBadge({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    if (count <= 0) return const SizedBox.shrink();
    return Semantics(
      label: '${context.l10n.adminOpenReports}: $count',
      excludeSemantics: true,
      child: Container(
        key: const ValueKey('openReportsBadge'),
        margin: const EdgeInsetsDirectional.only(end: 6),
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
        constraints: const BoxConstraints(minWidth: 22),
        decoration: BoxDecoration(color: CT.accent, borderRadius: BorderRadius.circular(11)),
        child: Text(count > 99 ? '99+' : '$count', textAlign: TextAlign.center, style: CT.text(12, weight: FontWeight.w700, color: Colors.white)),
      ),
    );
  }
}
