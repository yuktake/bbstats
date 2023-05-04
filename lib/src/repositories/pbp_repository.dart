import 'dart:async';
import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/pbp/pbp.dart';
import 'package:bb_stats/src/collections/player/player.dart';
import 'package:bb_stats/src/collections/team/team.dart';
import 'package:bb_stats/src/enums/GameAction.dart';
import 'package:bb_stats/src/enums/Period.dart';
import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/RecordType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:bb_stats/src/enums/ShotZone.dart';
import 'package:intl/intl.dart';
import 'package:isar/isar.dart';

class PbpRepository {
  PbpRepository(this.isar);

  /// Isarインスタンス
  final Isar isar;

  List<Pbp> getAll(int gameId) {
    if (!isar.isOpen) {
      return [];
    }

    final pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).sortByQuarter().thenByPlayAtDesc().findAllSync();

    return pbps;
  }

  int getTeamFga(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNotNull()
        .and()
        .not()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.TWO_POINT_MISS).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)
        .countSync();

    return num;
  }

  int getOpponentFga(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNotNull()
        .and()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.TWO_POINT_MISS).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)
        .countSync();

    return num;
  }

  int getTeamFgm(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNotNull()
        .and()
        .not()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE)
        .countSync();

    return num;
  }

  int getOpponentFgm(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNotNull()
        .and()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE)
        .countSync();

    return num;
  }

  int getTeamTpa(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNotNull()
        .and()
        .not()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)
        .countSync();

    return num;
  }

  int getOpponentTpa(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNotNull()
        .and()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)
        .countSync();

    return num;
  }

  int getTeamTpm(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNotNull()
        .and()
        .not()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.THREE_POINT_MADE)
        .countSync();

    return num;
  }

  int getOpponentTpm(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNotNull()
        .and()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.THREE_POINT_MADE)
        .countSync();

    return num;
  }

  int getTeamFta(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNull()
        .and()
        .not()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.FT_MISS).or().typeEqualTo(RecordType.FT_MADE)
        .countSync();

    return num;
  }

  int getOpponentFta(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNull()
        .and()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.FT_MISS).or().typeEqualTo(RecordType.FT_MADE)
        .countSync();

    return num;
  }

  int getTeamFtm(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNull()
        .and()
        .not()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.FT_MADE)
        .countSync();

    return num;
  }

  int getOpponentFtm(int gameId) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNull()
        .and()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.FT_MADE)
        .countSync();

    return num;
  }

  int getTeamStatsCountByRecordType(int gameId, RecordType recordType) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNull()
        .and()
        .not()
        .playerIsNull()
        .and()
        .typeEqualTo(recordType)
        .countSync();

    return num;
  }

  int getOpponentStatsCountByRecordType(int gameId, RecordType recordType) {
    if (!isar.isOpen) {
      return 0;
    }

    int num = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .shotPositionIsNull()
        .and()
        .playerIsNull()
        .and()
        .typeEqualTo(recordType)
        .countSync();

    return num;
  }

  List<Pbp> getShotChartPbps(int gameId, Period period, PlayType playType, ShotType shotType, int? playerId, int shotFilter, ShotZone shotZone) {
    if (!isar.isOpen) {
      return [];
    }

    QueryBuilder<Pbp, Pbp, QAfterFilterCondition> queryBuilder;
    queryBuilder = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().shotPositionIsNotNull().and().not().playerIsNull();

    switch (period) {
      case Period.FIRST:
        queryBuilder = queryBuilder.quarterEqualTo(1);
        break;
      case Period.SECOND:
        queryBuilder = queryBuilder.quarterEqualTo(2);
        break;
      case Period.THIRD:
        queryBuilder = queryBuilder.quarterEqualTo(3);
        break;
      case Period.FOURTH:
        queryBuilder = queryBuilder.quarterEqualTo(4);
        break;
      case Period.FIRST_HALF:
        queryBuilder = queryBuilder.group((q) => q.quarterEqualTo(1).or().quarterEqualTo(2));
        break;
      case Period.SECOND_HALF:
        queryBuilder = queryBuilder.group((q) => q.quarterEqualTo(3).or().quarterEqualTo(4));
        break;
      case Period.ALL:
      default:
        break;
    }

    switch(playType) {
      case PlayType.ISOLATION:
      case PlayType.FASTBREAK:
      case PlayType.PICK_AND_ROLL_BALL_HANDLER:
      case PlayType.PICK_AND_ROLL_ROLL_MAN:
      case PlayType.POSTUP:
      case PlayType.SPOTUP:
      case PlayType.HANDOFF:
      case PlayType.CUT:
      case PlayType.OFF_SCREEN:
        queryBuilder = queryBuilder.shotPosition((q) => q.playTypeEqualTo(playType));
        break;
      case PlayType.NONE:
      default:
        break;
    }

    switch(shotType) {
      case ShotType.LAYUP:
      case ShotType.CATCH_AND_SHOT:
      case ShotType.PULLUP:
      case ShotType.FLOATING_SHOT:
      case ShotType.HOOK_SHOT:
      case ShotType.TIP_SHOT:
      case ShotType.FADEAWAY:
      case ShotType.DUNK:
      case ShotType.ALLEY_OOP:
        queryBuilder = queryBuilder.shotPosition((q) => q.shotTypeEqualTo(shotType));
        break;
      case ShotType.NONE:
      default:
        break;
    }

    if (playerId != null) {
      queryBuilder = queryBuilder.player((q) => q.idEqualTo(playerId));
    }

    switch(shotFilter) {
      case 2:
        queryBuilder = queryBuilder.group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE));
        break;
      case 3:
        queryBuilder = queryBuilder.group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.TWO_POINT_MISS));
        break;
      case 1:
      default:
        break;
    }

    switch (shotZone) {
      case ShotZone.IN_THE_PAINT:
      case ShotZone.MIDDLE_AREA:
      case ShotZone.AROUND_TOP_THREE:
      case ShotZone.LEFT_CORNER_THREE:
      case ShotZone.RIGHT_CORNER_THREE:
        queryBuilder = queryBuilder.shotPosition((q) => q.shotZoneEqualTo(shotZone));
        break;
      case ShotZone.ALL:
      default:
        break;
    }

    List<Pbp> pbps = queryBuilder.findAllSync();

    return pbps;
  }

  List<Pbp> getOpponentShotChartPbps(int gameId, Period period, PlayType playType, ShotType shotType, int? defencedPlayerId, int shotFilter, ShotZone shotZone) {
    if (!isar.isOpen) {
      return [];
    }

    QueryBuilder<Pbp, Pbp, QAfterFilterCondition> queryBuilder;
    queryBuilder = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().shotPositionIsNotNull().and().playerIsNull();

    switch (period) {
      case Period.FIRST:
        queryBuilder = queryBuilder.quarterEqualTo(1);
        break;
      case Period.SECOND:
        queryBuilder = queryBuilder.quarterEqualTo(2);
        break;
      case Period.THIRD:
        queryBuilder = queryBuilder.quarterEqualTo(3);
        break;
      case Period.FOURTH:
        queryBuilder = queryBuilder.quarterEqualTo(4);
        break;
      case Period.FIRST_HALF:
        queryBuilder = queryBuilder.group((q) => q.quarterEqualTo(1).or().quarterEqualTo(2));
        break;
      case Period.SECOND_HALF:
        queryBuilder = queryBuilder.group((q) => q.quarterEqualTo(3).or().quarterEqualTo(4));
        break;
      case Period.ALL:
      default:
        break;
    }

    switch(playType) {
      case PlayType.ISOLATION:
      case PlayType.FASTBREAK:
      case PlayType.PICK_AND_ROLL_BALL_HANDLER:
      case PlayType.PICK_AND_ROLL_ROLL_MAN:
      case PlayType.POSTUP:
      case PlayType.SPOTUP:
      case PlayType.HANDOFF:
      case PlayType.CUT:
      case PlayType.OFF_SCREEN:
        queryBuilder = queryBuilder.shotPosition((q) => q.playTypeEqualTo(playType));
        break;
      case PlayType.NONE:
      default:
        break;
    }

    switch(shotType) {
      case ShotType.LAYUP:
      case ShotType.CATCH_AND_SHOT:
      case ShotType.PULLUP:
      case ShotType.FLOATING_SHOT:
      case ShotType.HOOK_SHOT:
      case ShotType.TIP_SHOT:
      case ShotType.FADEAWAY:
      case ShotType.DUNK:
      case ShotType.ALLEY_OOP:
        queryBuilder = queryBuilder.shotPosition((q) => q.shotTypeEqualTo(shotType));
        break;
      case ShotType.NONE:
      default:
        break;
    }

    if (defencedPlayerId != null) {
      queryBuilder = queryBuilder.supportedPlayerIdEqualTo(defencedPlayerId);
    }

    switch(shotFilter) {
      case 2:
        queryBuilder = queryBuilder.group((q) =>
          q.typeEqualTo(RecordType.THREE_POINT_MADE)
          .or()
          .typeEqualTo(RecordType.TWO_POINT_MADE)
        );
        break;
      case 3:
        queryBuilder = queryBuilder.group((q) =>
          q.typeEqualTo(RecordType.THREE_POINT_MISS)
          .or()
          .typeEqualTo(RecordType.TWO_POINT_MISS)
        );
        break;
      case 1:
      default:
        break;
    }

    switch (shotZone) {
      case ShotZone.IN_THE_PAINT:
      case ShotZone.MIDDLE_AREA:
      case ShotZone.AROUND_TOP_THREE:
      case ShotZone.LEFT_CORNER_THREE:
      case ShotZone.RIGHT_CORNER_THREE:
        queryBuilder = queryBuilder.shotPosition((q) => q.shotZoneEqualTo(shotZone));
        break;
      case ShotZone.ALL:
      default:
        break;
    }

    List<Pbp> pbps = queryBuilder.findAllSync();

    return pbps;
  }

  List<Pbp> getPbpByQuarter(int gameId, int quarter) {
    if (!isar.isOpen) {
      return [];
    }

    List<Pbp> pbps;

    switch(quarter){
      case 1:
      case 2:
      case 3:
      case 4:
        pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(quarter).sortByPlayAtDesc().findAllSync();
        break;
      case 5:
      default:
        pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).findAllSync();
        break;
    }

    return pbps;
  }

  List<Pbp> getPbpByCurrentQuarter(int gameId) {
    if (!isar.isOpen) {
      return [];
    }

    int currentQuarter;
    Pbp? latestPbp = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).sortByQuarterDesc().findFirstSync();
    if (latestPbp == null) {
      currentQuarter = 1;
    } else {
      currentQuarter = latestPbp.quarter;
    }

    List<Pbp> pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(currentQuarter).sortByPlayAtDesc().findAllSync();

    return pbps;
  }

  DateTime getLatestPlayAt(int gameId) {
    Game game = isar.games.filter().idEqualTo(gameId).findFirstSync()!;
    Pbp? latestPbp = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).sortByQuarterDesc().thenByPlayAt().findFirstSync();
    if (latestPbp == null) {
      return DateTime(2000,1,1,game.quarterMin,0,0);
    }

    return latestPbp.playAt;
  }

  int getCurrentQuarter(int gameId) {
    Pbp? latestPbp = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).sortByQuarterDesc().findFirstSync();
    if (latestPbp == null) {
      return 1;
    }

    return latestPbp.quarter;
  }

  List<int> getScoresByQuarter(int gameId) {
    List<Pbp> q1Pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(1).and().not().playerIsNull().group((q) => q.typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.FT_MADE)).findAllSync();
    List<Pbp> q2Pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(2).and().not().playerIsNull().group((q) => q.typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.FT_MADE)).findAllSync();
    List<Pbp> q3Pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(3).and().not().playerIsNull().group((q) => q.typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.FT_MADE)).findAllSync();
    List<Pbp> q4Pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(4).and().not().playerIsNull().group((q) => q.typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.FT_MADE)).findAllSync();

    int q1 = 0;
    int q2 = 0;
    int q3 = 0;
    int q4 = 0;
    int all = 0;

    for (var element in q1Pbps) { q1 = q1 + (element.shotPosition == null ? 1 : element.shotPosition!.point); }
    for (var element in q2Pbps) { q2 = q2 + (element.shotPosition == null ? 1 : element.shotPosition!.point); }
    for (var element in q3Pbps) { q3 = q3 + (element.shotPosition == null ? 1 : element.shotPosition!.point); }
    for (var element in q4Pbps) { q4 = q4 + (element.shotPosition == null ? 1 : element.shotPosition!.point); }
    all = q1 + q2 + q3 + q4;

    List<int> scoresByQuarter = [q1, q2, q3, q4, all];

    return scoresByQuarter;
  }

  List<int> getOpponentScoresByQuarter(int gameId) {
    List<Pbp> q1Pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(1).and().playerIsNull().group((q) => q.typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.FT_MADE)).findAllSync();
    List<Pbp> q2Pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(2).and().playerIsNull().group((q) => q.typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.FT_MADE)).findAllSync();
    List<Pbp> q3Pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(3).and().playerIsNull().group((q) => q.typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.FT_MADE)).findAllSync();
    List<Pbp> q4Pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(4).and().playerIsNull().group((q) => q.typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.FT_MADE)).findAllSync();

    int q1 = 0;
    int q2 = 0;
    int q3 = 0;
    int q4 = 0;
    int all = 0;

    for (var element in q1Pbps) { q1 = q1 + (element.shotPosition == null ? 1 : element.shotPosition!.point); }
    for (var element in q2Pbps) { q2 = q2 + (element.shotPosition == null ? 1 : element.shotPosition!.point); }
    for (var element in q3Pbps) { q3 = q3 + (element.shotPosition == null ? 1 : element.shotPosition!.point); }
    for (var element in q4Pbps) { q4 = q4 + (element.shotPosition == null ? 1 : element.shotPosition!.point); }
    all = q1 + q2 + q3 + q4;

    List<int> opponentScoresByQuarter = [q1, q2, q3, q4, all];

    return opponentScoresByQuarter;
  }

  List<int> getScoresForChart(int gameId) {
    List<int> scores = [];
    Game game = isar.games.filter().idEqualTo(gameId).findFirstSync()!;
    for(int i = 1; i <= 4; i++) {
      for(int j = game.quarterMin; j > 0; j--) {
        List<Pbp> pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(i).and().playAtBetween(DateTime(2000,1,1,j-1,0,1), DateTime(2000,1,1,j,0,0)).and().not().playerIsNull().group((q) => q.typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.FT_MADE)).findAllSync();
        int score = 0;
        for (var element in pbps) { score = score + (element.shotPosition == null ? 1 : element.shotPosition!.point); }
        if (i == 1 && j == game.quarterMin) {

        } else {
          score = score + scores.last;
        }
        scores.add(score);
      }
    }
    return scores;
  }

  List<int> getOpponentScoresForChart(int gameId) {
    List<int> scores = [];
    Game game = isar.games.filter().idEqualTo(gameId).findFirstSync()!;

    for(int i = 1; i <= 4; i++) {
      for(int j = game.quarterMin; j > 0; j--) {
        List<Pbp> pbps = isar.pbps.filter().game((q) => q.idEqualTo(gameId)).and().quarterEqualTo(i).and().playAtBetween(DateTime(2000,1,1,j-1,0,1), DateTime(2000,1,1,j,0,0)).and().playerIsNull().group((q) => q.typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.FT_MADE)).findAllSync();
        int score = 0;
        for (var element in pbps) { score = score + (element.shotPosition == null ? 1 : element.shotPosition!.point); }
        if (i == 1 && j == game.quarterMin) {

        } else {
          score = score + scores.last;
        }
        scores.add(score);
      }
    }

    return scores;
  }

  Future<void> addPlayerAction({
    required Game game,
    required Player? player,
    required DateTime playAt,
    required RecordType recordTypeArg,
    required int quarter,
    required ShotPosition? shotPosition,
    required int? supportPlayerId,
    required bool myTeamPlay,
  }) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    String time = DateFormat('H:mm').format(playAt);
    RecordType recordType = RecordType.NONE;
    String description = '';
    String playerName = player == null ? 'opponent' : player.name;
    switch(recordTypeArg) {
      case RecordType.TWO_POINT_MADE:
        recordType = RecordType.TWO_POINT_MADE;
        description = '$playerName 2 point made';
        break;
      case RecordType.TWO_POINT_MISS:
        recordType = RecordType.TWO_POINT_MISS;
        description = '$playerName 2 point missed';
        break;
      case RecordType.THREE_POINT_MADE:
        recordType = RecordType.THREE_POINT_MADE;
        description = '$playerName 3 point made';
        break;
      case RecordType.THREE_POINT_MISS:
        recordType = RecordType.THREE_POINT_MISS;
        description = '$playerName 3 point missed';
        break;
      case RecordType.FT_MISS:
        recordType = RecordType.FT_MISS;
        description = '$playerName free throw misses';
        break;
      case RecordType.FT_MADE:
        recordType = RecordType.FT_MADE;
        description = '$playerName free throw made';
        break;
      case RecordType.OFFENCE_REBOUND:
        recordType = RecordType.OFFENCE_REBOUND;
        description = '$playerName offence rebound';
        break;
      case RecordType.DEFENCE_REBOUND:
        recordType = RecordType.DEFENCE_REBOUND;
        description = '$playerName defence rebound';
        break;
      case RecordType.BLOCK:
        recordType = RecordType.BLOCK;
        description = '$playerName blocked';
        break;
      case RecordType.STEAL:
        recordType = RecordType.STEAL;
        description = '$playerName stealed';
        break;
      case RecordType.ASSIST:
        recordType = RecordType.ASSIST;
        description = '$playerName assisted';
        break;
      case RecordType.TURNOVER:
        recordType = RecordType.TURNOVER;
        description = '$playerName turnover';
        break;
      case RecordType.FOUL:
        recordType = RecordType.FOUL;
        description = '$playerName fouled';
        break;
      case RecordType.SUBSTITUTE:
        recordType = RecordType.SUBSTITUTE;
        description = '$playerName fouled';
        break;
      default:
        break;
    }

    if (recordType == RecordType.NONE || description == '') {
      return;
    }

    final pbp = Pbp()
      ..game.value = game
      ..player.value = player
      ..playAt = playAt
      ..type = recordType
      ..quarter = quarter
      ..description = '${quarter}Q: $time $description'
      ..shotPosition = shotPosition
      ..supportedPlayerId = supportPlayerId
      ..myTeamPlay = myTeamPlay
    ;

    isar.writeTxnSync(() {
      isar.pbps.putSync(pbp);
      pbp.player.saveSync();
    });
  }

  Future<void> addGameAction({
    required Game game,
    required DateTime playAt,
    required int currentQuarter,
    required GameAction gameAction,
    required bool myTeamPlay,
  }) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    String quarterDescription = 'GAME SET';

    String time = DateFormat('H:mm').format(playAt);
    RecordType recordType;
    String description;
    switch (gameAction) {
      case GameAction.SHOT_CLOCK_TURNOVER:
        recordType = RecordType.SHOT_CLOCK_TURNOVER;
        description = 'Shot Clock TurnOver';
        break;
      case GameAction.TIMEOUT:
        recordType = RecordType.TIMEOUT;
        description = 'Timeout';
        break;
      case GameAction.GAMESET:
        recordType = RecordType.GAMESET;
        description = quarterDescription;
        break;
    }

    final pbp = Pbp()
      ..game.value = game
      ..playAt = playAt
      ..type = recordType
      ..supportedPlayerId = null
      ..quarter = currentQuarter
      ..description = '${currentQuarter}Q: $time $description'
      ..myTeamPlay = myTeamPlay
      ..shotPosition = null
    ;

    isar.writeTxnSync(() {
      isar.pbps.putSync(pbp);
    });
  }

  void addSubstitutePbp(
      Game game,
      DateTime playAt,
      int quarter,
      Player substitutePlayer,
      Player onCourtPlayer,
      bool myTeamPlay,
  ) {
    String time = DateFormat('H:mm').format(playAt);
    String description = '${onCourtPlayer.name} substitutes to ${substitutePlayer.name}';
    final pbp = Pbp()
      ..game.value = game
      ..playAt = playAt
      ..player.value = onCourtPlayer
      ..type = RecordType.SUBSTITUTE
      ..quarter = quarter
      ..description = '${quarter}Q: $time $description'
      ..supportedPlayerId = null
      ..myTeamPlay = myTeamPlay
      ..shotPosition = null
    ;

    isar.writeTxnSync(() {
      isar.pbps.putSync(pbp);
    });
  }

  // 対象のplayerが誰にどれくらいアシストされたのか
  List<List<dynamic>> getAssistPlayerStats(int playerId, int columnIndex, bool ascending) {
    List<Player> players = isar.players.filter().not().idEqualTo(playerId).findAllSync();
    Map<int,int> maps = {};
    for (var player in players) {
      maps[player.id] = 0;
    }
    List<Pbp> pbps = isar.pbps.filter()
        .player((q) => q.idEqualTo(playerId))
        .and()
        .supportedPlayerIdIsNotNull()
        .and()
        .group((q) => q
          .typeEqualTo(RecordType.THREE_POINT_MADE)
          .or()
          .typeEqualTo(RecordType.TWO_POINT_MADE)
        )
        .and()
        .shotPositionIsNotNull()
        .findAllSync();

    for (var pbp in pbps) {
      maps[pbp.supportedPlayerId!] = maps[pbp.supportedPlayerId]!+1;
    }

    List<List<dynamic>> lists = [];
    for (var player in players) {
      List<dynamic> list = [
        player.name,
        maps[player.id],
      ];
      lists.add(list);
    }

    if (ascending) {
      lists.sort((a, b) => a[columnIndex].compareTo(b[columnIndex]));
    } else {
      lists.sort((a, b) => b[columnIndex].compareTo(a[columnIndex]));
    }

    return lists;
  }
  
  List<int> getPickupStats(int gameId) {
    int pitpPbpsCount = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .not()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.TWO_POINT_MADE)
        .and()
        .shotPosition((q) =>
          q.shotZoneEqualTo(ShotZone.IN_THE_PAINT)
        )
        .countSync();
    int pitpPts = pitpPbpsCount * 2;

    int fbPts = 0;
    List<Pbp> fbPbps = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .not()
        .playerIsNull()
        .and()
        .group((q) => q
          .typeEqualTo(RecordType.TWO_POINT_MADE)
          .or()
          .typeEqualTo(RecordType.THREE_POINT_MADE)
        )
        .and()
        .shotPosition((q) =>
          q.playTypeEqualTo(PlayType.FASTBREAK)
        )
        .findAllSync();
    for (var pbp in fbPbps) { fbPts = fbPts + pbp.shotPosition!.point; }

    int secondChancePts = 0;
    List<Pbp> secondChancePbps = isar.pbps.filter()
        .game((q) => q.idEqualTo(gameId))
        .and()
        .not()
        .playerIsNull()
        .and()
        .group((q) => q
          .typeEqualTo(RecordType.TWO_POINT_MADE)
          .or()
          .typeEqualTo(RecordType.THREE_POINT_MADE)
        )
        .and()
        .shotPosition((q) =>
          q.playTypeEqualTo(PlayType.SECOND_CHANCE)
        )
        .findAllSync();
    for (var pbp in secondChancePbps) { secondChancePts = secondChancePts + pbp.shotPosition!.point; }

    int benchPts = 0;
    // TODO modify
    // List<Pbp> benchPbps = isar.pbps.filter()
    //     .game((q) =>
    //       q.idEqualTo(gameId)
    //       .and()
    //       .boxscores((b) =>
    //         b.starterEqualTo(false)
    //       )
    //     )
    //     .and()
    //     .not()
    //     .playerIsNull()
    //     .and()
    //     .group((q) => q
    //       .typeEqualTo(RecordType.TWO_POINT_MADE)
    //       .or()
    //       .typeEqualTo(RecordType.THREE_POINT_MADE)
    //     )
    //     .and()
    //     .shotPositionIsNotNull()
    //     .findAllSync();
    // for (var pbp in benchPbps) { benchPts = benchPts + pbp.shotPosition!.point; }
    
    return [pitpPts, fbPts, secondChancePts, benchPts];
  }

  List<int> getOpponentPickupStats(int gameId) {
    int pitpPbpsCount = isar.pbps.filter()
        .game((q) =>
          q.idEqualTo(gameId)
        )
        .and()
        .playerIsNull()
        .and()
        .typeEqualTo(RecordType.TWO_POINT_MADE)
        .and()
        .shotPosition((q) =>
          q.shotZoneEqualTo(ShotZone.IN_THE_PAINT)
        )
        .countSync();
    int pitpPts = pitpPbpsCount * 2;

    int fbPts = 0;
    List<Pbp> fbPbps = isar.pbps.filter()
        .game((q) =>
          q.idEqualTo(gameId)
        )
        .and()
        .playerIsNull()
        .and()
        .group((q) => q
          .typeEqualTo(RecordType.TWO_POINT_MADE)
          .or()
          .typeEqualTo(RecordType.THREE_POINT_MADE)
        )
        .and()
        .shotPosition((q) =>
          q.playTypeEqualTo(PlayType.FASTBREAK)
        )
        .findAllSync();
    for (var pbp in fbPbps) { fbPts = fbPts + pbp.shotPosition!.point; }

    int secondChancePts = 0;
    List<Pbp> secondChancePbps = isar.pbps.filter()
        .game((q) =>
          q.idEqualTo(gameId)
        )
        .and()
        .playerIsNull()
        .and()
        .group((q) => q
          .typeEqualTo(RecordType.TWO_POINT_MADE)
          .or()
          .typeEqualTo(RecordType.THREE_POINT_MADE)
        )
        .and()
        .shotPosition((q) =>
          q.playTypeEqualTo(PlayType.SECOND_CHANCE)
        )
        .findAllSync();
    for (var pbp in secondChancePbps) { secondChancePts = secondChancePts + pbp.shotPosition!.point; }

    int benchPts = -1;

    return [pitpPts, fbPts, secondChancePts, benchPts];
  }

  List<Pbp> getPbpsBetweenDateTime(int gameId, int quarterMin) {
    Game game = isar.games.filter().idEqualTo(gameId).findFirstSync()!;

    if (game.quarterMin <= quarterMin) {
      return [];
    }

    List<Pbp> pbps = isar.pbps.filter()
      .game((q) =>
        q.idEqualTo(gameId)
      )
      .playAtBetween(DateTime(2000,1,1,quarterMin,0,1), DateTime(2000,1,1,game.quarterMin,0,0))
      .findAllSync();

    return pbps;
  }

  void deletePbp(int id) {
    isar.writeTxnSync(() {
      isar.pbps.filter().idEqualTo(id).deleteFirstSync();
    });
  }

  void deleteByGame(int gameId) {
    isar.pbps.filter().game((q) => q.idEqualTo(gameId)).deleteAllSync();
  }
}