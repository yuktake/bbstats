import 'package:bb_stats/src/repositories/teamStatRepository.php.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../collections/player/player.dart';
import '../collections/playerList/player_list_model.dart';
import '../repositories/player_repository.dart';

class PlayerListStateNotifier extends StateNotifier<PlayerListModel> {
  PlayerListStateNotifier(
      this.playerRepository,
  ) : super (
      PlayerListModel(
        players: playerRepository.getAllPlayers(true),
        visible: true
      )
  );

  final PlayerRepository playerRepository;

  void resetPlayerListState() {
    List<Player> players = playerRepository.getAllPlayers(true);
    state = state.copyWith(
      players: players,
    );
  }

  void updateVisible(bool visible) {
    List<Player> players = playerRepository.getAllPlayers(visible);
    state = state.copyWith(
      players: players,
      visible: visible
    );
  }
}