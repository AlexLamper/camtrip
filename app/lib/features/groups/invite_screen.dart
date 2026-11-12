import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/config.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import 'groups_controller.dart';

class InviteScreen extends ConsumerWidget {
  const InviteScreen({super.key, required this.groupId, this.justCreated = false});
  final String groupId;
  final bool justCreated;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final g = ref.watch(groupProvider(groupId));
    if (g == null) return Scaffold(appBar: AppBar());
    final message = AppConfig.inviteMessage(g.name, g.code);

    return Scaffold(
      appBar: AppBar(leading: justCreated ? const SizedBox() : const BackButton()),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: ListView(padding: const EdgeInsets.fromLTRB(26, 0, 26, 20), children: [
              if (justCreated) Text('Groep aangemaakt ✓', textAlign: TextAlign.center, style: CT.text(13, color: CT.muted, weight: FontWeight.w600)),
              const SizedBox(height: 4),
              Text('Nodig je vrienden uit', textAlign: TextAlign.center, style: CT.title(28)),
              const SizedBox(height: 26),
              Center(
                child: InstantPrint(
                  rotation: -1.5,
                  padding: 16,
                  bottom: 60,
                  caption: SizedBox(
                    width: double.infinity,
                    child: GestureDetector(
                      onTap: () {
                        Clipboard.setData(ClipboardData(text: g.code));
                        showMessage(context, 'Code gekopieerd');
                      },
                      child: Text(g.code, textAlign: TextAlign.center, style: CT.title(28).copyWith(letterSpacing: 6)),
                    ),
                  ),
                  child: SizedBox(
                    width: 220,
                    child: QrImageView(
                      data: AppConfig.inviteUrl(g.code),
                      backgroundColor: Colors.white,
                      eyeStyle: const QrEyeStyle(eyeShape: QrEyeShape.square, color: CT.ink),
                      dataModuleStyle: const QrDataModuleStyle(dataModuleShape: QrDataModuleShape.square, color: CT.ink),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Row(children: [
                Expanded(
                  child: Material(
                    color: const Color(0xFF25D366),
                    borderRadius: BorderRadius.circular(14),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(14),
                      onTap: () async {
                        final uri = Uri.parse('whatsapp://send?text=${Uri.encodeComponent(message)}');
                        if (!await launchUrl(uri)) await SharePlus.instance.share(ShareParams(text: message));
                      },
                      child: SizedBox(height: 54, child: Center(child: Text('WhatsApp', style: CT.text(15, color: Colors.white, weight: FontWeight.w600)))),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: CTButton('Deel link', kind: CTButtonKind.ghost, icon: Icons.ios_share, onTap: () {
                    SharePlus.instance.share(ShareParams(text: message, subject: 'Doe mee met ${g.name} op CamTrip'));
                  }),
                ),
              ]),
              const SizedBox(height: 16),
              Text(
                g.memberLimit == null
                    ? '${g.members.length} leden · onbeperkt (Pro)'
                    : '${g.members.length} van ${g.memberLimit} leden · Pro: onbeperkt',
                textAlign: TextAlign.center,
                style: CT.text(13, color: CT.muted, weight: FontWeight.w500),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
            child: justCreated
                ? CTButton('Naar de camera', icon: Icons.photo_camera, onTap: () {
                    ref.read(activeGroupIdProvider.notifier).set(g.id);
                    context.go('/');
                    context.push('/group/${g.id}');
                    context.push('/camera');
                  })
                : CTButton('Klaar', onTap: () => context.pop()),
          ),
        ]),
      ),
    );
  }
}
