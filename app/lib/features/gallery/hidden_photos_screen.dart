import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../models/models.dart';
import 'gallery_controller.dart';

/// "Verborgen foto's": photos this user hid for themselves in one group.
/// Tap to pick, then "Weer tonen" puts them back in the gallery.
class HiddenPhotosScreen extends ConsumerStatefulWidget {
  const HiddenPhotosScreen({super.key, required this.groupId});
  final String groupId;

  @override
  ConsumerState<HiddenPhotosScreen> createState() => _HiddenPhotosScreenState();
}

class _HiddenPhotosScreenState extends ConsumerState<HiddenPhotosScreen> {
  final _scroll = ScrollController();
  final Set<String> _picked = {};
  bool _busy = false;

  HiddenPhotosController get _ctrl => ref.read(hiddenPhotosProvider(widget.groupId).notifier);

  @override
  void initState() {
    super.initState();
    _scroll.addListener(() {
      if (_scroll.position.pixels > _scroll.position.maxScrollExtent - 600) _ctrl.loadMore();
    });
    // The list may be stale from an earlier visit: something was hidden since.
    Future.microtask(() => _ctrl.refresh());
  }

  @override
  void dispose() {
    _scroll.dispose();
    super.dispose();
  }

  Future<void> _show(List<Photo> photos) async {
    if (photos.isEmpty) return;
    setState(() => _busy = true);
    try {
      await _ctrl.unhide(photos);
      if (!mounted) return;
      setState(() => _picked.removeAll(photos.map((p) => p.id)));
      showMessage(context, '${Fmt.count(photos.length, 'foto staat', 'foto\'s staan')} weer in de groep');
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(hiddenPhotosProvider(widget.groupId));
    final photos = state.photos;
    _picked.retainAll(photos.map((p) => p.id).toSet());
    final picked = photos.where((p) => _picked.contains(p.id)).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Verborgen foto\'s'),
        actions: [
          if (photos.isNotEmpty)
            TextButton(
              onPressed: _busy ? null : () => _show(photos),
              child: Text('Alles tonen', style: CT.text(14, color: CT.accent, weight: FontWeight.w600)),
            ),
        ],
      ),
      body: Stack(children: [
        RefreshIndicator(
          color: CT.ink,
          onRefresh: _ctrl.refresh,
          child: CustomScrollView(
            controller: _scroll,
            physics: const AlwaysScrollableScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(22, 4, 22, 14),
                  child: Text(
                    'Alleen jij ziet deze foto\'s niet meer. Voor de anderen in de groep staan ze er gewoon.',
                    style: CT.text(14, color: CT.muted),
                  ),
                ),
              ),
              if (photos.isEmpty && !state.loading)
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: EmptyState(
                    title: 'Niets verborgen',
                    message: state.error ?? 'Foto\'s die je verbergt, vind je hier terug.',
                  ),
                ),
              if (photos.isEmpty && state.loading)
                const SliverFillRemaining(child: Center(child: CircularProgressIndicator(color: CT.ink))),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                sliver: SliverGrid(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, mainAxisSpacing: 6, crossAxisSpacing: 6),
                  delegate: SliverChildBuilderDelegate((_, i) {
                    final p = photos[i];
                    final on = _picked.contains(p.id);
                    return GestureDetector(
                      onTap: () => setState(() => on ? _picked.remove(p.id) : _picked.add(p.id)),
                      child: Stack(fit: StackFit.expand, children: [
                        ClipRRect(borderRadius: BorderRadius.circular(6), child: NetPhoto(p.thumbUrl, cacheKey: 'thumb_${p.id}')),
                        if (!on) Container(decoration: BoxDecoration(color: Colors.white.withValues(alpha: 0.35), borderRadius: BorderRadius.circular(6))),
                        Positioned(
                          right: 6,
                          top: 6,
                          child: Icon(on ? Icons.check_circle : Icons.radio_button_unchecked, color: on ? CT.accent : Colors.white, size: 22),
                        ),
                        if (p.isVideo) const Center(child: Icon(Icons.play_circle_fill, color: Colors.white70, size: 28)),
                      ]),
                    );
                  }, childCount: photos.length),
                ),
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 120)),
            ],
          ),
        ),
        if (picked.isNotEmpty)
          Positioned(
            left: 18,
            right: 18,
            bottom: 14 + MediaQuery.of(context).padding.bottom,
            child: CTButton(
              'Weer tonen (${picked.length})',
              icon: Icons.visibility_outlined,
              loading: _busy,
              onTap: () => _show(picked),
            ),
          ),
      ]),
    );
  }
}
