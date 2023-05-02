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
      start: null,
      end: null,
      team: teamRepository.findTeam(1)!,
      sortTargetIndex: 0,
      ascending: false,
    )
  );

  final GameRepository gameRepository;
  final BoxscoreRepository boxScoreRepository;
  final TeamRepository teamRepository;

  List<dynamic> getTeamStat() {
    return gameRepository.getAvgTeamStat();
  }

  List<List<dynamic>> getPlayerStats(DateTime? start, DateTime? end, int index, bool ascending) {
    return boxScoreRepository.getAvgBoxScores(state.start, state.end, index, ascending);
  }

  int countWinGame() {
    return gameRepository.countWinGame();
  }

  int countLostGame() {
    return gameRepository.countLostGame();
  }

  void updateSortTargetIndex(int index, bool ascending) {
    state = state.copyWith(
      sortTargetIndex: index,
      ascending: !state.ascending,
    );
  }

  void updateStartDate(DateTime start) {

    state = state.copyWith(
      start: start,
    );
  }

  void updateEndDate(DateTime end) {
    state = state.copyWith(
      end: end,
    );
  }
}