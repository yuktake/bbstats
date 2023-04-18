import 'package:bb_stats/src/consts/CsvColumns.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../collections/boxscoreList/boxscore_list_model.dart';

class  BoxScoreListStateNotifier extends StateNotifier<BoxScoreListModel> {
  BoxScoreListStateNotifier(
    this.gameId,
    this.boxScoreRepository
  ) : super (
    BoxScoreListModel(
      boxScores : boxScoreRepository.findByGame(gameId)
    )
  );

  final int gameId;
  final BoxscoreRepository boxScoreRepository;

  void updateBoxScoreListModel(DateTime dateTime) {

  }

  String getBoxScoresString(int gameId) {
    List<String> boxScores = [
      CsvColumns.boxScoreColumnList.join(','),
    ];

    for (var boxScore in state.boxScores) {
      List<String> tmpList = [
        boxScore.player.value!.name,
        boxScore.pts.toString(),
        boxScore.fgm.toString(),
        boxScore.fga.toString(),
        boxScore.fgRatio.toString(),
        boxScore.tpm.toString(),
        boxScore.tpa.toString(),
        boxScore.tpRatio.toString(),
        boxScore.ftm.toString(),
        boxScore.fta.toString(),
        boxScore.ftRatio.toString(),
        boxScore.oReb.toString(),
        boxScore.dReb.toString(),
        boxScore.reb.toString(),
        boxScore.ast.toString(),
        boxScore.stl.toString(),
        boxScore.blk.toString(),
        boxScore.to.toString(),
        boxScore.pf.toString(),
      ];
      boxScores.add(tmpList.join(','));
    }

    return boxScores.join("\n");
  }
}