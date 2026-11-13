import 'package:camtrip/features/camera/styles.dart';
import 'package:camtrip/features/groups/join_sheet.dart';
import 'package:camtrip/features/recap/recap_builder.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/painting.dart';
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
    test('query code', () => expect(parseInvite('camtrip://join?code=k7f2qx'), 'K7F2QX'));
    test('other website is not an invite', () => expect(parseInvite('https://example.com/menu'), isNull));
    test('code with dash', () => expect(parseInvite('K7F-2QX'), 'K7F2QX'));
  });

  group('models', () {
    test('AppUser reads blocked users and settings', () {
      final u = AppUser.fromJson({
        'id': 'u1',
        'name': 'Daan',
        'isPro': true,
        'settings': {'notifyNewPhotos': false},
        'blockedUserIds': ['a', 'b'],
      });
      expect(u.blockedUserIds, ['a', 'b']);
      expect(u.notifyNewPhotos, isFalse);
      expect(u.notifyRecap, isTrue);
      expect(u.copyWith(name: 'X').blockedUserIds, ['a', 'b']);
    });

    test('Photo parses the API shape, including camera-roll photos', () {
      final p = Photo.fromJson({
        'id': 'p1',
        'groupId': 'g1',
        'userId': 'u1',
        'kind': 'photo',
        'style': 'roll',
        'width': 2048,
        'height': 1536,
        'durationMs': 0,
        'takenAt': '2027-07-13T10:00:00.000Z',
        'fromRoll': true,
        'caption': '',
        'thumbUrl': 'https://r2/t.jpg',
        'displayUrl': 'https://r2/d.jpg',
        'videoUrl': null,
        'reactions': [
          {'emoji': '❤️', 'count': 2},
        ],
        'myReactions': ['❤️'],
        'favoriteCount': 1,
        'isFavorite': true,
      });
      expect(p.fromRoll, isTrue);
      expect(p.heartCount, 2);
      expect(p.takenAt.toUtc().hour, 10);
    });

    test('Group parses limits and members', () {
      final g = Group.fromJson({
        'id': 'g1',
        'name': "Mallorca '27",
        'type': 'vacation',
        'startDate': '2027-07-12T00:00:00.000Z',
        'endDate': '2027-07-19T21:59:00.000Z',
        'defaultStyle': 'film',
        'code': 'K7F2QX',
        'status': 'active',
        'photoCount': 3,
        'videoCount': 1,
        'coverUrl': null,
        'deleteAfter': null,
        'isProGroup': false,
        'memberLimit': 10,
        'myRole': 'admin',
        'ownerId': 'u1',
        'members': [
          {'id': 'u1', 'name': 'Daan', 'avatarColor': '#zzzzzz', 'role': 'admin'},
        ],
      });
      expect(g.isAdmin, isTrue);
      expect(g.totalCount, 4);
      expect(g.isFull, isFalse);
      expect(g.members.single.color, const Color(0xFFD9472B)); // bad hex falls back
    });

    test('report reasons match the API', () {
      expect(ReportReason.values.map((r) => r.name), ['ongepast', 'spam', 'anders']);
    });
  });

  group('styles', () {
    test('free styles match the server', () {
      expect(CameraStyle.all.where((s) => !s.pro).map((s) => s.id), ['flash', 'film', 'instant', 'disposable']);
    });
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
