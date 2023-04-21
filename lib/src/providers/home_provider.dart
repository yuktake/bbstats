import 'package:bb_stats/src/collections/home/home_model.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../repositories/team_repository.dart';

class HomeStateNotifier extends StateNotifier<HomeModel> {
  HomeStateNotifier(
      this.gameRepository,
      this.boxScoreRepository,
      this.teamRepository
  ) : super (
    HomeModel(
      teamStat: gameRepository.getAvgTeamStat(),
      start: null,
      end: null,
      playerStats: boxScoreRepository.getAvgBoxScores(null, null, 0, true),
      team: teamRepository.findTeam(1)!,
      win: gameRepository.countWinGame(),
      lost: gameRepository.countLostGame(),
      sortTargetIndex: 0,
      ascending: false,
    )
  );

  final GameRepository gameRepository;
  final BoxscoreRepository boxScoreRepository;
  final TeamRepository teamRepository;

  void updateSortTargetIndex(int index, bool ascending) {
    List<List<dynamic>> playerStats = boxScoreRepository.getAvgBoxScores(state.start, state.end, index, ascending);

    state = state.copyWith(
      playerStats: playerStats,
      sortTargetIndex: index,
      ascending: !state.ascending,
    );
  }

  void updateStartDate(DateTime start) {
    List<List<dynamic>> playerStats = boxScoreRepository.getAvgBoxScores(start, state.end, state.sortTargetIndex, state.ascending);

    state = state.copyWith(
      start: start,
      playerStats: playerStats,
    );
  }

  void updateEndDate(DateTime end) {
    List<List<dynamic>> playerStats = boxScoreRepository.getAvgBoxScores(state.start, end, state.sortTargetIndex, state.ascending);

    state = state.copyWith(
      end: end,
      playerStats: playerStats,
    );
  }
}