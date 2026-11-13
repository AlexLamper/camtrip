import 'package:camtrip/core/theme.dart';
import 'package:camtrip/features/premium/pro_gate.dart';
import 'package:camtrip/features/premium/roll.dart';
import 'package:camtrip/features/upload/upload_queue.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'support/l10n.dart';

Group _group({int used = 18, int? limit = 24, bool pro = false, String? source, String? passBy, DateTime? fetchedAt, DateTime? deleteAfter}) {
  final g = Group.fromJson({
    'id': 'g1',
    'name': 'Mallorca',
    'type': 'vacation',
    'code': 'ABC123',
    'status': 'active',
    'ownerId': 'owner',
    'isProGroup': pro,
    'proSource': source,
    'tripPass': passBy == null ? null : {'purchasedByName': passBy},
    'deleteAfter': deleteAfter?.toIso8601String(),
    'roll': limit == null ? null : {'used': used, 'limit': limit},
    'members': const [],
  });
  return fetchedAt == null ? g : g.copyWith().withFetchedAt(fetchedAt);
}

extension on Group {
  Group withFetchedAt(DateTime at) => Group(
        id: id,
        name: name,
        type: type,
        startDate: startDate,
        endDate: endDate,
        defaultStyle: defaultStyle,
        code: code,
        status: status,
        photoCount: photoCount,
        videoCount: videoCount,
        coverUrl: coverUrl,
        deleteAfter: deleteAfter,
        isProGroup: isProGroup,
        memberLimit: memberLimit,
        myRole: myRole,
        ownerId: ownerId,
        members: members,
        proSource: proSource,
        tripPassByName: tripPassByName,
        rollUsed: rollUsed,
        rollLimit: rollLimit,
        fetchedAt: at,
      );
}

UploadItem _item({String groupId = 'g1', String? photoId, UploadStatus status = UploadStatus.waiting, String kind = 'photo'}) => UploadItem(
      id: 'q${DateTime.now().microsecondsSinceEpoch}',
      groupId: groupId,
      kind: kind,
      style: 'flash',
      mime: 'image/jpeg',
      takenAt: DateTime(2026, 11, 13),
      fromRoll: false,
      width: 1,
      height: 1,
      durationMs: 0,
      originalPath: '/x',
      displayPath: '/x',
      thumbPath: '/x',
      status: status,
      photoId: photoId,
    );

void main() {
  setUpAll(useDutch);

  group('the roll from the server', () {
    test('Group reads roll and Trip Pass from the API', () {
      final g = _group(used: 7);
      expect(g.rollUsed, 7);
      expect(g.rollLimit, 24);
      final p = _group(limit: null, pro: true, source: 'tripPass', passBy: 'Sanne');
      expect(p.rollLimit, isNull);
      expect(p.hasTripPass, isTrue);
      expect(p.isProViaTripPass, isTrue);
    });

    test('shots waiting without a reservation count; reserved, held and other groups do not', () {
      final roll = computeRoll(group: _group(used: 18), unlocked: false, queue: [
        _item(), // offline shot: counts
        _item(kind: 'video'), // a video is one shot
        _item(photoId: 'p1'), // reserved: already in the server's count
        _item(status: UploadStatus.held), // did not fit: not on the roll
        _item(groupId: 'other'),
      ]);
      expect(roll!.used, 20);
      expect(roll.limit, 24);
      expect(roll.almostFull, isTrue);
      expect(roll.full, isFalse);
    });

    test('a newer count from an upload wins over the loaded group, an older one does not', () {
      final g = _group(used: 10, fetchedAt: DateTime(2026, 11, 13, 12));
      final newer = RollSeen(used: 23, limit: 24, at: DateTime(2026, 11, 13, 13));
      final older = RollSeen(used: 3, limit: 24, at: DateTime(2026, 11, 13, 11));
      expect(computeRoll(group: g, unlocked: false, queue: const [], seen: newer)!.used, 23);
      expect(computeRoll(group: g, unlocked: false, queue: const [], seen: older)!.used, 10);
      // the server said "no limit" since (a Trip Pass was bought): no counter
      final unlimited = RollSeen(used: 0, limit: null, at: DateTime(2026, 11, 13, 13));
      expect(computeRoll(group: g, unlocked: false, queue: const [], seen: unlimited), isNull);
    });

    test('no roll with Pro, in a Pro group, or when the server sends no limit', () {
      expect(computeRoll(group: _group(), unlocked: true, queue: const []), isNull);
      expect(computeRoll(group: _group(limit: null), unlocked: false, queue: const []), isNull);
      expect(computeRoll(group: null, unlocked: false, queue: const []), isNull);
    });

    test('full at 24/24', () {
      expect(computeRoll(group: _group(used: 24), unlocked: false, queue: const [])!.full, isTrue);
      expect(computeRoll(group: _group(used: 23), unlocked: false, queue: [_item()])!.full, isTrue);
    });
  });

  test('held shots (roll full) and a replaced reservation survive an app restart', () {
    final i = _item(status: UploadStatus.held)..replaces = 'p-old';
    final back = UploadItem.fromJson(i.toJson());
    expect(back.status, UploadStatus.held);
    expect(back.replaces, 'p-old');
    expect(UploadItem.fromJson(_item(status: UploadStatus.failed).toJson()).status, UploadStatus.failed);
    expect(UploadItem.fromJson(_item().toJson()).status, UploadStatus.waiting);
  });

  group('deletion nudge', () {
    final now = DateTime(2026, 11, 13, 12);
    test('shown in the last 7 days only, never for Pro groups', () {
      expect(daysUntilDeletion(_group(deleteAfter: now.add(const Duration(days: 7))), now: now), 7);
      expect(daysUntilDeletion(_group(deleteAfter: now.add(const Duration(days: 2, hours: 3))), now: now), 3);
      expect(daysUntilDeletion(_group(deleteAfter: now.add(const Duration(hours: 1))), now: now), 1);
      expect(daysUntilDeletion(_group(deleteAfter: now.add(const Duration(days: 8))), now: now), isNull);
      expect(daysUntilDeletion(_group(deleteAfter: null), now: now), isNull);
      expect(daysUntilDeletion(_group(pro: true, deleteAfter: now.add(const Duration(days: 2))), now: now), isNull);
    });
  });

  test('paywall links carry the reason and the group', () {
    expect(paywallLocation(), '/pro');
    expect(paywallLocation(reason: PaywallReason.rollFull, groupId: 'g1'), '/pro?reason=roll_full&group=g1');
    expect(PaywallReason.parse('watermark'), PaywallReason.watermark);
    expect(PaywallReason.parse('nonsense'), PaywallReason.general);
    expect(PaywallReason.parse(null), PaywallReason.general);
  });

  test('ProGate: a Trip Pass group is unlocked for everyone, "Trip Pass van Sanne"', () {
    final gate = ProGate(personal: false, group: _group(limit: null, pro: true, source: 'tripPass', passBy: 'Sanne'));
    expect(gate.unlocked, isTrue);
    expect(gate.watermark, isFalse);
    expect(gate.canUseStyle(styleIsPro: true), isTrue);
    expect(gate.viaLabel, 'Trip Pass van Sanne');
    expect(gate.cameraHint, 'Trip Pass van Sanne');
  });

  group('roll counter', () {
    Future<void> pump(WidgetTester tester, RollState roll) => tester.pumpWidget(
          localizedApp(theme: CT.theme(), home: Scaffold(body: Center(child: RollCounterPill(roll: roll)))),
        );

    testWidgets('shows used/limit, calm below 20', (tester) async {
      await pump(tester, const RollState(used: 18, limit: 24));
      expect(find.text('18/24'), findsOneWidget);
      final text = tester.widget<Text>(find.text('18/24'));
      expect(text.style?.color, CT.ink);
      expect(find.bySemanticsLabel('18 van 24 foto\'s op je rolletje'), findsOneWidget);
    });

    testWidgets('turns orange from 20', (tester) async {
      await pump(tester, const RollState(used: 20, limit: 24));
      expect(tester.widget<Text>(find.text('20/24')).style?.color, CT.warn);
    });

    testWidgets('never shows more than the limit', (tester) async {
      await pump(tester, const RollState(used: 26, limit: 24));
      expect(find.text('24/24'), findsOneWidget);
    });
  });
}
