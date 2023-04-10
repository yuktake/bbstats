// import 'dart:async';
// import 'dart:io';
//
// import 'package:bb_stats/src/collections/teamHistory/team_history.dart';
// import 'package:isar/isar.dart';
// import 'package:path_provider/path_provider.dart';
//
// class TeamHistoryRepository {
//   TeamHistoryRepository(this.isar);
//
//   /// Isarインスタンス
//   final Isar isar;
//
//   Future<TeamHistory?> findTeamHistory(int season) async {
//     if (!isar.isOpen) {
//       return null;
//     }
//
//     final teamHistory = await isar.teamHistorys.filter().seasonEqualTo(season).findFirst();
//     await teamHistory?.team.load();
//     await teamHistory?.stat.load();
//
//     // デフォルトのソートはidの昇順
//     return teamHistory;
//   }
//
//   TeamHistory? findTeamHistorySync(int season) {
//     if (!isar.isOpen) {
//       return null;
//     }
//
//     final teamHistory = isar.teamHistorys.filter().seasonEqualTo(season).findFirstSync();
//     teamHistory?.team.loadSync();
//     teamHistory?.stat.loadSync();
//
//     // デフォルトのソートはidの昇順
//     return teamHistory;
//   }
//
// }