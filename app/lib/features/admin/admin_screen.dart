import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import 'admin_api.dart';

/// Instellingen > Beheer. Only for app admins (the server checks too).
class AdminScreen extends ConsumerWidget {
  const AdminScreen({super.key, this.initialTab = 0});

  /// Index of the Meldingen tab.
  static const reportsTab = 2;

  /// 0 Overzicht, 1 Gebruikers, 2 Meldingen.
  final int initialTab;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isAdmin = ref.watch(authProvider.select((a) => a.value?.isAppAdmin ?? false));
    if (!isAdmin) {
      return Scaffold(
        appBar: AppBar(),
        body: EmptyState(title: context.l10n.noAccess, message: context.l10n.adminOnlyTeam),
      );
    }
    return DefaultTabController(
      length: 3,
      initialIndex: initialTab.clamp(0, 2),
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.manage, style: CT.title(20)),
          bottom: TabBar(
            labelColor: CT.ink,
            unselectedLabelColor: CT.muted,
            indicatorColor: CT.accent,
            labelStyle: CT.text(14, weight: FontWeight.w600),
            tabs: [Tab(text: context.l10n.adminOverview), Tab(text: context.l10n.adminUsers), Tab(text: context.l10n.adminReports)],
          ),
        ),
        body: const TabBarView(children: [_StatsTab(), _UsersTab(), _ReportsTab()]),
      ),
    );
  }
}

// ------------------------------------------------------------------ Overzicht

class _StatsTab extends ConsumerStatefulWidget {
  const _StatsTab();
  @override
  ConsumerState<_StatsTab> createState() => _StatsTabState();
}

class _StatsTabState extends ConsumerState<_StatsTab> {
  AdminStats? _stats;
  String? _error;

  @override
  void initState() {
    super.initState();
    _load();
  }

  Future<void> _load() async {
    try {
      final s = await ref.read(adminApiProvider).stats();
      if (!mounted) return;
      setState(() {
        _stats = s;
        _error = null;
      });
    } catch (e) {
      if (mounted) setState(() => _error = ApiException.from(e).message);
    }
  }

  @override
  Widget build(BuildContext context) {
    final s = _stats;
    if (s == null) return _LoadingOrError(error: _error, onRetry: _load);
    final l = context.l10n;
    Widget tile(String label, int value, {String? sub}) => Container(
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(14), boxShadow: CT.cardShadow),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.center, children: [
            Text(label, style: CT.text(12, color: CT.muted, weight: FontWeight.w500)),
            const SizedBox(height: 4),
            Text('$value', style: CT.title(26)),
            if (sub != null) Text(sub, style: CT.text(11, color: CT.muted)),
          ]),
        );
    return RefreshIndicator(
      color: CT.ink,
      onRefresh: _load,
      child: GridView.count(
        padding: const EdgeInsets.all(18),
        crossAxisCount: 2,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 1.45,
        children: [
          tile(l.adminUsers, s.usersTotal, sub: l.adminsCount(s.admins)),
          tile(l.adminNewThisWeek, s.newThisWeek),
          tile(l.adminGroups, s.groups),
          tile(l.photos, s.photos, sub: l.videosCount(s.videos)),
          tile(l.adminProSubscription, s.proSubscription),
          tile(l.adminProGift, s.proGift, sub: l.adminWithoutSubscription(s.proGiftOnly)),
          tile(l.adminOpenReports, s.openReports),
          tile(l.blockedTitle, s.banned),
        ],
      ),
    );
  }
}

// ------------------------------------------------------------------ Gebruikers

class _UsersTab extends ConsumerStatefulWidget {
  const _UsersTab();
  @override
  ConsumerState<_UsersTab> createState() => _UsersTabState();
}

class _UsersTabState extends ConsumerState<_UsersTab> {
  final _search = TextEditingController();
  Timer? _debounce;
  final List<AdminUser> _users = [];
  int _page = 0;
  bool _hasMore = true;
  bool _loading = false;
  String? _error;
  int _request = 0;

  @override
  void initState() {
    super.initState();
    _load(reset: true);
  }

  @override
  void dispose() {
    _debounce?.cancel();
    _search.dispose();
    super.dispose();
  }

  void _onSearch(String _) {
    _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 350), () => _load(reset: true));
  }

  Future<void> _load({bool reset = false}) async {
    if (_loading && !reset) return;
    final request = ++_request;
    final page = reset ? 1 : _page + 1;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final res = await ref.read(adminApiProvider).users(q: _search.text.trim(), page: page);
      if (!mounted || request != _request) return;
      setState(() {
        if (reset) _users.clear();
        _users.addAll(res.items);
        _page = page;
        _hasMore = res.hasMore;
      });
    } catch (e) {
      if (mounted && request == _request) setState(() => _error = ApiException.from(e).message);
    } finally {
      if (mounted && request == _request) setState(() => _loading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(18, 14, 18, 6),
        child: TextField(
          controller: _search,
          onChanged: _onSearch,
          textInputAction: TextInputAction.search,
          decoration: InputDecoration(
            hintText: context.l10n.adminSearchHint,
            prefixIcon: const Icon(Icons.search),
            filled: true,
            fillColor: CT.paper,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: CT.line)),
            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: CT.line)),
          ),
        ),
      ),
      if (_error != null) Padding(padding: const EdgeInsets.all(12), child: Text(_error!, style: CT.text(14, color: CT.accent))),
      Expanded(
        child: RefreshIndicator(
          color: CT.ink,
          onRefresh: () => _load(reset: true),
          child: ListView.builder(
            padding: const EdgeInsets.fromLTRB(18, 0, 18, 30),
            itemCount: _users.length + 1,
            itemBuilder: (context, i) {
              if (i == _users.length) {
                if (_loading) {
                  return const Padding(padding: EdgeInsets.all(20), child: Center(child: CircularProgressIndicator(color: CT.ink)));
                }
                if (_users.isEmpty) {
                  return Padding(padding: const EdgeInsets.all(24), child: Center(child: Text(context.l10n.nobodyFound, style: CT.text(15, color: CT.muted))));
                }
                return _hasMore
                    ? Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: CTButton(context.l10n.loadMore, kind: CTButtonKind.ghost, compact: true, onTap: _load),
                      )
                    : const SizedBox(height: 8);
              }
              final u = _users[i];
              return _UserRow(u, onTap: () async {
                await context.push('/admin/user/${u.id}');
                if (mounted) unawaited(_load(reset: true));
              });
            },
          ),
        ),
      ),
    ]);
  }
}

class _UserRow extends StatelessWidget {
  const _UserRow(this.u, {required this.onTap});
  final AdminUser u;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final initial = u.name.isEmpty ? '?' : String.fromCharCode(u.name.runes.first).toUpperCase();
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 11),
        decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Color(0xFFEEEEEE)))),
        child: Row(children: [
          Avatar(initial: initial, color: parseColor(u.avatarColor), size: 36),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(children: [
                Flexible(child: Text(u.name, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(15, weight: FontWeight.w600))),
                if (u.isAdmin) ...[const SizedBox(width: 6), _Tag(context.l10n.proSourceAdmin)],
                if (u.banned) ...[const SizedBox(width: 6), _Tag(context.l10n.blockedTitle, danger: true)],
              ]),
              Text(u.email.isEmpty ? context.l10n.noEmail : u.email, maxLines: 1, overflow: TextOverflow.ellipsis, style: CT.text(12, color: CT.muted)),
            ]),
          ),
          if (u.isPro) _Tag(proSourceLabel(u.proSource), pro: true),
          const Icon(Icons.chevron_right, color: CT.muted),
        ]),
      ),
    );
  }
}

// ------------------------------------------------------------------ Meldingen

class _ReportsTab extends ConsumerStatefulWidget {
  const _ReportsTab();
  @override
  ConsumerState<_ReportsTab> createState() => _ReportsTabState();
}

class _ReportsTabState extends ConsumerState<_ReportsTab> {
  final List<AdminReport> _reports = [];
  int _page = 0;
  bool _hasMore = true;
  bool _loading = false;
  String? _error;
  final Set<String> _busy = {};

  @override
  void initState() {
    super.initState();
    _load(reset: true);
  }

  Future<void> _load({bool reset = false}) async {
    if (_loading) return;
    final page = reset ? 1 : _page + 1;
    setState(() {
      _loading = true;
      _error = null;
    });
    try {
      final res = await ref.read(adminApiProvider).reports(page: page);
      if (!mounted) return;
      setState(() {
        if (reset) _reports.clear();
        _reports.addAll(res.items);
        _page = page;
        _hasMore = res.hasMore;
      });
    } catch (e) {
      if (mounted) setState(() => _error = ApiException.from(e).message);
    } finally {
      if (mounted) setState(() => _loading = false);
    }
  }

  Future<void> _act(AdminReport r, String action) async {
    final l = context.l10n;
    final (title, message, ok) = switch (action) {
      'delete_photo' => (l.deletePhotosTitle(1), l.adminDeletePhotoMessage(r.groupName), l.remove),
      'ban_user' => (l.blockTitle(r.photoUser.name), l.adminBanMessage, l.block),
      _ => (l.adminDismissTitle, l.adminDismissMessage, l.adminDismiss),
    };
    if (!await confirm(context, title: title, message: message, ok: ok, danger: action != 'dismiss')) return;
    setState(() => _busy.add(r.id));
    try {
      await ref.read(adminApiProvider).reportAction(r.id, action);
      if (!mounted) return;
      setState(() {
        if (action == 'delete_photo' && r.photoId != null) {
          _reports.removeWhere((x) => x.photoId == r.photoId);
        } else {
          _reports.removeWhere((x) => x.id == r.id);
        }
      });
      showMessage(context, switch (action) { 'delete_photo' => l.photoDeleted, 'ban_user' => l.adminAccountBlocked, _ => l.adminReportDismissed });
    } catch (e) {
      if (mounted) showMessage(context, ApiException.from(e).message);
    } finally {
      if (mounted) setState(() => _busy.remove(r.id));
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_reports.isEmpty && (_loading || _error != null)) return _LoadingOrError(error: _error, onRetry: () => _load(reset: true));
    return RefreshIndicator(
      color: CT.ink,
      onRefresh: () => _load(reset: true),
      child: _reports.isEmpty
          ? ListView(children: [
              const SizedBox(height: 60),
              EmptyState(title: context.l10n.adminNoReports, message: context.l10n.adminNoReportsMessage),
            ])
          : ListView.separated(
              padding: const EdgeInsets.fromLTRB(18, 16, 18, 30),
              itemCount: _reports.length + 1,
              separatorBuilder: (_, _) => const SizedBox(height: 12),
              itemBuilder: (context, i) {
                if (i == _reports.length) {
                  return _hasMore ? CTButton(context.l10n.loadMore, kind: CTButtonKind.ghost, compact: true, loading: _loading, onTap: _load) : const SizedBox();
                }
                final r = _reports[i];
                return _ReportCard(r, busy: _busy.contains(r.id), onAction: (a) => _act(r, a));
              },
            ),
    );
  }
}

class _ReportCard extends StatelessWidget {
  const _ReportCard(this.r, {required this.busy, required this.onAction});
  final AdminReport r;
  final bool busy;
  final ValueChanged<String> onAction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(14), boxShadow: CT.cardShadow),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: SizedBox(
              width: 84,
              height: 84,
              child: r.thumbUrl == null
                  ? Container(color: CT.cream, alignment: Alignment.center, child: Text(context.l10n.deletedTag, style: CT.text(11, color: CT.muted)))
                  : Stack(fit: StackFit.expand, children: [
                      NetPhoto(r.thumbUrl!),
                      if (r.isVideo) const Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 28)),
                    ]),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(r.reasonLabel, style: CT.text(15, weight: FontWeight.w600)),
              if (r.note.isNotEmpty) Text('"${r.note}"', style: CT.text(13)),
              const SizedBox(height: 4),
              Text(context.l10n.adminReportedBy('${r.reporter.name}${r.reporter.email.isNotEmpty ? ' (${r.reporter.email})' : ''}'), style: CT.text(12, color: CT.muted)),
              Text(context.l10n.adminPhotoBy('${r.photoUser.name}${r.photoUser.banned ? ' (${context.l10n.blockedTag})' : ''}'), style: CT.text(12, color: CT.muted)),
              Text(
                [r.groupName, if (r.createdAt != null) Fmt.shortYear(r.createdAt!), if (r.openOnPhoto > 1) context.l10n.reportsCount(r.openOnPhoto)].join(' · '),
                style: CT.text(12, color: CT.muted),
              ),
            ]),
          ),
        ]),
        const SizedBox(height: 10),
        if (busy)
          const Center(child: Padding(padding: EdgeInsets.all(8), child: CircularProgressIndicator(color: CT.ink)))
        else
          Wrap(spacing: 8, runSpacing: 8, children: [
            if (!r.photoGone) _SmallButton(context.l10n.adminDeletePhoto, dark: true, onTap: () => onAction('delete_photo')),
            _SmallButton(context.l10n.adminDismiss, onTap: () => onAction('dismiss')),
            if (!r.photoUser.banned && r.photoUser.id.isNotEmpty) _SmallButton(context.l10n.adminBlockCreator, danger: true, onTap: () => onAction('ban_user')),
          ]),
      ]),
    );
  }
}

// ------------------------------------------------------------------ shared bits

class _SmallButton extends StatelessWidget {
  const _SmallButton(this.label, {required this.onTap, this.dark = false, this.danger = false});
  final String label;
  final VoidCallback onTap;
  final bool dark;
  final bool danger;

  @override
  Widget build(BuildContext context) {
    final fg = dark ? Colors.white : (danger ? CT.accent : CT.ink);
    return Material(
      color: dark ? CT.ink : CT.paper,
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          constraints: const BoxConstraints(minHeight: 38),
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: dark ? null : Border.all(color: danger ? CT.accent : CT.line, width: 1.5),
          ),
          child: Text(label, style: CT.text(13, color: fg, weight: FontWeight.w600)),
        ),
      ),
    );
  }
}

class _Tag extends StatelessWidget {
  const _Tag(this.label, {this.pro = false, this.danger = false});
  final String label;
  final bool pro;
  final bool danger;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.only(right: 4),
        padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
        decoration: BoxDecoration(
          color: pro ? const Color(0xFFF2C230) : (danger ? CT.accent : CT.cream),
          borderRadius: BorderRadius.circular(7),
        ),
        child: Text(label, style: CT.text(10, weight: FontWeight.w700, color: danger ? Colors.white : CT.ink)),
      );
}

class _LoadingOrError extends StatelessWidget {
  const _LoadingOrError({required this.error, required this.onRetry});
  final String? error;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (error == null) return const Center(child: CircularProgressIndicator(color: CT.ink));
    return EmptyState(
      title: context.l10n.loadFailed,
      message: error!,
      action: SizedBox(width: 200, child: CTButton(context.l10n.retry, compact: true, onTap: onRetry)),
    );
  }
}
