import 'package:bb_stats/src/collections/boxscore/boxscore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'boxscore_list_model.freezed.dart';

@freezed
class BoxScoreListModel with _$BoxScoreListModel {
  const factory BoxScoreListModel({
    required List<Boxscore> boxScores,
    required int sortTargetIndex,
    required bool ascending,
  }) = _BoxScoreListModel;
}