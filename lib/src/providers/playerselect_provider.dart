import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../collections/playerSelect/player_select_model.dart';
import '../repositories/player_repository.dart';

class PlayerSelectStateNotifier extends StateNotifier<PlayerSelectModel> {
  PlayerSelectStateNotifier(
      this.playerRepository
  ) : super (PlayerSelectModel(
    players: playerRepository.getAllPlayers(true),
  ));
  final PlayerRepository playerRepository;

}