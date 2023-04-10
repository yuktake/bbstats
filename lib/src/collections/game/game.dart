import 'package:bb_stats/src/enums/Outcome.dart';
import 'package:isar/isar.dart';
import '../boxscore/boxscore.dart';
import '../pbp/pbp.dart';
import '../team/team.dart';

part 'game.g.dart';

@Collection()
class Game {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  final opponent = IsarLink<Team>();

  final boxscores = IsarLinks<Boxscore>();

  @Backlink(to: 'game')
  final pbps = IsarLinks<Pbp>();

  late int myPts;

  late int benchPts;

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

  late int opponentPts;

  late int opponentBenchPts;

  late int opponentFgm;

  late int opponentFga;

  late double opponentFgRatio;

  late int opponentTpm;

  late int opponentTpa;

  late double opponentTpRatio;

  late int opponentFtm;

  late int opponentFta;

  late double opponentFtRatio;

  late int opponentOReb;

  late int opponentDReb;

  late int opponentReb;

  late int opponentAst;

  late int opponentStl;

  late int opponentBlk;

  late int opponentTo;

  late int opponentPf;

  late DateTime gameDate;

  late bool onGame;

  @enumerated
  late Outcome outcome;

  late DateTime createdAt;

  late DateTime updatedAt;
}