import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PurchaseStateNotifier extends StateNotifier<bool> {
  PurchaseStateNotifier() : super(false) {
    initialize();
  }

  static const purchasePrefsKey = 'purchase';

  Future initialize() async {
    final purchase = await _purchaseStatus;
    state = purchase;
  }

  Future<bool> get _purchaseStatus async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(purchasePrefsKey) ?? false;
  }

  Future change(bool onGame) async {
    await _save(onGame);
    state = onGame;
  }

  Future<void> _save(bool purchase) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(purchasePrefsKey, purchase);
  }
}