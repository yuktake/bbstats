import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/team/team.dart';
import 'package:bb_stats/src/enums/FgResult.dart';
import 'package:bb_stats/src/enums/Outcome.dart';
import 'package:bb_stats/src/enums/PlayType.dart';
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

  List<List<dynamic>> getPlayTypeStats(DateTime? start, DateTime? end, int? opponentTeamId, int columnIndex, bool ascending) {
    if (!isar.isOpen) {
      return [];
    }

    QueryBuilder<TeamStat, TeamStat, QAfterFilterCondition> queryBuilder;

    // queryBuilderを初期化するための意味のないクエリ
    queryBuilder = isar.teamStats.filter().not().game((q) => q.idEqualTo(0));

    if (start != null) {
      queryBuilder = queryBuilder.game((q) => q.gameDateGreaterThan(start, include: true));
    }

    if (end != null) {
      queryBuilder = queryBuilder.game((q) => q.gameDateLessThan(end, include: true));
    }

    if (opponentTeamId != null) {
      queryBuilder = queryBuilder.game((q) => q.opponent((r) => r.idEqualTo(opponentTeamId)));
    }

    List<TeamStat> teamStats = queryBuilder.findAllSync();
    int gameNum = queryBuilder.countSync();

    if (gameNum == 0) {
      return [
        ["ISOLATION", 0, 0, 0.0, 0, 0, 0.0],
        ["FAST BREAK", 0, 0, 0.0, 0, 0, 0.0],
        ["P&R BALLER", 0, 0, 0.0, 0, 0, 0.0],
        ["P&R ROLLER", 0, 0, 0.0, 0, 0, 0.0],
        ["POST UP", 0, 0, 0.0, 0, 0, 0.0],
        ["SPOT UP", 0, 0, 0.0, 0, 0, 0.0],
        ["HAND OFF", 0, 0, 0.0, 0, 0, 0.0],
        ["CUT", 0, 0, 0.0, 0, 0, 0.0],
        ["OFF SCREEN", 0, 0, 0.0, 0, 0, 0.0],
        ["SECOND CHANCE", 0, 0, 0.0, 0, 0, 0.0],
      ];
    }

    int fgmIsolationSum = 0;
    int fgaIsolationSum = 0;
    double fgRatioIsolation = 0.0;
    int tpmIsolationSum = 0;
    int tpaIsolationSum = 0;
    double tpRatioIsolation = 0.0;

    int fgmFastBreakSum = 0;
    int fgaFastBreakSum = 0;
    double fgRatioFastBreak = 0.0;
    int tpmFastBreakSum = 0;
    int tpaFastBreakSum = 0;
    double tpRatioFastBreak = 0.0;

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

    int fgmSpotUpSum = 0;
    int fgaSpotUpSum = 0;
    double fgRatioSpotUp = 0.0;
    int tpmSpotUpSum = 0;
    int tpaSpotUpSum = 0;
    double tpRatioSpotUp = 0.0;

    int fgmHandOffSum = 0;
    int fgaHandOffSum = 0;
    double fgRatioHandOff = 0.0;
    int tpmHandOffSum = 0;
    int tpaHandOffSum = 0;
    double tpRatioHandOff = 0.0;

    int fgmCutSum = 0;
    int fgaCutSum = 0;
    double fgRatioCut = 0.0;
    int tpmCutSum = 0;
    int tpaCutSum = 0;
    double tpRatioCut = 0.0;

    int fgmOffScreenSum = 0;
    int fgaOffScreenSum = 0;
    double fgRatioOffScreen = 0.0;
    int tpmOffScreenSum = 0;
    int tpaOffScreenSum = 0;
    double tpRatioOffScreen = 0.0;

    int fgmSecondChanceSum = 0;
    int fgaSecondChanceSum = 0;
    double fgRatioSecondChance = 0.0;
    int tpmSecondChanceSum = 0;
    int tpaSecondChanceSum = 0;
    double tpRatioSecondChance = 0.0;

    for (var teamStat in teamStats) {
      fgmIsolationSum = fgmIsolationSum + teamStat.fgmIsolation;
      fgaIsolationSum = fgaIsolationSum + teamStat.fgaIsolation;
      tpmIsolationSum = tpmIsolationSum + teamStat.tpmIsolation;
      tpaIsolationSum = tpaIsolationSum + teamStat.tpaIsolation;

      fgmFastBreakSum = fgmFastBreakSum + teamStat.fgmFastBreak;
      fgaFastBreakSum = fgaFastBreakSum + teamStat.fgaFastBreak;
      tpmFastBreakSum = tpmFastBreakSum + teamStat.tpmFastBreak;
      tpaFastBreakSum = tpaFastBreakSum + teamStat.tpaFastBreak;

      fgmHandlerSum = fgmHandlerSum + teamStat.fgmHandler;
      fgaHandlerSum = fgaHandlerSum + teamStat.fgaHandler;
      tpmHandlerSum = tpmHandlerSum + teamStat.tpmHandler;
      tpaHandlerSum = tpaHandlerSum + teamStat.tpaHandler;

      fgmRollerSum = fgmRollerSum + teamStat.fgmRoller;
      fgaRollerSum = fgaRollerSum + teamStat.fgaRoller;
      tpmRollerSum = tpmRollerSum + teamStat.tpmRoller;
      tpaRollerSum = tpaRollerSum + teamStat.tpaRoller;

      fgmPostUpSum = fgmPostUpSum + teamStat.fgmPostUp;
      fgaPostUpSum = fgaPostUpSum + teamStat.fgaPostUp;
      tpmPostUpSum = tpmPostUpSum + teamStat.tpmPostUp;
      tpaPostUpSum = tpaPostUpSum + teamStat.tpaPostUp;

      fgmSpotUpSum = fgmSpotUpSum + teamStat.fgmSpotUp;
      fgaSpotUpSum = fgaSpotUpSum + teamStat.fgaSpotUp;
      tpmSpotUpSum = tpmSpotUpSum + teamStat.tpmSpotUp;
      tpaSpotUpSum = tpaSpotUpSum + teamStat.tpaSpotUp;

      fgmHandOffSum = fgmHandOffSum + teamStat.fgmHandOff;
      fgaHandOffSum = fgaHandOffSum + teamStat.fgaHandOff;
      tpmHandOffSum = tpmHandOffSum + teamStat.tpmHandOff;
      tpaHandOffSum = tpaHandOffSum + teamStat.tpaHandOff;

      fgmCutSum = fgmCutSum + teamStat.fgmCut;
      fgaCutSum = fgaCutSum + teamStat.fgaCut;
      tpmCutSum = tpmCutSum + teamStat.tpmCut;
      tpaCutSum = tpaCutSum + teamStat.tpaCut;

      fgmOffScreenSum = fgmOffScreenSum + teamStat.fgmOffScreen;
      fgaOffScreenSum = fgaOffScreenSum + teamStat.fgaOffScreen;
      tpmOffScreenSum = tpmOffScreenSum + teamStat.tpmOffScreen;
      tpaOffScreenSum = tpaOffScreenSum + teamStat.tpaOffScreen;

      fgmSecondChanceSum = fgmSecondChanceSum + teamStat.fgmSecondChance;
      fgaSecondChanceSum = fgaSecondChanceSum + teamStat.fgaSecondChance;
      tpmSecondChanceSum = tpmSecondChanceSum + teamStat.tpmSecondChance;
      tpaSecondChanceSum = tpaSecondChanceSum + teamStat.tpaSecondChance;
    }

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

    double fgmSecondChanceAvg = ((fgmSecondChanceSum/gameNum) * 10).round() / 10;
    double fgaSecondChanceAvg = ((fgaSecondChanceSum/gameNum) * 10).round() / 10;
    double tpmSecondChanceAvg = ((tpmSecondChanceSum/gameNum) * 10).round() / 10;
    double tpaSecondChanceAvg = ((tpaSecondChanceSum/gameNum) * 10).round() / 10;
    if (fgaSecondChanceSum != 0) {
      fgRatioSecondChance = ((fgmSecondChanceSum/fgaSecondChanceSum) * 100 * 10).round() / 10;
    }
    if (tpaCutSum != 0) {
      tpRatioSecondChance = ((tpmSecondChanceSum/tpaSecondChanceSum) * 100 * 10).round() / 10;
    }
    List<dynamic> secondChanceStats = ["SECOND CHANCE", fgmSecondChanceAvg, fgaSecondChanceAvg, fgRatioSecondChance, tpmSecondChanceAvg, tpaSecondChanceAvg, tpRatioSecondChance];

    List<List<dynamic>> playTypeStats = [
      isolationStats,
      fastBreakStats,
      handlerStats,
      rollerStats,
      postUpStats,
      spotUpStats,
      handOffStats,
      cutStats,
      offScreenStats,
      secondChanceStats,
    ];

    if (ascending) {
      playTypeStats.sort((a, b) => a[columnIndex].compareTo(b[columnIndex]));
    } else {
      playTypeStats.sort((a, b) => b[columnIndex].compareTo(a[columnIndex]));
    }

    return playTypeStats;
  }

  List<List<dynamic>> getShotZoneStats(DateTime? start, DateTime? end, int? opponentTeamId, int columnIndex, bool ascending) {
    if (!isar.isOpen) {
      return [];
    }

    QueryBuilder<TeamStat, TeamStat, QAfterFilterCondition> queryBuilder;
    // queryBuilderを初期化するための意味のないクエリ
    queryBuilder = isar.teamStats.filter().not().game((q) => q.idEqualTo(0));

    if (opponentTeamId != null) {
      queryBuilder = queryBuilder.game((q) => q.opponent((r) => r.idEqualTo(opponentTeamId)));
    }

    if (start != null) {
      queryBuilder = queryBuilder.game((q) => q.gameDateGreaterThan(start, include: true));
    }

    if (end != null) {
      queryBuilder = queryBuilder.game((q) => q.gameDateLessThan(end, include: true));
    }

    List<TeamStat> teamStats = queryBuilder.findAllSync();
    int gameNum = queryBuilder.countSync();

    if (gameNum == 0) {
      return [
        ["IN THE PAINT", 0, 0, 0.0, 0, 0, 0.0],
        ["MIDDLE AREA", 0, 0, 0.0, 0, 0, 0.0],
        ["AROUND TOP THREE", 0, 0, 0.0, 0, 0, 0.0],
        ["LEFT CORNER THREE", 0, 0, 0.0, 0, 0, 0.0],
        ["RIGHT CORNER THREE", 0, 0, 0.0, 0, 0, 0.0],
      ];
    }

    int fgmZoneTopSum = 0;
    int fgaZoneTopSum = 0;
    double fgRatioZoneTop = 0.0;
    int tpmZoneTopSum = 0;
    int tpaZoneTopSum = 0;
    double tpRatioZoneTop = 0.0;

    int fgmZoneLeftSum = 0;
    int fgaZoneLeftSum = 0;
    double fgRatioZoneLeft = 0.0;
    int tpmZoneLeftSum = 0;
    int tpaZoneLeftSum = 0;
    double tpRatioZoneLeft = 0.0;

    int fgmZoneRightSum = 0;
    int fgaZoneRightSum = 0;
    double fgRatioZoneRight = 0.0;
    int tpmZoneRightSum = 0;
    int tpaZoneRightSum = 0;
    double tpRatioZoneRight = 0.0;

    int fgmZoneMiddleSum = 0;
    int fgaZoneMiddleSum = 0;
    double fgRatioZoneMiddle = 0.0;
    int tpmZoneMiddleSum = 0;
    int tpaZoneMiddleSum = 0;
    double tpRatioZoneMiddle = 0.0;

    int fgmZonePaintSum = 0;
    int fgaZonePaintSum = 0;
    double fgRatioZonePaint = 0.0;
    int tpmZonePaintSum = 0;
    int tpaZonePaintSum = 0;
    double tpRatioZonePaint = 0.0;

    for (var teamStat in teamStats) {
      fgmZoneTopSum = fgmZoneTopSum + teamStat.fgmZoneTop;
      fgaZoneTopSum = fgaZoneTopSum + teamStat.fgaZoneTop;
      tpmZoneTopSum = tpmZoneTopSum + teamStat.tpmZoneTop;
      tpaZoneTopSum = tpaZoneTopSum + teamStat.tpaZoneTop;

      fgmZoneLeftSum = fgmZoneLeftSum + teamStat.fgmZoneLeft;
      fgaZoneLeftSum = fgaZoneLeftSum + teamStat.fgaZoneLeft;
      tpmZoneLeftSum = tpmZoneLeftSum + teamStat.tpmZoneLeft;
      tpaZoneLeftSum = tpaZoneLeftSum + teamStat.tpaZoneLeft;

      fgmZoneRightSum = fgmZoneRightSum + teamStat.fgmZoneRight;
      fgaZoneRightSum = fgaZoneRightSum + teamStat.fgaZoneRight;
      tpmZoneRightSum = tpmZoneRightSum + teamStat.tpmZoneRight;
      tpaZoneRightSum = tpaZoneRightSum + teamStat.tpaZoneRight;

      fgmZoneMiddleSum = fgmZoneMiddleSum + teamStat.fgmZoneMiddle;
      fgaZoneMiddleSum = fgaZoneMiddleSum + teamStat.fgaZoneMiddle;
      tpmZoneMiddleSum = tpmZoneMiddleSum + teamStat.tpmZoneMiddle;
      tpaZoneMiddleSum = tpaZoneMiddleSum + teamStat.tpaZoneMiddle;

      fgmZonePaintSum = fgmZonePaintSum + teamStat.fgmZonePaint;
      fgaZonePaintSum = fgaZonePaintSum + teamStat.fgaZonePaint;
      tpmZonePaintSum = tpmZonePaintSum + teamStat.tpmZonePaint;
      tpaZonePaintSum = tpaZonePaintSum + teamStat.tpaZonePaint;
    }

    double fgmZoneTopAvg = ((fgmZoneTopSum/gameNum) * 10).round() / 10;
    double fgaZoneTopAvg = ((fgaZoneTopSum/gameNum) * 10).round() / 10;
    double tpmZoneTopAvg = ((tpmZoneTopSum/gameNum) * 10).round() / 10;
    double tpaZoneTopAvg = ((tpaZoneTopSum/gameNum) * 10).round() / 10;
    if (fgaZoneTopSum != 0) {
      fgRatioZoneTop = ((fgmZoneTopSum/fgaZoneTopSum) * 100 * 10).round() / 10;
    }
    if (tpaZoneTopSum != 0) {
      tpRatioZoneTop = ((tpmZoneTopSum/tpaZoneTopSum) * 100 * 10).round() / 10;
    }
    List<dynamic> zoneTopStats = ["AROUND TOP THREE", fgmZoneTopAvg, fgaZoneTopAvg, fgRatioZoneTop, tpmZoneTopAvg, tpaZoneTopAvg, tpRatioZoneTop];

    double fgmZoneLeftAvg = ((fgmZoneLeftSum/gameNum) * 10).round() / 10;
    double fgaZoneLeftAvg = ((fgaZoneLeftSum/gameNum) * 10).round() / 10;
    double tpmZoneLeftAvg = ((tpmZoneLeftSum/gameNum) * 10).round() / 10;
    double tpaZoneLeftAvg = ((tpaZoneLeftSum/gameNum) * 10).round() / 10;
    if (fgaZoneLeftSum != 0) {
      fgRatioZoneLeft = ((fgmZoneLeftSum/fgaZoneLeftSum) * 100 * 10).round() / 10;
    }
    if (tpaZoneLeftSum != 0) {
      tpRatioZoneLeft = ((tpmZoneLeftSum/tpaZoneLeftSum) * 100 * 10).round() / 10;
    }
    List<dynamic> zoneLeftStats = ["LEFT CORNER THREE", fgmZoneLeftAvg, fgaZoneLeftAvg, fgRatioZoneLeft, tpmZoneLeftAvg, tpaZoneLeftAvg, tpRatioZoneLeft];

    double fgmZoneRightAvg = ((fgmZoneRightSum/gameNum) * 10).round() / 10;
    double fgaZoneRightAvg = ((fgaZoneRightSum/gameNum) * 10).round() / 10;
    double tpmZoneRightAvg = ((tpmZoneRightSum/gameNum) * 10).round() / 10;
    double tpaZoneRightAvg = ((tpaZoneRightSum/gameNum) * 10).round() / 10;
    if (fgaZoneRightSum != 0) {
      fgRatioZoneRight = ((fgmZoneRightSum/fgaZoneRightSum) * 100 * 10).round() / 10;
    }
    if (tpaZoneRightSum != 0) {
      tpRatioZoneRight = ((tpmZoneRightSum/tpaZoneRightSum) * 100 * 10).round() / 10;
    }
    List<dynamic> zoneRightStats = ["RIGHT CORNER THREE", fgmZoneRightAvg, fgaZoneRightAvg, fgRatioZoneRight, tpmZoneRightAvg, tpaZoneRightAvg, tpRatioZoneRight];

    double fgmZoneMiddleAvg = ((fgmZoneMiddleSum/gameNum) * 10).round() / 10;
    double fgaZoneMiddleAvg = ((fgaZoneMiddleSum/gameNum) * 10).round() / 10;
    double tpmZoneMiddleAvg = ((tpmZoneMiddleSum/gameNum) * 10).round() / 10;
    double tpaZoneMiddleAvg = ((tpaZoneMiddleSum/gameNum) * 10).round() / 10;
    if (fgaZoneMiddleSum != 0) {
      fgRatioZoneMiddle = ((fgmZoneMiddleSum/fgaZoneMiddleSum) * 100 * 10).round() / 10;
    }
    if (tpaZoneMiddleSum != 0) {
      tpRatioZoneMiddle = ((tpmZoneMiddleSum/tpaZoneMiddleSum) * 100 * 10).round() / 10;
    }
    List<dynamic> zoneMiddleStats = ["MIDDLE AREA", fgmZoneMiddleAvg, fgaZoneMiddleAvg, fgRatioZoneMiddle, tpmZoneMiddleAvg, tpaZoneMiddleAvg, tpRatioZoneMiddle];

    double fgmZonePaintAvg = ((fgmZonePaintSum/gameNum) * 10).round() / 10;
    double fgaZonePaintAvg = ((fgaZonePaintSum/gameNum) * 10).round() / 10;
    double tpmZonePaintAvg = ((tpmZonePaintSum/gameNum) * 10).round() / 10;
    double tpaZonePaintAvg = ((tpaZonePaintSum/gameNum) * 10).round() / 10;
    if (fgaZonePaintSum != 0) {
      fgRatioZonePaint = ((fgmZonePaintSum/fgaZonePaintSum) * 100 * 10).round() / 10;
    }
    if (tpaZonePaintSum != 0) {
      tpRatioZonePaint = ((tpmZonePaintSum/tpaZonePaintSum) * 100 * 10).round() / 10;
    }
    List<dynamic> zonePaintStats = ["IN THE PAINT", fgmZonePaintAvg, fgaZonePaintAvg, fgRatioZonePaint, tpmZonePaintAvg, tpaZonePaintAvg, tpRatioZonePaint];

    List<List<dynamic>> shotZoneStats = [
      zoneTopStats,
      zoneLeftStats,
      zoneRightStats,
      zoneMiddleStats,
      zonePaintStats,
    ];

    if (ascending) {
      shotZoneStats.sort((a, b) => a[columnIndex].compareTo(b[columnIndex]));
    } else {
      shotZoneStats.sort((a, b) => b[columnIndex].compareTo(a[columnIndex]));
    }

    return shotZoneStats;
  }
}