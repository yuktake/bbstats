import 'package:isar/isar.dart';

import '../game/game.dart';

part 'teamStat.g.dart';

@Collection()
class TeamStat {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  @Backlink(to: 'teamStat')
  final game = IsarLink<Game>();

  late int fgmLayup;

  late int fgaLayup;

  late int tpmLayup;

  late int tpaLayup;

  late int fgmCatchAndShot;

  late int fgaCatchAndShot;

  late int tpmCatchAndShot;

  late int tpaCatchAndShot;

  late int fgmPullUp;

  late int fgaPullUp;

  late int tpmPullUp;

  late int tpaPullUp;

  late int fgmFloating;

  late int fgaFloating;

  late int tpmFloating;

  late int tpaFloating;

  late int fgmHook;

  late int fgaHook;

  late int tpmHook;

  late int tpaHook;

  late int fgmTip;

  late int fgaTip;

  late int tpmTip;

  late int tpaTip;

  late int fgmFadeAway;

  late int fgaFadeAway;

  late int tpmFadeAway;

  late int tpaFadeAway;

  late int fgmDunk;

  late int fgaDunk;

  late int tpmDunk;

  late int tpaDunk;

  late int fgmAlleyOop;

  late int fgaAlleyOop;

  late int tpmAlleyOop;

  late int tpaAlleyOop;

  //　Zone

  late int fgmZoneTop;

  late int fgaZoneTop;

  late int tpmZoneTop;

  late int tpaZoneTop;

  late int fgmZoneLeft;

  late int fgaZoneLeft;

  late int tpmZoneLeft;

  late int tpaZoneLeft;

  late int fgmZoneRight;

  late int fgaZoneRight;

  late int tpmZoneRight;

  late int tpaZoneRight;

  late int fgmZoneMiddle;

  late int fgaZoneMiddle;

  late int tpmZoneMiddle;

  late int tpaZoneMiddle;

  late int fgmZonePaint;

  late int fgaZonePaint;

  late int tpmZonePaint;

  late int tpaZonePaint;
}