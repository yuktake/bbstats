import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/team/team.dart';
import 'package:bb_stats/src/enums/FgResult.dart';
import 'package:bb_stats/src/enums/Outcome.dart';
import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:bb_stats/src/enums/ShotZone.dart';
import 'package:isar/isar.dart';

import '../collections/teamStat/teamStat.dart';

class TeamStatRepository {
  TeamStatRepository(this.isar);
  /// Isarインスタンス
  final Isar isar;

  Future<TeamStat?> createTeamStat(Game game) async {
    if (!isar.isOpen) {
      return null;
    }

    final teamStat = TeamStat()
      ..game.value = game
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

      ..fgmZoneTop = 0
      ..fgaZoneTop = 0
      ..tpmZoneTop = 0
      ..tpaZoneTop = 0

      ..fgmZoneLeft = 0
      ..fgaZoneLeft = 0
      ..tpmZoneLeft = 0
      ..tpaZoneLeft = 0

      ..fgmZoneRight = 0
      ..fgaZoneRight = 0
      ..tpmZoneRight = 0
      ..tpaZoneRight = 0

      ..fgmZoneMiddle = 0
      ..fgaZoneMiddle = 0
      ..tpmZoneMiddle = 0
      ..tpaZoneMiddle = 0

      ..fgmZonePaint = 0
      ..fgaZonePaint = 0
      ..tpmZonePaint = 0
      ..tpaZonePaint = 0
    ;

    isar.writeTxnSync(() {
      isar.teamStats.putSync(teamStat);
      teamStat.game.saveSync();
    });

    return teamStat;
  }

  void makeShot(int gameId, FgResult fgResult, PlayType playType, ShotZone shotZone) {
    if (!isar.isOpen) {
      return;
    }

    final teamStat = isar.teamStats.filter().game((q) => q.idEqualTo(gameId)).findFirstSync();
    if (teamStat == null) {
      return;
    }

    switch(playType){
      case PlayType.NONE:
        break;
      case PlayType.ISOLATION:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmIsolation = teamStat.tpmIsolation + 1;
          teamStat.tpaIsolation = teamStat.tpaIsolation + 1;
          teamStat.fgmIsolation = teamStat.fgmIsolation + 1;
          teamStat.fgaIsolation = teamStat.fgaIsolation + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaIsolation = teamStat.tpaIsolation + 1;
          teamStat.fgaIsolation = teamStat.fgaIsolation + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmIsolation = teamStat.fgmIsolation + 1;
          teamStat.fgaIsolation = teamStat.fgaIsolation + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaIsolation = teamStat.fgaIsolation + 1;
        }
        break;
      case PlayType.FASTBREAK:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmFastBreak = teamStat.tpmFastBreak + 1;
          teamStat.tpaFastBreak = teamStat.tpaFastBreak + 1;
          teamStat.fgmFastBreak = teamStat.fgmFastBreak + 1;
          teamStat.fgaFastBreak = teamStat.fgaFastBreak + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaFastBreak = teamStat.tpaFastBreak + 1;
          teamStat.fgaFastBreak = teamStat.fgaFastBreak + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmFastBreak = teamStat.fgmFastBreak + 1;
          teamStat.fgaFastBreak = teamStat.fgaFastBreak + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaFastBreak = teamStat.fgaFastBreak + 1;
        }
        break;
      case PlayType.PICK_AND_ROLL_BALL_HANDLER:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmHandler = teamStat.tpmHandler + 1;
          teamStat.tpaHandler = teamStat.tpaHandler + 1;
          teamStat.fgmHandler = teamStat.fgmHandler + 1;
          teamStat.fgaHandler = teamStat.fgaHandler + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaHandler = teamStat.tpaHandler + 1;
          teamStat.fgaHandler = teamStat.fgaHandler + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmHandler = teamStat.fgmHandler + 1;
          teamStat.fgaHandler = teamStat.fgaHandler + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaHandler = teamStat.fgaHandler + 1;
        }
        break;
      case PlayType.PICK_AND_ROLL_ROLL_MAN:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmRoller = teamStat.tpmRoller + 1;
          teamStat.tpaRoller = teamStat.tpaRoller + 1;
          teamStat.fgmRoller = teamStat.fgmRoller + 1;
          teamStat.fgaRoller = teamStat.fgaRoller + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaRoller = teamStat.tpaRoller + 1;
          teamStat.fgaRoller = teamStat.fgaRoller + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmRoller = teamStat.fgmRoller + 1;
          teamStat.fgaRoller = teamStat.fgaRoller + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaRoller = teamStat.fgaRoller + 1;
        }
        break;
      case PlayType.POSTUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmPostUp = teamStat.tpmPostUp + 1;
          teamStat.tpaPostUp = teamStat.tpaPostUp + 1;
          teamStat.fgmPostUp = teamStat.fgmPostUp + 1;
          teamStat.fgaPostUp = teamStat.fgaPostUp + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaPostUp = teamStat.tpaPostUp + 1;
          teamStat.fgaPostUp = teamStat.fgaPostUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmPostUp = teamStat.fgmPostUp + 1;
          teamStat.fgaPostUp = teamStat.fgaPostUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaPostUp = teamStat.fgaPostUp + 1;
        }
        break;
      case PlayType.SPOTUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmSpotUp = teamStat.tpmSpotUp + 1;
          teamStat.tpaSpotUp = teamStat.tpaSpotUp + 1;
          teamStat.fgmSpotUp = teamStat.fgmSpotUp + 1;
          teamStat.fgaSpotUp = teamStat.fgaSpotUp + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaSpotUp = teamStat.tpaSpotUp + 1;
          teamStat.fgaSpotUp = teamStat.fgaSpotUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmSpotUp = teamStat.fgmSpotUp + 1;
          teamStat.fgaSpotUp = teamStat.fgaSpotUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaSpotUp = teamStat.fgaSpotUp + 1;
        }
        break;
      case PlayType.HANDOFF:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmHandOff = teamStat.tpmHandOff + 1;
          teamStat.tpaHandOff = teamStat.tpaHandOff + 1;
          teamStat.fgmHandOff = teamStat.fgmHandOff + 1;
          teamStat.fgaHandOff = teamStat.fgaHandOff + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaHandOff = teamStat.tpaHandOff + 1;
          teamStat.fgaHandOff = teamStat.fgaHandOff + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmHandOff = teamStat.fgmHandOff + 1;
          teamStat.fgaHandOff = teamStat.fgaHandOff + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaHandOff = teamStat.fgaHandOff + 1;
        }
        break;
      case PlayType.CUT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmCut = teamStat.tpmCut + 1;
          teamStat.tpaCut = teamStat.tpaCut + 1;
          teamStat.fgmCut = teamStat.fgmCut + 1;
          teamStat.fgaCut = teamStat.fgaCut + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaCut = teamStat.tpaCut + 1;
          teamStat.fgaCut = teamStat.fgaCut + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmCut = teamStat.fgmCut + 1;
          teamStat.fgaCut = teamStat.fgaCut + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaCut = teamStat.fgaCut + 1;
        }
        break;
      case PlayType.OFF_SCREEN:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmOffScreen = teamStat.tpmOffScreen + 1;
          teamStat.tpaOffScreen = teamStat.tpaOffScreen + 1;
          teamStat.fgmOffScreen = teamStat.fgmOffScreen + 1;
          teamStat.fgaOffScreen = teamStat.fgaOffScreen + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaOffScreen = teamStat.tpaOffScreen + 1;
          teamStat.fgaOffScreen = teamStat.fgaOffScreen + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmOffScreen = teamStat.fgmOffScreen + 1;
          teamStat.fgaOffScreen = teamStat.fgaOffScreen + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaOffScreen = teamStat.fgaOffScreen + 1;
        }
        break;
      case PlayType.SECOND_CHANCE:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmSecondChance = teamStat.tpmSecondChance + 1;
          teamStat.tpaSecondChance = teamStat.tpaSecondChance + 1;
          teamStat.fgmSecondChance = teamStat.fgmSecondChance + 1;
          teamStat.fgaSecondChance = teamStat.fgaSecondChance + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaSecondChance = teamStat.tpaSecondChance + 1;
          teamStat.fgaSecondChance = teamStat.fgaSecondChance + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmSecondChance = teamStat.fgmSecondChance + 1;
          teamStat.fgaSecondChance = teamStat.fgaSecondChance + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaSecondChance = teamStat.fgaSecondChance + 1;
        }
        break;
    }

    switch(shotZone){
      case ShotZone.ALL:
        break;
      case ShotZone.IN_THE_PAINT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmZonePaint = teamStat.tpmZonePaint + 1;
          teamStat.tpaZonePaint = teamStat.tpaZonePaint + 1;
          teamStat.fgmZonePaint = teamStat.fgmZonePaint + 1;
          teamStat.fgaZonePaint = teamStat.fgaZonePaint + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaZonePaint = teamStat.tpaZonePaint + 1;
          teamStat.fgaZonePaint = teamStat.fgaZonePaint + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmZonePaint = teamStat.fgmZonePaint + 1;
          teamStat.fgaZonePaint = teamStat.fgaZonePaint + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaZonePaint = teamStat.fgaZonePaint + 1;
        }
        break;
      case ShotZone.MIDDLE_AREA:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmZoneMiddle = teamStat.tpmZoneMiddle + 1;
          teamStat.tpaZoneMiddle = teamStat.tpaZoneMiddle + 1;
          teamStat.fgmZoneMiddle = teamStat.fgmZoneMiddle + 1;
          teamStat.fgaZoneMiddle = teamStat.fgaZoneMiddle + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaZoneMiddle = teamStat.tpaZoneMiddle + 1;
          teamStat.fgaZoneMiddle = teamStat.fgaZoneMiddle + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmZoneMiddle = teamStat.fgmZoneMiddle + 1;
          teamStat.fgaZoneMiddle = teamStat.fgaZoneMiddle + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaZoneMiddle = teamStat.fgaZoneMiddle + 1;
        }
        break;
      case ShotZone.AROUND_TOP_THREE:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmZoneTop = teamStat.tpmZoneTop + 1;
          teamStat.tpaZoneTop = teamStat.tpaZoneTop + 1;
          teamStat.fgmZoneTop = teamStat.fgmZoneTop + 1;
          teamStat.fgaZoneTop = teamStat.fgaZoneTop + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaZoneTop = teamStat.tpaZoneTop + 1;
          teamStat.fgaZoneTop = teamStat.fgaZoneTop + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmZoneTop = teamStat.fgmZoneTop + 1;
          teamStat.fgaZoneTop = teamStat.fgaZoneTop + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaZoneTop = teamStat.fgaZoneTop + 1;
        }
        break;
      case ShotZone.LEFT_CORNER_THREE:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmZoneLeft = teamStat.tpmZoneLeft + 1;
          teamStat.tpaZoneLeft = teamStat.tpaZoneLeft + 1;
          teamStat.fgmZoneLeft = teamStat.fgmZoneLeft + 1;
          teamStat.fgaZoneLeft = teamStat.fgaZoneLeft + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaZoneLeft = teamStat.tpaZoneLeft + 1;
          teamStat.fgaZoneLeft = teamStat.fgaZoneLeft + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmZoneLeft = teamStat.fgmZoneLeft + 1;
          teamStat.fgaZoneLeft = teamStat.fgaZoneLeft + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaZoneLeft = teamStat.fgaZoneLeft + 1;
        }
        break;
      case ShotZone.RIGHT_CORNER_THREE:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmZoneRight = teamStat.tpmZoneRight + 1;
          teamStat.tpaZoneRight = teamStat.tpaZoneRight + 1;
          teamStat.fgmZoneRight = teamStat.fgmZoneRight + 1;
          teamStat.fgaZoneRight = teamStat.fgaZoneRight + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaZoneRight = teamStat.tpaZoneRight + 1;
          teamStat.fgaZoneRight = teamStat.fgaZoneRight + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmZoneRight = teamStat.fgmZoneRight + 1;
          teamStat.fgaZoneRight = teamStat.fgaZoneRight + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaZoneRight = teamStat.fgaZoneRight + 1;
        }
        break;
    }

    // TODO:: PlayType別も記録する？？？

    isar.writeTxnSync(() {
      isar.teamStats.putSync(teamStat);
    });
  }

  void modifyShot(int gameId, FgResult fgResult, PlayType playType, ShotZone shotZone) {
    if (!isar.isOpen) {
      return;
    }

    final teamStat = isar.teamStats.filter()
        .game((q) => q.idEqualTo(gameId))
        .findFirstSync();

    if (teamStat == null) {
      return;
    }

    switch(playType){
      case PlayType.NONE:
        break;
      case PlayType.ISOLATION:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmIsolation = teamStat.tpmIsolation - 1;
          teamStat.tpaIsolation = teamStat.tpaIsolation - 1;
          teamStat.fgmIsolation = teamStat.fgmIsolation - 1;
          teamStat.fgaIsolation = teamStat.fgaIsolation - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaIsolation = teamStat.tpaIsolation - 1;
          teamStat.fgaIsolation = teamStat.fgaIsolation - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmIsolation = teamStat.fgmIsolation - 1;
          teamStat.fgaIsolation = teamStat.fgaIsolation - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaIsolation = teamStat.fgaIsolation - 1;
        }
        break;
      case PlayType.FASTBREAK:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmFastBreak = teamStat.tpmFastBreak - 1;
          teamStat.tpaFastBreak = teamStat.tpaFastBreak - 1;
          teamStat.fgmFastBreak = teamStat.fgmFastBreak - 1;
          teamStat.fgaFastBreak = teamStat.fgaFastBreak - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaFastBreak = teamStat.tpaFastBreak - 1;
          teamStat.fgaFastBreak = teamStat.fgaFastBreak - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmFastBreak = teamStat.fgmFastBreak - 1;
          teamStat.fgaFastBreak = teamStat.fgaFastBreak - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaFastBreak = teamStat.fgaFastBreak - 1;
        }
        break;
      case PlayType.PICK_AND_ROLL_BALL_HANDLER:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmHandler = teamStat.tpmHandler - 1;
          teamStat.tpaHandler = teamStat.tpaHandler - 1;
          teamStat.fgmHandler = teamStat.fgmHandler - 1;
          teamStat.fgaHandler = teamStat.fgaHandler - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaHandler = teamStat.tpaHandler - 1;
          teamStat.fgaHandler = teamStat.fgaHandler - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmHandler = teamStat.fgmHandler - 1;
          teamStat.fgaHandler = teamStat.fgaHandler - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaHandler = teamStat.fgaHandler - 1;
        }
        break;
      case PlayType.PICK_AND_ROLL_ROLL_MAN:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmRoller = teamStat.tpmRoller - 1;
          teamStat.tpaRoller = teamStat.tpaRoller - 1;
          teamStat.fgmRoller = teamStat.fgmRoller - 1;
          teamStat.fgaRoller = teamStat.fgaRoller - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaRoller = teamStat.tpaRoller - 1;
          teamStat.fgaRoller = teamStat.fgaRoller - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmRoller = teamStat.fgmRoller - 1;
          teamStat.fgaRoller = teamStat.fgaRoller - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaRoller = teamStat.fgaRoller - 1;
        }
        break;
      case PlayType.POSTUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmPostUp = teamStat.tpmPostUp - 1;
          teamStat.tpaPostUp = teamStat.tpaPostUp - 1;
          teamStat.fgmPostUp = teamStat.fgmPostUp - 1;
          teamStat.fgaPostUp = teamStat.fgaPostUp - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaPostUp = teamStat.tpaPostUp - 1;
          teamStat.fgaPostUp = teamStat.fgaPostUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmPostUp = teamStat.fgmPostUp - 1;
          teamStat.fgaPostUp = teamStat.fgaPostUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaPostUp = teamStat.fgaPostUp - 1;
        }
        break;
      case PlayType.SPOTUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmSpotUp = teamStat.tpmSpotUp - 1;
          teamStat.tpaSpotUp = teamStat.tpaSpotUp - 1;
          teamStat.fgmSpotUp = teamStat.fgmSpotUp - 1;
          teamStat.fgaSpotUp = teamStat.fgaSpotUp - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaSpotUp = teamStat.tpaSpotUp - 1;
          teamStat.fgaSpotUp = teamStat.fgaSpotUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmSpotUp = teamStat.fgmSpotUp - 1;
          teamStat.fgaSpotUp = teamStat.fgaSpotUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaSpotUp = teamStat.fgaSpotUp - 1;
        }
        break;
      case PlayType.HANDOFF:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmHandOff = teamStat.tpmHandOff - 1;
          teamStat.tpaHandOff = teamStat.tpaHandOff - 1;
          teamStat.fgmHandOff = teamStat.fgmHandOff - 1;
          teamStat.fgaHandOff = teamStat.fgaHandOff - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaHandOff = teamStat.tpaHandOff - 1;
          teamStat.fgaHandOff = teamStat.fgaHandOff - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmHandOff = teamStat.fgmHandOff - 1;
          teamStat.fgaHandOff = teamStat.fgaHandOff - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaHandOff = teamStat.fgaHandOff - 1;
        }
        break;
      case PlayType.CUT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmCut = teamStat.tpmCut - 1;
          teamStat.tpaCut = teamStat.tpaCut - 1;
          teamStat.fgmCut = teamStat.fgmCut - 1;
          teamStat.fgaCut = teamStat.fgaCut - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaCut = teamStat.tpaCut - 1;
          teamStat.fgaCut = teamStat.fgaCut - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmCut = teamStat.fgmCut - 1;
          teamStat.fgaCut = teamStat.fgaCut - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaCut = teamStat.fgaCut - 1;
        }
        break;
      case PlayType.OFF_SCREEN:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmOffScreen = teamStat.tpmOffScreen - 1;
          teamStat.tpaOffScreen = teamStat.tpaOffScreen - 1;
          teamStat.fgmOffScreen = teamStat.fgmOffScreen - 1;
          teamStat.fgaOffScreen = teamStat.fgaOffScreen - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaOffScreen = teamStat.tpaOffScreen - 1;
          teamStat.fgaOffScreen = teamStat.fgaOffScreen - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmOffScreen = teamStat.fgmOffScreen - 1;
          teamStat.fgaOffScreen = teamStat.fgaOffScreen - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaOffScreen = teamStat.fgaOffScreen - 1;
        }
        break;
      case PlayType.SECOND_CHANCE:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmSecondChance = teamStat.tpmSecondChance - 1;
          teamStat.tpaSecondChance = teamStat.tpaSecondChance - 1;
          teamStat.fgmSecondChance = teamStat.fgmSecondChance - 1;
          teamStat.fgaSecondChance = teamStat.fgaSecondChance - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaSecondChance = teamStat.tpaSecondChance - 1;
          teamStat.fgaSecondChance = teamStat.fgaSecondChance - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmSecondChance = teamStat.fgmSecondChance - 1;
          teamStat.fgaSecondChance = teamStat.fgaSecondChance - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaSecondChance = teamStat.fgaSecondChance - 1;
        }
        break;
    }

    switch(shotZone){
      case ShotZone.ALL:
        break;
      case ShotZone.IN_THE_PAINT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmZonePaint = teamStat.tpmZonePaint - 1;
          teamStat.tpaZonePaint = teamStat.tpaZonePaint - 1;
          teamStat.fgmZonePaint = teamStat.fgmZonePaint - 1;
          teamStat.fgaZonePaint = teamStat.fgaZonePaint - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaZonePaint = teamStat.tpaZonePaint - 1;
          teamStat.fgaZonePaint = teamStat.fgaZonePaint - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmZonePaint = teamStat.fgmZonePaint - 1;
          teamStat.fgaZonePaint = teamStat.fgaZonePaint - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaZonePaint = teamStat.fgaZonePaint - 1;
        }
        break;
      case ShotZone.MIDDLE_AREA:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmZoneMiddle = teamStat.tpmZoneMiddle - 1;
          teamStat.tpaZoneMiddle = teamStat.tpaZoneMiddle - 1;
          teamStat.fgmZoneMiddle = teamStat.fgmZoneMiddle - 1;
          teamStat.fgaZoneMiddle = teamStat.fgaZoneMiddle - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaZoneMiddle = teamStat.tpaZoneMiddle - 1;
          teamStat.fgaZoneMiddle = teamStat.fgaZoneMiddle - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmZoneMiddle = teamStat.fgmZoneMiddle - 1;
          teamStat.fgaZoneMiddle = teamStat.fgaZoneMiddle - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaZoneMiddle = teamStat.fgaZoneMiddle - 1;
        }
        break;
      case ShotZone.AROUND_TOP_THREE:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmZoneTop = teamStat.tpmZoneTop - 1;
          teamStat.tpaZoneTop = teamStat.tpaZoneTop - 1;
          teamStat.fgmZoneTop = teamStat.fgmZoneTop - 1;
          teamStat.fgaZoneTop = teamStat.fgaZoneTop - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaZoneTop = teamStat.tpaZoneTop - 1;
          teamStat.fgaZoneTop = teamStat.fgaZoneTop - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmZoneTop = teamStat.fgmZoneTop - 1;
          teamStat.fgaZoneTop = teamStat.fgaZoneTop - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaZoneTop = teamStat.fgaZoneTop - 1;
        }
        break;
      case ShotZone.LEFT_CORNER_THREE:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmZoneLeft = teamStat.tpmZoneLeft - 1;
          teamStat.tpaZoneLeft = teamStat.tpaZoneLeft - 1;
          teamStat.fgmZoneLeft = teamStat.fgmZoneLeft - 1;
          teamStat.fgaZoneLeft = teamStat.fgaZoneLeft - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaZoneLeft = teamStat.tpaZoneLeft - 1;
          teamStat.fgaZoneLeft = teamStat.fgaZoneLeft - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmZoneLeft = teamStat.fgmZoneLeft - 1;
          teamStat.fgaZoneLeft = teamStat.fgaZoneLeft - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaZoneLeft = teamStat.fgaZoneLeft - 1;
        }
        break;
      case ShotZone.RIGHT_CORNER_THREE:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmZoneRight = teamStat.tpmZoneRight - 1;
          teamStat.tpaZoneRight = teamStat.tpaZoneRight - 1;
          teamStat.fgmZoneRight = teamStat.fgmZoneRight - 1;
          teamStat.fgaZoneRight = teamStat.fgaZoneRight - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaZoneRight = teamStat.tpaZoneRight - 1;
          teamStat.fgaZoneRight = teamStat.fgaZoneRight - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmZoneRight = teamStat.fgmZoneRight - 1;
          teamStat.fgaZoneRight = teamStat.fgaZoneRight - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaZoneRight = teamStat.fgaZoneRight - 1;
        }
        break;
    }

    // TODO:: PlayType別も記録する？？？

    isar.writeTxnSync(() {
      isar.teamStats.putSync(teamStat);
    });
  }

  List<List<dynamic>> getPlayTypeStats(int? opponentTeamId, int columnIndex, bool ascending) {
    if (!isar.isOpen) {
      return [];
    }

    // 勝敗が決まっている試合のスタッツのみで集計する
    QueryBuilder<TeamStat, TeamStat, QAfterFilterCondition> queryBuilder = isar.teamStats.filter().not().game((q) => q.outcomeEqualTo(Outcome.NONE));
    if (opponentTeamId != null) {
      queryBuilder = queryBuilder.game((q) => q.opponent((r) => r.idEqualTo(opponentTeamId)));
    }

    List<TeamStat> teamStats = queryBuilder.findAllSync();
    int gameNum = queryBuilder.countSync();

    int fgmIsolation = 0;
    int fgaIsolation = 0;
    double fgRatioIsolation = 0.0;
    int tpmIsolation = 0;
    int tpaIsolation = 0;
    double tpRatioIsolation = 0.0;

    int fgmFastBreak = 0;
    int fgaFastBreak = 0;
    double fgRatioFastBreak = 0.0;
    int tpmFastBreak = 0;
    int tpaFastBreak = 0;
    double tpRatioFastBreak = 0.0;

    int fgmHandler = 0;
    int fgaHandler = 0;
    double fgRatioHandler = 0.0;
    int tpmHandler = 0;
    int tpaHandler = 0;
    double tpRatioHandler = 0.0;

    int fgmRoller = 0;
    int fgaRoller = 0;
    double fgRatioRoller = 0.0;
    int tpmRoller = 0;
    int tpaRoller = 0;
    double tpRatioRoller = 0.0;

    int fgmPostUp = 0;
    int fgaPostUp = 0;
    double fgRatioPostUp = 0.0;
    int tpmPostUp = 0;
    int tpaPostUp = 0;
    double tpRatioPostUp = 0.0;

    int fgmSpotUp = 0;
    int fgaSpotUp = 0;
    double fgRatioSpotUp = 0.0;
    int tpmSpotUp = 0;
    int tpaSpotUp = 0;
    double tpRatioSpotUp = 0.0;

    int fgmHandOff = 0;
    int fgaHandOff = 0;
    double fgRatioHandOff = 0.0;
    int tpmHandOff = 0;
    int tpaHandOff = 0;
    double tpRatioHandOff = 0.0;

    int fgmCut = 0;
    int fgaCut = 0;
    double fgRatioCut = 0.0;
    int tpmCut = 0;
    int tpaCut = 0;
    double tpRatioCut = 0.0;

    int fgmOffScreen = 0;
    int fgaOffScreen = 0;
    double fgRatioOffScreen = 0.0;
    int tpmOffScreen = 0;
    int tpaOffScreen = 0;
    double tpRatioOffScreen = 0.0;

    int fgmSecondChance = 0;
    int fgaSecondChance = 0;
    double fgRatioSecondChance = 0.0;
    int tpmSecondChance = 0;
    int tpaSecondChance = 0;
    double tpRatioSecondChance = 0.0;

    for (var teamStat in teamStats) {
      teamStat.fgmIsolation = teamStat.fgmIsolation;
      teamStat.fgaIsolation = teamStat.fgaIsolation;
      teamStat.tpmIsolation = teamStat.tpmIsolation;
      teamStat.tpaIsolation = teamStat.tpaIsolation;
    }

    return [];
  }
}