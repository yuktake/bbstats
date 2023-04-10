// import 'package:isar/isar.dart';
//
// import '../team/team.dart';
// import '../teamStat/team_stat.dart';
//
// part 'team_history.g.dart';
//
// @Collection()
// class TeamHistory {
//   /// 自動インクリメントする ID
//   Id id = Isar.autoIncrement;
//
//   @Backlink(to: 'histories')
//   final team = IsarLink<Team>();
//
//   final stat = IsarLink<TeamStat>();
//
//   late int season;
//
//   late DateTime createdAt;
//
//   late DateTime updatedAt;
// }