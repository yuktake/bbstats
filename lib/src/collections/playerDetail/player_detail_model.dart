import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_detail_model.freezed.dart';

@freezed
class PlayerDetailModel with _$PlayerDetailModel {
  const factory PlayerDetailModel({
    required DateTime? start,
    required DateTime? end,
    required List<dynamic> seasonStats,
    required List<List<dynamic>> shotTypeStats,
    required List<List<dynamic>> playTypeStats,
    required List<List<dynamic>> assistPlayerStats,
  }) = _PlayerDetailModel;
}