import 'package:bb_stats/src/collections/settingDetails/setting_details_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingDetailsStateNotifier extends StateNotifier<SettingDetailsModel> {
  SettingDetailsStateNotifier() : super (
    const SettingDetailsModel(
      quarterMin: 10,
      overtimeQuarterMin: 5,
    )
  ){
    initialize();
  }

  static const quarterMinPrefsKey = 'quarterMin';
  static const overtimeQuarterMinPrefsKey = 'overtimeQuarterMin';

  SharedPreferences? prefs;

  Future initialize() async {
    prefs = await SharedPreferences.getInstance();
    final quarterMin = await _quarterMinStatus;
    final overtimeQuarterMin = await _overtimeQuarterMinStatus;
    state = state.copyWith(
      quarterMin: quarterMin,
      overtimeQuarterMin: overtimeQuarterMin,
    );
  }

  Future<int> get _quarterMinStatus async {
    return prefs!.getInt(quarterMinPrefsKey) ?? 10;
  }

  void updateQuarterMinState(int quarterMin) {
    state = state.copyWith(
        quarterMin: quarterMin
    );
  }

  Future<int> get _overtimeQuarterMinStatus async {
    return prefs!.getInt(overtimeQuarterMinPrefsKey) ?? 5;
  }

  void updateOvertimeQuarterMinState(int overtimeQuarterMin) {
    state = state.copyWith(
        overtimeQuarterMin: overtimeQuarterMin
    );
  }

  bool save() {
    prefs!.setInt(quarterMinPrefsKey, state.quarterMin);
    prefs!.setInt(overtimeQuarterMinPrefsKey, state.overtimeQuarterMin);

    return true;
  }

}