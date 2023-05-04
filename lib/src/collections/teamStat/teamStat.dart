import 'package:isar/isar.dart';

import '../game/game.dart';

part 'teamStat.g.dart';

@Collection()
class TeamStat {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  @Backlink(to: 'teamStat')
  final game = IsarLink<Game>();

  late int fgmIsolation;
  late int fgaIsolation;
  late int tpmIsolation;
  late int tpaIsolation;

  late int fgmFastBreak;
  late int fgaFastBreak;
  late int tpmFastBreak;
  late int tpaFastBreak;

  late int fgmHandler;
  late int fgaHandler;
  late int tpmHandler;
  late int tpaHandler;

  late int fgmRoller;
  late int fgaRoller;
  late int tpmRoller;
  late int tpaRoller;

  late int fgmPostUp;
  late int fgaPostUp;
  late int tpmPostUp;
  late int tpaPostUp;

  late int fgmSpotUp;
  late int fgaSpotUp;
  late int tpmSpotUp;
  late int tpaSpotUp;

  late int fgmHandOff;
  late int fgaHandOff;
  late int tpmHandOff;
  late int tpaHandOff;

  late int fgmCut;
  late int fgaCut;
  late int tpmCut;
  late int tpaCut;

  late int fgmOffScreen;
  late int fgaOffScreen;
  late int tpmOffScreen;
  late int tpaOffScreen;

  late int fgmSecondChance;
  late int fgaSecondChance;
  late int tpmSecondChance;
  late int tpaSecondChance;

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