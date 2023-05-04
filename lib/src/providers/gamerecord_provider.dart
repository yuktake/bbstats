import 'package:bb_stats/src/collections/gameRecord/game_record_model.dart';
import 'package:bb_stats/src/enums/FgResult.dart';
import 'package:bb_stats/src/enums/FtResult.dart';
import 'package:bb_stats/src/enums/GameAction.dart';
import 'package:bb_stats/src/enums/RecordType.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:bb_stats/src/repositories/pbp_repository.dart';
import 'package:bb_stats/src/repositories/teamStatRepository.php.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../collections/boxscore/boxscore.dart';
import '../collections/game/game.dart';
import '../collections/pbp/pbp.dart';
import '../collections/player/player.dart';
import '../repositories/player_repository.dart';

class GameRecordStateNotifier extends StateNotifier<GameRecordModel> {
  GameRecordStateNotifier(
      this.gameId,
      this.playerRepository,
      this.gameRepository,
      this.teamStatRepository,
      this.boxScoreRepository,
      this.pbpRepository
  ) : super (GameRecordModel(
      player1: null,
      player2: null,
      player3: null,
      player4: null,
      player5: null,
      game: gameRepository.findGame(gameId)!,
      quarterMin: gameRepository.getQuarterMin(gameId),
      time: pbpRepository.getLatestPlayAt(gameId),
      currentQuarter: pbpRepository.getCurrentQuarter(gameId),
      records: pbpRepository.getPbpByCurrentQuarter(gameId),
      substitutes: boxScoreRepository.getSubstitutes(gameId),
      controller: ScrollController()
  )){
    Game? game = gameRepository.findGame(gameId);
    if (game == null) {
      return;
    }
    List<Boxscore> boxScores = boxScoreRepository.findOnCourtBoxScores(game.id);
    if (boxScores.length != 5) {
      return;
    }
    state = state.copyWith(
      player1: boxScores.elementAt(0).player.value,
      player2: boxScores.elementAt(1).player.value,
      player3: boxScores.elementAt(2).player.value,
      player4: boxScores.elementAt(3).player.value,
      player5: boxScores.elementAt(4).player.value,
    );
  }

  final int gameId;
  final PlayerRepository playerRepository;
  final GameRepository gameRepository;
  final TeamStatRepository teamStatRepository;
  final BoxscoreRepository boxScoreRepository;
  final PbpRepository pbpRepository;

  void scrollUp() {
    state.controller.animateTo(
      state.controller.position.minScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void scrollDown() {
    state.controller.animateTo(
      state.controller.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.fastOutSlowIn,
    );
  }

  void updateTime(DateTime time) {
    state = state.copyWith(
      time: time
    );
  }

  void updateQuarter(int quarter) {
    List<Pbp> pbps = pbpRepository.getPbpByQuarter(gameId, quarter);
    state = state.copyWith(
        records: pbps,
        currentQuarter: quarter
    );
    state.controller.animateTo(
      state.controller.position.minScrollExtent,
      duration: const Duration(microseconds: 100),
      curve: Curves.linear,
    );
  }

  void updateBoxScore(Player? player, RecordType recordType) {
    switch(recordType) {
      case RecordType.FT_MADE:
        if (player == null) {
          gameRepository.opponentMadeShot(gameId, RecordType.FT_MADE);
        } else {
          Boxscore boxScore = boxScoreRepository.findOneByGameAndPlayer(gameId, player.id)!;
          gameRepository.madeShot(gameId, RecordType.FT_MADE, boxScore.starter);
          boxScoreRepository.makeFreeThrow(gameId, player.id, FtResult.FT_MADE);
        }
        break;
      case RecordType.FT_MISS:
        if (player == null) {
          gameRepository.opponentMissShot(gameId, RecordType.FT_MISS);
        } else {
          gameRepository.missShot(gameId, RecordType.FT_MISS);
          boxScoreRepository.makeFreeThrow(gameId, player.id, FtResult.FT_MISS);
        }
        break;
      case RecordType.OFFENCE_REBOUND:
        if (player != null) {
          gameRepository.addOffenceRebound(gameId, true);
          boxScoreRepository.makeRebound(gameId, player.id, RecordType.OFFENCE_REBOUND);
        } else {
          gameRepository.addOffenceRebound(gameId, false);
        }
        break;
      case RecordType.DEFENCE_REBOUND:
        if (player != null) {
          gameRepository.addDefenceRebound(gameId, true);
          boxScoreRepository.makeRebound(gameId, player.id, RecordType.DEFENCE_REBOUND);
        } else {
          gameRepository.addDefenceRebound(gameId, false);
        }
        break;
      case RecordType.BLOCK:
        if (player != null) {
          gameRepository.addBlock(gameId, true);
          boxScoreRepository.makeBlock(gameId, player.id);
        } else {
          gameRepository.addBlock(gameId, false);
        }
        break;
      case RecordType.STEAL:
        if (player != null) {
          gameRepository.addSteal(gameId, true);
          boxScoreRepository.makeSteal(gameId, player.id);
        } else {
          gameRepository.addSteal(gameId, false);
        }
        break;
      case RecordType.TURNOVER:
        if (player != null) {
          gameRepository.addTurnover(gameId, true);
          boxScoreRepository.makeTurnover(gameId, player.id);
        } else {
          gameRepository.addTurnover(gameId, false);
        }
        break;
      case RecordType.ASSIST:
        if (player != null) {
          gameRepository.addAssist(gameId, true);
          boxScoreRepository.makeAssist(gameId, player.id);
        } else {
          gameRepository.addAssist(gameId, false);
        }
        break;
      case RecordType.FOUL:
        if (player != null) {
          gameRepository.addFoul(gameId, true);
          boxScoreRepository.makeFoul(gameId, player.id);
        } else {
          gameRepository.addFoul(gameId, false);
        }
        break;
      default:
        break;
    }
  }

  void addGameAction(GameAction gameAction, bool myTeamPlay) {
    Game? game = gameRepository.findGame(gameId);
    pbpRepository.addGameAction(
        game: game!,
        currentQuarter: state.currentQuarter,
        playAt: state.time,
        gameAction: gameAction,
        myTeamPlay: myTeamPlay
    );
    if (gameAction == GameAction.SHOT_CLOCK_TURNOVER) {
      if (myTeamPlay) {
        gameRepository.addTurnover(gameId, true);
      } else {
        gameRepository.addTurnover(gameId, false);
      }
    }
    List<Pbp> pbps = pbpRepository.getPbpByQuarter(gameId, state.currentQuarter);
    state = state.copyWith(
      records: pbps,
    );
  }

  void substitute(int quarter, Player substitutePlayer, int onCourtPlayerIndex) {
    Game? game = gameRepository.findGame(gameId);
    switch(onCourtPlayerIndex) {
      case 0:
        pbpRepository.addSubstitutePbp(
            game!,
            state.time,
            quarter,
            substitutePlayer,
            state.player1!,
            true
        );
        boxScoreRepository.substitute(gameId, substitutePlayer, state.player1!);
        state = state.copyWith(
          player1: substitutePlayer
        );
        break;
      case 1:
        pbpRepository.addSubstitutePbp(
            game!,
            state.time,
            quarter,
            substitutePlayer,
            state.player2!,
            true
        );
        boxScoreRepository.substitute(gameId, substitutePlayer, state.player2!);
        state = state.copyWith(
            player2: substitutePlayer
        );
        break;
      case 2:
        pbpRepository.addSubstitutePbp(
            game!,
            state.time,
            quarter,
            substitutePlayer,
            state.player3!,
            true
        );
        boxScoreRepository.substitute(gameId, substitutePlayer, state.player3!);
        state = state.copyWith(
            player3: substitutePlayer
        );
        break;
      case 3:
        pbpRepository.addSubstitutePbp(
            game!,
            state.time,
            quarter,
            substitutePlayer,
            state.player4!,
            true
        );
        boxScoreRepository.substitute(gameId, substitutePlayer, state.player4!);
        state = state.copyWith(
            player4: substitutePlayer
        );
        break;
      case 4:
        pbpRepository.addSubstitutePbp(
            game!,
            state.time,
            quarter,
            substitutePlayer,
            state.player5!,
            true
        );
        boxScoreRepository.substitute(gameId, substitutePlayer, state.player5!);
        state = state.copyWith(
            player5: substitutePlayer
        );
        break;
      default:
        break;
    }
    List<Pbp> pbps = pbpRepository.getPbpByQuarter(gameId, state.currentQuarter);
    List<Boxscore> substitues = boxScoreRepository.getSubstitutes(gameId);
    state = state.copyWith(
      records: pbps,
      substitutes: substitues
    );
  }

  void addPlayAction(
      int playerId,
      RecordType recordType,
      int quarter,
      ShotPosition? shotPosition,
      int? supportedPlayerId,
      bool myTeamPlay,
    ) {
    Player? player = playerRepository.getPlayer(playerId);
    Game? game = gameRepository.findGame(gameId);
    pbpRepository.addPlayerAction(
        game: game!,
        player: player,
        playAt: state.time,
        recordTypeArg: recordType,
        quarter: quarter,
        shotPosition: shotPosition,
        supportPlayerId: supportedPlayerId,
        myTeamPlay: myTeamPlay,
    );
    List<Pbp> pbps = pbpRepository.getPbpByQuarter(gameId, state.currentQuarter);
    state = state.copyWith(
        records: pbps,
        game: gameRepository.findGame(gameId)!,
    );
  }

  void deletePbp(Pbp pbp) {
    switch(pbp.type) {
      case RecordType.TWO_POINT_MADE:
        if (pbp.player.value == null) {
          gameRepository.modifyOpponentShot(gameId, RecordType.TWO_POINT_MADE);
        } else {
          Boxscore boxScore = boxScoreRepository.findOneByGameAndPlayer(gameId, pbp.player.value!.id)!;
          gameRepository.modifyShot(gameId, pbp.supportedPlayerId, RecordType.TWO_POINT_MADE, boxScore.starter);
          teamStatRepository.modifyShot(gameId, FgResult.TWO_POINT_MADE, pbp.shotPosition!.playType, pbp.shotPosition!.shotZone);
          boxScoreRepository.modifyShot(gameId, pbp.player.value!.id, FgResult.TWO_POINT_MADE, pbp.supportedPlayerId);
        }
        break;
      case RecordType.TWO_POINT_MISS:
        if (pbp.player.value == null) {
          gameRepository.modifyOpponentShot(gameId, RecordType.TWO_POINT_MISS);
        } else {
          Boxscore boxScore = boxScoreRepository.findOneByGameAndPlayer(gameId, pbp.player.value!.id)!;
          gameRepository.modifyShot(gameId, pbp.supportedPlayerId, RecordType.TWO_POINT_MISS, boxScore.starter);
          teamStatRepository.modifyShot(gameId, FgResult.TWO_POINT_MISS, pbp.shotPosition!.playType, pbp.shotPosition!.shotZone);
          boxScoreRepository.modifyShot(gameId, pbp.player.value!.id, FgResult.TWO_POINT_MISS, pbp.supportedPlayerId);
        }
        break;
      case RecordType.THREE_POINT_MADE:
        if (pbp.player.value == null) {
          gameRepository.modifyOpponentShot(gameId, RecordType.THREE_POINT_MADE);
        } else {
          Boxscore boxScore = boxScoreRepository.findOneByGameAndPlayer(gameId, pbp.player.value!.id)!;
          gameRepository.modifyShot(gameId, pbp.supportedPlayerId, RecordType.THREE_POINT_MADE, boxScore.starter);
          teamStatRepository.modifyShot(gameId, FgResult.THREE_POINT_MADE, pbp.shotPosition!.playType, pbp.shotPosition!.shotZone);
          boxScoreRepository.modifyShot(gameId, pbp.player.value!.id, FgResult.THREE_POINT_MADE, pbp.supportedPlayerId);
        }
        break;
      case RecordType.THREE_POINT_MISS:
        if (pbp.player.value == null) {
          gameRepository.modifyOpponentShot(gameId, RecordType.THREE_POINT_MISS);
        } else {
          Boxscore boxScore = boxScoreRepository.findOneByGameAndPlayer(gameId, pbp.player.value!.id)!;
          gameRepository.modifyShot(gameId, pbp.supportedPlayerId, RecordType.THREE_POINT_MISS, boxScore.starter);
          teamStatRepository.modifyShot(gameId, FgResult.THREE_POINT_MISS, pbp.shotPosition!.playType, pbp.shotPosition!.shotZone);
          boxScoreRepository.modifyShot(gameId, pbp.player.value!.id, FgResult.THREE_POINT_MISS, pbp.supportedPlayerId);
        }
        break;
      case RecordType.FT_MADE:
        if (pbp.player.value == null) {
          gameRepository.modifyOpponentShot(gameId, RecordType.FT_MADE);
        } else {
          Boxscore boxScore = boxScoreRepository.findOneByGameAndPlayer(gameId, pbp.player.value!.id)!;
          gameRepository.modifyShot(gameId, pbp.supportedPlayerId, RecordType.FT_MADE, boxScore.starter);
          boxScoreRepository.modifyFreeThrow(gameId, pbp.player.value!.id, FtResult.FT_MADE);
        }
        break;
      case RecordType.FT_MISS:
        if (pbp.player.value == null) {
          gameRepository.modifyOpponentShot(gameId, RecordType.FT_MISS);
        } else {
          Boxscore boxScore = boxScoreRepository.findOneByGameAndPlayer(gameId, pbp.player.value!.id)!;
          gameRepository.modifyShot(gameId, pbp.supportedPlayerId, RecordType.FT_MISS, boxScore.starter);
          boxScoreRepository.modifyFreeThrow(gameId, pbp.player.value!.id, FtResult.FT_MISS);
        }
        break;
      case RecordType.OFFENCE_REBOUND:
        if (pbp.player.value != null) {
          boxScoreRepository.modifyRebound(gameId, pbp.player.value!.id, RecordType.OFFENCE_REBOUND);
        }
        gameRepository.modifyOffenceRebound(gameId, pbp.myTeamPlay);
        break;
      case RecordType.DEFENCE_REBOUND:
        if (pbp.player.value != null) {
          boxScoreRepository.modifyRebound(gameId, pbp.player.value!.id, RecordType.DEFENCE_REBOUND);
        }
        gameRepository.modifyDefenceRebound(gameId, pbp.myTeamPlay);
        break;
      case RecordType.BLOCK:
        if (pbp.player.value != null) {
          boxScoreRepository.modifyBlock(gameId, pbp.player.value!.id);
        }
        gameRepository.modifyBlock(gameId, pbp.myTeamPlay);
        break;
      case RecordType.STEAL:
        if (pbp.player.value != null) {
          boxScoreRepository.modifySteal(gameId, pbp.player.value!.id);
        }
        gameRepository.modifySteal(gameId, pbp.myTeamPlay);
        break;
      case RecordType.TURNOVER:
        if (pbp.player.value != null) {
          boxScoreRepository.modifyTurnover(gameId, pbp.player.value!.id);
        }
        gameRepository.modifyTurnover(gameId, pbp.myTeamPlay);
        break;
      case RecordType.ASSIST:
        if (pbp.player.value != null) {
          boxScoreRepository.modifyAssist(gameId, pbp.player.value!.id);
        }
        gameRepository.modifyAssist(gameId, pbp.myTeamPlay);
        break;
      case RecordType.FOUL:
        if (pbp.player.value != null) {
          boxScoreRepository.modifyFoul(gameId, pbp.player.value!.id);
        }
        gameRepository.modifyFoul(gameId, pbp.myTeamPlay);
        break;
      case RecordType.SUBSTITUTE:
      //  交代を修正する場合はonCourtと修正時の得点の遡りが複雑なため、何もしない
      //  記入者側で適宜対応してね
        break;
      case RecordType.TIMEOUT:
        break;
      case RecordType.SHOT_CLOCK_TURNOVER:
        gameRepository.modifyTurnover(gameId, pbp.myTeamPlay);
        break;
      default:
        break;
    }
    pbpRepository.deletePbp(pbp.id);
    List<Pbp> pbps = pbpRepository.getPbpByQuarter(gameId, state.currentQuarter);
    state = state.copyWith(
      records: pbps,
      game: gameRepository.findGame(gameId)!,
    );
  }

  void updateQuarterMinState(int quarterMin) {
    state = state.copyWith(
        quarterMin: quarterMin
    );
  }

  void saveQuarterMin(int gameId) {
    gameRepository.updateQuarterMin(gameId, state.quarterMin);
    Game game = gameRepository.findGame(gameId)!;
    state = state.copyWith(
      game: game
    );
  }

  bool beDeletedPbpExists(int gameId, int quarterMin) {
    List<Pbp> beDeletedPbps = pbpRepository.getPbpsBetweenDateTime(gameId, state.quarterMin);

    return beDeletedPbps.isNotEmpty;
  }

  void deleteOutOfQuarterPbps(int gameId, int quarterMin) {
    List<Pbp> beDeletedPbps = pbpRepository.getPbpsBetweenDateTime(gameId, state.quarterMin);
    for (var pbp in beDeletedPbps) {
      deletePbp(pbp);
    }
  }

  void gameSet() {
    gameRepository.gameSet();
  }
}