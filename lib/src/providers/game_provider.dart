import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/game/game_model.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:bb_stats/src/repositories/pbp_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

class GameStateNotifier extends StateNotifier<GameModel> {
  GameStateNotifier(
    this.isar,
    this.gameRepository,
    this.boxScoreRepository,
    this.pbpRepository,
    this.id
  ) : super(
      GameModel(
          game: gameRepository.findGame(id),
          page: 0
      )
  );

  final Isar isar;

  final GameRepository gameRepository;

  final BoxscoreRepository boxScoreRepository;

  final PbpRepository pbpRepository;

  final int id;

  void updateGameModel(int page) async {
    state = state.copyWith(
      page: page,
    );
  }

  bool deleteGame(int gameId) {
    isar.writeTxnSync(() {
      boxScoreRepository.deleteByGame(gameId);
      pbpRepository.deleteByGame(gameId);
      gameRepository.deleteGame(gameId);
    });

    return true;
  }
}