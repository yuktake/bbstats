import 'package:bb_stats/src/collections/gamePbp/game_pbp_model.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:bb_stats/src/repositories/pbp_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../consts/CsvColumns.dart';
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
  ));

    final int gameId;
    final PlayerRepository playerRepository;
    final GameRepository gameRepository;
    final BoxscoreRepository boxScoreRepository;
    final PbpRepository pbpRepository;

    void editGame() {
      gameRepository.editGame(gameId);
    }

    void updateQuarter(int quarter) {
      state = state.copyWith(
        quarter: quarter,
        pbps: pbpRepository.getPbpByQuarter(gameId, quarter)
      );
    }

    String getPbpString(int gameId) {
      List<String> pbps = [
        CsvColumns.pbpColumnList.join(','),
      ];

      for (var pbp in state.pbps) {
        List<String> tmpList = [
          pbp.player.value == null ? 'opponent team' : pbp.player.value!.team.value!.name,
          pbp.player.value == null ? '' : pbp.player.value!.name,
          pbp.quarter.toString(),
          DateFormat('H:mm').format(pbp.playAt),
          pbp.description
        ];
        pbps.add(tmpList.join(","));
      }

      return pbps.join("\n");
    }

  }