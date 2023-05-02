import 'package:isar/isar.dart';

part 'team.g.dart';

@Collection()
class Team {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  /// チーム名
  late String name;
}