import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/enums/FgResult.dart';
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

  void makeShot(int gameId, FgResult fgResult, ShotType shotType, ShotZone shotZone) {
    if (!isar.isOpen) {
      return;
    }

    final teamStat = isar.teamStats.filter().game((q) => q.idEqualTo(gameId)).findFirstSync();
    if (teamStat == null) {
      return;
    }

    switch(shotType){
      case ShotType.NONE:
        break;
      case ShotType.LAYUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmLayup = teamStat.tpmLayup + 1;
          teamStat.tpaLayup = teamStat.tpaLayup + 1;
          teamStat.fgmLayup = teamStat.fgmLayup + 1;
          teamStat.fgaLayup = teamStat.fgaLayup + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaLayup = teamStat.tpaLayup + 1;
          teamStat.fgaLayup = teamStat.fgaLayup + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmLayup = teamStat.fgmLayup + 1;
          teamStat.fgaLayup = teamStat.fgaLayup + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaLayup = teamStat.fgaLayup + 1;
        }
        break;
      case ShotType.CATCH_AND_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmCatchAndShot = teamStat.tpmCatchAndShot + 1;
          teamStat.tpaCatchAndShot = teamStat.tpaCatchAndShot + 1;
          teamStat.fgmCatchAndShot = teamStat.fgmCatchAndShot + 1;
          teamStat.fgaCatchAndShot = teamStat.fgaCatchAndShot + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaCatchAndShot = teamStat.tpaCatchAndShot + 1;
          teamStat.fgaCatchAndShot = teamStat.fgaCatchAndShot + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmCatchAndShot = teamStat.fgmCatchAndShot + 1;
          teamStat.fgaCatchAndShot = teamStat.fgaCatchAndShot + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaCatchAndShot = teamStat.fgaCatchAndShot + 1;
        }
        break;
      case ShotType.PULLUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmPullUp = teamStat.tpmPullUp + 1;
          teamStat.tpaPullUp = teamStat.tpaPullUp + 1;
          teamStat.fgmPullUp = teamStat.fgmPullUp + 1;
          teamStat.fgaPullUp = teamStat.fgaPullUp + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaPullUp = teamStat.tpaPullUp + 1;
          teamStat.fgaPullUp = teamStat.fgaPullUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmPullUp = teamStat.fgmPullUp + 1;
          teamStat.fgaPullUp = teamStat.fgaPullUp + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaPullUp = teamStat.fgaPullUp + 1;
        }
        break;
      case ShotType.FLOATING_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmFloating = teamStat.tpmFloating + 1;
          teamStat.tpaFloating = teamStat.tpaFloating + 1;
          teamStat.fgmFloating = teamStat.fgmFloating + 1;
          teamStat.fgaFloating = teamStat.fgaFloating + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaFloating = teamStat.tpaFloating + 1;
          teamStat.fgaFloating = teamStat.fgaFloating + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmFloating = teamStat.fgmFloating + 1;
          teamStat.fgaFloating = teamStat.fgaFloating + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaFloating = teamStat.fgaFloating + 1;
        }
        break;
      case ShotType.HOOK_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmHook = teamStat.tpmHook + 1;
          teamStat.tpaHook = teamStat.tpaHook + 1;
          teamStat.fgmHook = teamStat.fgmHook + 1;
          teamStat.fgaHook = teamStat.fgaHook + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaHook = teamStat.tpaHook + 1;
          teamStat.fgaHook = teamStat.fgaHook + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmHook = teamStat.fgmHook + 1;
          teamStat.fgaHook = teamStat.fgaHook + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaHook = teamStat.fgaHook + 1;
        }
        break;
      case ShotType.TIP_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmTip = teamStat.tpmTip + 1;
          teamStat.tpaTip = teamStat.tpaTip + 1;
          teamStat.fgmTip = teamStat.fgmTip + 1;
          teamStat.fgaTip = teamStat.fgaTip + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaTip = teamStat.tpaTip + 1;
          teamStat.fgaTip = teamStat.fgaTip + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmTip = teamStat.fgmTip + 1;
          teamStat.fgaTip = teamStat.fgaTip + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaTip = teamStat.fgaTip + 1;
        }
        break;
      case ShotType.FADEAWAY:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmFadeAway = teamStat.tpmFadeAway + 1;
          teamStat.tpaFadeAway = teamStat.tpaFadeAway + 1;
          teamStat.fgmFadeAway = teamStat.fgmFadeAway + 1;
          teamStat.fgaFadeAway = teamStat.fgaFadeAway + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaFadeAway = teamStat.tpaFadeAway + 1;
          teamStat.fgaFadeAway = teamStat.fgaFadeAway + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmFadeAway = teamStat.fgmFadeAway + 1;
          teamStat.fgaFadeAway = teamStat.fgaFadeAway + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaFadeAway = teamStat.fgaFadeAway + 1;
        }
        break;
      case ShotType.DUNK:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmDunk = teamStat.tpmDunk + 1;
          teamStat.tpaDunk = teamStat.tpaDunk + 1;
          teamStat.fgmDunk = teamStat.fgmDunk + 1;
          teamStat.fgaDunk = teamStat.fgaDunk + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaDunk = teamStat.tpaDunk + 1;
          teamStat.fgaDunk = teamStat.fgaDunk + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmDunk = teamStat.fgmDunk + 1;
          teamStat.fgaDunk = teamStat.fgaDunk + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaDunk = teamStat.fgaDunk + 1;
        }
        break;
      case ShotType.ALLEY_OOP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmAlleyOop = teamStat.tpmAlleyOop + 1;
          teamStat.tpaAlleyOop = teamStat.tpaAlleyOop + 1;
          teamStat.fgmAlleyOop = teamStat.fgmAlleyOop + 1;
          teamStat.fgaAlleyOop = teamStat.fgaAlleyOop + 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaAlleyOop = teamStat.tpaAlleyOop + 1;
          teamStat.fgaAlleyOop = teamStat.fgaAlleyOop + 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmAlleyOop = teamStat.fgmAlleyOop + 1;
          teamStat.fgaAlleyOop = teamStat.fgaAlleyOop + 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaAlleyOop = teamStat.fgaAlleyOop + 1;
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

  void modifyShot(int gameId, FgResult fgResult, ShotType shotType, ShotZone shotZone) {
    if (!isar.isOpen) {
      return;
    }

    final teamStat = isar.teamStats.filter()
        .game((q) => q.idEqualTo(gameId))
        .findFirstSync();

    if (teamStat == null) {
      return;
    }

    switch(shotType){
      case ShotType.NONE:
        break;
      case ShotType.LAYUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmLayup = teamStat.tpmLayup - 1;
          teamStat.tpaLayup = teamStat.tpaLayup - 1;
          teamStat.fgmLayup = teamStat.fgmLayup - 1;
          teamStat.fgaLayup = teamStat.fgaLayup - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaLayup = teamStat.tpaLayup - 1;
          teamStat.fgaLayup = teamStat.fgaLayup - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmLayup = teamStat.fgmLayup - 1;
          teamStat.fgaLayup = teamStat.fgaLayup - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaLayup = teamStat.fgaLayup - 1;
        }
        break;
      case ShotType.CATCH_AND_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmCatchAndShot = teamStat.tpmCatchAndShot - 1;
          teamStat.tpaCatchAndShot = teamStat.tpaCatchAndShot - 1;
          teamStat.fgmCatchAndShot = teamStat.fgmCatchAndShot - 1;
          teamStat.fgaCatchAndShot = teamStat.fgaCatchAndShot - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaCatchAndShot = teamStat.tpaCatchAndShot - 1;
          teamStat.fgaCatchAndShot = teamStat.fgaCatchAndShot - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmCatchAndShot = teamStat.fgmCatchAndShot - 1;
          teamStat.fgaCatchAndShot = teamStat.fgaCatchAndShot - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaCatchAndShot = teamStat.fgaCatchAndShot - 1;
        }
        break;
      case ShotType.PULLUP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmPullUp = teamStat.tpmPullUp - 1;
          teamStat.tpaPullUp = teamStat.tpaPullUp - 1;
          teamStat.fgmPullUp = teamStat.fgmPullUp - 1;
          teamStat.fgaPullUp = teamStat.fgaPullUp - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaPullUp = teamStat.tpaPullUp - 1;
          teamStat.fgaPullUp = teamStat.fgaPullUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmPullUp = teamStat.fgmPullUp - 1;
          teamStat.fgaPullUp = teamStat.fgaPullUp - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaPullUp = teamStat.fgaPullUp - 1;
        }
        break;
      case ShotType.FLOATING_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmFloating = teamStat.tpmFloating - 1;
          teamStat.tpaFloating = teamStat.tpaFloating - 1;
          teamStat.fgmFloating = teamStat.fgmFloating - 1;
          teamStat.fgaFloating = teamStat.fgaFloating - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaFloating = teamStat.tpaFloating - 1;
          teamStat.fgaFloating = teamStat.fgaFloating - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmFloating = teamStat.fgmFloating - 1;
          teamStat.fgaFloating = teamStat.fgaFloating - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaFloating = teamStat.fgaFloating - 1;
        }
        break;
      case ShotType.HOOK_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmHook = teamStat.tpmHook - 1;
          teamStat.tpaHook = teamStat.tpaHook - 1;
          teamStat.fgmHook = teamStat.fgmHook - 1;
          teamStat.fgaHook = teamStat.fgaHook - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaHook = teamStat.tpaHook - 1;
          teamStat.fgaHook = teamStat.fgaHook - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmHook = teamStat.fgmHook - 1;
          teamStat.fgaHook = teamStat.fgaHook - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaHook = teamStat.fgaHook - 1;
        }
        break;
      case ShotType.TIP_SHOT:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmTip = teamStat.tpmTip - 1;
          teamStat.tpaTip = teamStat.tpaTip - 1;
          teamStat.fgmTip = teamStat.fgmTip - 1;
          teamStat.fgaTip = teamStat.fgaTip - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaTip = teamStat.tpaTip - 1;
          teamStat.fgaTip = teamStat.fgaTip - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmTip = teamStat.fgmTip - 1;
          teamStat.fgaTip = teamStat.fgaTip - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaTip = teamStat.fgaTip - 1;
        }
        break;
      case ShotType.FADEAWAY:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmFadeAway = teamStat.tpmFadeAway - 1;
          teamStat.tpaFadeAway = teamStat.tpaFadeAway - 1;
          teamStat.fgmFadeAway = teamStat.fgmFadeAway - 1;
          teamStat.fgaFadeAway = teamStat.fgaFadeAway - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaFadeAway = teamStat.tpaFadeAway - 1;
          teamStat.fgaFadeAway = teamStat.fgaFadeAway - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmFadeAway = teamStat.fgmFadeAway - 1;
          teamStat.fgaFadeAway = teamStat.fgaFadeAway - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaFadeAway = teamStat.fgaFadeAway - 1;
        }
        break;
      case ShotType.DUNK:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmDunk = teamStat.tpmDunk - 1;
          teamStat.tpaDunk = teamStat.tpaDunk - 1;
          teamStat.fgmDunk = teamStat.fgmDunk - 1;
          teamStat.fgaDunk = teamStat.fgaDunk - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaDunk = teamStat.tpaDunk - 1;
          teamStat.fgaDunk = teamStat.fgaDunk - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmDunk = teamStat.fgmDunk - 1;
          teamStat.fgaDunk = teamStat.fgaDunk - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaDunk = teamStat.fgaDunk - 1;
        }
        break;
      case ShotType.ALLEY_OOP:
        if (fgResult == FgResult.THREE_POINT_MADE) {
          teamStat.tpmAlleyOop = teamStat.tpmAlleyOop - 1;
          teamStat.tpaAlleyOop = teamStat.tpaAlleyOop - 1;
          teamStat.fgmAlleyOop = teamStat.fgmAlleyOop - 1;
          teamStat.fgaAlleyOop = teamStat.fgaAlleyOop - 1;
        } else if (fgResult == FgResult.THREE_POINT_MISS) {
          teamStat.tpaAlleyOop = teamStat.tpaAlleyOop - 1;
          teamStat.fgaAlleyOop = teamStat.fgaAlleyOop - 1;
        } else if (fgResult == FgResult.TWO_POINT_MADE) {
          teamStat.fgmAlleyOop = teamStat.fgmAlleyOop - 1;
          teamStat.fgaAlleyOop = teamStat.fgaAlleyOop - 1;
        } else if (fgResult == FgResult.TWO_POINT_MISS) {
          teamStat.fgaAlleyOop = teamStat.fgaAlleyOop - 1;
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

}