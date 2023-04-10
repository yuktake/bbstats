import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QuarterMinStateNotifier extends StateNotifier<int> {
  QuarterMinStateNotifier() : super(10) {
    initialize();
  }

  static const quarterMinPrefsKey = 'quarterMin';

  Future initialize() async {
    final quarterMin = await _quarterMinStatus;
    state = quarterMin;
  }

  Future<int> get _quarterMinStatus async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt(quarterMinPrefsKey) ?? 10;
  }

  Future change(int quarterMin) async {
    await _save(quarterMin);
    state = quarterMin;
  }

  Future<void> _save(int quarterMin) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt(quarterMinPrefsKey, quarterMin);
  }
}