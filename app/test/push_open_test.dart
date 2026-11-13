import 'dart:ui';

import 'package:camtrip/features/notifications/push.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('a report alert opens Beheer > Meldingen, only for admins', () {
    final open = PushOpen.from({'type': 'report', 'reportId': 'r1'});
    expect(open.route(isAdmin: true), '/admin?tab=reports');
    expect(open.route(isAdmin: false), isNull);
  });

  test('new photos and recaps open the group', () {
    expect(PushOpen.from({'type': 'new_photos', 'groupId': 'g1'}).route(isAdmin: false), '/group/g1');
    expect(PushOpen.from({'type': 'recap', 'groupId': 'g2'}).route(isAdmin: true), '/group/g2');
    // Older native builds send only the group id.
    expect(PushOpen.from('g3').route(isAdmin: false), '/group/g3');
  });

  test('a reset code opens nothing; junk is ignored', () {
    expect(PushOpen.from({'type': 'reset_code'}).route(isAdmin: true), isNull);
    expect(PushOpen.from(null).data, isEmpty);
    expect(PushOpen.from('').data, isEmpty);
    expect(PushOpen.from({'groupId': 7}).data, {'groupId': '7'});
  });

  test('locale tag sent with the push token', () {
    expect(pushLocaleTag(const Locale('nl')), 'nl');
    expect(pushLocaleTag(const Locale('pt', 'BR')), 'pt_BR');
    expect(pushLocaleTag(const Locale.fromSubtags(languageCode: 'zh', scriptCode: 'Hant')), 'zh_Hant');
    expect(pushLocaleTag(const Locale('fil')), 'fil');
  });
}
