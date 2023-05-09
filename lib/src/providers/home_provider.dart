import 'package:bb_stats/src/collections/home/home_model.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../consts/CsvColumns.dart';
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

  String getBoxScoresString() {
    List<String> boxScores = [
      CsvColumns.boxScoreColumnList.join(','),
    ];

    for (var item in getPlayerStats(state.start, state.end, state.sortTargetIndex, state.ascending)) {
      List<String> tmpList = [
        item[1].toString(),
        item[2].toString(),
        item[3].toString(),
        item[4].toString(),
        item[5].toString(),
        item[6].toString(),
        item[7].toString(),
        item[8].toString(),
        item[9].toString(),
        item[10].toString(),
        item[11].toString(),
        item[12].toString(),
        item[13].toString(),
        item[14].toString(),
        item[15].toString(),
        item[16].toString(),
        item[17].toString(),
        item[18].toString(),
        item[19].toString(),
      ];
      boxScores.add(tmpList.join(','));
    }

    return boxScores.join("\n");
  }
}