import 'package:freezed_annotation/freezed_annotation.dart';

import '../game/game.dart';
import '../team/team.dart';

part 'game_summary_model.freezed.dart';

@freezed
class GameSummaryModel with _$GameSummaryModel {
  const factory GameSummaryModel({
    required Game game,
    required Team? myTeam,
    required List<int> scores,
    required List<int> opponentScores,
    required List<int> scoreByQuarter,
    required List<int> opponentScoreByQuarter,
    required List<List<dynamic>> comparisonStats,
    required List<int> pickupStats,
    required List<int> opponentPickupStats,
  }) = _GameSummaryModel;
}