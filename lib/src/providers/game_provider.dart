import 'package:bb_stats/src/collections/game/game_model.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class GameStateNotifier extends StateNotifier<GameModel> {
  GameStateNotifier(this.gameRepository, this.id) : super(
      GameModel(
          game: gameRepository.findGame(id),
          page: 0
      )
  );

  final GameRepository gameRepository;

  final int id;



  void updateGameModel(int page) async {
    state = state.copyWith(
      page: page,
    );
  }
}