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

}