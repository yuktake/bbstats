import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnGameStateNotifier extends StateNotifier<bool> {
  OnGameStateNotifier() : super(false) {
    initialize();
  }

  static const onGamePrefsKey = 'onGame';

  Future initialize() async {
    final onGame = await _onGameStatus;
    state = onGame;
  }

  Future<bool> get _onGameStatus async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(onGamePrefsKey) ?? false;
  }

  Future change(bool onGame) async {
    await _save(onGame);
    state = onGame;
  }

  Future<void> _save(bool onGame) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(onGamePrefsKey, onGame);
  }
}