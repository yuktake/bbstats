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
    ) : super (HomeModel(
      teamStat: gameRepository.getAvgTeamStat(),
      playerStats: boxScoreRepository.getAvgBoxScores(0, true),
      team: teamRepository.findTeam(1)!,
      win: gameRepository.countWinGame(),
      lost: gameRepository.countLostGame(),
      sortTargetIndex: 0,
      ascending: false,
    ));
  final GameRepository gameRepository;
  final BoxscoreRepository boxScoreRepository;
  final TeamRepository teamRepository;

  void updateSortTargetIndex(int index, bool ascending) {
    List<List<dynamic>> playerStats = boxScoreRepository.getAvgBoxScores(index, ascending);

    state = state.copyWith(
      playerStats: playerStats,
      sortTargetIndex: index,
      ascending: !state.ascending,
    );
  }
}