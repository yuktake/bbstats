import 'package:bb_stats/src/collections/gameSummary/game_summary_model.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:bb_stats/src/repositories/team_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../collections/game/game.dart';
import '../repositories/pbp_repository.dart';

class GameSummaryStateNotifier extends StateNotifier<GameSummaryModel> {
  GameSummaryStateNotifier(
    this.gameId,
    this.gameRepository,
    this.teamRepository,
    this.pbpRepository,
  ) : super (
      GameSummaryModel(
        game: gameRepository.findGame(gameId)!,
        myTeam: teamRepository.findTeam(1),
        scores: pbpRepository.getScoresForChart(gameId),
        opponentScores: pbpRepository.getOpponentScoresForChart(gameId),
        scoreByQuarter: pbpRepository.getScoresByQuarter(gameId),
        opponentScoreByQuarter: pbpRepository.getOpponentScoresByQuarter(gameId),
        comparisonStats: gameRepository.getStatsForComparison(gameId),
        pickupStats: pbpRepository.getPickupStats(gameId),
        opponentPickupStats: pbpRepository.getOpponentPickupStats(gameId),
      )
  ) {
    update();
  }

  final GameRepository gameRepository;
  final TeamRepository teamRepository;
  final PbpRepository pbpRepository;
  final int gameId;

  List<int> getScores() {
    return pbpRepository.getScoresForChart(gameId);
  }

  List<int> getOpponentScores() {
    return pbpRepository.getOpponentScoresForChart(gameId);
  }

  List<List<dynamic>> getComparisonStats() {
    return gameRepository.getStatsForComparison(gameId);
  }

  List<int> getScoreByQuarter() {
    return pbpRepository.getScoresByQuarter(gameId);
  }

  List<int> getOpponentScoreByQuarter() {
    return pbpRepository.getOpponentScoresByQuarter(gameId);
  }

  List<int> getPickUpStats() {
    return pbpRepository.getPickupStats(gameId);
  }

  List<int> getOpponentPickUpStats() {
    return pbpRepository.getOpponentPickupStats(gameId);
  }

  void update() {
    state = state.copyWith(
      game: gameRepository.findGame(gameId)!,
      scores: pbpRepository.getScoresForChart(gameId),
      opponentScores: pbpRepository.getOpponentScoresForChart(gameId),
      scoreByQuarter: pbpRepository.getScoresByQuarter(gameId),
      opponentScoreByQuarter: pbpRepository.getOpponentScoresByQuarter(gameId),
    );
  }
}