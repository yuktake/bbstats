import 'package:bb_stats/src/collections/game/game.dart';
import 'package:isar/isar.dart';
import '../player/player.dart';

part 'boxscore.g.dart';

@Collection()
class Boxscore {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  @Backlink(to: 'boxscores')
  final player = IsarLink<Player>();

  @Backlink(to: 'boxscores')
  final game = IsarLink<Game>();

  late int pts;

  late int fgm;

  late int fga;

  late double fgRatio;

  late int tpm;

  late int tpa;

  late double tpRatio;

  late int ftm;

  late int fta;

  late double ftRatio;

  late int oReb;

  late int dReb;

  late int reb;

  late int ast;

  late int stl;

  late int blk;

  late int to;

  late int pf;

  late bool starter;

  late bool onCourt;

  // Stat Details

  // Shot Type

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

  // Play Type

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
}