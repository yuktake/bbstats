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
  ){

  }

  final int gameId;
  final BoxscoreRepository boxScoreRepository;

  void updateBoxScoreListModel(DateTime dateTime) {

  }
}