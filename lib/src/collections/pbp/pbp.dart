import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/RecordType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:isar/isar.dart';
import '../../enums/ShotZone.dart';
import '../game/game.dart';
import '../player/player.dart';

part 'pbp.g.dart';

@Collection()
class Pbp {
  /// 自動インクリメントする ID
  Id id = Isar.autoIncrement;

  final player = IsarLink<Player>();

  final game = IsarLink<Game>();

  late int? supportedPlayerId;

  @enumerated
  late RecordType type;

  late int quarter;

  late DateTime playAt;

  late String description;

  late bool myTeamPlay;

  late ShotPosition? shotPosition;

}

@embedded
class ShotPosition {
  late int positionX;

  late int positionY;

  late int point;

  @enumerated
  late PlayType playType;

  @enumerated
  late ShotType shotType;

  @enumerated
  late ShotZone shotZone;
}