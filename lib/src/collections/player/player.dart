import 'package:isar/isar.dart';
import '../boxscore/boxscore.dart';
import '../team/team.dart';

part 'player.g.dart';

@Collection()
class Player {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  final team = IsarLink<Team>();

  final boxscores = IsarLinks<Boxscore>();

  // final histories = IsarLinks<PlayerHistory>();

  late String name;

  // late DateTime? birthDay;
  //
  // late int? height;

  late bool visible;

  late DateTime createdAt;

  late DateTime updatedAt;
}