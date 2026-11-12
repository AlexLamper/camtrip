import 'package:intl/intl.dart';

class Fmt {
  Fmt._();

  static final _day = DateFormat('EEEE d MMMM', 'nl_NL');
  static final _short = DateFormat('d MMM', 'nl_NL');
  static final _shortYear = DateFormat('d MMM yyyy', 'nl_NL');
  static final _time = DateFormat('HH:mm', 'nl_NL');
  static final _dm = DateFormat('dd/MM', 'nl_NL');

  static String _cap(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  /// "Zondag 13 juli"
  static String day(DateTime d) => _cap(_day.format(d.toLocal()));

  /// "13 jul"
  static String short(DateTime d) => _short.format(d.toLocal());
  static String shortYear(DateTime d) => _shortYear.format(d.toLocal());
  static String time(DateTime d) => _time.format(d.toLocal());
  static String dm(DateTime d) => _dm.format(d.toLocal());

  /// "12-19 juli" / "28 jun - 3 jul"
  static String range(DateTime? start, DateTime? end) {
    if (start == null && end == null) return '';
    if (start == null || end == null) return short((start ?? end)!);
    final s = start.toLocal(), e = end.toLocal();
    if (s.year == e.year && s.month == e.month && s.day == e.day) return short(s);
    if (s.month == e.month && s.year == e.year) return '${s.day}-${e.day} ${DateFormat('MMMM', 'nl_NL').format(e)}';
    return '${short(s)} - ${short(e)}';
  }

  /// "'27 07 13" retro date stamp
  static String stamp(DateTime d) {
    final l = d.toLocal();
    String two(int v) => v.toString().padLeft(2, '0');
    return "'${two(l.year % 100)} ${two(l.month)} ${two(l.day)}";
  }

  static String count(int n, String one, String many) => '$n ${n == 1 ? one : many}';
}
