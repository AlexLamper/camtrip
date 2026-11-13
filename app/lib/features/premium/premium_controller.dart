import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:purchases_flutter/purchases_flutter.dart';

import '../../core/api.dart';
import '../../core/config.dart';
import '../../l10n/l10n.dart';
import '../../models/models.dart';
import '../auth/auth_controller.dart';
import '../groups/groups_controller.dart';
import '../upload/upload_queue.dart';

/// RevenueCat setup for the Trip Pass (a consumable, one per trip): its own
/// offering 'trip_pass' with one package 'trip_pass' (product camtrip_trip_pass).
class TripPassConfig {
  static const offering = 'trip_pass';
  static const package = 'trip_pass';
  static const product = 'camtrip_trip_pass';

  /// Subscriber attribute set right before buying, so the server's webhook can
  /// still apply the pass if the app dies after paying. Custom attributes may
  /// not start with '\$' (reserved by RevenueCat).
  static const pendingGroupAttribute = 'camtrip_pending_trip_pass_group';
}

/// How a Trip Pass purchase ended.
enum TripPassOutcome {
  /// Paid and applied: the group is Pro now.
  activated,

  /// Paid, but the server could not confirm yet; the webhook applies it soon.
  pending,

  /// The user cancelled the store sheet.
  cancelled,
}

class PremiumState {
  const PremiumState({this.isPro = false, this.offering, this.tripPassOffering, this.busy = false, this.configured = false});
  final bool isPro;
  final Offering? offering;

  /// The separate 'trip_pass' offering (one consumable package).
  final Offering? tripPassOffering;
  final bool busy;
  final bool configured;

  Package? get annual => offering?.annual ?? _byId('\$rc_annual');
  Package? get monthly => offering?.monthly ?? _byId('\$rc_monthly');

  /// The Trip Pass package: 'trip_pass' in its own offering (or, as a fallback,
  /// a package of that name in the default offering).
  Package? get tripPass {
    for (final o in [tripPassOffering, offering]) {
      for (final p in o?.availablePackages ?? const <Package>[]) {
        if (p.identifier == TripPassConfig.package || p.storeProduct.identifier == TripPassConfig.product) return p;
      }
    }
    return null;
  }

  Package? _byId(String id) {
    for (final p in offering?.availablePackages ?? const <Package>[]) {
      if (p.identifier == id) return p;
    }
    return null;
  }

  PremiumState copyWith({bool? isPro, Offering? offering, Offering? tripPassOffering, bool? busy, bool? configured}) => PremiumState(
        isPro: isPro ?? this.isPro,
        offering: offering ?? this.offering,
        tripPassOffering: tripPassOffering ?? this.tripPassOffering,
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
      state = state.copyWith(
        offering: offerings.current ?? offerings.all['default'],
        tripPassOffering: offerings.all[TripPassConfig.offering],
      );
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

  /// After Pro or a Trip Pass: new roll limits from the server, and the shots
  /// that were held back because the roll was full get uploaded after all.
  Future<void> _afterUnlock() async {
    try {
      await ref.read(groupsProvider.notifier).reload();
    } catch (_) {}
    await ref.read(uploadQueueProvider.notifier).releaseHeld();
  }

  /// Buys a Trip Pass for [group] and has the server apply it.
  Future<TripPassOutcome> purchaseTripPass(Group group) async {
    if (!state.configured) throw ApiException(L10n.current.subscriptionsUnavailable);
    final package = state.tripPass;
    if (package == null) throw ApiException(L10n.current.tripPassUnavailable);
    state = state.copyWith(busy: true);
    try {
      // Safety net first: if the app dies after paying, the webhook knows the group.
      try {
        await Purchases.setAttributes({TripPassConfig.pendingGroupAttribute: group.serverId});
      } catch (_) {}
      final PurchaseResult result;
      try {
        result = await Purchases.purchase(PurchaseParams.package(package));
      } on PlatformException catch (e) {
        final code = PurchasesErrorHelper.getErrorCode(e);
        if (code == PurchasesErrorCode.purchaseCancelledError) return TripPassOutcome.cancelled;
        if (code == PurchasesErrorCode.paymentPendingError) throw ApiException(L10n.current.paymentPending);
        debugPrint('trip pass purchase failed: ${e.message}');
        throw ApiException(L10n.current.purchaseFailed);
      }
      _apply(result.customerInfo);
      final tx = result.storeTransaction.transactionIdentifier;
      var outcome = TripPassOutcome.pending;
      for (var attempt = 0; attempt < 3 && outcome == TripPassOutcome.pending; attempt++) {
        try {
          final res = await ref.read(apiProvider).post('/groups/${group.serverId}/trip-pass', {'transactionId': tx});
          final g = res['group'];
          if (g is Map<String, dynamic>) ref.read(groupsProvider.notifier).applyServerGroup(Group.fromJson(g));
          outcome = TripPassOutcome.activated;
        } on ApiException catch (e) {
          // Refused for good (used elsewhere, group already has one): say so.
          if (e.status == 409) rethrow;
          // Not yet known at RevenueCat, or offline: try again shortly, then leave it to the webhook.
          await Future<void>.delayed(Duration(seconds: 1 + attempt * 2));
        }
      }
      // Applied: the safety net is no longer needed ('' removes the attribute).
      // Still pending: leave it for the webhook.
      if (outcome == TripPassOutcome.activated) {
        try {
          await Purchases.setAttributes({TripPassConfig.pendingGroupAttribute: ''});
        } catch (_) {}
      }
      await _afterUnlock();
      return outcome;
    } finally {
      state = state.copyWith(busy: false);
    }
  }

  /// Returns true when Pro is active afterwards. Cancelling returns false quietly.
  Future<bool> purchase(Package package) async {
    if (!state.configured) throw ApiException(L10n.current.subscriptionsUnavailable);
    state = state.copyWith(busy: true);
    try {
      final result = await Purchases.purchase(PurchaseParams.package(package));
      _apply(result.customerInfo);
      await _syncServer();
      if (state.isPro) unawaited(_afterUnlock());
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
