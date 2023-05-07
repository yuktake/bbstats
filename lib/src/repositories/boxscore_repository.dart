import 'dart:async';

import 'package:bb_stats/src/collections/boxscore/boxscore.dart';
import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/player/player.dart';
import 'package:bb_stats/src/enums/FgResult.dart';
import 'package:bb_stats/src/enums/FtResult.dart';
import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/RecordType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:bb_stats/src/enums/ShotZone.dart';
import 'package:isar/isar.dart';

class BoxscoreRepository {
  BoxscoreRepository(this.isar);

  /// Isarインスタンス
  final Isar isar;

  Future<Boxscore?> createBoxscore(Player player, Game game, bool starter) async {
    if (!isar.isOpen) {
      return null;
    }

    final boxScore = Boxscore()
      ..player.value = player
      ..game.value = game
      ..pts = 0
      ..fga = 0
      ..fgm = 0
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
      ..starter = starter
      ..onCourt = starter

      ..fgmLayup = 0
      ..fgaLayup = 0
      ..tpmLayup = 0
      ..tpaLayup = 0

      ..fgmCatchAndShot = 0
      ..fgaCatchAndShot = 0
      ..tpmCatchAndShot = 0
      ..tpaCatchAndShot = 0

      ..fgmPullUp = 0
      ..fgaPullUp = 0
      ..tpmPullUp = 0
      ..tpaPullUp = 0

      ..fgmFloating = 0
      ..fgaFloating = 0
      ..tpmFloating = 0
      ..tpaFloating = 0

      ..fgmHook = 0
      ..fgaHook = 0
      ..tpmHook = 0
      ..tpaHook = 0

      ..fgmTip = 0
      ..fgaTip = 0
      ..tpmTip = 0
      ..tpaTip = 0

      ..fgmFadeAway = 0
      ..fgaFadeAway = 0
      ..tpmFadeAway = 0
      ..tpaFadeAway = 0

      ..fgmDunk = 0
      ..fgaDunk = 0
      ..tpmDunk = 0
      ..tpaDunk = 0

      ..fgmAlleyOop = 0
      ..fgaAlleyOop = 0
      ..tpmAlleyOop = 0
      ..tpaAlleyOop = 0

      // playtype
      ..fgmIsolation = 0
      ..fgaIsolation = 0
      ..tpmIsolation = 0
      ..tpaIsolation = 0

      ..fgmFastBreak = 0
      ..fgaFastBreak = 0
      ..tpmFastBreak = 0
      ..tpaFastBreak = 0

      ..fgmHandler = 0
      ..fgaHandler = 0
      ..tpmHandler = 0
      ..tpaHandler = 0

      ..fgmRoller = 0
      ..fgaRoller = 0
      ..tpmRoller = 0
      ..tpaRoller = 0

      ..fgmPostUp = 0
      ..fgaPostUp = 0
      ..tpmPostUp = 0
      ..tpaPostUp = 0

      ..fgmSpotUp = 0
      ..fgaSpotUp = 0
      ..tpmSpotUp = 0
      ..tpaSpotUp = 0

      ..fgmHandOff = 0
      ..fgaHandOff = 0
      ..tpmHandOff = 0
      ..tpaHandOff = 0

      ..fgmCut = 0
      ..fgaCut = 0
      ..tpmCut = 0
      ..tpaCut = 0

      ..fgmOffScreen = 0
      ..fgaOffScreen = 0
      ..tpmOffScreen = 0
      ..tpaOffScreen = 0

      ..fgmSecondChance = 0
      ..fgaSecondChance = 0
      ..tpmSecondChance = 0
      ..tpaSecondChance = 0
    ;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
      boxScore.player.saveSync();
      boxScore.game.saveSync();
    });

    return boxScore;
  }

  List<Boxscore> findByGame(int gameId, int columnIndex, bool ascending) {
    if (!isar.isOpen) {
      return [];
    }

    final boxScores = isar.boxscores.filter().game((q) => q.idEqualTo(gameId)).findAllSync();
    boxScores.asMap().forEach((int index, Boxscore boxScore)  {
      boxScore.player.loadSync();
    });

    if (ascending) {
      switch(columnIndex){
        case 0:
          boxScores.sort((a, b) => a.player.value!.name.compareTo(b.player.value!.name));
          break;
        case 1:
          boxScores.sort((a, b) => a.pts.compareTo(b.pts));
          break;
        case 2:
          boxScores.sort((a, b) => a.fgm.compareTo(b.fgm));
          break;
        case 3:
          boxScores.sort((a, b) => a.fga.compareTo(b.fga));
          break;
        case 4:
          boxScores.sort((a, b) => a.fgRatio.compareTo(b.fgRatio));
          break;
        case 5:
          boxScores.sort((a, b) => a.tpm.compareTo(b.tpm));
          break;
        case 6:
          boxScores.sort((a, b) => a.tpa.compareTo(b.tpa));
          break;
        case 7:
          boxScores.sort((a, b) => a.tpRatio.compareTo(b.tpRatio));
          break;
        case 8:
          boxScores.sort((a, b) => a.ftm.compareTo(b.ftm));
          break;
        case 9:
          boxScores.sort((a, b) => a.fta.compareTo(b.fta));
          break;
        case 10:
          boxScores.sort((a, b) => a.ftRatio.compareTo(b.ftRatio));
          break;
        case 11:
          boxScores.sort((a, b) => a.oReb.compareTo(b.oReb));
          break;
        case 12:
          boxScores.sort((a, b) => a.dReb.compareTo(b.dReb));
          break;
        case 13:
          boxScores.sort((a, b) => a.reb.compareTo(b.reb));
          break;
        case 14:
          boxScores.sort((a, b) => a.ast.compareTo(b.ast));
          break;
        case 15:
          boxScores.sort((a, b) => a.stl.compareTo(b.stl));
          break;
        case 16:
          boxScores.sort((a, b) => a.blk.compareTo(b.blk));
          break;
        case 17:
          boxScores.sort((a, b) => a.to.compareTo(b.to));
          break;
        case 18:
          boxScores.sort((a, b) => a.pf.compareTo(b.pf));
          break;
      }
    } else {
      switch(columnIndex){
        case 0:
          boxScores.sort((a, b) => b.player.value!.name.compareTo(a.player.value!.name));
          break;
        case 1:
          boxScores.sort((a, b) => b.pts.compareTo(a.pts));
          break;
        case 2:
          boxScores.sort((a, b) => b.fgm.compareTo(a.fgm));
          break;
        case 3:
          boxScores.sort((a, b) => b.fga.compareTo(a.fga));
          break;
        case 4:
          boxScores.sort((a, b) => b.fgRatio.compareTo(a.fgRatio));
          break;
        case 5:
          boxScores.sort((a, b) => b.tpm.compareTo(a.tpm));
          break;
        case 6:
          boxScores.sort((a, b) => b.tpa.compareTo(a.tpa));
          break;
        case 7:
          boxScores.sort((a, b) => b.tpRatio.compareTo(a.tpRatio));
          break;
        case 8:
          boxScores.sort((a, b) => b.ftm.compareTo(a.ftm));
          break;
        case 9:
          boxScores.sort((a, b) => b.fta.compareTo(a.fta));
          break;
        case 10:
          boxScores.sort((a, b) => b.ftRatio.compareTo(a.ftRatio));
          break;
        case 11:
          boxScores.sort((a, b) => b.oReb.compareTo(a.oReb));
          break;
        case 12:
          boxScores.sort((a, b) => b.dReb.compareTo(a.dReb));
          break;
        case 13:
          boxScores.sort((a, b) => b.reb.compareTo(a.reb));
          break;
        case 14:
          boxScores.sort((a, b) => b.ast.compareTo(a.ast));
          break;
        case 15:
          boxScores.sort((a, b) => b.stl.compareTo(a.stl));
          break;
        case 16:
          boxScores.sort((a, b) => b.blk.compareTo(a.blk));
          break;
        case 17:
          boxScores.sort((a, b) => b.to.compareTo(a.to));
          break;
        case 18:
          boxScores.sort((a, b) => b.pf.compareTo(a.pf));
          break;
      }
    }

    return boxScores;
  }

  List<List<dynamic>> getAvgBoxScores(DateTime? start, DateTime? end, int columnIndex, bool ascending) {
    final players = isar.players.filter().visibleEqualTo(true).findAllSync();
    if (players.isEmpty) {
      return [];
    }

    List<List<dynamic>> playerStats = [];

    for (var player in players) {
      QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> queryBuilder = isar.boxscores.filter().player((q) => q.idEqualTo(player.id));
      if (start != null) {
        queryBuilder = queryBuilder.game((q) => q.gameDateGreaterThan(start, include: true));
      }
      if (end != null) {
        queryBuilder = queryBuilder.game((q) => q.gameDateLessThan(end, include: true));
      }

      final boxScoreNum = queryBuilder.countSync();
      final ptsSum = queryBuilder.ptsProperty().sumSync();
      final fgmSum = queryBuilder.fgmProperty().sumSync();
      final fgaSum = queryBuilder.fgaProperty().sumSync();
      final tpmSum = queryBuilder.tpmProperty().sumSync();
      final tpaSum = queryBuilder.tpaProperty().sumSync();
      final ftmSum = queryBuilder.ftmProperty().sumSync();
      final ftaSum = queryBuilder.ftaProperty().sumSync();
      final oRebSum = queryBuilder.oRebProperty().sumSync();
      final dRebSum = queryBuilder.dRebProperty().sumSync();
      final rebSum = queryBuilder.rebProperty().sumSync();
      final astSum = queryBuilder.astProperty().sumSync();
      final stlSum = queryBuilder.stlProperty().sumSync();
      final blkSum = queryBuilder.blkProperty().sumSync();
      final toSum = queryBuilder.toProperty().sumSync();
      final pfSum = queryBuilder.pfProperty().sumSync();

      final ptsAvg = boxScoreNum == 0 ? 0.0 : ((ptsSum/boxScoreNum) * 10).round() / 10;
      final fgmAvg = boxScoreNum == 0 ? 0.0 : ((fgmSum/boxScoreNum) * 10).round() / 10;
      final fgaAvg = boxScoreNum == 0 ? 0.0 : ((fgaSum/boxScoreNum) * 10).round() / 10;
      final fgRatio = fgaSum==0 ? 0.0 : ((fgmSum/fgaSum) * 100 * 10).round() / 10;
      final tpmAvg = boxScoreNum == 0 ? 0.0 : ((tpmSum/boxScoreNum) * 10).round() / 10;
      final tpaAvg = boxScoreNum == 0 ? 0.0 : ((tpaSum/boxScoreNum) * 10).round() / 10;
      final tpRatio = tpaSum==0 ? 0.0 : ((tpmSum/tpaSum) * 100 * 10).round() / 10;
      final ftmAvg = boxScoreNum == 0 ? 0.0 : ((ftmSum/boxScoreNum) * 10).round() / 10;
      final ftaAvg = boxScoreNum == 0 ? 0.0 : ((ftaSum/boxScoreNum) * 10).round() / 10;
      final ftRatio = ftaSum==0 ? 0.0 : ((ftmSum/ftaSum) * 100 * 10).round() / 10;
      final oRebAvg = boxScoreNum == 0 ? 0.0 : ((oRebSum/boxScoreNum) * 10).round() / 10;
      final dRebAvg = boxScoreNum == 0 ? 0.0 : ((dRebSum/boxScoreNum) * 10).round() / 10;
      final rebAvg = boxScoreNum == 0 ? 0.0 : ((rebSum/boxScoreNum) * 10).round() / 10;
      final astAvg = boxScoreNum == 0 ? 0.0 : ((astSum/boxScoreNum) * 10).round() / 10;
      final stlAvg = boxScoreNum == 0 ? 0.0 : ((stlSum/boxScoreNum) * 10).round() / 10;
      final blkAvg = boxScoreNum == 0 ? 0.0 : ((blkSum/boxScoreNum) * 10).round() / 10;
      final toAvg = boxScoreNum == 0 ? 0.0 : ((toSum/boxScoreNum) * 10).round() / 10;
      final pfAvg = boxScoreNum == 0 ? 0.0 : ((pfSum/boxScoreNum) * 10).round() / 10;

      List<dynamic> tmp = [
        player.id,
        player.name,
        ptsAvg,
        fgmAvg,
        fgaAvg,
        fgRatio,
        tpmAvg,
        tpaAvg,
        tpRatio,
        ftmAvg,
        ftaAvg,
        ftRatio,
        oRebAvg,
        dRebAvg,
        rebAvg,
        astAvg,
        stlAvg,
        blkAvg,
        toAvg,
        pfAvg,
      ];
      playerStats.add(tmp);
    }

    if (ascending) {
      playerStats.sort((a, b) => a[columnIndex+1].compareTo(b[columnIndex+1]));
    } else {
      playerStats.sort((a, b) => b[columnIndex+1].compareTo(a[columnIndex+1]));
    }

    return playerStats;
  }

  Boxscore? findOneByGameAndPlayer(int gameId, int playerId) {
    if (!isar.isOpen) {
      return null;
    }
    final boxScore = isar.boxscores.filter().game((q) => q.idEqualTo(gameId)).and().player((q) => q.idEqualTo(playerId)).findFirstSync();

    return boxScore;
  }

  List<Boxscore> findStarterBoxScores(int gameId) {
    if (!isar.isOpen) {
      return [];
    }
    final boxScores = isar.boxscores.filter().game((q) => q.idEqualTo(gameId)).and().starterEqualTo(true).findAllSync();
    boxScores.asMap().forEach((int index, Boxscore boxScore)  {
      boxScore.player.loadSync();
    });

    return boxScores;
  }

  List<Boxscore> findOnCourtBoxScores(int gameId) {
    if (!isar.isOpen) {
      return [];
    }
    final boxScores = isar.boxscores.filter().game((q) => q.idEqualTo(gameId)).and().onCourtEqualTo(true).findAllSync();
    boxScores.asMap().forEach((int index, Boxscore boxScore)  {
      boxScore.player.loadSync();
    });

    return boxScores;
  }

  List<Boxscore> getSubstitutes(int gameId) {
    if (!isar.isOpen) {
      return [];
    }
    final boxScores = isar.boxscores.filter().game((q) => q.idEqualTo(gameId)).and().onCourtEqualTo(false).findAllSync();
    boxScores.asMap().forEach((int index, Boxscore boxScore)  {
      boxScore.player.loadSync();
    });

    return boxScores;
  }

  void makeShot(Boxscore boxScore, FgResult fgResult, int? supportPlayerId, PlayType playType, ShotType shotType, ShotZone shotZone) {

    if (fgResult == FgResult.NONE) {
      // TODO:: ERROR
      return;
    }

    // 以降はTPM/TPA/FGM/FGAしか存在しない
    if (fgResult == FgResult.THREE_POINT_MADE) {
      boxScore.tpa = boxScore.tpa+1;
      boxScore.tpm = boxScore.tpm+1;
      boxScore.tpRatio = ((boxScore.tpm / boxScore.tpa) * 100 * 10).round() / 10;
      boxScore.pts = boxScore.pts + 3;
      boxScore.fga = boxScore.fga+1;
      boxScore.fgm = boxScore.fgm+1;
      boxScore.fgRatio = ((boxScore.fgm / boxScore.fga) * 100 * 10).round() / 10;
    } else if (fgResult == FgResult.THREE_POINT_MISS) {
      boxScore.tpa = boxScore.tpa+1;
      boxScore.tpRatio = ((boxScore.tpm / boxScore.tpa) * 100 * 10).round() / 10;
      boxScore.fga = boxScore.fga+1;
      boxScore.fgRatio = ((boxScore.fgm / boxScore.fga) * 100 * 10).round() / 10;
    } else if (fgResult == FgResult.TWO_POINT_MADE) {
      boxScore.pts = boxScore.pts + 2;
      boxScore.fga = boxScore.fga+1;
      boxScore.fgm = boxScore.fgm+1;
      boxScore.fgRatio = ((boxScore.fgm / boxScore.fga) * 100 * 10).round() / 10;
    } else if (fgResult == FgResult.TWO_POINT_MISS) {
      boxScore.fga = boxScore.fga+1;
      boxScore.fgRatio = ((boxScore.fgm / boxScore.fga) * 100 * 10).round() / 10;
    }

    switch(playType) {
      case PlayType.NONE:
        break;
      case PlayType.ISOLATION:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmIsolation = boxScore.tpmIsolation + 1;
          boxScore.tpaIsolation = boxScore.tpaIsolation + 1;
          boxScore.fgmIsolation = boxScore.fgmIsolation + 1;
          boxScore.fgaIsolation = boxScore.fgaIsolation + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaIsolation = boxScore.tpaIsolation + 1;
          boxScore.fgaIsolation = boxScore.fgaIsolation + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmIsolation = boxScore.fgmIsolation + 1;
          boxScore.fgaIsolation = boxScore.fgaIsolation + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaIsolation = boxScore.fgaIsolation + 1;
        }
        break;
      case PlayType.FASTBREAK:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmFastBreak = boxScore.tpmFastBreak + 1;
          boxScore.tpaFastBreak = boxScore.tpaFastBreak + 1;
          boxScore.fgmFastBreak = boxScore.fgmFastBreak + 1;
          boxScore.fgaFastBreak = boxScore.fgaFastBreak + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaFastBreak = boxScore.tpaFastBreak + 1;
          boxScore.fgaFastBreak = boxScore.fgaFastBreak + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmFastBreak = boxScore.fgmFastBreak + 1;
          boxScore.fgaFastBreak = boxScore.fgaFastBreak + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaFastBreak = boxScore.fgaFastBreak + 1;
        }
        break;
      case PlayType.PICK_AND_ROLL_BALL_HANDLER:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmHandler = boxScore.tpmHandler + 1;
          boxScore.tpaHandler = boxScore.tpaHandler + 1;
          boxScore.fgmHandler = boxScore.fgmHandler + 1;
          boxScore.fgaHandler = boxScore.fgaHandler + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaHandler = boxScore.tpaHandler + 1;
          boxScore.fgaHandler = boxScore.fgaHandler + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmHandler = boxScore.fgmHandler + 1;
          boxScore.fgaHandler = boxScore.fgaHandler + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaHandler = boxScore.fgaHandler + 1;
        }
        break;
      case PlayType.PICK_AND_ROLL_ROLL_MAN:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmRoller = boxScore.tpmRoller + 1;
          boxScore.tpaRoller = boxScore.tpaRoller + 1;
          boxScore.fgmRoller = boxScore.fgmRoller + 1;
          boxScore.fgaRoller = boxScore.fgaRoller + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaRoller = boxScore.tpaRoller + 1;
          boxScore.fgaRoller = boxScore.fgaRoller + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmRoller = boxScore.fgmRoller + 1;
          boxScore.fgaRoller = boxScore.fgaRoller + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaRoller = boxScore.fgaRoller + 1;
        }
        break;
      case PlayType.POSTUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmPostUp = boxScore.tpmPostUp + 1;
          boxScore.tpaPostUp = boxScore.tpaPostUp + 1;
          boxScore.fgmPostUp = boxScore.fgmPostUp + 1;
          boxScore.fgaPostUp = boxScore.fgaPostUp + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaPostUp = boxScore.tpaPostUp + 1;
          boxScore.fgaPostUp = boxScore.fgaPostUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmPostUp = boxScore.fgmPostUp + 1;
          boxScore.fgaPostUp = boxScore.fgaPostUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaPostUp = boxScore.fgaPostUp + 1;
        }
        break;
      case PlayType.SPOTUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmSpotUp = boxScore.tpmSpotUp + 1;
          boxScore.tpaSpotUp = boxScore.tpaSpotUp + 1;
          boxScore.fgmSpotUp = boxScore.fgmSpotUp + 1;
          boxScore.fgaSpotUp = boxScore.fgaSpotUp + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaSpotUp = boxScore.tpaSpotUp + 1;
          boxScore.fgaSpotUp = boxScore.fgaSpotUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmSpotUp = boxScore.fgmSpotUp + 1;
          boxScore.fgaSpotUp = boxScore.fgaSpotUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaSpotUp = boxScore.fgaSpotUp + 1;
        }
        break;
      case PlayType.HANDOFF:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmHandOff = boxScore.tpmHandOff + 1;
          boxScore.tpaHandOff = boxScore.tpaHandOff + 1;
          boxScore.fgmHandOff = boxScore.fgmHandOff + 1;
          boxScore.fgaHandOff = boxScore.fgaHandOff + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaHandOff = boxScore.tpaHandOff + 1;
          boxScore.fgaHandOff = boxScore.fgaHandOff + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmHandOff = boxScore.fgmHandOff + 1;
          boxScore.fgaHandOff = boxScore.fgaHandOff + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaHandOff = boxScore.fgaHandOff + 1;
        }
        break;
      case PlayType.CUT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmCut = boxScore.tpmCut + 1;
          boxScore.tpaCut = boxScore.tpaCut + 1;
          boxScore.fgmCut = boxScore.fgmCut + 1;
          boxScore.fgaCut = boxScore.fgaCut + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaCut = boxScore.tpaCut + 1;
          boxScore.fgaCut = boxScore.fgaCut + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmCut = boxScore.fgmCut + 1;
          boxScore.fgaCut = boxScore.fgaCut + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaCut = boxScore.fgaCut + 1;
        }
        break;
      case PlayType.OFF_SCREEN:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmOffScreen = boxScore.tpmOffScreen + 1;
          boxScore.tpaOffScreen = boxScore.tpaOffScreen + 1;
          boxScore.fgmOffScreen = boxScore.fgmOffScreen + 1;
          boxScore.fgaOffScreen = boxScore.fgaOffScreen + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaOffScreen = boxScore.tpaOffScreen + 1;
          boxScore.fgaOffScreen = boxScore.fgaOffScreen + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmOffScreen = boxScore.fgmOffScreen + 1;
          boxScore.fgaOffScreen = boxScore.fgaOffScreen + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaOffScreen = boxScore.fgaOffScreen + 1;
        }
        break;
      case PlayType.SECOND_CHANCE:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmSecondChance = boxScore.tpmSecondChance + 1;
          boxScore.tpaSecondChance = boxScore.tpaSecondChance + 1;
          boxScore.fgmSecondChance = boxScore.fgmSecondChance + 1;
          boxScore.fgaSecondChance = boxScore.fgaSecondChance + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaSecondChance = boxScore.tpaSecondChance + 1;
          boxScore.fgaSecondChance = boxScore.fgaSecondChance + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmSecondChance = boxScore.fgmSecondChance + 1;
          boxScore.fgaSecondChance = boxScore.fgaSecondChance + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaSecondChance = boxScore.fgaSecondChance + 1;
        }
        break;
    }

    switch(shotType){
      case ShotType.NONE:
        break;
      case ShotType.LAYUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmLayup = boxScore.tpmLayup + 1;
          boxScore.tpaLayup = boxScore.tpaLayup + 1;
          boxScore.fgmLayup = boxScore.fgmLayup + 1;
          boxScore.fgaLayup = boxScore.fgaLayup + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaLayup = boxScore.tpaLayup + 1;
          boxScore.fgaLayup = boxScore.fgaLayup + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmLayup = boxScore.fgmLayup + 1;
          boxScore.fgaLayup = boxScore.fgaLayup + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaLayup = boxScore.fgaLayup + 1;
        }
        break;
      case ShotType.CATCH_AND_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmCatchAndShot = boxScore.tpmCatchAndShot + 1;
          boxScore.tpaCatchAndShot = boxScore.tpaCatchAndShot + 1;
          boxScore.fgmCatchAndShot = boxScore.fgmCatchAndShot + 1;
          boxScore.fgaCatchAndShot = boxScore.fgaCatchAndShot + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaCatchAndShot = boxScore.tpaCatchAndShot + 1;
          boxScore.fgaCatchAndShot = boxScore.fgaCatchAndShot + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmCatchAndShot = boxScore.fgmCatchAndShot + 1;
          boxScore.fgaCatchAndShot = boxScore.fgaCatchAndShot + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaCatchAndShot = boxScore.fgaCatchAndShot + 1;
        }
        break;
      case ShotType.PULLUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmPullUp = boxScore.tpmPullUp + 1;
          boxScore.tpaPullUp = boxScore.tpaPullUp + 1;
          boxScore.fgmPullUp = boxScore.fgmPullUp + 1;
          boxScore.fgaPullUp = boxScore.fgaPullUp + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaPullUp = boxScore.tpaPullUp + 1;
          boxScore.fgaPullUp = boxScore.fgaPullUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmPullUp = boxScore.fgmPullUp + 1;
          boxScore.fgaPullUp = boxScore.fgaPullUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaPullUp = boxScore.fgaPullUp + 1;
        }
        break;
      case ShotType.FLOATING_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmFloating = boxScore.tpmFloating + 1;
          boxScore.tpaFloating = boxScore.tpaFloating + 1;
          boxScore.fgmFloating = boxScore.fgmFloating + 1;
          boxScore.fgaFloating = boxScore.fgaFloating + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaFloating = boxScore.tpaFloating + 1;
          boxScore.fgaFloating = boxScore.fgaFloating + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmFloating = boxScore.fgmFloating + 1;
          boxScore.fgaFloating = boxScore.fgaFloating + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaFloating = boxScore.fgaFloating + 1;
        }
        break;
      case ShotType.HOOK_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmHook = boxScore.tpmHook + 1;
          boxScore.tpaHook = boxScore.tpaHook + 1;
          boxScore.fgmHook = boxScore.fgmHook + 1;
          boxScore.fgaHook = boxScore.fgaHook + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaHook = boxScore.tpaHook + 1;
          boxScore.fgaHook = boxScore.fgaHook + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmHook = boxScore.fgmHook + 1;
          boxScore.fgaHook = boxScore.fgaHook + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaHook = boxScore.fgaHook + 1;
        }
        break;
      case ShotType.TIP_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmTip = boxScore.tpmTip + 1;
          boxScore.tpaTip = boxScore.tpaTip + 1;
          boxScore.fgmTip = boxScore.fgmTip + 1;
          boxScore.fgaTip = boxScore.fgaTip + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaTip = boxScore.tpaTip + 1;
          boxScore.fgaTip = boxScore.fgaTip + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmTip = boxScore.fgmTip + 1;
          boxScore.fgaTip = boxScore.fgaTip + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaTip = boxScore.fgaTip + 1;
        }
        break;
      case ShotType.FADEAWAY:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmFadeAway = boxScore.tpmFadeAway + 1;
          boxScore.tpaFadeAway = boxScore.tpaFadeAway + 1;
          boxScore.fgmFadeAway = boxScore.fgmFadeAway + 1;
          boxScore.fgaFadeAway = boxScore.fgaFadeAway + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaFadeAway = boxScore.tpaFadeAway + 1;
          boxScore.fgaFadeAway = boxScore.fgaFadeAway + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmFadeAway = boxScore.fgmFadeAway + 1;
          boxScore.fgaFadeAway = boxScore.fgaFadeAway + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaFadeAway = boxScore.fgaFadeAway + 1;
        }
        break;
      case ShotType.DUNK:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmDunk = boxScore.tpmDunk + 1;
          boxScore.tpaDunk = boxScore.tpaDunk + 1;
          boxScore.fgmDunk = boxScore.fgmDunk + 1;
          boxScore.fgaDunk = boxScore.fgaDunk + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaDunk = boxScore.tpaDunk + 1;
          boxScore.fgaDunk = boxScore.fgaDunk + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmDunk = boxScore.fgmDunk + 1;
          boxScore.fgaDunk = boxScore.fgaDunk + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaDunk = boxScore.fgaDunk + 1;
        }
        break;
      case ShotType.ALLEY_OOP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmAlleyOop = boxScore.tpmAlleyOop + 1;
          boxScore.tpaAlleyOop = boxScore.tpaAlleyOop + 1;
          boxScore.fgmAlleyOop = boxScore.fgmAlleyOop + 1;
          boxScore.fgaAlleyOop = boxScore.fgaAlleyOop + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaAlleyOop = boxScore.tpaAlleyOop + 1;
          boxScore.fgaAlleyOop = boxScore.fgaAlleyOop + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmAlleyOop = boxScore.fgmAlleyOop + 1;
          boxScore.fgaAlleyOop = boxScore.fgaAlleyOop + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaAlleyOop = boxScore.fgaAlleyOop + 1;
        }
        break;
    }

    // TODO:: プレイヤーのショットゾーン別のスタッツもあったほうがいい？？

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });

    if (supportPlayerId == null) {
      return;
    }
    final supportPlayerBoxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(boxScore.game.value!.id))
        .and()
        .player((q) => q.idEqualTo(supportPlayerId))
        .onCourtEqualTo(true)
        .findFirstSync();

    if (supportPlayerBoxScore == null) {
      return;
    }

    if (fgResult == FgResult.TWO_POINT_MADE || fgResult == FgResult.THREE_POINT_MADE) {
      supportPlayerBoxScore.ast = supportPlayerBoxScore.ast+1;
    } else if (fgResult == FgResult.TWO_POINT_MISS || fgResult == FgResult.THREE_POINT_MISS) {
      supportPlayerBoxScore.reb = supportPlayerBoxScore.reb+1;
      supportPlayerBoxScore.oReb = supportPlayerBoxScore.oReb+1;
    }

    isar.writeTxnSync(() {
      isar.boxscores.putSync(supportPlayerBoxScore);
    });
  }

  void modifyShot(Boxscore boxScore, FgResult fgResult, int? supportPlayerId, PlayType playType, ShotType shotType, ShotZone shotZone) {

    if (fgResult == FgResult.NONE) {
      // TODO:: ERROR
      return;
    }

    switch (fgResult){
      case FgResult.NONE:
        // 通らない
        break;
      case FgResult.TWO_POINT_MADE:
        boxScore.fga-=1;
        boxScore.fgm-=1;
        if (boxScore.fga == 0) {
          boxScore.fgRatio = 0.0;
        } else {
          boxScore.fgRatio = ((boxScore.fgm / boxScore.fga) * 100 * 10).round() / 10;
        }
        boxScore.pts-=2;
        break;
      case FgResult.TWO_POINT_MISS:
        boxScore.fga-=1;
        if (boxScore.fga == 0) {
          boxScore.fgRatio = 0.0;
        } else {
          boxScore.fgRatio = ((boxScore.fgm / boxScore.fga) * 100 * 10).round() / 10;
        }
        break;
      case FgResult.THREE_POINT_MADE:
        boxScore.tpa-=1;
        boxScore.tpm-=1;
        if (boxScore.tpa == 0) {
          boxScore.tpRatio = 0.0;
        } else {
          boxScore.tpRatio = ((boxScore.tpm / boxScore.tpa) * 100 * 10).round() / 10;
        }
        boxScore.fga-=1;
        boxScore.fgm-=1;
        if (boxScore.fga == 0) {
          boxScore.fgRatio = 0.0;
        } else {
          boxScore.fgRatio = ((boxScore.fgm / boxScore.fga) * 100 * 10).round() / 10;
        }
        boxScore.pts-=3;
        break;
      case FgResult.THREE_POINT_MISS:
        boxScore.tpa-=1;
        if (boxScore.tpa == 0) {
          boxScore.tpRatio = 0.0;
        } else {
          boxScore.tpRatio = ((boxScore.tpm / boxScore.tpa) * 100 * 10).round() / 10;
        }
        boxScore.fga-=1;
        if (boxScore.fga == 0) {
          boxScore.fgRatio = 0.0;
        } else {
          boxScore.fgRatio = ((boxScore.fgm / boxScore.fga) * 100 * 10).round() / 10;
        }
        break;
    }

    switch(playType) {
      case PlayType.NONE:
        break;
      case PlayType.ISOLATION:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmIsolation = boxScore.tpmIsolation - 1;
          boxScore.tpaIsolation = boxScore.tpaIsolation - 1;
          boxScore.fgmIsolation = boxScore.fgmIsolation - 1;
          boxScore.fgaIsolation = boxScore.fgaIsolation - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaIsolation = boxScore.tpaIsolation - 1;
          boxScore.fgaIsolation = boxScore.fgaIsolation - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmIsolation = boxScore.fgmIsolation - 1;
          boxScore.fgaIsolation = boxScore.fgaIsolation - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaIsolation = boxScore.fgaIsolation - 1;
        }
        break;
      case PlayType.FASTBREAK:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmFastBreak = boxScore.tpmFastBreak - 1;
          boxScore.tpaFastBreak = boxScore.tpaFastBreak - 1;
          boxScore.fgmFastBreak = boxScore.fgmFastBreak - 1;
          boxScore.fgaFastBreak = boxScore.fgaFastBreak - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaFastBreak = boxScore.tpaFastBreak - 1;
          boxScore.fgaFastBreak = boxScore.fgaFastBreak - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmFastBreak = boxScore.fgmFastBreak - 1;
          boxScore.fgaFastBreak = boxScore.fgaFastBreak - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaFastBreak = boxScore.fgaFastBreak - 1;
        }
        break;
      case PlayType.PICK_AND_ROLL_BALL_HANDLER:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmHandler = boxScore.tpmHandler - 1;
          boxScore.tpaHandler = boxScore.tpaHandler - 1;
          boxScore.fgmHandler = boxScore.fgmHandler - 1;
          boxScore.fgaHandler = boxScore.fgaHandler - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaHandler = boxScore.tpaHandler - 1;
          boxScore.fgaHandler = boxScore.fgaHandler - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmHandler = boxScore.fgmHandler - 1;
          boxScore.fgaHandler = boxScore.fgaHandler - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaHandler = boxScore.fgaHandler - 1;
        }
        break;
      case PlayType.PICK_AND_ROLL_ROLL_MAN:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmRoller = boxScore.tpmRoller - 1;
          boxScore.tpaRoller = boxScore.tpaRoller - 1;
          boxScore.fgmRoller = boxScore.fgmRoller - 1;
          boxScore.fgaRoller = boxScore.fgaRoller - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaRoller = boxScore.tpaRoller - 1;
          boxScore.fgaRoller = boxScore.fgaRoller - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmRoller = boxScore.fgmRoller - 1;
          boxScore.fgaRoller = boxScore.fgaRoller - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaRoller = boxScore.fgaRoller - 1;
        }
        break;
      case PlayType.POSTUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmPostUp = boxScore.tpmPostUp - 1;
          boxScore.tpaPostUp = boxScore.tpaPostUp - 1;
          boxScore.fgmPostUp = boxScore.fgmPostUp - 1;
          boxScore.fgaPostUp = boxScore.fgaPostUp - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaPostUp = boxScore.tpaPostUp - 1;
          boxScore.fgaPostUp = boxScore.fgaPostUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmPostUp = boxScore.fgmPostUp - 1;
          boxScore.fgaPostUp = boxScore.fgaPostUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaPostUp = boxScore.fgaPostUp - 1;
        }
        break;
      case PlayType.SPOTUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmSpotUp = boxScore.tpmSpotUp - 1;
          boxScore.tpaSpotUp = boxScore.tpaSpotUp - 1;
          boxScore.fgmSpotUp = boxScore.fgmSpotUp - 1;
          boxScore.fgaSpotUp = boxScore.fgaSpotUp - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaSpotUp = boxScore.tpaSpotUp - 1;
          boxScore.fgaSpotUp = boxScore.fgaSpotUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmSpotUp = boxScore.fgmSpotUp - 1;
          boxScore.fgaSpotUp = boxScore.fgaSpotUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaSpotUp = boxScore.fgaSpotUp - 1;
        }
        break;
      case PlayType.HANDOFF:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmHandOff = boxScore.tpmHandOff - 1;
          boxScore.tpaHandOff = boxScore.tpaHandOff - 1;
          boxScore.fgmHandOff = boxScore.fgmHandOff - 1;
          boxScore.fgaHandOff = boxScore.fgaHandOff - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaHandOff = boxScore.tpaHandOff - 1;
          boxScore.fgaHandOff = boxScore.fgaHandOff - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmHandOff = boxScore.fgmHandOff - 1;
          boxScore.fgaHandOff = boxScore.fgaHandOff - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaHandOff = boxScore.fgaHandOff - 1;
        }
        break;
      case PlayType.CUT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmCut = boxScore.tpmCut - 1;
          boxScore.tpaCut = boxScore.tpaCut - 1;
          boxScore.fgmCut = boxScore.fgmCut - 1;
          boxScore.fgaCut = boxScore.fgaCut - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaCut = boxScore.tpaCut - 1;
          boxScore.fgaCut = boxScore.fgaCut - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmCut = boxScore.fgmCut - 1;
          boxScore.fgaCut = boxScore.fgaCut - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaCut = boxScore.fgaCut - 1;
        }
        break;
      case PlayType.OFF_SCREEN:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmOffScreen = boxScore.tpmOffScreen - 1;
          boxScore.tpaOffScreen = boxScore.tpaOffScreen - 1;
          boxScore.fgmOffScreen = boxScore.fgmOffScreen - 1;
          boxScore.fgaOffScreen = boxScore.fgaOffScreen - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaOffScreen = boxScore.tpaOffScreen - 1;
          boxScore.fgaOffScreen = boxScore.fgaOffScreen - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmOffScreen = boxScore.fgmOffScreen - 1;
          boxScore.fgaOffScreen = boxScore.fgaOffScreen - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaOffScreen = boxScore.fgaOffScreen - 1;
        }
        break;
      case PlayType.SECOND_CHANCE:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmSecondChance = boxScore.tpmSecondChance - 1;
          boxScore.tpaSecondChance = boxScore.tpaSecondChance - 1;
          boxScore.fgmSecondChance = boxScore.fgmSecondChance - 1;
          boxScore.fgaSecondChance = boxScore.fgaSecondChance - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaSecondChance = boxScore.tpaSecondChance - 1;
          boxScore.fgaSecondChance = boxScore.fgaSecondChance - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmSecondChance = boxScore.fgmSecondChance - 1;
          boxScore.fgaSecondChance = boxScore.fgaSecondChance - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaSecondChance = boxScore.fgaSecondChance - 1;
        }
        break;
    }

    switch(shotType){
      case ShotType.NONE:
        break;
      case ShotType.LAYUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmLayup = boxScore.tpmLayup - 1;
          boxScore.tpaLayup = boxScore.tpaLayup - 1;
          boxScore.fgmLayup = boxScore.fgmLayup - 1;
          boxScore.fgaLayup = boxScore.fgaLayup - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaLayup = boxScore.tpaLayup - 1;
          boxScore.fgaLayup = boxScore.fgaLayup - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmLayup = boxScore.fgmLayup - 1;
          boxScore.fgaLayup = boxScore.fgaLayup - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaLayup = boxScore.fgaLayup - 1;
        }
        break;
      case ShotType.CATCH_AND_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmCatchAndShot = boxScore.tpmCatchAndShot - 1;
          boxScore.tpaCatchAndShot = boxScore.tpaCatchAndShot - 1;
          boxScore.fgmCatchAndShot = boxScore.fgmCatchAndShot - 1;
          boxScore.fgaCatchAndShot = boxScore.fgaCatchAndShot - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaCatchAndShot = boxScore.tpaCatchAndShot - 1;
          boxScore.fgaCatchAndShot = boxScore.fgaCatchAndShot - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmCatchAndShot = boxScore.fgmCatchAndShot - 1;
          boxScore.fgaCatchAndShot = boxScore.fgaCatchAndShot - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaCatchAndShot = boxScore.fgaCatchAndShot - 1;
        }
        break;
      case ShotType.PULLUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmPullUp = boxScore.tpmPullUp - 1;
          boxScore.tpaPullUp = boxScore.tpaPullUp - 1;
          boxScore.fgmPullUp = boxScore.fgmPullUp - 1;
          boxScore.fgaPullUp = boxScore.fgaPullUp - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaPullUp = boxScore.tpaPullUp - 1;
          boxScore.fgaPullUp = boxScore.fgaPullUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmPullUp = boxScore.fgmPullUp - 1;
          boxScore.fgaPullUp = boxScore.fgaPullUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaPullUp = boxScore.fgaPullUp - 1;
        }
        break;
      case ShotType.FLOATING_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmFloating = boxScore.tpmFloating - 1;
          boxScore.tpaFloating = boxScore.tpaFloating - 1;
          boxScore.fgmFloating = boxScore.fgmFloating - 1;
          boxScore.fgaFloating = boxScore.fgaFloating - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaFloating = boxScore.tpaFloating - 1;
          boxScore.fgaFloating = boxScore.fgaFloating - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmFloating = boxScore.fgmFloating - 1;
          boxScore.fgaFloating = boxScore.fgaFloating - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaFloating = boxScore.fgaFloating - 1;
        }
        break;
      case ShotType.HOOK_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmHook = boxScore.tpmHook - 1;
          boxScore.tpaHook = boxScore.tpaHook - 1;
          boxScore.fgmHook = boxScore.fgmHook - 1;
          boxScore.fgaHook = boxScore.fgaHook - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaHook = boxScore.tpaHook - 1;
          boxScore.fgaHook = boxScore.fgaHook - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmHook = boxScore.fgmHook - 1;
          boxScore.fgaHook = boxScore.fgaHook - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaHook = boxScore.fgaHook - 1;
        }
        break;
      case ShotType.TIP_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmTip = boxScore.tpmTip - 1;
          boxScore.tpaTip = boxScore.tpaTip - 1;
          boxScore.fgmTip = boxScore.fgmTip - 1;
          boxScore.fgaTip = boxScore.fgaTip - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaTip = boxScore.tpaTip - 1;
          boxScore.fgaTip = boxScore.fgaTip - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmTip = boxScore.fgmTip - 1;
          boxScore.fgaTip = boxScore.fgaTip - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaTip = boxScore.fgaTip - 1;
        }
        break;
      case ShotType.FADEAWAY:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmFadeAway = boxScore.tpmFadeAway - 1;
          boxScore.tpaFadeAway = boxScore.tpaFadeAway - 1;
          boxScore.fgmFadeAway = boxScore.fgmFadeAway - 1;
          boxScore.fgaFadeAway = boxScore.fgaFadeAway - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaFadeAway = boxScore.tpaFadeAway - 1;
          boxScore.fgaFadeAway = boxScore.fgaFadeAway - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmFadeAway = boxScore.fgmFadeAway - 1;
          boxScore.fgaFadeAway = boxScore.fgaFadeAway - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaFadeAway = boxScore.fgaFadeAway - 1;
        }
        break;
      case ShotType.DUNK:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmDunk = boxScore.tpmDunk - 1;
          boxScore.tpaDunk = boxScore.tpaDunk - 1;
          boxScore.fgmDunk = boxScore.fgmDunk - 1;
          boxScore.fgaDunk = boxScore.fgaDunk - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaDunk = boxScore.tpaDunk - 1;
          boxScore.fgaDunk = boxScore.fgaDunk - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmDunk = boxScore.fgmDunk - 1;
          boxScore.fgaDunk = boxScore.fgaDunk - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaDunk = boxScore.fgaDunk - 1;
        }
        break;
      case ShotType.ALLEY_OOP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          boxScore.tpmAlleyOop = boxScore.tpmAlleyOop - 1;
          boxScore.tpaAlleyOop = boxScore.tpaAlleyOop - 1;
          boxScore.fgmAlleyOop = boxScore.fgmAlleyOop - 1;
          boxScore.fgaAlleyOop = boxScore.fgaAlleyOop - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          boxScore.tpaAlleyOop = boxScore.tpaAlleyOop - 1;
          boxScore.fgaAlleyOop = boxScore.fgaAlleyOop - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          boxScore.fgmAlleyOop = boxScore.fgmAlleyOop - 1;
          boxScore.fgaAlleyOop = boxScore.fgaAlleyOop - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          boxScore.fgaAlleyOop = boxScore.fgaAlleyOop - 1;
        }
        break;
    }

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });

    // アシストされていなければここで終了
    if (supportPlayerId == null) {
      return;
    }

    final supportPlayerBoxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(boxScore.game.value!.id))
        .and()
        .player((q) => q.idEqualTo(supportPlayerId))
        .findFirstSync();

    if (supportPlayerBoxScore == null) {
      return;
    }

    if (fgResult == FgResult.TWO_POINT_MADE || fgResult == FgResult.THREE_POINT_MADE) {
      supportPlayerBoxScore.ast-=1;
    } else if (fgResult == FgResult.TWO_POINT_MISS || fgResult == FgResult.THREE_POINT_MISS) {
      supportPlayerBoxScore.reb-=1;
      supportPlayerBoxScore.oReb-=1;
    }

    isar.writeTxnSync(() {
      isar.boxscores.putSync(supportPlayerBoxScore);
    });
  }

  void makeFreeThrow(int gameId, int playerId, FtResult ftResult) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .player((q) => q.idEqualTo(playerId))
        .and()
        .onCourtEqualTo(true)
        .findFirstSync();

    if (boxScore == null) {
      return;
    }

    switch (ftResult) {
      case FtResult.FT_MADE:
        boxScore.pts = boxScore.pts+1;
        boxScore.ftm = boxScore.ftm+1;
        boxScore.fta = boxScore.fta+1;
        boxScore.ftRatio = ((boxScore.ftm / boxScore.fta) * 100 * 10).round() / 10;
        break;
      case FtResult.FT_MISS:
        boxScore.fta = boxScore.fta+1;
        boxScore.ftRatio = ((boxScore.ftm / boxScore.fta) * 100 * 10).round() / 10;
        break;
    }

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void modifyFreeThrow(int gameId, int playerId, FtResult ftResult) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .player((q) => q.idEqualTo(playerId))
        .findFirstSync();

    if (boxScore == null) {
      return;
    }

    switch (ftResult) {
      case FtResult.FT_MADE:
        boxScore.pts-=1;
        boxScore.ftm-=1;
        boxScore.fta-=1;
        if (boxScore.fta == 0) {
          boxScore.ftRatio = 0.0;
        } else {
          boxScore.ftRatio = ((boxScore.ftm / boxScore.fta) * 100 * 10).round() / 10;
        }
        break;
      case FtResult.FT_MISS:
        boxScore.fta-=1;
        if (boxScore.fta == 0) {
          boxScore.ftRatio = 0.0;
        } else {
          boxScore.ftRatio = ((boxScore.ftm / boxScore.fta) * 100 * 10).round() / 10;
        }
        break;
    }

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void makeRebound(int gameId, int playerId, RecordType recordType) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId)).and()
        .player((q) => q.idEqualTo(playerId))
        .onCourtEqualTo(true).findFirstSync();

    if (boxScore == null) {
      return;
    }

    switch (recordType) {
      case RecordType.OFFENCE_REBOUND:
        boxScore.oReb = boxScore.oReb+1;
        break;
      case RecordType.DEFENCE_REBOUND:
        boxScore.dReb = boxScore.dReb+1;
        break;
      default:
        break;
    }
    boxScore.reb = boxScore.reb+1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void modifyRebound(int gameId, int playerId, RecordType recordType) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .player((q) => q.idEqualTo(playerId))
        .findFirstSync();

    if (boxScore == null) {
      return;
    }

    switch (recordType) {
      case RecordType.OFFENCE_REBOUND:
        boxScore.oReb-=1;
        break;
      case RecordType.DEFENCE_REBOUND:
        boxScore.dReb-=1;
        break;
      default:
        break;
    }
    boxScore.reb-=1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void makeBlock(int gameId, int playerId) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId)).and()
        .player((q) => q.idEqualTo(playerId))
        .onCourtEqualTo(true).findFirstSync();

    if (boxScore == null) {
      return;
    }

    boxScore.blk = boxScore.blk+1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void modifyBlock(int gameId, int playerId) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .player((q) => q.idEqualTo(playerId))
        .findFirstSync();

    if (boxScore == null) {
      return;
    }

    boxScore.blk-=1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void makeSteal(int gameId, int playerId) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId)).and()
        .player((q) => q.idEqualTo(playerId))
        .onCourtEqualTo(true).findFirstSync();

    if (boxScore == null) {
      return;
    }

    boxScore.stl = boxScore.stl+1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void modifySteal(int gameId, int playerId) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .player((q) => q.idEqualTo(playerId))
        .findFirstSync();

    if (boxScore == null) {
      return;
    }

    boxScore.stl-=1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void makeAssist(int gameId, int playerId) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId)).and()
        .player((q) => q.idEqualTo(playerId))
        .onCourtEqualTo(true).findFirstSync();

    if (boxScore == null) {
      return;
    }

    boxScore.ast = boxScore.ast+1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void modifyAssist(int gameId, int playerId) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .player((q) => q.idEqualTo(playerId))
        .findFirstSync();

    if (boxScore == null) {
      return;
    }

    boxScore.ast-=1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void makeTurnover(int gameId, int playerId) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId)).and()
        .player((q) => q.idEqualTo(playerId))
        .onCourtEqualTo(true).findFirstSync();

    if (boxScore == null) {
      return;
    }

    boxScore.to = boxScore.to+1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void modifyTurnover(int gameId, int playerId) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .player((q) => q.idEqualTo(playerId))
        .findFirstSync();

    if (boxScore == null) {
      return;
    }

    boxScore.to-=1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void makeFoul(int gameId, int playerId) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId)).and()
        .player((q) => q.idEqualTo(playerId))
        .onCourtEqualTo(true).findFirstSync();

    if (boxScore == null) {
      return;
    }

    boxScore.pf = boxScore.pf+1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void modifyFoul(int gameId, int playerId) {
    final boxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .player((q) => q.idEqualTo(playerId))
        .findFirstSync();

    if (boxScore == null) {
      return;
    }

    boxScore.pf-=1;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(boxScore);
    });
  }

  void substitute(int gameId, Player substitutePlayer, Player onCourtPlayer) {
    final substitutePlayerBoxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .player((q) => q.idEqualTo(substitutePlayer.id))
        .findFirstSync();

    final onCourtPlayerBoxScore = isar.boxscores.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .player((q) => q.idEqualTo(onCourtPlayer.id))
        .findFirstSync();

    if (substitutePlayerBoxScore == null || onCourtPlayerBoxScore == null) {
      return;
    }

    substitutePlayerBoxScore.onCourt = true;
    onCourtPlayerBoxScore.onCourt = false;

    isar.writeTxnSync(() {
      isar.boxscores.putSync(substitutePlayerBoxScore);
      isar.boxscores.putSync(onCourtPlayerBoxScore);
    });
  }

  List<dynamic> getSeasonStats(int playerId, DateTime? start, DateTime? end) {
    QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> queryBuilder;

    queryBuilder = isar.boxscores.filter().player((q) => q.idEqualTo(playerId));

    if (start != null) {
      queryBuilder = queryBuilder.game((q) => q.gameDateGreaterThan(start, include: true));
    }

    if (end != null) {
      queryBuilder = queryBuilder.game((q) => q.gameDateLessThan(end,include: true));
    }

    List<Boxscore> seasonBoxScores = queryBuilder.findAllSync();

    int count = seasonBoxScores.length;
    if (count == 0) {
      List<dynamic> seasonStats = [0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0,0.0];
      return seasonStats;
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

    for (var boxScore in seasonBoxScores) {
      ptsSum = ptsSum + boxScore.pts;
      fgmSum = fgmSum + boxScore.fgm;
      fgaSum = fgaSum + boxScore.fga;
      tpmSum = tpmSum + boxScore.tpm;
      tpaSum = tpaSum + boxScore.tpa;
      ftmSum = ftmSum + boxScore.ftm;
      ftaSum = ftaSum + boxScore.fta;
      oRebSum = oRebSum + boxScore.oReb;
      dRebSum = dRebSum + boxScore.dReb;
      rebSum = rebSum + boxScore.reb;
      astSum = astSum + boxScore.ast;
      toSum = toSum + boxScore.to;
      stlSum = stlSum + boxScore.stl;
      blkSum = blkSum + boxScore.blk;
      pfSum = pfSum + boxScore.pf;
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

    List<dynamic> seasonStats = [
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

    return seasonStats;
  }

  List<List<dynamic>> getShotTypeStatsByPlayer(DateTime? start, DateTime? end, int playerId, int columnIndex, bool ascending) {
    if (!isar.isOpen) {
      return [];
    }

    QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> queryBuilder = isar.boxscores.filter().player((q) => q.idEqualTo(playerId));

    if (start != null) {
      queryBuilder = queryBuilder.game((q) => q.gameDateGreaterThan(start, include: true));
    }

    if (end != null) {
      queryBuilder = queryBuilder.game((q) => q.gameDateLessThan(end, include: true));
    }

    List<Boxscore> boxScores = queryBuilder.findAllSync();
    int gameNum = queryBuilder.countSync();

    if (gameNum == 0) {
      return [
        ["ALLEY OOP", 0, 0, 0.0, 0, 0, 0.0],
        ["Catch&Shot", 0, 0, 0.0, 0, 0, 0.0],
        ["DUNK", 0, 0, 0.0, 0, 0, 0.0],
        ["FADE AWAY", 0, 0, 0.0, 0, 0, 0.0],
        ["FLOATING", 0, 0, 0.0, 0, 0, 0.0],
        ["HOOK SHOT", 0, 0, 0.0, 0, 0, 0.0],
        ["LAYUP", 0, 0, 0.0, 0, 0, 0.0],
        ["PULL UP", 0, 0, 0.0, 0, 0, 0.0],
        ["TIP SHOT", 0, 0, 0.0, 0, 0, 0.0],
      ];
    }

    int fgmAlleyOopSum = 0;
    int fgaAlleyOopSum = 0;
    double fgRatioAlleyOop = 0.0;
    int tpmAlleyOopSum = 0;
    int tpaAlleyOopSum = 0;
    double tpRatioAlleyOop = 0.0;

    int fgmCatchAndShotSum = 0;
    int fgaCatchAndShotSum = 0;
    double fgRatioCatchAndShot = 0.0;
    int tpmCatchAndShotSum = 0;
    int tpaCatchAndShotSum = 0;
    double tpRatioCatchAndShot = 0.0;

    int fgmDunkSum = 0;
    int fgaDunkSum = 0;
    double fgRatioDunk = 0.0;
    int tpmDunkSum = 0;
    int tpaDunkSum = 0;
    double tpRatioDunk = 0.0;

    int fgmFadeAwaySum = 0;
    int fgaFadeAwaySum = 0;
    double fgRatioFadeAway = 0.0;
    int tpmFadeAwaySum = 0;
    int tpaFadeAwaySum = 0;
    double tpRatioFadeAway = 0.0;

    int fgmFloatingSum = 0;
    int fgaFloatingSum = 0;
    double fgRatioFloating = 0.0;
    int tpmFloatingSum = 0;
    int tpaFloatingSum = 0;
    double tpRatioFloating = 0.0;

    int fgmHookSum = 0;
    int fgaHookSum = 0;
    double fgRatioHook = 0.0;
    int tpmHookSum = 0;
    int tpaHookSum = 0;
    double tpRatioHook = 0.0;

    int fgmLayupSum = 0;
    int fgaLayupSum = 0;
    double fgRatioLayup = 0.0;
    int tpmLayupSum = 0;
    int tpaLayupSum = 0;
    double tpRatioLayup = 0.0;

    int fgmPullUpSum = 0;
    int fgaPullUpSum = 0;
    double fgRatioPullUp = 0.0;
    int tpmPullUpSum = 0;
    int tpaPullUpSum = 0;
    double tpRatioPullUp = 0.0;

    int fgmTipSum = 0;
    int fgaTipSum = 0;
    double fgRatioTip = 0.0;
    int tpmTipSum = 0;
    int tpaTipSum = 0;
    double tpRatioTip = 0.0;

    for (var boxScore in boxScores) {
      fgmAlleyOopSum = fgmAlleyOopSum + boxScore.fgmAlleyOop;
      fgaAlleyOopSum = fgaAlleyOopSum + boxScore.fgaAlleyOop;
      tpmAlleyOopSum = tpmAlleyOopSum + boxScore.tpmAlleyOop;
      tpaAlleyOopSum = tpaAlleyOopSum + boxScore.tpaAlleyOop;

      fgmCatchAndShotSum = fgmCatchAndShotSum + boxScore.fgmCatchAndShot;
      fgaCatchAndShotSum = fgaCatchAndShotSum + boxScore.fgaCatchAndShot;
      tpmCatchAndShotSum = tpmCatchAndShotSum + boxScore.tpmCatchAndShot;
      tpaCatchAndShotSum = tpaCatchAndShotSum + boxScore.tpaCatchAndShot;

      fgmDunkSum = fgmDunkSum + boxScore.fgmDunk;
      fgaDunkSum = fgaDunkSum + boxScore.fgaDunk;
      tpmDunkSum = tpmDunkSum + boxScore.tpmDunk;
      tpaDunkSum = tpaDunkSum + boxScore.tpaDunk;

      fgmFadeAwaySum = fgmFadeAwaySum + boxScore.fgmFadeAway;
      fgaFadeAwaySum = fgaFadeAwaySum + boxScore.fgaFadeAway;
      tpmFadeAwaySum = tpmFadeAwaySum + boxScore.tpmFadeAway;
      tpaFadeAwaySum = tpaFadeAwaySum + boxScore.tpaFadeAway;

      fgmFloatingSum = fgmFloatingSum + boxScore.fgmFloating;
      fgaFloatingSum = fgaFloatingSum + boxScore.fgaFloating;
      tpmFloatingSum = tpmFloatingSum + boxScore.tpmFloating;
      tpaFloatingSum = tpaFloatingSum + boxScore.tpaFloating;

      fgmHookSum = fgmHookSum + boxScore.fgmHook;
      fgaHookSum = fgaHookSum + boxScore.fgaHook;
      tpmHookSum = tpmHookSum + boxScore.tpmHook;
      tpaHookSum = tpaHookSum + boxScore.tpaHook;

      fgmLayupSum = fgmLayupSum + boxScore.fgmLayup;
      fgaLayupSum = fgaLayupSum + boxScore.fgaLayup;
      tpmLayupSum = tpmLayupSum + boxScore.tpmLayup;
      tpaLayupSum = tpaLayupSum + boxScore.tpaLayup;

      fgmAlleyOopSum = fgmAlleyOopSum + boxScore.fgmAlleyOop;
      fgaAlleyOopSum = fgaAlleyOopSum + boxScore.fgaAlleyOop;
      tpmAlleyOopSum = tpmAlleyOopSum + boxScore.tpmAlleyOop;
      tpaAlleyOopSum = tpaAlleyOopSum + boxScore.tpaAlleyOop;

      fgmPullUpSum = fgmPullUpSum + boxScore.fgmPullUp;
      fgaPullUpSum = fgaPullUpSum + boxScore.fgaPullUp;
      tpmPullUpSum = tpmPullUpSum + boxScore.tpmPullUp;
      tpaPullUpSum = tpaPullUpSum + boxScore.tpaPullUp;

      fgmTipSum = fgmTipSum + boxScore.fgmTip;
      fgaTipSum = fgaTipSum + boxScore.fgaTip;
      tpmTipSum = tpmTipSum + boxScore.tpmTip;
      tpaTipSum = tpaTipSum + boxScore.tpaTip;
    }

    double fgmAlleyOopAvg = ((fgmAlleyOopSum/gameNum) * 10).round() / 10;
    double fgaAlleyOopAvg = ((fgaAlleyOopSum/gameNum) * 10).round() / 10;
    double tpmAlleyOopAvg = ((tpmAlleyOopSum/gameNum) * 10).round() / 10;
    double tpaAlleyOopAvg = ((tpaAlleyOopSum/gameNum) * 10).round() / 10;
    if (fgaAlleyOopSum != 0) {
      fgRatioAlleyOop = ((fgmAlleyOopSum/fgaAlleyOopSum) * 100 * 10).round() / 10;
    }
    if (tpaAlleyOopSum != 0) {
      tpRatioAlleyOop = ((tpmAlleyOopSum/tpaAlleyOopSum) * 100 * 10).round() / 10;
    }
    List<dynamic> alleyOopStats = ["ALLEY OOP", fgmAlleyOopAvg, fgaAlleyOopAvg, fgRatioAlleyOop, tpmAlleyOopAvg, tpaAlleyOopAvg, tpRatioAlleyOop];

    double fgmCatchAndShotAvg = ((fgmCatchAndShotSum/gameNum) * 10).round() / 10;
    double fgaCatchAndShotAvg = ((fgaCatchAndShotSum/gameNum) * 10).round() / 10;
    double tpmCatchAndShotAvg = ((tpmCatchAndShotSum/gameNum) * 10).round() / 10;
    double tpaCatchAndShotAvg = ((tpaCatchAndShotSum/gameNum) * 10).round() / 10;
    if (fgaCatchAndShotSum != 0) {
      fgRatioCatchAndShot = ((fgmCatchAndShotSum/fgaCatchAndShotSum) * 100 * 10).round() / 10;
    }
    if (tpaCatchAndShotSum != 0) {
      tpRatioCatchAndShot = ((tpmCatchAndShotSum/tpaCatchAndShotSum) * 100 * 10).round() / 10;
    }
    List<dynamic> catchAndShotStats = ["Catch&Shot", fgmCatchAndShotAvg, fgaCatchAndShotAvg, fgRatioCatchAndShot, tpmCatchAndShotAvg, tpaCatchAndShotAvg, tpRatioCatchAndShot];

    double fgmDunkAvg = ((fgmDunkSum/gameNum) * 10).round() / 10;
    double fgaDunkAvg = ((fgaDunkSum/gameNum) * 10).round() / 10;
    double tpmDunkAvg = ((tpmDunkSum/gameNum) * 10).round() / 10;
    double tpaDunkAvg = ((tpaDunkSum/gameNum) * 10).round() / 10;
    if (fgaDunkSum != 0) {
      fgRatioDunk = ((fgmDunkSum/fgaDunkSum) * 100 * 10).round() / 10;
    }
    if (tpaDunkSum != 0) {
      tpRatioDunk = ((tpmDunkSum/tpaDunkSum) * 100 * 10).round() / 10;
    }
    List<dynamic> dunkStats = ["DUNK", fgmDunkAvg, fgaDunkAvg, fgRatioDunk, tpmDunkAvg, tpaDunkAvg, tpRatioDunk];

    double fgmFadeAwayAvg = ((fgmFadeAwaySum/gameNum) * 10).round() / 10;
    double fgaFadeAwayAvg = ((fgaFadeAwaySum/gameNum) * 10).round() / 10;
    double tpmFadeAwayAvg = ((tpmFadeAwaySum/gameNum) * 10).round() / 10;
    double tpaFadeAwayAvg = ((tpaFadeAwaySum/gameNum) * 10).round() / 10;
    if (fgaFadeAwaySum != 0) {
      fgRatioFadeAway = ((fgmFadeAwaySum/fgaFadeAwaySum) * 100 * 10).round() / 10;
    }
    if (tpaFadeAwaySum != 0) {
      tpRatioFadeAway = ((tpmFadeAwaySum/tpaFadeAwaySum) * 100 * 10).round() / 10;
    }
    List<dynamic> fadeAwayStats = ["FADE AWAY", fgmFadeAwayAvg, fgaFadeAwayAvg, fgRatioFadeAway, tpmFadeAwayAvg, tpaFadeAwayAvg, tpRatioFadeAway];

    double fgmFloatingAvg = ((fgmFloatingSum/gameNum) * 10).round() / 10;
    double fgaFloatingAvg = ((fgaFloatingSum/gameNum) * 10).round() / 10;
    double tpmFloatingAvg = ((tpmFloatingSum/gameNum) * 10).round() / 10;
    double tpaFloatingAvg = ((tpaFloatingSum/gameNum) * 10).round() / 10;
    if (fgaFloatingSum != 0) {
      fgRatioFloating = ((fgmFloatingSum/fgaFloatingSum) * 100 * 10).round() / 10;
    }
    if (tpaFloatingSum != 0) {
      tpRatioFloating = ((tpmFloatingSum/tpaFloatingSum) * 100 * 10).round() / 10;
    }
    List<dynamic> floatingStats = ["FLOATING", fgmFloatingAvg, fgaFloatingAvg, fgRatioFloating, tpmFloatingAvg, tpaFloatingAvg, tpRatioFloating];

    double fgmHookAvg = ((fgmHookSum/gameNum) * 10).round() / 10;
    double fgaHookAvg = ((fgaHookSum/gameNum) * 10).round() / 10;
    double tpmHookAvg = ((tpmHookSum/gameNum) * 10).round() / 10;
    double tpaHookAvg = ((tpaHookSum/gameNum) * 10).round() / 10;
    if (fgaHookSum != 0) {
      fgRatioHook = ((fgmHookSum/fgaHookSum) * 100 * 10).round() / 10;
    }
    if (tpaHookSum != 0) {
      tpRatioHook = ((tpmHookSum/tpaHookSum) * 100 * 10).round() / 10;
    }
    List<dynamic> hookStats = ["HOOK", fgmHookAvg, fgaHookAvg, fgRatioHook, tpmHookAvg, tpaHookAvg, tpRatioHook];

    double fgmLayupAvg = ((fgmLayupSum/gameNum) * 10).round() / 10;
    double fgaLayupAvg = ((fgaLayupSum/gameNum) * 10).round() / 10;
    double tpmLayupAvg = ((tpmLayupSum/gameNum) * 10).round() / 10;
    double tpaLayupAvg = ((tpaLayupSum/gameNum) * 10).round() / 10;
    if (fgaLayupSum != 0) {
      fgRatioLayup = ((fgmLayupSum/fgaLayupSum) * 100 * 10).round() / 10;
    }
    if (tpaLayupSum != 0) {
      tpRatioLayup = ((tpmLayupSum/tpaLayupSum) * 100 * 10).round() / 10;
    }
    List<dynamic> layupStats = ["LAYUP", fgmLayupAvg, fgaLayupAvg, fgRatioLayup, tpmLayupAvg, tpaLayupAvg, tpRatioLayup];

    double fgmPullUpAvg = ((fgmPullUpSum/gameNum) * 10).round() / 10;
    double fgaPullUpAvg = ((fgaPullUpSum/gameNum) * 10).round() / 10;
    double tpmPullUpAvg = ((tpmPullUpSum/gameNum) * 10).round() / 10;
    double tpaPullUpAvg = ((tpaPullUpSum/gameNum) * 10).round() / 10;
    if (fgaPullUpSum != 0) {
      fgRatioPullUp = ((fgmPullUpSum/fgaPullUpSum) * 100 * 10).round() / 10;
    }
    if (tpaPullUpSum != 0) {
      tpRatioPullUp = ((tpmPullUpSum/tpaPullUpSum) * 100 * 10).round() / 10;
    }
    List<dynamic> pullUpStats = ["PULL UP", fgmPullUpAvg, fgaPullUpAvg, fgRatioPullUp, tpmPullUpAvg, tpaPullUpAvg, tpRatioPullUp];

    double fgmTipAvg = ((fgmTipSum/gameNum) * 10).round() / 10;
    double fgaTipAvg = ((fgaTipSum/gameNum) * 10).round() / 10;
    double tpmTipAvg = ((tpmTipSum/gameNum) * 10).round() / 10;
    double tpaTipAvg = ((tpaTipSum/gameNum) * 10).round() / 10;
    if (fgaTipSum != 0) {
      fgRatioTip = ((fgmTipSum/fgaTipSum) * 100 * 10).round() / 10;
    }
    if (tpaTipSum != 0) {
      tpRatioTip = ((tpmTipSum/tpaTipSum) * 100 * 10).round() / 10;
    }
    List<dynamic> tipStats = ["TIP SHOT", fgmTipAvg, fgaTipAvg, fgRatioTip, tpmTipAvg, tpaTipAvg, tpRatioTip];

    List<List<dynamic>> shotTypeStats = [
      alleyOopStats,
      catchAndShotStats,
      dunkStats,
      fadeAwayStats,
      floatingStats,
      hookStats,
      layupStats,
      pullUpStats,
      tipStats,
    ];

    if (ascending) {
      shotTypeStats.sort((a, b) => a[columnIndex].compareTo(b[columnIndex]));
    } else {
      shotTypeStats.sort((a, b) => b[columnIndex].compareTo(a[columnIndex]));
    }

    return shotTypeStats;
  }
  
  List<List<dynamic>> getPlayTypeStatsByPlayer(DateTime? start, DateTime? end, int playerId, int columnIndex, bool ascending) {
    if (!isar.isOpen) {
      return [];
    }

    QueryBuilder<Boxscore, Boxscore, QAfterFilterCondition> queryBuilder = isar.boxscores.filter().player((q) => q.idEqualTo(playerId));

    if (start != null) {
      queryBuilder = queryBuilder.game((q) => q.gameDateGreaterThan(start, include: true));
    }

    if (end != null) {
      queryBuilder = queryBuilder.game((q) => q.gameDateLessThan(end, include: true));
    }

    List<Boxscore> boxScores = queryBuilder.findAllSync();
    int gameNum = queryBuilder.countSync();

    if (gameNum == 0) {
      return [
        ["CUT", 0, 0, 0.0, 0, 0, 0.0],
        ["FAST BREAK", 0, 0, 0.0, 0, 0, 0.0],
        ["HAND OFF", 0, 0, 0.0, 0, 0, 0.0],
        ["ISOLATION", 0, 0, 0.0, 0, 0, 0.0],
        ["OFF SCREEN", 0, 0, 0.0, 0, 0, 0.0],
        ["P&R HANDLER", 0, 0, 0.0, 0, 0, 0.0],
        ["P&R ROLLER", 0, 0, 0.0, 0, 0, 0.0],
        ["POST UP", 0, 0, 0.0, 0, 0, 0.0],
        ["SECOND CHANCE", 0, 0, 0.0, 0, 0, 0.0],
        ["SPOT UP", 0, 0, 0.0, 0, 0, 0.0],
      ];
    }

    int fgmCutSum = 0;
    int fgaCutSum = 0;
    double fgRatioCut = 0.0;
    int tpmCutSum = 0;
    int tpaCutSum = 0;
    double tpRatioCut = 0.0;

    int fgmFastBreakSum = 0;
    int fgaFastBreakSum = 0;
    double fgRatioFastBreak = 0.0;
    int tpmFastBreakSum = 0;
    int tpaFastBreakSum = 0;
    double tpRatioFastBreak = 0.0;

    int fgmHandOffSum = 0;
    int fgaHandOffSum = 0;
    double fgRatioHandOff = 0.0;
    int tpmHandOffSum = 0;
    int tpaHandOffSum = 0;
    double tpRatioHandOff = 0.0;

    int fgmIsolationSum = 0;
    int fgaIsolationSum = 0;
    double fgRatioIsolation = 0.0;
    int tpmIsolationSum = 0;
    int tpaIsolationSum = 0;
    double tpRatioIsolation = 0.0;

    int fgmOffScreenSum = 0;
    int fgaOffScreenSum = 0;
    double fgRatioOffScreen = 0.0;
    int tpmOffScreenSum = 0;
    int tpaOffScreenSum = 0;
    double tpRatioOffScreen = 0.0;

    int fgmHandlerSum = 0;
    int fgaHandlerSum = 0;
    double fgRatioHandler = 0.0;
    int tpmHandlerSum = 0;
    int tpaHandlerSum = 0;
    double tpRatioHandler = 0.0;

    int fgmRollerSum = 0;
    int fgaRollerSum = 0;
    double fgRatioRoller = 0.0;
    int tpmRollerSum = 0;
    int tpaRollerSum = 0;
    double tpRatioRoller = 0.0;

    int fgmPostUpSum = 0;
    int fgaPostUpSum = 0;
    double fgRatioPostUp = 0.0;
    int tpmPostUpSum = 0;
    int tpaPostUpSum = 0;
    double tpRatioPostUp = 0.0;

    int fgmSecondChanceSum = 0;
    int fgaSecondChanceSum = 0;
    double fgRatioSecondChance = 0.0;
    int tpmSecondChanceSum = 0;
    int tpaSecondChanceSum = 0;
    double tpRatioSecondChance = 0.0;

    int fgmSpotUpSum = 0;
    int fgaSpotUpSum = 0;
    double fgRatioSpotUp = 0.0;
    int tpmSpotUpSum = 0;
    int tpaSpotUpSum = 0;
    double tpRatioSpotUp = 0.0;

    for (var boxScore in boxScores) {
      fgmCutSum = fgmCutSum + boxScore.fgmCut;
      fgaCutSum = fgaCutSum + boxScore.fgaCut;
      tpmCutSum = tpmCutSum + boxScore.tpmCut;
      tpaCutSum = tpaCutSum + boxScore.tpaCut;

      fgmFastBreakSum = fgmFastBreakSum + boxScore.fgmFastBreak;
      fgaFastBreakSum = fgaFastBreakSum + boxScore.fgaFastBreak;
      tpmFastBreakSum = tpmFastBreakSum + boxScore.tpmFastBreak;
      tpaFastBreakSum = tpaFastBreakSum + boxScore.tpaFastBreak;

      fgmHandOffSum = fgmHandOffSum + boxScore.fgmHandOff;
      fgaHandOffSum = fgaHandOffSum + boxScore.fgaHandOff;
      tpmHandOffSum = tpmHandOffSum + boxScore.tpmHandOff;
      tpaHandOffSum = tpaHandOffSum + boxScore.tpaHandOff;

      fgmIsolationSum = fgmIsolationSum + boxScore.fgmIsolation;
      fgaIsolationSum = fgaIsolationSum + boxScore.fgaIsolation;
      tpmIsolationSum = tpmIsolationSum + boxScore.tpmIsolation;
      tpaIsolationSum = tpaIsolationSum + boxScore.tpaIsolation;

      fgmOffScreenSum = fgmOffScreenSum + boxScore.fgmOffScreen;
      fgaOffScreenSum = fgaOffScreenSum + boxScore.fgaOffScreen;
      tpmOffScreenSum = tpmOffScreenSum + boxScore.tpmOffScreen;
      tpaOffScreenSum = tpaOffScreenSum + boxScore.tpaOffScreen;

      fgmHandlerSum = fgmHandlerSum + boxScore.fgmHandler;
      fgaHandlerSum = fgaHandlerSum + boxScore.fgaHandler;
      tpmHandlerSum = tpmHandlerSum + boxScore.tpmHandler;
      tpaHandlerSum = tpaHandlerSum + boxScore.tpaHandler;

      fgmRollerSum = fgmRollerSum + boxScore.fgmRoller;
      fgaRollerSum = fgaRollerSum + boxScore.fgaRoller;
      tpmRollerSum = tpmRollerSum + boxScore.tpmRoller;
      tpaRollerSum = tpaRollerSum + boxScore.tpaRoller;

      fgmPostUpSum = fgmPostUpSum + boxScore.fgmPostUp;
      fgaPostUpSum = fgaPostUpSum + boxScore.fgaPostUp;
      tpmPostUpSum = tpmPostUpSum + boxScore.tpmPostUp;
      tpaPostUpSum = tpaPostUpSum + boxScore.tpaPostUp;

      fgmSecondChanceSum = fgmSecondChanceSum + boxScore.fgmSecondChance;
      fgaSecondChanceSum = fgaSecondChanceSum + boxScore.fgaSecondChance;
      tpmSecondChanceSum = tpmSecondChanceSum + boxScore.tpmSecondChance;
      tpaSecondChanceSum = tpaSecondChanceSum + boxScore.tpaSecondChance;

      fgmSpotUpSum = fgmSpotUpSum + boxScore.fgmSpotUp;
      fgaSpotUpSum = fgaSpotUpSum + boxScore.fgaSpotUp;
      tpmSpotUpSum = tpmSpotUpSum + boxScore.tpmSpotUp;
      tpaSpotUpSum = tpaSpotUpSum + boxScore.tpaSpotUp;
    }

    double fgmCutAvg = ((fgmCutSum/gameNum) * 10).round() / 10;
    double fgaCutAvg = ((fgaCutSum/gameNum) * 10).round() / 10;
    double tpmCutAvg = ((tpmCutSum/gameNum) * 10).round() / 10;
    double tpaCutAvg = ((tpaCutSum/gameNum) * 10).round() / 10;
    if (fgaCutSum != 0) {
      fgRatioCut = ((fgmCutSum/fgaCutSum) * 100 * 10).round() / 10;
    }
    if (tpaCutSum != 0) {
      tpRatioCut = ((tpmCutSum/tpaCutSum) * 100 * 10).round() / 10;
    }
    List<dynamic> cutStats = ["CUT", fgmCutAvg, fgaCutAvg, fgRatioCut, tpmCutAvg, tpaCutAvg, tpRatioCut];

    double fgmFastBreakAvg = ((fgmFastBreakSum/gameNum) * 10).round() / 10;
    double fgaFastBreakAvg = ((fgaFastBreakSum/gameNum) * 10).round() / 10;
    double tpmFastBreakAvg = ((tpmFastBreakSum/gameNum) * 10).round() / 10;
    double tpaFastBreakAvg = ((tpaFastBreakSum/gameNum) * 10).round() / 10;
    if (fgaFastBreakSum != 0) {
      fgRatioFastBreak = ((fgmFastBreakSum/fgaFastBreakSum) * 100 * 10).round() / 10;
    }
    if (tpaFastBreakSum != 0) {
      tpRatioFastBreak = ((tpmFastBreakSum/tpaFastBreakSum) * 100 * 10).round() / 10;
    }
    List<dynamic> fastBreakStats = ["FAST BREAK", fgmFastBreakAvg, fgaFastBreakAvg, fgRatioFastBreak, tpmFastBreakAvg, tpaFastBreakAvg, tpRatioFastBreak];

    double fgmHandOffAvg = ((fgmHandOffSum/gameNum) * 10).round() / 10;
    double fgaHandOffAvg = ((fgaHandOffSum/gameNum) * 10).round() / 10;
    double tpmHandOffAvg = ((tpmHandOffSum/gameNum) * 10).round() / 10;
    double tpaHandOffAvg = ((tpaHandOffSum/gameNum) * 10).round() / 10;
    if (fgaHandOffSum != 0) {
      fgRatioHandOff = ((fgmHandOffSum/fgaHandOffSum) * 100 * 10).round() / 10;
    }
    if (tpaHandOffSum != 0) {
      tpRatioHandOff = ((tpmHandOffSum/tpaHandOffSum) * 100 * 10).round() / 10;
    }
    List<dynamic> handOffStats = ["HAND OFF", fgmHandOffAvg, fgaHandOffAvg, fgRatioHandOff, tpmHandOffAvg, tpaHandOffAvg, tpRatioHandOff];

    double fgmIsolationAvg = ((fgmIsolationSum/gameNum) * 10).round() / 10;
    double fgaIsolationAvg = ((fgaIsolationSum/gameNum) * 10).round() / 10;
    double tpmIsolationAvg = ((tpmIsolationSum/gameNum) * 10).round() / 10;
    double tpaIsolationAvg = ((tpaIsolationSum/gameNum) * 10).round() / 10;
    if (fgaIsolationSum != 0) {
      fgRatioIsolation = ((fgmIsolationSum/fgaIsolationSum) * 100 * 10).round() / 10;
    }
    if (tpaIsolationSum != 0) {
      tpRatioIsolation = ((tpmIsolationSum/tpaIsolationSum) * 100 * 10).round() / 10;
    }
    List<dynamic> isolationStats = ["ISOLATION", fgmIsolationAvg, fgaIsolationAvg, fgRatioIsolation, tpmIsolationAvg, tpaIsolationAvg, tpRatioIsolation];

    double fgmOffScreenAvg = ((fgmOffScreenSum/gameNum) * 10).round() / 10;
    double fgaOffScreenAvg = ((fgaOffScreenSum/gameNum) * 10).round() / 10;
    double tpmOffScreenAvg = ((tpmOffScreenSum/gameNum) * 10).round() / 10;
    double tpaOffScreenAvg = ((tpaOffScreenSum/gameNum) * 10).round() / 10;
    if (fgaOffScreenSum != 0) {
      fgRatioOffScreen = ((fgmOffScreenSum/fgaOffScreenSum) * 100 * 10).round() / 10;
    }
    if (tpaOffScreenSum != 0) {
      tpRatioOffScreen = ((tpmOffScreenSum/tpaOffScreenSum) * 100 * 10).round() / 10;
    }
    List<dynamic> offScreenStats = ["OFF SCREEN", fgmOffScreenAvg, fgaOffScreenAvg, fgRatioOffScreen, tpmOffScreenAvg, tpaOffScreenAvg, tpRatioOffScreen];

    double fgmHandlerAvg = ((fgmHandlerSum/gameNum) * 10).round() / 10;
    double fgaHandlerAvg = ((fgaHandlerSum/gameNum) * 10).round() / 10;
    double tpmHandlerAvg = ((tpmHandlerSum/gameNum) * 10).round() / 10;
    double tpaHandlerAvg = ((tpaHandlerSum/gameNum) * 10).round() / 10;
    if (fgaHandlerSum != 0) {
      fgRatioHandler = ((fgmHandlerSum/fgaHandlerSum) * 100 * 10).round() / 10;
    }
    if (tpaHandlerSum != 0) {
      tpRatioHandler = ((tpmHandlerSum/tpaHandlerSum) * 100 * 10).round() / 10;
    }
    List<dynamic> handlerStats = ["P&R HANDLER", fgmHandlerAvg, fgaHandlerAvg, fgRatioHandler, tpmHandlerAvg, tpaHandlerAvg, tpRatioHandler];

    double fgmRollerAvg = ((fgmRollerSum/gameNum) * 10).round() / 10;
    double fgaRollerAvg = ((fgaRollerSum/gameNum) * 10).round() / 10;
    double tpmRollerAvg = ((tpmRollerSum/gameNum) * 10).round() / 10;
    double tpaRollerAvg = ((tpaRollerSum/gameNum) * 10).round() / 10;
    if (fgaRollerSum != 0) {
      fgRatioRoller = ((fgmRollerSum/fgaRollerSum) * 100 * 10).round() / 10;
    }
    if (tpaRollerSum != 0) {
      tpRatioRoller = ((tpmRollerSum/tpaRollerSum) * 100 * 10).round() / 10;
    }
    List<dynamic> rollerStats = ["P&R ROLLER", fgmRollerAvg, fgaRollerAvg, fgRatioRoller, tpmRollerAvg, tpaRollerAvg, tpRatioRoller];

    double fgmPostUpAvg = ((fgmPostUpSum/gameNum) * 10).round() / 10;
    double fgaPostUpAvg = ((fgaPostUpSum/gameNum) * 10).round() / 10;
    double tpmPostUpAvg = ((tpmPostUpSum/gameNum) * 10).round() / 10;
    double tpaPostUpAvg = ((tpaPostUpSum/gameNum) * 10).round() / 10;
    if (fgaPostUpSum != 0) {
      fgRatioPostUp = ((fgmPostUpSum/fgaPostUpSum) * 100 * 10).round() / 10;
    }
    if (tpaPostUpSum != 0) {
      tpRatioPostUp = ((tpmPostUpSum/tpaPostUpSum) * 100 * 10).round() / 10;
    }
    List<dynamic> postUpStats = ["POST UP", fgmPostUpAvg, fgaPostUpAvg, fgRatioPostUp, tpmPostUpAvg, tpaPostUpAvg, tpRatioPostUp];

    double fgmSecondChanceAvg = ((fgmSecondChanceSum/gameNum) * 10).round() / 10;
    double fgaSecondChanceAvg = ((fgaSecondChanceSum/gameNum) * 10).round() / 10;
    double tpmSecondChanceAvg = ((tpmSecondChanceSum/gameNum) * 10).round() / 10;
    double tpaSecondChanceAvg = ((tpaSecondChanceSum/gameNum) * 10).round() / 10;
    if (fgaSecondChanceSum != 0) {
      fgRatioSecondChance = ((fgmSecondChanceSum/fgaSecondChanceSum) * 100 * 10).round() / 10;
    }
    if (tpaSecondChanceSum != 0) {
      tpRatioSecondChance = ((tpmSecondChanceSum/tpaSecondChanceSum) * 100 * 10).round() / 10;
    }
    List<dynamic> secondChanceStats = ["SECOND CHANCE", fgmSecondChanceAvg, fgaSecondChanceAvg, fgRatioSecondChance, tpmSecondChanceAvg, tpaSecondChanceAvg, tpRatioSecondChance];

    double fgmSpotUpAvg = ((fgmSpotUpSum/gameNum) * 10).round() / 10;
    double fgaSpotUpAvg = ((fgaSpotUpSum/gameNum) * 10).round() / 10;
    double tpmSpotUpAvg = ((tpmSpotUpSum/gameNum) * 10).round() / 10;
    double tpaSpotUpAvg = ((tpaSpotUpSum/gameNum) * 10).round() / 10;
    if (fgaSpotUpSum != 0) {
      fgRatioSpotUp = ((fgmSpotUpSum/fgaSpotUpSum) * 100 * 10).round() / 10;
    }
    if (tpaSpotUpSum != 0) {
      tpRatioSpotUp = ((tpmSpotUpSum/tpaSpotUpSum) * 100 * 10).round() / 10;
    }
    List<dynamic> spotUpStats = ["SPOT UP", fgmSpotUpAvg, fgaSpotUpAvg, fgRatioSpotUp, tpmSpotUpAvg, tpaSpotUpAvg, tpRatioSpotUp];

    List<List<dynamic>> playTypeStats = [
      cutStats,
      fastBreakStats,
      handOffStats,
      isolationStats,
      offScreenStats,
      handlerStats,
      rollerStats,
      postUpStats,
      secondChanceStats,
      spotUpStats,
    ];

    if (ascending) {
      playTypeStats.sort((a, b) => a[columnIndex].compareTo(b[columnIndex]));
    } else {
      playTypeStats.sort((a, b) => b[columnIndex].compareTo(a[columnIndex]));
    }

    return playTypeStats;
  }

  void deleteByGame(int gameId) {
    isar.boxscores.filter().game((q) => q.idEqualTo(gameId)).deleteAllSync();
  }
}