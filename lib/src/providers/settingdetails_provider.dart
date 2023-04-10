import 'package:bb_stats/src/collections/settingDetails/setting_details_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingDetailsStateNotifier extends StateNotifier<SettingDetailsModel> {
  SettingDetailsStateNotifier() : super (
    const SettingDetailsModel(
      quarterMin: 10,
    )
  ){
    initialize();
  }

  static const quarterMinPrefsKey = 'quarterMin';

  SharedPreferences? prefs;

  Future initialize() async {
    final quarterMin = await _quarterMinStatus;
    state = state.copyWith(
      quarterMin: quarterMin
    );
  }

  Future<int> get _quarterMinStatus async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getInt(quarterMinPrefsKey) ?? 10;
  }

  void updateQuarterMinState(int quarterMin) {
    state = state.copyWith(
        quarterMin: quarterMin
    );
  }

  void save() {
    prefs!.setInt(quarterMinPrefsKey, state.quarterMin);
  }

}