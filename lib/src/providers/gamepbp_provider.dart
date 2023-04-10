import 'package:bb_stats/src/collections/gamePbp/game_pbp_model.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:bb_stats/src/repositories/pbp_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../repositories/player_repository.dart';

class GamePbpStateNotifier extends StateNotifier<GamePbpModel> {
  GamePbpStateNotifier(
    this.gameId,
    this.playerRepository,
    this.gameRepository,
    this.boxScoreRepository,
    this.pbpRepository
  )
  : super (GamePbpModel(
    game: gameRepository.findGame(gameId)!,
    pbps: pbpRepository.getPbpByQuarter(gameId, 5),
    // ALL
    quarter: 5
  )){

    }

    final int gameId;
    final PlayerRepository playerRepository;
    final GameRepository gameRepository;
    final BoxscoreRepository boxScoreRepository;
    final PbpRepository pbpRepository;

  void updateQuarter(int quarter) {
    state = state.copyWith(
      quarter: quarter,
      pbps: pbpRepository.getPbpByQuarter(gameId, quarter)
    );
  }

  }