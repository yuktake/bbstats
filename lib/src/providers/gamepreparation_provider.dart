import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/player_repository.dart';
import 'package:bb_stats/src/repositories/teamStatRepository.php.dart';
import 'package:bb_stats/src/repositories/team_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../collections/boxscore/boxscore.dart';
import '../collections/game/game.dart';
import '../collections/gamePreparation/game_preparation_model.dart';
import '../collections/player/player.dart';
import '../collections/team/team.dart';
import '../repositories/game_repository.dart';

class GamePreparationStateNotifier extends StateNotifier<GamePreparationModel> {
  GamePreparationStateNotifier(
      this.teamRepository,
      this.teamStatRepository,
      this.playerRepository,
      this.gameRepository,
      this.boxScoreRepository
    ): super (
      GamePreparationModel(
        gameDate: DateTime.now(),
        quarterMin: 10,
        myTeam: teamRepository.findTeam(1)!,
        opponentTeam: null,
        pg: null,
        sg: null,
        sf: null,
        pf: null,
        c: null,
        histories: gameRepository.getGamesByOpponent(null),
        startable: false,
      )
  ){
    // onGame=trueのGameのstarter5人を代入後、全てnull出なければstartable=trueにする
    Game? game = gameRepository.findOnGame();
    Team? opponent = game?.opponent.value;
    if (game == null || opponent == null) {
      initialize();
      return;
    }
    List<Boxscore> boxScores = boxScoreRepository.findStarterBoxScores(game.id);
    if (boxScores.length != 5) {
      return;
    }
    state = state.copyWith(
      gameDate: game.gameDate,
      opponentTeam: opponent,
      quarterMin: game.quarterMin,
      pg: boxScores.elementAt(0).player.value,
      sg: boxScores.elementAt(1).player.value,
      sf: boxScores.elementAt(2).player.value,
      pf: boxScores.elementAt(3).player.value,
      c: boxScores.elementAt(4).player.value,
      histories: gameRepository.getGamesByOpponent(opponent),
      startable: true,
    );
  }

  final TeamRepository teamRepository;
  final TeamStatRepository teamStatRepository;
  final PlayerRepository playerRepository;
  final GameRepository gameRepository;
  final BoxscoreRepository boxScoreRepository;

  static const quarterMinPrefsKey = 'quarterMin';

  SharedPreferences? prefs;

  Future initialize() async {
    final quarterMin = await _quarterMinStatus;
    state = state.copyWith(
        quarterMin: quarterMin
    );
  }

  Future<int> get _quarterMinStatus async {
    prefs = await SharedPreferences.getInstance();
    return prefs!.getInt(quarterMinPrefsKey) ?? 10;
  }

  void updateQuarterMinState(int quarterMin) {
    state = state.copyWith(
        quarterMin: quarterMin
    );
  }

  void initState() {
    state = state.copyWith(
      opponentTeam: null,
      pg: null,
      sg: null,
      sf: null,
      pf: null,
      c: null,
      startable: false,
      gameDate: DateTime.now(),
    );
  }

  void selectOpponent(Team team) {
    state = state.copyWith(
      opponentTeam: team,
    );
    checkStartable();
  }

  void updateGameDate(DateTime gameDate) {
    state = state.copyWith(
      gameDate: gameDate,
    );
  }

  void checkStartable() {
    bool startable;
    if (state.pg != null && state.sg != null && state.sf != null && state.pf != null && state.c != null && state.opponentTeam != null) {
      List<int> ids = [state.pg!.id,state.sg!.id,state.sf!.id,state.pf!.id,state.c!.id];
      if (ids.length != ids.toSet().toList().length) {
        startable = false;
      } else {
        startable = true;
      }
    } else {
      startable = false;
    }
    state = state.copyWith(
      startable: startable
    );
  }

  Game? getOnGame() {
    final game = gameRepository.findOnGame();

    return game;
  }

  Future<int?> startGame() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final gameId = await gameRepository.createGame(state.opponentTeam!, state.gameDate, state.quarterMin);

    Game? game = gameRepository.findGame(gameId);
    if (game == null) {
      return null;
    }

    List<Boxscore> boxScores = [];

    List<Player> players = playerRepository.getAllPlayers(true);
    for (final player in players) {
      Boxscore? boxScore;
      if ((player.id == state.pg?.id) || (player.id == state.sg?.id) || (player.id == state.sf?.id) || (player.id == state.pf?.id) || (player.id == state.c?.id)) {
        boxScore = await boxScoreRepository.createBoxscore(player, game, true);
      } else {
        boxScore = await boxScoreRepository.createBoxscore(player, game, false);
      }
      if (boxScore == null) {
        continue;
      }
      boxScores.add(boxScore);
    }

    await gameRepository.addBoxScores(game, boxScores);
    await teamStatRepository.createTeamStat(game);
    prefs.setBool('onGame', true);

    return gameId;
  }

  void selectPlayer(Player player, String position) {
    switch(position) {
      case "pg":
        state = state.copyWith(
          pg: player,
        );
        break;
      case "sg":
        state = state.copyWith(
          sg: player,
        );
        break;
      case "sf":
        state = state.copyWith(
          sf: player,
        );
        break;
      case "pf":
        state = state.copyWith(
          pf: player,
        );
        break;
      case "c":
        state = state.copyWith(
          c: player,
        );
        break;
    }
    checkStartable();
  }

  void updateHistories(Team team) {
    final histories = gameRepository.getGamesByOpponent(team);
    state = state.copyWith(
      histories: histories
    );
  }
}