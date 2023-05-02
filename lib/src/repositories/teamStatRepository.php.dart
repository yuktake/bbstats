import 'package:bb_stats/src/collections/game/game.dart';
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

}