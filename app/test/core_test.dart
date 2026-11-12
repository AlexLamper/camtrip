import 'package:camtrip/features/camera/styles.dart';
import 'package:camtrip/features/groups/join_sheet.dart';
import 'package:camtrip/features/recap/recap_builder.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

Photo _photo(String id, DateTime t, {int fav = 0}) => Photo(
      id: id,
      groupId: 'g',
      userId: 'u',
      kind: 'photo',
      style: 'film',
      width: 100,
      height: 100,
      durationMs: 0,
      takenAt: t,
      fromRoll: false,
      thumbUrl: '',
      displayUrl: '',
      videoUrl: null,
      reactions: const [],
      myReactions: const [],
      favoriteCount: fav,
      isFavorite: false,
    );

void main() {
  group('parseInvite', () {
    test('plain code', () => expect(parseInvite(' k7f2qx '), 'K7F2QX'));
    test('website link', () => expect(parseInvite('https://camtrip.app/j/K7F2QX?x=1'), 'K7F2QX'));
    test('app scheme', () => expect(parseInvite('camtrip://join/ab3cde'), 'AB3CDE'));
    test('garbage', () => expect(parseInvite('hi'), isNull));
  });

  group('ColorMatrix', () {
    test('identity composition is identity', () {
      final m = ColorMatrix.compose([ColorMatrix.identity, ColorMatrix.identity]);
      expect(m.m, ColorMatrix.identity.m);
    });
    test('saturation 0 makes grey', () {
      final m = ColorMatrix.saturation(0).m;
      // a pure red pixel turns into its luminance on every channel
      final r = m[0] * 255, g = m[5] * 255, b = m[10] * 255;
      expect((r - g).abs() < 0.001 && (g - b).abs() < 0.001, isTrue);
    });
    test('compose applies in order (offset then gain)', () {
      final m = ColorMatrix.compose([ColorMatrix.brightness(10), ColorMatrix.channels(r: 2)]).m;
      expect(m[4], 20); // (x + 10) * 2
    });
    test('every style has a valid 20-value matrix', () {
      for (final s in CameraStyle.all) {
        expect(s.matrix.m.length, 20, reason: s.id);
      }
    });
  });

  group('pickRecapPhotos', () {
    test('keeps everything when it fits, chronological', () {
      final ps = [_photo('b', DateTime(2027, 7, 13)), _photo('a', DateTime(2027, 7, 12))];
      expect(pickRecapPhotos(ps, RecapTemplate.goldenHour).map((p) => p.id), ['a', 'b']);
    });
    test('caps length and covers every day', () {
      final ps = [
        for (var d = 0; d < 5; d++)
          for (var i = 0; i < 40; i++) _photo('$d-$i', DateTime(2027, 7, 12 + d, 10, i), fav: i == 7 ? 5 : 0),
      ];
      final picked = pickRecapPhotos(ps, RecapTemplate.goldenHour);
      expect(picked.length, lessThanOrEqualTo((maxRecapSeconds / RecapTemplate.goldenHour.secondsPerPhoto).floor()));
      expect(picked.map((p) => p.takenAt.day).toSet().length, 5);
      expect(picked.any((p) => p.id == '0-7'), isTrue, reason: 'favourites first');
    });
  });
}
