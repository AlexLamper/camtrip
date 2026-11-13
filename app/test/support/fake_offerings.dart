import 'package:camtrip/features/premium/premium_controller.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

const _ctx = PresentedOfferingContext('default', null, null);
const _tripCtx = PresentedOfferingContext('trip_pass', null, null);

Package _package(String id, PackageType type, double price, String priceString, {String? perMonth, IntroductoryPrice? intro}) =>
    Package(id, type, StoreProduct('camtrip_pro_$id', 'CamTrip Pro', 'CamTrip Pro', price, priceString, 'EUR',
        introductoryPrice: intro, pricePerMonthString: perMonth), _ctx);

/// A RevenueCat offering like the real one: yearly and monthly. The yearly
/// product still carries a 7-day free intro offer (as the store may report
/// while it is being removed): the paywall must not advertise it. Prices are
/// deliberately odd so tests can tell them from the paywall's fallback list prices.
Offering fakeOffering() {
  final annual = _package('\$rc_annual', PackageType.annual, 47.99, '€ 47,99',
      perMonth: '€ 4,00', intro: const IntroductoryPrice(0, '€ 0,00', 'P1W', 1, PeriodUnit.day, 7));
  final monthly = _package('\$rc_monthly', PackageType.monthly, 7.49, '€ 7,49');
  return Offering('default', 'CamTrip Pro', const {}, [annual, monthly], annual: annual, monthly: monthly);
}

/// The separate 'trip_pass' offering with its one consumable package.
Offering fakeTripPassOffering() {
  const product = StoreProduct('camtrip_trip_pass', 'Trip Pass', 'Trip Pass', 4.49, '€ 4,49', 'EUR');
  return Offering('trip_pass', 'Trip Pass', const {}, [const Package('trip_pass', PackageType.custom, product, _tripCtx)]);
}

/// Premium state with [fakeOffering] (and [fakeTripPassOffering]) loaded and nothing calling RevenueCat.
class FakePremium extends PremiumController {
  FakePremium({this.offering});
  final Offering? offering;

  @override
  PremiumState build() => PremiumState(configured: true, offering: offering ?? fakeOffering(), tripPassOffering: fakeTripPassOffering());

  @override
  Future<void> loadOffering() async {}
}
