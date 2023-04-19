import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_detail_model.freezed.dart';

@freezed
class PlayerDetailModel with _$PlayerDetailModel {
  const factory PlayerDetailModel({
    required DateTime? start,
    required DateTime? end,
    required List<dynamic> seasonStats,
    required List<List<dynamic>> shotTypeStats,
    required int shotTypeSortTargetIndex,
    required bool shotTypeAscending,
    required List<List<dynamic>> playTypeStats,
    required int playTypeSortTargetIndex,
    required bool playTypeAscending,
    required List<List<dynamic>> assistPlayerStats,
    required int assistSortTargetIndex,
    required bool assistAscending,
  }) = _PlayerDetailModel;
}