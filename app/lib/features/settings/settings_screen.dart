import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/api.dart';
import '../../core/config.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../main.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../premium/premium_controller.dart';

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
    final name = await showDialog<String>(
      context: context,
      builder: (d) => AlertDialog(
        title: Text('Je naam', style: CT.title(20)),
        content: TextField(controller: c, autofocus: true, maxLength: 40, textCapitalization: TextCapitalization.words),
        actions: [
          TextButton(onPressed: () => Navigator.pop(d), child: const Text('Annuleer')),
          TextButton(onPressed: () => Navigator.pop(d, c.text.trim()), child: const Text('Opslaan')),
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

    Widget toggle(String title, bool value, ValueChanged<bool> onChanged, {String? subtitle}) =>
        SettingRow(title: title, subtitle: subtitle, trailing: Switch(value: value, onChanged: (v) => setState(() => onChanged(v))));

    return Scaffold(
      appBar: AppBar(title: const Text('')),
      body: ListView(padding: const EdgeInsets.fromLTRB(22, 0, 22, 40), children: [
        Text('Instellingen', style: CT.title(30)),
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
                  Text(user?.name.isNotEmpty == true ? user!.name : 'Jij', style: CT.text(16, weight: FontWeight.w600)),
                  Text(user?.email.isNotEmpty == true ? user!.email : 'Tik om je naam te wijzigen', style: CT.text(12, color: CT.muted)),
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
          CTButton('Word CamTrip Pro', kind: CTButtonKind.primary, icon: Icons.star_rounded, onTap: () => context.push('/pro')),
        ],
        const SectionLabel('Foto\'s'),
        toggle('Eigen foto\'s opslaan in album per groep', prefs.saveOwnToAlbum, (v) => prefs.saveOwnToAlbum = v),
        toggle('Foto\'s van anderen automatisch opslaan', prefs.autoSaveOthers, (v) => prefs.autoSaveOthers = v),
        toggle('Alleen uploaden via wifi', prefs.wifiOnly, (v) => prefs.wifiOnly = v),
        toggle('Video\'s alleen via wifi', prefs.videosWifiOnly, (v) => prefs.videosWifiOnly = v, subtitle: 'Spaart je mobiele data'),
        toggle('Datumstempel', prefs.dateStamp, (v) => prefs.dateStamp = v),
        SettingRow(title: 'Wachtrij', trailing: const Icon(Icons.chevron_right), onTap: () => context.push('/queue')),
        const SectionLabel('Meldingen'),
        toggle('Nieuwe foto\'s (gebundeld)', user?.notifyNewPhotos ?? true,
            (v) => ref.read(authProvider.notifier).updateProfile(notifyNewPhotos: v).ignore()),
        toggle('Recap klaar', user?.notifyRecap ?? true, (v) => ref.read(authProvider.notifier).updateProfile(notifyRecap: v).ignore()),
        if (user?.isAppAdmin ?? false) ...[
          const SectionLabel('CamTrip-team'),
          SettingRow(
            title: 'Beheer',
            subtitle: 'Gebruikers, Pro geven, meldingen en cijfers',
            trailing: const Icon(Icons.chevron_right),
            onTap: () => context.push('/admin'),
          ),
        ],
        const SectionLabel('Account'),
        SettingRow(
          title: 'Abonnement beheren',
          trailing: const Icon(Icons.chevron_right),
          onTap: () => launchUrl(
            Uri.parse(Platform.isIOS ? 'https://apps.apple.com/account/subscriptions' : 'https://play.google.com/store/account/subscriptions'),
            mode: LaunchMode.externalApplication,
          ),
        ),
        SettingRow(title: 'Aankopen herstellen', onTap: () async {
          try {
            final ok = await ref.read(premiumProvider.notifier).restore();
            if (context.mounted) showMessage(context, ok ? 'Pro is hersteld' : 'Geen eerdere aankoop gevonden');
          } on ApiException catch (e) {
            if (context.mounted) showMessage(context, e.message);
          }
        }),
        SettingRow(
          title: 'Geblokkeerde personen',
          subtitle: (user?.blockedUserIds.isEmpty ?? true) ? 'Niemand' : Fmt.count(user!.blockedUserIds.length, 'persoon', 'personen'),
          trailing: const Icon(Icons.chevron_right),
          onTap: _blocked,
        ),
        SettingRow(title: 'Privacybeleid', trailing: const Icon(Icons.open_in_new, size: 18), onTap: () => launchUrl(Uri.parse(AppConfig.privacyUrl))),
        SettingRow(title: 'Voorwaarden', trailing: const Icon(Icons.open_in_new, size: 18), onTap: () => launchUrl(Uri.parse(AppConfig.termsUrl))),
        SettingRow(title: 'Contact', subtitle: AppConfig.supportEmail, onTap: () => launchUrl(Uri.parse('mailto:${AppConfig.supportEmail}'))),
        SettingRow(
          title: 'Uitloggen',
          color: CT.accent,
          onTap: () async {
            await ref.read(authProvider.notifier).signOut();
            if (context.mounted) context.go('/');
          },
        ),
        SettingRow(
          title: 'Account verwijderen',
          subtitle: 'Verwijdert je account en al je foto\'s',
          color: CT.accent,
          divider: false,
          onTap: () async {
            if (!await confirm(context,
                title: 'Account verwijderen?',
                message: 'Je account en al je foto\'s en video\'s worden verwijderd, ook uit de groepen. Een lopend abonnement zeg je op via de App Store of Google Play.',
                ok: 'Verwijder',
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 0, 20, 16),
        child: Column(mainAxisSize: MainAxisSize.min, crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text('Geblokkeerd', style: CT.title(22)),
          const SizedBox(height: 4),
          Text('Je ziet geen foto\'s van deze mensen.', style: CT.text(13, color: CT.muted)),
          const SizedBox(height: 12),
          if (_error != null)
            Text(_error!, style: CT.text(14, color: CT.accent))
          else if (users == null)
            const Padding(padding: EdgeInsets.all(20), child: Center(child: CircularProgressIndicator(color: CT.ink)))
          else if (users.isEmpty)
            Padding(padding: const EdgeInsets.symmetric(vertical: 12), child: Text('Je hebt niemand geblokkeerd.', style: CT.text(15)))
          else
            ConstrainedBox(
              constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height * 0.5),
              child: ListView(shrinkWrap: true, children: [
                for (final m in users)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    leading: Avatar.member(m, size: 34),
                    title: Text(m.name, style: CT.text(16, weight: FontWeight.w500)),
                    trailing: TextButton(onPressed: () => _unblock(m), child: const Text('Opheffen')),
                  ),
              ]),
            ),
        ]),
      ),
    );
  }
}
