import 'package:bb_stats/src/collections/game/game.dart';
import 'package:isar/isar.dart';

part 'game_summary.g.dart';

@Collection()
class GameSummary {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  final game = IsarLink<Game>();

  late int q1;

  late int q2;

  late int q3;

  late int q4;

}