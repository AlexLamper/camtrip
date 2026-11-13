import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../core/api.dart';
import '../../core/config.dart';
import '../../l10n/l10n.dart';
import '../auth/auth_controller.dart';

class PremiumState {
  const PremiumState({this.isPro = false, this.offering, this.busy = false, this.configured = false});
  final bool isPro;
  final Offering? offering;
  final bool busy;
  final bool configured;

  Package? get annual => offering?.annual ?? _byId('\$rc_annual');
  Package? get monthly => offering?.monthly ?? _byId('\$rc_monthly');

  Package? _byId(String id) {
    for (final p in offering?.availablePackages ?? const <Package>[]) {
      if (p.identifier == id) return p;
    }
    return null;
  }

  PremiumState copyWith({bool? isPro, Offering? offering, bool? busy, bool? configured}) => PremiumState(
        isPro: isPro ?? this.isPro,
        offering: offering ?? this.offering,
        busy: busy ?? this.busy,
        configured: configured ?? this.configured,
      );
}

final premiumProvider = NotifierProvider<PremiumController, PremiumState>(PremiumController.new);

/// True when the signed-in user has Pro, from RevenueCat (instant) or the
/// server (covers purchases made on another device).
final isProProvider = Provider<bool>((ref) {
  final rc = ref.watch(premiumProvider).isPro;
  final server = ref.watch(authProvider).value?.isPro ?? false;
  return rc || server;
});

class PremiumController extends Notifier<PremiumState> {
  @override
  PremiumState build() => const PremiumState();

  /// Called once from main().
  Future<void> configure() async {
    final key = RevenueCatConfig.sdkKey();
    if (key.isEmpty) return; // keys not injected (local dev build)
    try {
      await Purchases.setLogLevel(kDebugMode ? LogLevel.info : LogLevel.warn);
      await Purchases.configure(PurchasesConfiguration(key));
    } catch (e) {
      debugPrint('RevenueCat configure failed: $e');
      return; // the app works without purchases; the paywall says so
    }
    Purchases.addCustomerInfoUpdateListener(_apply);
    state = state.copyWith(configured: true);
    unawaited(loadOffering());
  }

  void _apply(CustomerInfo info) {
    final pro = info.entitlements.active.containsKey(RevenueCatConfig.proEntitlement);
    if (pro != state.isPro) state = state.copyWith(isPro: pro);
  }

  Future<void> loadOffering() async {
    if (!state.configured) return;
    try {
      final offerings = await Purchases.getOfferings();
      state = state.copyWith(offering: offerings.current ?? offerings.all['default']);
    } catch (_) {}
  }

  /// RevenueCat appUserID = our Mongo user id, so a purchase belongs to the
  /// account on every device and the webhook can find it.
  Future<void> onSignedIn(String userId) async {
    if (!state.configured) return;
    final result = await Purchases.logIn(userId);
    _apply(result.customerInfo);
    await _syncServer();
  }

  Future<void> onSignedOut() async {
    if (!state.configured) return;
    if (!await Purchases.isAnonymous) await Purchases.logOut();
    state = state.copyWith(isPro: false);
  }

  Future<void> _syncServer() async {
    try {
      await ref.read(apiProvider).post('/sync-pro');
      await ref.read(authProvider.notifier).refresh();
    } catch (_) {}
  }

  /// Returns true when Pro is active afterwards. Cancelling returns false quietly.
  Future<bool> purchase(Package package) async {
    if (!state.configured) throw ApiException(L10n.current.subscriptionsUnavailable);
    state = state.copyWith(busy: true);
    try {
      final result = await Purchases.purchase(PurchaseParams.package(package));
      _apply(result.customerInfo);
      await _syncServer();
      return state.isPro;
    } on PlatformException catch (e) {
      final code = PurchasesErrorHelper.getErrorCode(e);
      if (code == PurchasesErrorCode.purchaseCancelledError) return false;
      if (code == PurchasesErrorCode.paymentPendingError) throw ApiException(L10n.current.paymentPending);
      debugPrint('purchase failed: ${e.message}');
      throw ApiException(L10n.current.purchaseFailed);
    } finally {
      state = state.copyWith(busy: false);
    }
  }

  Future<bool> restore() async {
    if (!state.configured) throw ApiException(L10n.current.restoreUnavailable);
    state = state.copyWith(busy: true);
    try {
      final info = await Purchases.restorePurchases();
      _apply(info);
      await _syncServer();
      return state.isPro;
    } on PlatformException catch (e) {
      debugPrint('restore failed: ${e.message}');
      throw ApiException(L10n.current.restoreFailed);
    } finally {
      state = state.copyWith(busy: false);
    }
  }
}
