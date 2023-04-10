import 'package:isar/isar.dart';
import '../teamHistory/team_history.dart';

part 'team.g.dart';

@Collection()
class Team {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  // final histories = IsarLinks<TeamHistory>();

  /// チーム名
  late String name;
}