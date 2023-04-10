// import 'package:bb_stats/src/collections/boxscore/boxscore.dart';
// import 'package:bb_stats/src/collections/player/player.dart';
// import 'package:isar/isar.dart';
//
// import '../playerStat/player_stat.dart';
//
// part 'player_history.g.dart';
//
// @Collection()
// class PlayerHistory {
//   /// 自動インクリメントする ID
//   Id id = Isar.autoIncrement;
//
//   // @Backlink(to: 'histories')
//   final player = IsarLink<Player>();
//
//   final boxscores = IsarLinks<Boxscore>();
//
//   final stat = IsarLink<PlayerStat>();
//
//   late int season;
//
//   late DateTime createdAt;
//
//   late DateTime updatedAt;
// }