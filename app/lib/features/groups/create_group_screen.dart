import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../core/api.dart';
import '../../core/format.dart';
import '../../core/theme.dart';
import '../../core/widgets.dart';
import '../../models/models.dart';
import '../camera/styles.dart';
import '../premium/premium_controller.dart';
import 'groups_controller.dart';

class CreateGroupScreen extends ConsumerStatefulWidget {
  const CreateGroupScreen({super.key});
  @override
  ConsumerState<CreateGroupScreen> createState() => _CreateGroupScreenState();
}

class _CreateGroupScreenState extends ConsumerState<CreateGroupScreen> {
  final _name = TextEditingController();
  GroupType _type = GroupType.vacation;
  DateTimeRange? _range;
  DateTime _eventDay = DateTime.now();
  String _style = 'instant';
  bool _busy = false;

  @override
  void dispose() {
    _name.dispose();
    super.dispose();
  }

  Future<void> _pickRange() async {
    final now = DateTime.now();
    final r = await showDateRangePicker(
      context: context,
      firstDate: now.subtract(const Duration(days: 60)),
      lastDate: now.add(const Duration(days: 730)),
      initialDateRange: _range ?? DateTimeRange(start: now, end: now.add(const Duration(days: 7))),
      locale: const Locale('nl'),
      builder: (c, child) => Theme(data: CT.theme(), child: child!),
    );
    if (r != null) setState(() => _range = r);
  }

  Future<void> _pickDay() async {
    final now = DateTime.now();
    final d = await showDatePicker(
      context: context,
      firstDate: now.subtract(const Duration(days: 60)),
      lastDate: now.add(const Duration(days: 730)),
      initialDate: _eventDay,
      locale: const Locale('nl'),
    );
    if (d != null) setState(() => _eventDay = d);
  }

  Future<void> _create() async {
    final name = _name.text.trim();
    if (name.isEmpty) {
      showMessage(context, 'Geef je groep een naam');
      return;
    }
    if (_type == GroupType.vacation && _range == null) {
      await _pickRange();
      if (_range == null) return;
    }
    setState(() => _busy = true);
    try {
      final (start, end) = switch (_type) {
        GroupType.vacation => (_range!.start, DateTime(_range!.end.year, _range!.end.month, _range!.end.day, 23, 59)),
        GroupType.event => (_eventDay, DateTime(_eventDay.year, _eventDay.month, _eventDay.day, 23, 59).add(const Duration(hours: 6))),
        GroupType.permanent => (null, null),
      };
      final g = await ref.read(groupsProvider.notifier).create(name: name, type: _type, start: start, end: end, style: _style);
      if (mounted) context.pushReplacement('/group/${g.id}/invite?new=1');
    } on ApiException catch (e) {
      if (mounted) showMessage(context, e.message);
    } finally {
      if (mounted) setState(() => _busy = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    final isPro = ref.watch(isProProvider);
    Widget typeOption(GroupType t, IconData icon, String title, String sub) {
      final on = _type == t;
      return GestureDetector(
        onTap: () => setState(() => _type = t),
        child: Container(
          margin: const EdgeInsets.only(bottom: 8),
          padding: const EdgeInsets.all(14),
          decoration: BoxDecoration(
            color: CT.paper,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: on ? CT.accent : CT.line, width: 1.5),
          ),
          child: Row(children: [
            Icon(icon, color: on ? CT.accent : CT.ink),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(title, style: CT.text(15, weight: FontWeight.w600)),
                Text(sub, style: CT.text(12, color: CT.muted)),
              ]),
            ),
            Icon(on ? Icons.radio_button_checked : Icons.radio_button_off, color: on ? CT.accent : const Color(0xFFCCCCCC)),
          ]),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(leading: const CloseButton(), title: const Text('Nieuwe groep')),
      body: SafeArea(
        child: Column(children: [
          Expanded(
            child: ListView(padding: const EdgeInsets.fromLTRB(22, 4, 22, 24), children: [
              const SectionLabel('Naam'),
              TextField(
                controller: _name,
                autofocus: true,
                maxLength: 60,
                textCapitalization: TextCapitalization.sentences,
                style: CT.title(18, weight: FontWeight.w600),
                decoration: const InputDecoration(hintText: 'Mallorca \'27', counterText: ''),
              ),
              const SectionLabel('Soort groep'),
              typeOption(GroupType.vacation, Icons.beach_access_outlined, 'Vakantie', 'Met begin- en einddatum, daarna archief'),
              typeOption(GroupType.event, Icons.celebration_outlined, 'Event', 'Eén dag of avond, bijv. een feest'),
              typeOption(GroupType.permanent, Icons.all_inclusive, 'Altijd open', 'Voor je vaste vriendengroep'),
              if (_type == GroupType.vacation) ...[
                const SectionLabel('Datum'),
                GestureDetector(
                  onTap: _pickRange,
                  child: Row(children: [
                    Expanded(child: _dateBox(_range == null ? 'Vertrek' : Fmt.shortYear(_range!.start))),
                    const SizedBox(width: 10),
                    Expanded(child: _dateBox(_range == null ? 'Terug' : Fmt.shortYear(_range!.end))),
                  ]),
                ),
              ],
              if (_type == GroupType.event) ...[
                const SectionLabel('Datum'),
                GestureDetector(onTap: _pickDay, child: _dateBox(Fmt.shortYear(_eventDay))),
              ],
              const SectionLabel('Standaard camerastijl'),
              Wrap(spacing: 8, runSpacing: 8, children: [
                for (final s in CameraStyle.all)
                  CTChip(
                    s.name,
                    selected: _style == s.id,
                    dashed: s.pro && !isPro,
                    icon: s.pro && !isPro ? Icons.star_rounded : null,
                    onTap: () => s.pro && !isPro ? context.push('/pro') : setState(() => _style = s.id),
                  ),
              ]),
              if (!isPro) ...[
                const SizedBox(height: 18),
                Text(
                  _type == GroupType.permanent
                      ? 'Gratis: tot 10 leden. Met Pro onbeperkt.'
                      : 'Gratis: tot 10 leden, foto\'s blijven tot 30 dagen na de einddatum. Met Pro onbeperkt en voor altijd.',
                  style: CT.text(12, color: CT.muted),
                ),
              ],
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(22, 0, 22, 12),
            child: CTButton('Groep aanmaken', kind: CTButtonKind.primary, loading: _busy, onTap: _create),
          ),
        ]),
      ),
    );
  }

  Widget _dateBox(String text) => Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(color: CT.paper, borderRadius: BorderRadius.circular(12), border: Border.all(color: CT.line, width: 1.5)),
        child: Text(text, style: CT.text(15, weight: FontWeight.w500)),
      );
}
