import 'package:intl/intl.dart';

import '../l10n/l10n.dart';

/// Dates in the app's language (DateFormat skeletons, so every language gets
/// its own order and month names).
class Fmt {
  Fmt._();

  static String get _l => L10n.intlLocale;

  static String _cap(String s) => s.isEmpty ? s : s[0].toUpperCase() + s.substring(1);

  /// "Zondag 13 juli" / "Sunday, July 13"
  static String day(DateTime d) => _cap(DateFormat.MMMMEEEEd(_l).format(d.toLocal()));

  /// "zondag 13 juli" / "Sunday, July 13", in the language's own casing,
  /// for use inside a sentence.
  static String dayInline(DateTime d) => DateFormat.MMMMEEEEd(_l).format(d.toLocal());

  /// "13 jul" / "Jul 13"
  static String short(DateTime d) => DateFormat.MMMd(_l).format(d.toLocal());
  static String shortYear(DateTime d) => DateFormat.yMMMd(_l).format(d.toLocal());
  static String time(DateTime d) => DateFormat.Hm(_l).format(d.toLocal());

  /// "13/07" / "7/13"
  static String dm(DateTime d) => DateFormat.Md(_l).format(d.toLocal());

  /// "12-19 juli" / "July 12-19" / "28 jun - 3 jul"
  static String range(DateTime? start, DateTime? end) {
    if (start == null && end == null) return '';
    if (start == null || end == null) return short((start ?? end)!);
    final s = start.toLocal(), e = end.toLocal();
    if (s.year == e.year && s.month == e.month && s.day == e.day) return short(s);
    if (s.month == e.month && s.year == e.year) {
      // Each language picks the parts it needs: "12-19 juli", "July 12-19",
      // "12.-19. heinäkuuta" (month in the right case), "7月12日～19日".
      return L10n.current.dateRangeSameMonth(
        DateFormat.d(_l).format(s),
        DateFormat.d(_l).format(e),
        DateFormat.MMMM(_l).format(e),
        DateFormat.M(_l).format(e),
        DateFormat.MMMMd(_l).format(e),
      );
    }
    return '${short(s)} - ${short(e)}';
  }

  /// "'27 07 13" retro date stamp (the same on every camera, in every language)
  static String stamp(DateTime d) {
    final l = d.toLocal();
    String two(int v) => v.toString().padLeft(2, '0');
    return "'${two(l.year % 100)} ${two(l.month)} ${two(l.day)}";
  }
}
