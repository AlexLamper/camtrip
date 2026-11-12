import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../main.dart';
import 'upload_queue.dart';

class QueueScreen extends ConsumerWidget {
  const QueueScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final items = ref.watch(uploadQueueProvider);
    final queue = ref.read(uploadQueueProvider.notifier);
    final prefs = ref.watch(prefsProvider);
    final photos = items.where((i) => !i.isVideo).length;
    final videos = items.length - photos;

    return Scaffold(
      appBar: AppBar(),
      body: ListView(padding: const EdgeInsets.fromLTRB(22, 0, 22, 120), children: [
        if (!queue.online)
          _banner('Geen bereik.', 'Je foto\'s staan al in je album en worden gedeeld zodra je weer internet hebt.')
        else if (!queue.onWifi && (prefs.wifiOnly || (videos > 0 && prefs.videosWifiOnly)))
          _banner('Wacht op wifi.', prefs.wifiOnly ? 'Je hebt "alleen uploaden via wifi" aan staan.' : 'Video\'s gaan alleen via wifi.'),
        const SizedBox(height: 16),
        Text('Wachtrij', style: CT.title(28)),
        const SizedBox(height: 4),
        Text(
          items.isEmpty
              ? 'Alles is gedeeld ✓'
              : '${[if (photos > 0) '$photos ${photos == 1 ? 'foto' : 'foto\'s'}', if (videos > 0) '$videos ${videos == 1 ? 'video' : 'video\'s'}'].join(' en ')} nog te delen',
          style: CT.text(14, color: CT.muted),
        ),
        const SizedBox(height: 10),
        for (final i in items)
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
            child: Row(children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(6),
                child: SizedBox(width: 48, height: 48, child: Image.file(File(i.thumbPath), fit: BoxFit.cover, errorBuilder: (_, _, _) => Container(color: CT.cream))),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text(i.isVideo ? 'Video' : 'Foto', style: CT.text(14, weight: FontWeight.w500)),
                  const SizedBox(height: 6),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(2),
                    child: LinearProgressIndicator(
                      value: i.status == UploadStatus.uploading ? i.progress : 0,
                      minHeight: 4,
                      color: i.status == UploadStatus.failed ? CT.accent : const Color(0xFF2F6DB5),
                      backgroundColor: const Color(0xFFEEEEEE),
                    ),
                  ),
                  if (i.status == UploadStatus.failed && i.error != null)
                    Padding(padding: const EdgeInsets.only(top: 4), child: Text(i.error!, style: CT.text(12, color: CT.accent))),
                ]),
              ),
              const SizedBox(width: 10),
              if (i.status == UploadStatus.failed)
                PopupMenuButton<String>(
                  onSelected: (v) => v == 'retry' ? queue.retry(i.id) : queue.remove(i.id),
                  itemBuilder: (_) => const [
                    PopupMenuItem(value: 'retry', child: Text('Opnieuw proberen')),
                    PopupMenuItem(value: 'remove', child: Text('Uit wachtrij halen')),
                  ],
                )
              else
                Text(
                  i.status == UploadStatus.uploading ? '${(i.progress * 100).round()}%' : (i.isVideo && prefs.videosWifiOnly && !queue.onWifi ? 'wifi' : 'wacht'),
                  style: CT.text(12, color: CT.muted),
                ),
            ]),
          ),
        if (items.isNotEmpty) ...[
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(14),
            decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(14), boxShadow: CT.cardShadow),
            child: Row(children: [
              Expanded(
                child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                  Text('Video\'s alleen via wifi', style: CT.text(14, weight: FontWeight.w600)),
                  Text('Spaart je mobiele data', style: CT.text(12, color: CT.muted)),
                ]),
              ),
              Switch(value: prefs.videosWifiOnly, onChanged: (v) {
                prefs.videosWifiOnly = v;
                queue.retryAll();
              }),
            ]),
          ),
        ],
      ]),
      bottomNavigationBar: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
          child: items.isEmpty ? CTButton('Klaar', onTap: () => context.pop()) : CTButton('Nu opnieuw proberen', onTap: queue.retryAll),
        ),
      ),
    );
  }

  Widget _banner(String bold, String text) => Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(color: CT.warnBg, borderRadius: BorderRadius.circular(14), border: Border.all(color: CT.warn, width: 1.5)),
        child: Row(children: [
          const Icon(Icons.signal_cellular_alt, color: CT.warn),
          const SizedBox(width: 10),
          Expanded(child: Text.rich(TextSpan(children: [TextSpan(text: '$bold ', style: CT.text(13, weight: FontWeight.w700)), TextSpan(text: text, style: CT.text(13))]))),
        ]),
      );
}
