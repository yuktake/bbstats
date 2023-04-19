import 'dart:async';

import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/enums/Outcome.dart';
import 'package:bb_stats/src/enums/RecordType.dart';
import 'package:isar/isar.dart';

import '../collections/boxscore/boxscore.dart';
import '../collections/team/team.dart';

class GameRepository {
  GameRepository(this.isar);

  /// Isarインスタンス
  final Isar isar;

  Future<int> createGame(Team team, DateTime gameDate, int quarterMin) async {
    if (!isar.isOpen) {
      return Future<int>(() {
        return 0;
      });
    }

    final game = Game()
      ..quarterMin = quarterMin
      ..opponent.value = team
      ..myPts = 0
      ..benchPts = 0
      ..fgm = 0
      ..fga = 0
      ..fgRatio = 0.0
      ..tpm = 0
      ..tpa = 0
      ..tpRatio = 0.0
      ..ftm = 0
      ..fta = 0
      ..ftRatio = 0.0
      ..oReb = 0
      ..dReb = 0
      ..reb = 0
      ..ast = 0
      ..stl = 0
      ..blk = 0
      ..to = 0
      ..pf = 0
      ..opponentPts = 0
      ..opponentBenchPts = 0
      ..opponentFgm = 0
      ..opponentFga = 0
      ..opponentFgRatio = 0.0
      ..opponentTpm = 0
      ..opponentTpa = 0
      ..opponentTpRatio = 0.0
      ..opponentFtm = 0
      ..opponentFta = 0
      ..opponentFtRatio = 0.0
      ..opponentOReb = 0
      ..opponentDReb = 0
      ..opponentReb = 0
      ..opponentAst = 0
      ..opponentStl = 0
      ..opponentBlk = 0
      ..opponentTo = 0
      ..opponentPf = 0
      ..gameDate = gameDate
      ..onGame = true
      ..outcome = Outcome.NONE
      ..createdAt = gameDate
      ..updatedAt = gameDate
    ;

    int val = await isar.writeTxn(() async {
      await isar.games.put(game);
      await game.opponent.save();
      return game.id;
    });

    return val;
  }

  List<dynamic> getAvgTeamStat() {

    final gameCount = isar.games.countSync();
    final ptsSum = isar.games.where().myPtsProperty().sumSync();
    final reboundSum = isar.games.where().rebProperty().sumSync();
    final assistSum = isar.games.where().astProperty().sumSync();
    final opponentPtsSum = isar.games.where().opponentPtsProperty().sumSync();

    final avgPts = gameCount == 0 ? 0.0 : ((ptsSum/gameCount) * 10).round() / 10;
    final avgRebound = gameCount == 0 ? 0.0 : ((reboundSum/gameCount) * 10).round() / 10;
    final avgAssist = gameCount == 0 ? 0.0 : ((assistSum/gameCount) * 10).round() / 10;
    final avgOpponentPts = gameCount == 0 ? 0.0 : ((opponentPtsSum/gameCount) * 10).round() / 10;

    return [
      avgPts,
      avgRebound,
      avgAssist,
      avgOpponentPts,
    ];
  }

  Future<void>? addBoxScores(Game game, List<Boxscore> boxScores) {
    if (!isar.isOpen) {
      return null;
    }

    isar.writeTxnSync(() {
      game.boxscores.loadSync();
      for (final boxScore in boxScores) {
        game.boxscores.add(boxScore);
      }
      game.boxscores.saveSync();
    });
    return null;
  }

  int countWinGame() {
    if (!isar.isOpen) {
      return 0;
    }

    final winCount = isar.games.filter().outcomeEqualTo(Outcome.WIN).countSync();

    return winCount;
  }

  int countLostGame() {
    if (!isar.isOpen) {
      return 0;
    }

    final lostCount = isar.games.filter().outcomeEqualTo(Outcome.LOSE).countSync();

    return lostCount;
  }

  void madeShot(int id, RecordType recordType, bool starter) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (recordType == RecordType.TWO_POINT_MADE) {
      game.myPts+=2;
      game.fgm+=1;
      game.fga+=1;
      double fgRatio = ((game.fgm/game.fga) * 100 * 10).round() / 10;
      game.fgRatio = fgRatio;
      if (!starter) {
        game.benchPts+=2;
      }
    } else if(recordType == RecordType.THREE_POINT_MADE) {
      game.myPts+=3;
      game.fgm+=1;
      game.fga+=1;
      game.tpm+=1;
      game.tpa+=1;
      double fgRatio = ((game.fgm/game.fga) * 100 * 10).round() / 10;
      double tpRatio = ((game.tpm/game.tpa) * 100 * 10).round() / 10;
      game.fgRatio = fgRatio;
      game.tpRatio = tpRatio;
      if (!starter) {
        game.benchPts+=3;
      }
    } else if (recordType == RecordType.FT_MADE) {
      game.myPts+=1;
      game.ftm+=1;
      game.fta+=1;
      double ftRatio = ((game.ftm/game.fta) * 100 * 10).round() / 10;
      game.ftRatio = ftRatio;
      if (!starter) {
        game.benchPts+=1;
      }
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void addAssist(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.ast++;
    } else {
      game.opponentAst++;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void modifyAssist(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.ast--;
    } else {
      game.opponentAst--;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void addOffenceRebound(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.oReb++;
      game.reb++;
    } else {
      game.opponentOReb++;
      game.opponentReb++;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void modifyOffenceRebound(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if(myTeam) {
      game.oReb--;
      game.reb--;
    } else {
      game.opponentOReb--;
      game.opponentReb--;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void addDefenceRebound(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.dReb++;
      game.reb++;
    } else {
      game.opponentDReb++;
      game.opponentReb++;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void modifyDefenceRebound(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.dReb--;
      game.reb--;
    } else {
      game.opponentDReb--;
      game.opponentReb--;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void addBlock(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.blk++;
    } else {
      game.opponentBlk++;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void modifyBlock(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.blk--;
    } else {
      game.opponentBlk--;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void addSteal(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.stl++;
    } else {
      game.opponentStl++;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void modifySteal(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.stl--;
    } else {
      game.opponentStl--;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void addTurnover(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.to++;
    } else {
      game.opponentTo++;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void modifyTurnover(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if(myTeam) {
      game.to--;
    } else {
      game.opponentTo--;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void addFoul(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.pf++;
    } else {
      game.opponentPf++;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void modifyFoul(int id, bool myTeam) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (myTeam) {
      game.pf--;
    } else {
      game.opponentPf--;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void modifyShot(int id, int? supportPlayerId, RecordType recordType, bool starter) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    switch(recordType) {
      case RecordType.TWO_POINT_MADE:
        game.myPts-=2;
        game.fgm-=1;
        game.fga-=1;
        if (game.fga == 0) {
          game.fgRatio = 0.0;
        } else {
          game.fgRatio = ((game.fgm/game.fga) * 100 * 10).round() / 10;
        }

        if (!starter) {
          game.benchPts-=2;
        }

        if (supportPlayerId != null) {
          game.ast-=1;
        }
        break;
      case RecordType.TWO_POINT_MISS:
        game.fga-=1;
        if (game.fga == 0) {
          game.fgRatio = 0.0;
        } else {
          game.fgRatio = ((game.fgm/game.fga) * 100 * 10).round() / 10;
        }

        if (supportPlayerId != null) {
          game.oReb-=1;
          game.reb-=1;
        }
        break;
      case RecordType.THREE_POINT_MADE:
        game.myPts-=3;
        game.tpm-=1;
        game.tpa-=1;
        game.fgm-=1;
        game.fga-=1;
        if (game.tpa == 0) {
          game.tpRatio = 0.0;
        } else {
          game.tpRatio = ((game.tpm/game.tpa) * 100 * 10).round() / 10;
        }

        if (game.fga == 0) {
          game.fgRatio = 0.0;
        } else {
          game.fgRatio = ((game.fgm/game.fga) * 100 * 10).round() / 10;
        }

        if (!starter) {
          game.benchPts-=3;
        }

        if (supportPlayerId != null) {
          game.ast-=1;
        }
        break;
      case RecordType.THREE_POINT_MISS:
        game.tpa-=1;
        if (game.tpa == 0) {
          game.tpRatio = 0.0;
        } else {
          game.tpRatio = ((game.tpm/game.tpa) * 100 * 10).round() / 10;
        }

        if (supportPlayerId != null) {
          game.oReb-=1;
          game.reb-=1;
        }
        break;
      case RecordType.FT_MADE:
        game.myPts-=1;
        game.ftm-=1;
        game.fta-=1;
        if (game.fta == 0) {
          game.ftRatio = 0.0;
        } else {
          game.ftRatio = ((game.ftm/game.fta) * 100 * 10).round() / 10;
        }

        if (!starter) {
          game.benchPts-=1;
        }

        break;
      case RecordType.FT_MISS:
        game.fta-=1;
        if (game.fta == 0) {
          game.ftRatio = 0.0;
        } else {
          game.ftRatio = ((game.ftm/game.fta) * 100 * 10).round() / 10;
        }
        break;
      default:
        break;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void opponentMadeShot(int id, RecordType recordType) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (recordType == RecordType.TWO_POINT_MADE) {
      game.opponentPts+=2;
      game.opponentFgm+=1;
      game.opponentFga+=1;
      double opponentFgRatio = ((game.opponentFgm/game.opponentFga) * 100 * 10).round() / 10;
      game.opponentFgRatio = opponentFgRatio;

    } else if(recordType == RecordType.THREE_POINT_MADE) {
      game.opponentPts+=3;
      game.opponentFgm+=1;
      game.opponentFga+=1;
      game.opponentTpm+=1;
      game.opponentTpa+=1;
      double opponentFgRatio = ((game.opponentFgm/game.opponentFga) * 100 * 10).round() / 10;
      double opponentTpRatio = ((game.opponentTpm/game.opponentTpa) * 100 * 10).round() / 10;
      game.opponentFgRatio = opponentFgRatio;
      game.opponentTpRatio = opponentTpRatio;

    } else if (recordType == RecordType.FT_MADE) {
      game.opponentPts+=1;
      game.opponentFtm+=1;
      game.opponentFta+=1;
      double opponentFtRatio = ((game.opponentFtm/game.opponentFta) * 100 * 10).round() / 10;
      game.opponentFtRatio = opponentFtRatio;

    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void modifyOpponentShot(int id, RecordType recordType) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    switch(recordType) {
      case RecordType.TWO_POINT_MADE:
        game.opponentPts-=2;
        game.opponentFgm-=1;
        game.opponentFga-=1;
        if (game.opponentFga == 0) {
          game.opponentFgRatio = 0.0;
        } else {
          game.opponentFgRatio = ((game.opponentFgm/game.opponentFga) * 100 * 10).round() / 10;
        }

        break;
      case RecordType.TWO_POINT_MISS:
        game.opponentFga-=1;
        if (game.opponentFga == 0) {
          game.opponentFgRatio = 0.0;
        } else {
          game.opponentFgRatio = ((game.opponentFgm/game.opponentFga) * 100 * 10).round() / 10;
        }

        break;
      case RecordType.THREE_POINT_MADE:
        game.opponentPts-=3;
        game.opponentTpm-=1;
        game.opponentTpa-=1;
        if (game.opponentTpa == 0) {
          game.opponentTpRatio = 0.0;
        } else {
          game.opponentTpRatio = ((game.opponentTpm/game.opponentTpa) * 100 * 10).round() / 10;
        }

        game.opponentFgm-=1;
        game.opponentFga-=1;
        if (game.opponentFga == 0) {
          game.opponentFgRatio = 0.0;
        } else {
          game.opponentFgRatio = ((game.opponentFgm/game.opponentFga) * 100 * 10).round() / 10;
        }

        break;
      case RecordType.THREE_POINT_MISS:
        game.opponentTpa-=1;
        if (game.opponentTpa == 0) {
          game.opponentTpRatio = 0.0;
        } else {
          game.opponentTpRatio = ((game.opponentTpm/game.opponentTpa) * 100 * 10).round() / 10;
        }

        game.opponentFga-=1;
        if (game.opponentFga == 0) {
          game.opponentFgRatio = 0.0;
        } else {
          game.opponentFgRatio = ((game.opponentFgm/game.opponentFga) * 100 * 10).round() / 10;
        }

        break;
      case RecordType.FT_MADE:
        game.opponentPts-=1;
        game.opponentFtm-=1;
        game.opponentFta-=1;
        if (game.opponentFta == 0) {
          game.opponentFtRatio = 0.0;
        } else {
          game.opponentFtRatio = ((game.opponentFtm/game.opponentFta) * 100 * 10).round() / 10;
        }

        break;
      case RecordType.FT_MISS:
        game.opponentFta-=1;
        if (game.opponentFta == 0) {
          game.opponentFtRatio = 0.0;
        } else {
          game.opponentFtRatio = ((game.opponentFtm/game.opponentFta) * 100 * 10).round() / 10;
        }
        break;
      default:
        break;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void missShot(int id, RecordType recordType) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (recordType == RecordType.TWO_POINT_MISS) {
      game.fga+=1;
      double fgRatio = ((game.fgm/game.fga) * 100 * 10).round() / 10;
      game.fgRatio = fgRatio;
    } else if(recordType == RecordType.THREE_POINT_MISS) {
      game.fga+=1;
      game.tpa+=1;
      double fgRatio = ((game.fgm/game.fga) * 100 * 10).round() / 10;
      double tpRatio = ((game.tpm/game.tpa) * 100 * 10).round() / 10;
      game.fgRatio = fgRatio;
      game.tpRatio = tpRatio;
    } else if (recordType == RecordType.FT_MISS) {
      game.fta+=1;
      double ftRatio = ((game.ftm/game.fta) * 100 * 10).round() / 10;
      game.ftRatio = ftRatio;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  void opponentMissShot(int id, RecordType recordType) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return;
    }

    if (recordType == RecordType.TWO_POINT_MISS) {
      game.opponentFga+=1;
      double opponentFgRatio = ((game.opponentFgm/game.opponentFga) * 100 * 10).round() / 10;
      game.opponentFgRatio = opponentFgRatio;
    } else if(recordType == RecordType.THREE_POINT_MISS) {
      game.opponentFga+=1;
      game.opponentTpa+=1;
      double opponentFgRatio = ((game.opponentFgm/game.opponentFga) * 100 * 10).round() / 10;
      double opponentTpRatio = ((game.opponentTpm/game.opponentTpa) * 100 * 10).round() / 10;
      game.opponentFgRatio = opponentFgRatio;
      game.opponentTpRatio = opponentTpRatio;
    } else if (recordType == RecordType.FT_MISS) {
      game.opponentFta+=1;
      double opponentFtRatio = ((game.opponentFtm/game.opponentFta) * 100 * 10).round() / 10;
      game.opponentFtRatio = opponentFtRatio;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  Game? findGame(int id) {
    if (!isar.isOpen) {
      return null;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    game?.opponent.loadSync();

    return game;
  }

  int getQuarterMin(int id) {
    if (!isar.isOpen) {
      return -1;
    }

    final game = isar.games.where().idEqualTo(id).findFirstSync();
    if (game == null) {
      return -1;
    }

    return game.quarterMin;
  }

  void updateQuarterMin(int gameId, int quarterMin) {
    if (!isar.isOpen) {
      return;
    }

    final game = isar.games.where().idEqualTo(gameId).findFirstSync();
    if (game == null) {
      return;
    }

    game.quarterMin = quarterMin;

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }

  Game? findOnGame() {
    if (!isar.isOpen) {
      return null;
    }

    final game = isar.games.filter().onGameEqualTo(true).findFirstSync();
    game?.opponent.loadSync();

    return game;
  }

  List<Game> findGames() {
    if (!isar.isOpen) {
      return [];
    }

    // 更新日時の降順で全件返す
    final games = isar.games.where().sortByUpdatedAtDesc().findAllSync();

    // IsarLinkでリンクされているカテゴリを読み込む必要がある
    for (final game in games) {
      game.opponent.loadSync();
    }
    return games;
  }

  List<Game> findGamesByDate(DateTime datetime) {
    if (!isar.isOpen) {
      return [];
    }
    
    DateTime dateStart = DateTime(datetime.year, datetime.month, datetime.day, 0, 0, 0);
    DateTime dateEnd = DateTime(datetime.year, datetime.month, datetime.day, 23, 59, 59);
    final games = isar.games.filter().gameDateBetween(dateStart,dateEnd).findAllSync();

    for (final game in games) {
      game.opponent.loadSync();
    }

    return games;
  }

  List<Game> getGamesByOpponent(Team? opponent) {
    if (!isar.isOpen) {
      return [];
    }

    if (opponent == null) {
      return [];
    }

    List<Game> latestThree = [];

    final List<Game> games = isar.games.filter().opponent((q) => q.idEqualTo(opponent.id)).and().not().outcomeEqualTo(Outcome.NONE).sortByGameDateDesc().findAllSync();

    for (final game in games) {
      if (latestThree.length == 3) {
        break;
      }
      game.opponent.loadSync();
      latestThree.add(game);
    }

    return latestThree;
  }

  List<dynamic> getOverallStats(DateTime? start, DateTime? end, int? opponentTeamId) {
    QueryBuilder<Game, Game, QAfterFilterCondition> queryBuilder;

    queryBuilder = isar.games.filter().not().outcomeEqualTo(Outcome.NONE);

    if (start != null) {
      queryBuilder = queryBuilder.gameDateGreaterThan(start, include: true);
    }

    if (end != null) {
      queryBuilder = queryBuilder.gameDateLessThan(end, include: true);
    }

    if (opponentTeamId != null) {
      queryBuilder = queryBuilder.opponent((q) => q.idEqualTo(opponentTeamId));
    }

    List<Game> overallGames = queryBuilder.findAllSync();

    int count = overallGames.length;
    if (count == 0) {
      List<dynamic> overallStats = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
      return overallStats;
    }

    double ptsSum = 0.0;
    double fgmSum = 0.0;
    double fgaSum = 0.0;
    double tpmSum = 0.0;
    double tpaSum = 0.0;
    double ftmSum = 0.0;
    double ftaSum = 0.0;
    double oRebSum = 0.0;
    double dRebSum = 0.0;
    double rebSum = 0.0;
    double astSum = 0.0;
    double toSum = 0.0;
    double stlSum = 0.0;
    double blkSum = 0.0;
    double pfSum = 0.0;

    for (var game in overallGames) {
      ptsSum = ptsSum + game.myPts;
      fgmSum = fgmSum + game.fgm;
      fgaSum = fgaSum + game.fga;
      tpmSum = tpmSum + game.tpm;
      tpaSum = tpaSum + game.tpa;
      ftmSum = ftmSum + game.tpa;
      ftaSum = ftaSum + game.fta;
      oRebSum = oRebSum + game.oReb;
      dRebSum = dRebSum + game.dReb;
      rebSum = rebSum + game.reb;
      astSum = astSum + game.ast;
      toSum = toSum + game.to;
      stlSum = stlSum + game.stl;
      blkSum = blkSum + game.blk;
      pfSum = pfSum + game.pf;
    }

    double seasonPtsAvg = ((ptsSum/count) * 10).round() / 10;
    double seasonFgmAvg = ((fgmSum/count) * 10).round() / 10;
    double seasonFgaAvg = ((fgaSum/count) * 10).round() / 10;
    double seasonFgRatio = fgaSum == 0.0 ? 0.0 : ((fgmSum/fgaSum) * 100 * 10).round() / 10;
    double seasonTpmAvg = ((tpmSum/count) * 10).round() / 10;
    double seasonTpaAvg = ((tpaSum/count) * 10).round() / 10;
    double seasonTpRatio = tpaSum == 0.0 ? 0.0 : ((tpmSum/tpaSum) * 100 * 10).round() / 10;
    double seasonFtmAvg = ((ftmSum/count) * 10).round() / 10;
    double seasonFtaAvg = ((ftaSum/count) * 10).round() / 10;
    double seasonFtRatio = ftaSum == 0.0 ? 0.0 : ((ftmSum/ftaSum) * 100 * 10).round() / 10;
    double seasonORebAvg = ((oRebSum/count) * 10).round() / 10;
    double seasonDRebAvg = ((dRebSum/count) * 10).round() / 10;
    double seasonRebAvg = ((rebSum/count) * 10).round() / 10;
    double seasonAstAvg = ((astSum/count) * 10).round() / 10;
    double seasonToAvg = ((toSum/count) * 10).round() / 10;
    double seasonStlAvg = ((stlSum/count) * 10).round() / 10;
    double seasonBlkAvg = ((blkSum/count) * 10).round() / 10;
    double seasonPfAvg = ((pfSum/count) * 10).round() / 10;

    List<dynamic> overallStats = [
      seasonPtsAvg,
      seasonFgmAvg,
      seasonFgaAvg,
      seasonFgRatio,
      seasonTpmAvg,
      seasonTpaAvg,
      seasonTpRatio,
      seasonFtmAvg,
      seasonFtaAvg,
      seasonFtRatio,
      seasonORebAvg,
      seasonDRebAvg,
      seasonRebAvg,
      seasonAstAvg,
      seasonStlAvg,
      seasonBlkAvg,
      seasonToAvg,
      seasonPfAvg,
    ];

    return overallStats;
  }

  List<dynamic> getStatsByResult(DateTime? start, DateTime? end, int? opponentTeamId, Outcome outcome) {
    QueryBuilder<Game, Game, QAfterFilterCondition> queryBuilder;
    String outcomeString;

    switch(outcome) {
      case Outcome.WIN:
        outcomeString = 'WIN';
        break;
      case Outcome.LOSE:
        outcomeString = 'LOSE';
        break;
      case Outcome.DRAW:
        outcomeString = 'DRAW';
        break;
      case Outcome.NONE:
      default:
        outcomeString = '';
    }

    queryBuilder = isar.games.filter().outcomeEqualTo(outcome);

    if (start != null) {
      queryBuilder = queryBuilder.gameDateGreaterThan(start, include: true);
    }

    if (end != null) {
      queryBuilder = queryBuilder.gameDateLessThan(end, include: true);
    }

    if (opponentTeamId != null) {
      queryBuilder = queryBuilder.opponent((q) => q.idEqualTo(opponentTeamId));
    }

    List<Game> overallGames = queryBuilder.findAllSync();

    int count = overallGames.length;
    if (count == 0) {
      List<dynamic> overallStats = [outcomeString,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
      return overallStats;
    }

    double ptsSum = 0.0;
    double fgmSum = 0.0;
    double fgaSum = 0.0;
    double tpmSum = 0.0;
    double tpaSum = 0.0;
    double ftmSum = 0.0;
    double ftaSum = 0.0;
    double oRebSum = 0.0;
    double dRebSum = 0.0;
    double rebSum = 0.0;
    double astSum = 0.0;
    double toSum = 0.0;
    double stlSum = 0.0;
    double blkSum = 0.0;
    double pfSum = 0.0;

    for (var game in overallGames) {
      ptsSum = ptsSum + game.myPts;
      fgmSum = fgmSum + game.fgm;
      fgaSum = fgaSum + game.fga;
      tpmSum = tpmSum + game.tpm;
      tpaSum = tpaSum + game.tpa;
      ftmSum = ftmSum + game.tpa;
      ftaSum = ftaSum + game.fta;
      oRebSum = oRebSum + game.oReb;
      dRebSum = dRebSum + game.dReb;
      rebSum = rebSum + game.reb;
      astSum = astSum + game.ast;
      toSum = toSum + game.to;
      stlSum = stlSum + game.stl;
      blkSum = blkSum + game.blk;
      pfSum = pfSum + game.pf;
    }

    double seasonPtsAvg = ((ptsSum/count) * 10).round() / 10;
    double seasonFgmAvg = ((fgmSum/count) * 10).round() / 10;
    double seasonFgaAvg = ((fgaSum/count) * 10).round() / 10;
    double seasonFgRatio = fgaSum == 0.0 ? 0.0 : ((fgmSum/fgaSum) * 100 * 10).round() / 10;
    double seasonTpmAvg = ((tpmSum/count) * 10).round() / 10;
    double seasonTpaAvg = ((tpaSum/count) * 10).round() / 10;
    double seasonTpRatio = tpaSum == 0.0 ? 0.0 : ((tpmSum/tpaSum) * 100 * 10).round() / 10;
    double seasonFtmAvg = ((ftmSum/count) * 10).round() / 10;
    double seasonFtaAvg = ((ftaSum/count) * 10).round() / 10;
    double seasonFtRatio = ftaSum == 0.0 ? 0.0 : ((ftmSum/ftaSum) * 100 * 10).round() / 10;
    double seasonORebAvg = ((oRebSum/count) * 10).round() / 10;
    double seasonDRebAvg = ((dRebSum/count) * 10).round() / 10;
    double seasonRebAvg = ((rebSum/count) * 10).round() / 10;
    double seasonAstAvg = ((astSum/count) * 10).round() / 10;
    double seasonToAvg = ((toSum/count) * 10).round() / 10;
    double seasonStlAvg = ((stlSum/count) * 10).round() / 10;
    double seasonBlkAvg = ((blkSum/count) * 10).round() / 10;
    double seasonPfAvg = ((pfSum/count) * 10).round() / 10;

    List<dynamic> byResultStats = [
      outcomeString,
      seasonPtsAvg,
      seasonFgmAvg,
      seasonFgaAvg,
      seasonFgRatio,
      seasonTpmAvg,
      seasonTpaAvg,
      seasonTpRatio,
      seasonFtmAvg,
      seasonFtaAvg,
      seasonFtRatio,
      seasonORebAvg,
      seasonDRebAvg,
      seasonRebAvg,
      seasonAstAvg,
      seasonStlAvg,
      seasonBlkAvg,
      seasonToAvg,
      seasonPfAvg,
    ];

    return byResultStats;
  }

  List<List<dynamic>> getStatsForComparison(int gameId) {
    if (!isar.isOpen) {
      return [
        [0.0,0.0],
        [0.0,0.0],
        [0.0,0.0],
        [0.0,0.0],
        [0.0,0.0],
        [0.0,0.0],
      ];
    }

    final game = isar.games.where().idEqualTo(gameId).findFirstSync();
    if (game == null) {
      return [
        [0.0,0.0],
        [0.0,0.0],
        [0.0,0.0],
        [0.0,0.0],
        [0.0,0.0],
        [0.0,0.0],
      ];
    }
    game.opponent.loadSync();

    List<List<dynamic>> comparisonStats = [
      [game.oReb.toDouble(), game.opponentOReb.toDouble()],
      [game.dReb.toDouble(), game.opponentDReb.toDouble()],
      [game.ast.toDouble(), game.opponentAst.toDouble()],
      [game.stl.toDouble(), game.opponentStl.toDouble()],
      [game.blk.toDouble(), game.opponentBlk.toDouble()],
      [game.to.toDouble(), game.opponentTo.toDouble()],
    ];

    return comparisonStats;
  }

  void gameSet() {
    final game = isar.games.filter().onGameEqualTo(true).findFirstSync();
    if (game == null) {
      return;
    }
    game.onGame = false;
    if (game.myPts > game.opponentPts) {
      game.outcome = Outcome.WIN;
    } else if(game.myPts < game.opponentPts) {
      game.outcome = Outcome.LOSE;
    } else {
      game.outcome = Outcome.DRAW;
    }

    isar.writeTxnSync(() {
      isar.games.putSync(game);
    });
  }
}