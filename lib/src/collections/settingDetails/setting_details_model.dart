import 'package:freezed_annotation/freezed_annotation.dart';

part 'setting_details_model.freezed.dart';

@freezed
class SettingDetailsModel with _$SettingDetailsModel {
  const factory SettingDetailsModel({
    required int quarterMin,

  }) = _SettingDetailsModel;
}