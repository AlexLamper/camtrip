import 'package:camtrip/features/premium/premium_controller.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

const _ctx = PresentedOfferingContext('default', null, null);

Package _package(String id, PackageType type, double price, String priceString, {String? perMonth, IntroductoryPrice? intro}) =>
    Package(id, type, StoreProduct('camtrip_pro_$id', 'CamTrip Pro', 'CamTrip Pro', price, priceString, 'EUR',
        introductoryPrice: intro, pricePerMonthString: perMonth), _ctx);

/// A RevenueCat offering like the real one: yearly with a 7-day free trial,
/// and monthly. Prices are deliberately odd so tests can tell them from the
/// paywall's fallback list prices.
Offering fakeOffering() {
  final annual = _package('\$rc_annual', PackageType.annual, 47.99, '€ 47,99',
      perMonth: '€ 4,00', intro: const IntroductoryPrice(0, '€ 0,00', 'P1W', 1, PeriodUnit.day, 7));
  final monthly = _package('\$rc_monthly', PackageType.monthly, 7.49, '€ 7,49');
  return Offering('default', 'CamTrip Pro', const {}, [annual, monthly], annual: annual, monthly: monthly);
}

/// Premium state with [fakeOffering] loaded and nothing calling RevenueCat.
class FakePremium extends PremiumController {
  FakePremium({this.offering});
  final Offering? offering;

  @override
  PremiumState build() => PremiumState(configured: true, offering: offering ?? fakeOffering());

  @override
  Future<void> loadOffering() async {}
}
