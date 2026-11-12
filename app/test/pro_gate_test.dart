import 'package:camtrip/features/admin/admin_api.dart';
import 'package:camtrip/features/groups/groups_controller.dart';
import 'package:camtrip/features/premium/premium_controller.dart';
import 'package:camtrip/features/premium/pro_gate.dart';
import 'package:camtrip/models/models.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

Group makeGroup({bool pro = false, String? source, String? by, String id = 'g1'}) => Group.fromJson({
      'id': id,
      'name': 'Mallorca',
      'type': 'vacation',
      'code': 'ABC123',
      'status': 'active',
      'myRole': 'member',
      'ownerId': 'owner',
      'isProGroup': pro,
      'isPro': pro,
      'proSource': source,
      'proBy': by == null ? null : {'id': 'u-$by', 'name': by},
      'memberLimit': pro ? null : 10,
      'members': [
        {'id': 'me', 'name': 'Ik', 'role': 'member'},
      ],
    });

void main() {
  setUpAll(() => initializeDateFormatting('nl_NL'));

  group('ProGate: personal Pro OR the group\'s Pro', () {
    test('free user in a free group: Pro styles locked, watermark on', () {
      final g = ProGate(personal: false, group: makeGroup());
      expect(g.unlocked, isFalse);
      expect(g.viaGroup, isFalse);
      expect(g.canUseStyle(styleIsPro: false), isTrue);
      expect(g.canUseStyle(styleIsPro: true), isFalse);
      expect(g.watermark, isTrue);
      expect(g.originalQuality, isFalse);
      expect(g.viaLabel, isNull);
      expect(g.cameraHint, isNull);
    });

    test('free user in a Pro group: unlocked via the group, "Pro via Sanne"', () {
      final g = ProGate(personal: false, group: makeGroup(pro: true, source: 'group', by: 'Sanne'));
      expect(g.unlocked, isTrue);
      expect(g.viaGroup, isTrue);
      expect(g.canUseStyle(styleIsPro: true), isTrue);
      expect(g.watermark, isFalse);
      expect(g.originalQuality, isTrue);
      expect(g.viaLabel, 'Pro via Sanne');
      expect(g.cameraHint, contains('Sanne'));
    });

    test('Pro group without a name still explains where Pro comes from', () {
      final g = ProGate(personal: false, group: makeGroup(pro: true, source: 'group'));
      expect(g.viaLabel, 'Pro via de groep');
      expect(g.cameraHint, isNotNull);
    });

    test('my own Pro: unlocked everywhere, no "via" badge', () {
      for (final gr in [null, makeGroup(), makeGroup(pro: true, source: 'self', by: 'Ik')]) {
        final g = ProGate(personal: true, group: gr);
        expect(g.unlocked, isTrue);
        expect(g.viaGroup, isFalse);
        expect(g.canUseStyle(styleIsPro: true), isTrue);
        expect(g.viaLabel, isNull);
      }
    });

    test('no group (camera before a group is picked): only personal Pro counts', () {
      expect(const ProGate(personal: false).unlocked, isFalse);
      expect(const ProGate(personal: false).canUseStyle(styleIsPro: true), isFalse);
      expect(const ProGate(personal: true).unlocked, isTrue);
    });
  });

  group('providers', () {
    ProviderContainer container({required bool personal, List<Group> groups = const [], String? active}) {
      final c = ProviderContainer(overrides: [
        isProProvider.overrideWithValue(personal),
        groupProvider.overrideWith((ref, id) => groups.where((g) => g.id == id).firstOrNull),
        activeGroupProvider.overrideWithValue(groups.where((g) => g.id == active).firstOrNull),
      ]);
      addTearDown(c.dispose);
      return c;
    }

    test('proGateProvider follows the group by id', () {
      final c = container(personal: false, groups: [
        makeGroup(id: 'free'),
        makeGroup(id: 'pro', pro: true, source: 'group', by: 'Sanne'),
      ]);
      expect(c.read(proGateProvider('free')).unlocked, isFalse);
      expect(c.read(proGateProvider('pro')).unlocked, isTrue);
      expect(c.read(proGateProvider('pro')).viaLabel, 'Pro via Sanne');
      expect(c.read(proGateProvider('missing')).unlocked, isFalse);
      expect(c.read(proGateProvider(null)).unlocked, isFalse);
    });

    test('activeProGateProvider uses the camera\'s group', () {
      final groups = [makeGroup(id: 'pro', pro: true, source: 'group', by: 'Sanne')];
      expect(container(personal: false, groups: groups, active: 'pro').read(activeProGateProvider).unlocked, isTrue);
      expect(container(personal: false, groups: groups).read(activeProGateProvider).unlocked, isFalse);
      expect(container(personal: true).read(activeProGateProvider).unlocked, isTrue);
    });
  });

  group('JSON', () {
    test('Group reads isProGroup, proSource and proBy', () {
      final g = makeGroup(pro: true, source: 'group', by: 'Sanne');
      expect(g.isProGroup, isTrue);
      expect(g.isProViaGroup, isTrue);
      expect(g.proByName, 'Sanne');
      expect(g.copyWith(name: 'X').proByName, 'Sanne');
      expect(makeGroup(pro: true, source: 'self', by: 'Ik').isProViaGroup, isFalse);
      expect(makeGroup().isProViaGroup, isFalse);
    });

    test('AppUser reads role, proSource and proUntil', () {
      final u = AppUser.fromJson({
        'id': 'u1',
        'name': 'Alex',
        'isPro': true,
        'role': 'admin',
        'proSource': 'admin',
        'proUntil': null,
      });
      expect(u.isAppAdmin, isTrue);
      expect(u.proSource, 'admin');
      expect(u.proUntil, isNull);
      final gift = AppUser.fromJson({'id': 'u2', 'isPro': true, 'proSource': 'gift', 'proUntil': '2027-01-01T00:00:00.000Z'});
      expect(gift.isAppAdmin, isFalse);
      expect(gift.proUntil, DateTime.utc(2027));
      expect(gift.copyWith(name: 'B').proSource, 'gift');
    });
  });

  group('admin labels', () {
    test('Pro source and status text', () {
      expect(proSourceLabel('subscription'), 'Abonnement');
      expect(proSourceLabel('gift'), 'Cadeau');
      expect(proSourceLabel('admin'), 'Beheerder');
      expect(proSourceLabel(null), 'Geen Pro');
      expect(proStatusText(isPro: false), 'Geen Pro');
      expect(proStatusText(isPro: true, source: 'gift'), 'Pro (Cadeau), geen einddatum');
      expect(proStatusText(isPro: true, source: 'subscription', until: DateTime(2026, 12, 24)), startsWith('Pro (Abonnement), tot 24'));
      expect(reportReasonLabel('spam'), 'Spam');
      expect(reportReasonLabel('iets'), 'iets');
      expect(GrantDuration.values.map((d) => d.name), ['month', 'year', 'lifetime', 'custom']);
    });
  });
}
