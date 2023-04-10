import 'package:bb_stats/src/collections/gameList/game_list_model.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../collections/game/game.dart';

class GameListStateNotifier extends StateNotifier<GameListModel> {
  GameListStateNotifier(this.gameRepository)
      : super (GameListModel(
    games : gameRepository.findGamesByDate(DateTime.now()),
    dateTime: DateTime.now()
  ));

  final GameRepository gameRepository;

  void updateGameListModel(DateTime dateTime) {
    List<Game> games = gameRepository.findGamesByDate(dateTime);
    state = state.copyWith(
      games: games,
      dateTime: dateTime,
    );
  }
}