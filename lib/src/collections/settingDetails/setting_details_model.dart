import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_details_model.freezed.dart';

@freezed
class SettingDetailsModel with _$SettingDetailsModel {
  const factory SettingDetailsModel({
    required int quarterMin,
    required int overtimeQuarterMin,
  }) = _SettingDetailsModel;
}