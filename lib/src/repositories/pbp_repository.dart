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

  List<List<dynamic>> getShotTypeStatsByPlayer(int playerId) {
    int layupFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.LAYUP)).countSync();
    int layupFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.LAYUP)).countSync();
    double layupFgRatio = 0.0;
    if (layupFga != 0) {
      layupFgRatio = ((layupFgm/layupFga) * 100 * 10).round() / 10;
    }
    int layupTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.LAYUP)).countSync();
    int layupTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.LAYUP)).countSync();
    double layupTpRatio = 0.0;
    if (layupTpa != 0) {
      layupTpRatio = ((layupTpm/layupTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> layupStats = ["LAYUP", layupFgm, layupFga, layupFgRatio, layupTpm, layupTpa, layupTpRatio];

    int catchAndShotFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.CATCH_AND_SHOT)).countSync();
    int catchAndShotFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.CATCH_AND_SHOT)).countSync();
    double catchAndShotFgRatio = 0.0;
    if (catchAndShotFga != 0) {
      catchAndShotFgRatio = ((catchAndShotFgm/catchAndShotFga) * 100 * 10).round() / 10;
    }
    int catchAndShotTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.CATCH_AND_SHOT)).countSync();
    int catchAndShotTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.CATCH_AND_SHOT)).countSync();
    double catchAndShotTpRatio = 0.0;
    if (catchAndShotTpa != 0) {
      catchAndShotTpRatio = ((catchAndShotTpm/catchAndShotTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> catchAndShotStats = ["Catch&Shot", catchAndShotFgm, catchAndShotFga, catchAndShotFgRatio, catchAndShotTpm, catchAndShotTpa, catchAndShotTpRatio];

    int pullUpFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.PULLUP)).countSync();
    int pullUpFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.PULLUP)).countSync();
    double pullUpFgRatio = 0.0;
    if (pullUpFga != 0) {
      pullUpFgRatio = ((pullUpFgm/pullUpFga) * 100 * 10).round() / 10;
    }
    int pullUpTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.PULLUP)).countSync();
    int pullUpTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.PULLUP)).countSync();
    double pullUpTpRatio = 0.0;
    if (pullUpTpa != 0) {
      pullUpTpRatio = ((pullUpTpm/pullUpTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> pullUpStats = ["PULL UP", pullUpFgm, pullUpFga, pullUpFgRatio, pullUpTpm, pullUpTpa, pullUpTpRatio];

    int floatingFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.FLOATING_SHOT)).countSync();
    int floatingFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.FLOATING_SHOT)).countSync();
    double floatingFgRatio = 0.0;
    if (floatingFga != 0) {
      floatingFgRatio = ((floatingFgm/floatingFga) * 100 * 10).round() / 10;
    }
    int floatingTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.FLOATING_SHOT)).countSync();
    int floatingTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.FLOATING_SHOT)).countSync();
    double floatingTpRatio = 0.0;
    if (floatingTpa != 0) {
      floatingTpRatio = ((floatingTpm/floatingTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> floatingStats = ["FLOATING", floatingFgm, floatingFga, floatingFgRatio, floatingTpm, floatingTpa, floatingTpRatio];

    int hookFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.HOOK_SHOT)).countSync();
    int hookFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.HOOK_SHOT)).countSync();
    double hookFgRatio = 0.0;
    if (hookFga != 0) {
      hookFgRatio = ((hookFgm/hookFga) * 100 * 10).round() / 10;
    }
    int hookTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.HOOK_SHOT)).countSync();
    int hookTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.HOOK_SHOT)).countSync();
    double hookTpRatio = 0.0;
    if (hookTpa != 0) {
      hookTpRatio = ((hookTpm/hookTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> hookStats = ["HOOK SHOT", hookFgm, hookFga, hookFgRatio, hookTpm, hookTpa, hookTpRatio];

    int tipFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.TIP_SHOT)).countSync();
    int tipFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.TIP_SHOT)).countSync();
    double tipFgRatio = 0.0;
    if (tipFga != 0) {
      tipFgRatio = ((tipFgm/tipFga) * 100 * 10).round() / 10;
    }
    int tipTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.TIP_SHOT)).countSync();
    int tipTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.TIP_SHOT)).countSync();
    double tipTpRatio = 0.0;
    if (tipTpa != 0) {
      tipTpRatio = ((tipTpm/tipTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> tipStats = ["TIP SHOT", tipFgm, tipFga, tipFgRatio, tipTpm, tipTpa, tipTpRatio];

    int fadeAwayFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.FADEAWAY)).countSync();
    int fadeAwayFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.FADEAWAY)).countSync();
    double fadeAwayFgRatio = 0.0;
    if (fadeAwayFga != 0) {
      fadeAwayFgRatio = ((fadeAwayFgm/fadeAwayFga) * 100 * 10).round() / 10;
    }
    int fadeAwayTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.FADEAWAY)).countSync();
    int fadeAwayTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.FADEAWAY)).countSync();
    double fadeAwayTpRatio = 0.0;
    if (fadeAwayTpa != 0) {
      fadeAwayTpRatio = ((fadeAwayTpm/fadeAwayTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> fadeAwayStats = ["FADEAWAY", fadeAwayFgm, fadeAwayFga, fadeAwayFgRatio, fadeAwayTpm, fadeAwayTpa, fadeAwayTpRatio];

    int dunkFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.DUNK)).countSync();
    int dunkFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.DUNK)).countSync();
    double dunkFgRatio = 0.0;
    if (dunkFga != 0) {
      dunkFgRatio = ((dunkFgm/dunkFga) * 100 * 10).round() / 10;
    }
    int dunkTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.DUNK)).countSync();
    int dunkTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.DUNK)).countSync();
    double dunkTpRatio = 0.0;
    if (dunkTpa != 0) {
      dunkTpRatio = ((dunkTpm/dunkTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> dunkStats = ["DUNK", dunkFgm, dunkFga, dunkFgRatio, dunkTpm, dunkTpa, dunkTpRatio];

    int alleyOopFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.ALLEY_OOP)).countSync();
    int alleyOopFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.ALLEY_OOP)).countSync();
    double alleyOopFgRatio = 0.0;
    if (alleyOopFga != 0) {
      alleyOopFgRatio = ((alleyOopFgm/alleyOopFga) * 100 * 10).round() / 10;
    }
    int alleyOopTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.ALLEY_OOP)).countSync();
    int alleyOopTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotTypeEqualTo(ShotType.ALLEY_OOP)).countSync();
    double alleyOopTpRatio = 0.0;
    if (alleyOopTpa != 0) {
      alleyOopTpRatio = ((alleyOopTpm/alleyOopTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> alleyOopStats = ["ALLEY OOP", alleyOopFgm, alleyOopFga, alleyOopFgRatio, alleyOopTpm, alleyOopTpa, alleyOopTpRatio];

    List<List<dynamic>> shotTypeStats = [
      layupStats,
      catchAndShotStats,
      pullUpStats,
      floatingStats,
      hookStats,
      tipStats,
      fadeAwayStats,
      dunkStats,
      alleyOopStats
    ];

    return shotTypeStats;
  }

  List<List<dynamic>> getPlayTypeStats(int? opponentTeamId) {
    int isolationFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.ISOLATION)).countSync();
    int isolationFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.ISOLATION)).countSync();
    double isolationFgRatio = 0.0;
    if (isolationFga != 0) {
      isolationFgRatio = ((isolationFgm/isolationFga) * 100 * 10).round() / 10;
    }
    int isolationTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.ISOLATION)).countSync();
    int isolationTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.ISOLATION)).countSync();
    double isolationTpRatio = 0.0;
    if (isolationTpa != 0) {
      isolationTpRatio = ((isolationTpm/isolationTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> isolationStats = ["ISOLATION", isolationFgm, isolationFga, isolationFgRatio, isolationTpm, isolationTpa, isolationTpRatio];

    int fastBreakFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.FASTBREAK)).countSync();
    int fastBreakFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.FASTBREAK)).countSync();
    double fastBreakFgRatio = 0.0;
    if (fastBreakFga != 0) {
      fastBreakFgRatio = ((fastBreakFgm/fastBreakFga) * 100 * 10).round() / 10;
    }
    int fastBreakTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.FASTBREAK)).countSync();
    int fastBreakTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.FASTBREAK)).countSync();
    double fastBreakTpRatio = 0.0;
    if (fastBreakTpa != 0) {
      fastBreakTpRatio = ((fastBreakTpm/fastBreakTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> fastBreakStats = ["FAST_BREAK", fastBreakFgm, fastBreakFga, fastBreakFgRatio, fastBreakTpm, fastBreakTpa, fastBreakTpRatio];

    int handlerFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_BALL_HANDLER)).countSync();
    int handlerFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_BALL_HANDLER)).countSync();
    double handlerFgRatio = 0.0;
    if (handlerFga != 0) {
      handlerFgRatio = ((handlerFgm/handlerFga) * 100 * 10).round() / 10;
    }
    int handlerTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_BALL_HANDLER)).countSync();
    int handlerTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_BALL_HANDLER)).countSync();
    double handlerTpRatio = 0.0;
    if (handlerTpa != 0) {
      handlerTpRatio = ((handlerTpm/handlerTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> handlerStats = ["P&R BALLER", handlerFgm, handlerFga, handlerFgRatio, handlerTpm, handlerTpa, handlerTpRatio];

    int rollerFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_ROLL_MAN)).countSync();
    int rollerFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_ROLL_MAN)).countSync();
    double rollerFgRatio = 0.0;
    if (rollerFga != 0) {
      rollerFgRatio = ((rollerFgm/rollerFga) * 100 * 10).round() / 10;
    }
    int rollerTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_ROLL_MAN)).countSync();
    int rollerTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_ROLL_MAN)).countSync();
    double rollerTpRatio = 0.0;
    if (rollerTpa != 0) {
      rollerTpRatio = ((rollerTpm/rollerTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> rollerStats = ["P&R ROLLER", rollerFgm, rollerFga, rollerFgRatio, rollerTpm, rollerTpa, rollerTpRatio];

    int postUpFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.POSTUP)).countSync();
    int postUpFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.POSTUP)).countSync();
    double postUpFgRatio = 0.0;
    if (postUpFga != 0) {
      postUpFgRatio = ((postUpFgm/postUpFga) * 100 * 10).round() / 10;
    }
    int postUpTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.POSTUP)).countSync();
    int postUpTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.POSTUP)).countSync();
    double postUpTpRatio = 0.0;
    if (postUpTpa != 0) {
      postUpTpRatio = ((postUpTpm/postUpTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> postUpStats = ["POST UP", postUpFgm, postUpFga, postUpFgRatio, postUpTpm, postUpTpa, postUpTpRatio];

    int spotUpFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.SPOTUP)).countSync();
    int spotUpFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.SPOTUP)).countSync();
    double spotUpFgRatio = 0.0;
    if (spotUpFga != 0) {
      spotUpFgRatio = ((spotUpFgm/spotUpFga) * 100 * 10).round() / 10;
    }
    int spotUpTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.SPOTUP)).countSync();
    int spotUpTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.SPOTUP)).countSync();
    double spotUpTpRatio = 0.0;
    if (spotUpTpa != 0) {
      spotUpTpRatio = ((spotUpTpm/spotUpTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> spotUpStats = ["SPOT UP", spotUpFgm, spotUpFga, spotUpFgRatio, spotUpTpm, spotUpTpa, spotUpTpRatio];

    int handoffFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.HANDOFF)).countSync();
    int handoffFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.HANDOFF)).countSync();
    double handoffFgRatio = 0.0;
    if (handoffFga != 0) {
      handoffFgRatio = ((spotUpFgm/spotUpFga) * 100 * 10).round() / 10;
    }
    int handoffTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.HANDOFF)).countSync();
    int handoffTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.HANDOFF)).countSync();
    double handoffTpRatio = 0.0;
    if (handoffTpa != 0) {
      handoffTpRatio = ((handoffTpm/handoffTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> handoffStats = ["HAND OFF", handoffFgm, handoffFga, handoffFgRatio, handoffTpm, handoffTpa, handoffTpRatio];

    int cutFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    int cutFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    double cutFgRatio = 0.0;
    if (cutFga != 0) {
      cutFgRatio = ((cutFgm/cutFga) * 100 * 10).round() / 10;
    }
    int cutTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    int cutTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    double cutTpRatio = 0.0;
    if (cutTpa != 0) {
      cutTpRatio = ((cutTpm/cutTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> cutStats = ["CUT", cutFgm, cutFga, cutFgRatio, cutTpm, cutTpa, cutTpRatio];

    int offScreenFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    int offScreenFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    double offScreenFgRatio = 0.0;
    if (offScreenFga != 0) {
      offScreenFgRatio = ((offScreenFgm/offScreenFga) * 100 * 10).round() / 10;
    }
    int offScreenTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    int offScreenTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    double offScreenTpRatio = 0.0;
    if (offScreenTpa != 0) {
      offScreenTpRatio = ((offScreenTpm/offScreenTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> offScreenStats = ["OFF SCREEN", offScreenFgm, offScreenFga, offScreenFgRatio, offScreenTpm, offScreenTpa, offScreenTpRatio];

    List<List<dynamic>> playTypeStats = [
      isolationStats,
      fastBreakStats,
      handlerStats,
      rollerStats,
      postUpStats,
      spotUpStats,
      handoffStats,
      cutStats,
      offScreenStats,
    ];

    return playTypeStats;
  }

  List<List<dynamic>> getShotZoneStats(int? opponentTeamId) {
    int inThePaintFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.IN_THE_PAINT)).countSync();
    int inThePaintFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.IN_THE_PAINT)).countSync();
    double inThePaintFgRatio = 0.0;
    if (inThePaintFga != 0) {
      inThePaintFgRatio = ((inThePaintFgm/inThePaintFga) * 100 * 10).round() / 10;
    }
    int inThePaintTpa = 0;
    int inThePaintTpm = 0;
    double inThePaintTpRatio = 0.0;
    List<dynamic> inThePaintStats = ["IN THE PAINT", inThePaintFgm, inThePaintFga, inThePaintFgRatio, inThePaintTpm, inThePaintTpa, inThePaintTpRatio];

    int middleAreaFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.MIDDLE_AREA)).countSync();
    int middleAreaFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.MIDDLE_AREA)).countSync();
    double middleAreaFgRatio = 0.0;
    if (middleAreaFga != 0) {
      middleAreaFgRatio = ((middleAreaFgm/middleAreaFga) * 100 * 10).round() / 10;
    }
    int middleAreaTpa = 0;
    int middleAreaTpm = 0;
    double middleAreaTpRatio = 0.0;
    List<dynamic> middleAreaStats = ["MIDDLE AREA", middleAreaFgm, middleAreaFga, middleAreaFgRatio, middleAreaTpm, middleAreaTpa, middleAreaTpRatio];

    int aroundTopThreeFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.AROUND_TOP_THREE)).countSync();
    int aroundTopThreeFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.AROUND_TOP_THREE)).countSync();
    double aroundTopThreeFgRatio = 0.0;
    if (aroundTopThreeFga != 0) {
      aroundTopThreeFgRatio = ((aroundTopThreeFgm/aroundTopThreeFga) * 100 * 10).round() / 10;
    }
    int aroundTopThreeTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.AROUND_TOP_THREE)).countSync();
    int aroundTopThreeTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.AROUND_TOP_THREE)).countSync();
    double aroundTopThreeTpRatio = 0.0;
    if (aroundTopThreeTpa != 0) {
      aroundTopThreeTpRatio = ((aroundTopThreeTpm/aroundTopThreeTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> aroundTopThreeStats = ["AROUND TOP THREE", aroundTopThreeFgm, aroundTopThreeFga, aroundTopThreeFgRatio, aroundTopThreeTpm, aroundTopThreeTpa, aroundTopThreeTpRatio];

    int leftCornerThreeFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.LEFT_CORNER_THREE)).countSync();
    int leftCornerThreeFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.LEFT_CORNER_THREE)).countSync();
    double leftCornerThreeFgRatio = 0.0;
    if (leftCornerThreeFgRatio != 0) {
      leftCornerThreeFgRatio = ((leftCornerThreeFgm/leftCornerThreeFga) * 100 * 10).round() / 10;
    }
    int leftCornerThreeTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.LEFT_CORNER_THREE)).countSync();
    int leftCornerThreeTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.LEFT_CORNER_THREE)).countSync();
    double leftCornerThreeTpRatio = 0.0;
    if (leftCornerThreeTpa != 0) {
      leftCornerThreeTpRatio = ((leftCornerThreeTpm/leftCornerThreeTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> leftCornerThreeStats = ["LEFT CORNER THREE", leftCornerThreeFgm, leftCornerThreeFga, leftCornerThreeFgRatio, leftCornerThreeTpm, leftCornerThreeTpa, leftCornerThreeTpRatio];

    int rightCornerThreeFga = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.RIGHT_CORNER_THREE)).countSync();
    int rightCornerThreeFgm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.RIGHT_CORNER_THREE)).countSync();
    double rightCornerThreeFgRatio = 0.0;
    if (rightCornerThreeFga != 0) {
      rightCornerThreeFgRatio = ((rightCornerThreeFgm/rightCornerThreeFga) * 100 * 10).round() / 10;
    }
    int rightCornerThreeTpa = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.RIGHT_CORNER_THREE)).countSync();
    int rightCornerThreeTpm = isar.pbps.filter().not().playerIsNull().and().game((q) => opponentTeamId==null ? q.not().opponentIsNull() : q.opponent((q) => q.idEqualTo(opponentTeamId))).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.shotZoneEqualTo(ShotZone.RIGHT_CORNER_THREE)).countSync();
    double rightCornerThreeTpRatio = 0.0;
    if (rightCornerThreeTpa != 0) {
      rightCornerThreeTpRatio = ((rightCornerThreeTpm/rightCornerThreeTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> rightCornerThreeStats = ["RIGHT CORNER THREE", rightCornerThreeFgm, rightCornerThreeFga, rightCornerThreeFgRatio, rightCornerThreeTpm, rightCornerThreeTpa, rightCornerThreeTpRatio];

    List<List<dynamic>> stats = [
      inThePaintStats,
      middleAreaStats,
      aroundTopThreeStats,
      leftCornerThreeStats,
      rightCornerThreeStats
    ];

    return stats;
  }

  List<List<dynamic>> getPlayTypeStatsByPlayer(int playerId) {
    int isolationFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.ISOLATION)).countSync();
    int isolationFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.ISOLATION)).countSync();
    double isolationFgRatio = 0.0;
    if (isolationFga != 0) {
      isolationFgRatio = ((isolationFgm/isolationFga) * 100 * 10).round() / 10;
    }
    int isolationTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.ISOLATION)).countSync();
    int isolationTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.ISOLATION)).countSync();
    double isolationTpRatio = 0.0;
    if (isolationTpa != 0) {
      isolationTpRatio = ((isolationTpm/isolationTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> isolationStats = ["ISOLATION", isolationFgm, isolationFga, isolationFgRatio, isolationTpm, isolationTpa, isolationTpRatio];

    int fastBreakFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.FASTBREAK)).countSync();
    int fastBreakFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.FASTBREAK)).countSync();
    double fastBreakFgRatio = 0.0;
    if (fastBreakFga != 0) {
      fastBreakFgRatio = ((fastBreakFgm/fastBreakFga) * 100 * 10).round() / 10;
    }
    int fastBreakTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.FASTBREAK)).countSync();
    int fastBreakTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.FASTBREAK)).countSync();
    double fastBreakTpRatio = 0.0;
    if (fastBreakTpa != 0) {
      fastBreakTpRatio = ((fastBreakTpm/fastBreakTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> fastBreakStats = ["FAST_BREAK", fastBreakFgm, fastBreakFga, fastBreakFgRatio, fastBreakTpm, fastBreakTpa, fastBreakTpRatio];

    int handlerFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_BALL_HANDLER)).countSync();
    int handlerFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_BALL_HANDLER)).countSync();
    double handlerFgRatio = 0.0;
    if (handlerFga != 0) {
      handlerFgRatio = ((handlerFgm/handlerFga) * 100 * 10).round() / 10;
    }
    int handlerTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_BALL_HANDLER)).countSync();
    int handlerTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_BALL_HANDLER)).countSync();
    double handlerTpRatio = 0.0;
    if (handlerTpa != 0) {
      handlerTpRatio = ((handlerTpm/handlerTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> handlerStats = ["P&R BALLER", handlerFgm, handlerFga, handlerFgRatio, handlerTpm, handlerTpa, handlerTpRatio];

    int rollerFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_ROLL_MAN)).countSync();
    int rollerFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_ROLL_MAN)).countSync();
    double rollerFgRatio = 0.0;
    if (rollerFga != 0) {
      rollerFgRatio = ((rollerFgm/rollerFga) * 100 * 10).round() / 10;
    }
    int rollerTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_ROLL_MAN)).countSync();
    int rollerTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.PICK_AND_ROLL_ROLL_MAN)).countSync();
    double rollerTpRatio = 0.0;
    if (rollerTpa != 0) {
      rollerTpRatio = ((rollerTpm/rollerTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> rollerStats = ["P&R ROLLER", rollerFgm, rollerFga, rollerFgRatio, rollerTpm, rollerTpa, rollerTpRatio];

    int postUpFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.POSTUP)).countSync();
    int postUpFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.POSTUP)).countSync();
    double postUpFgRatio = 0.0;
    if (postUpFga != 0) {
      postUpFgRatio = ((postUpFgm/postUpFga) * 100 * 10).round() / 10;
    }
    int postUpTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.POSTUP)).countSync();
    int postUpTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.POSTUP)).countSync();
    double postUpTpRatio = 0.0;
    if (postUpTpa != 0) {
      postUpTpRatio = ((postUpTpm/postUpTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> postUpStats = ["POST UP", postUpFgm, postUpFga, postUpFgRatio, postUpTpm, postUpTpa, postUpTpRatio];

    int spotUpFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.SPOTUP)).countSync();
    int spotUpFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.SPOTUP)).countSync();
    double spotUpFgRatio = 0.0;
    if (spotUpFga != 0) {
      spotUpFgRatio = ((spotUpFgm/spotUpFga) * 100 * 10).round() / 10;
    }
    int spotUpTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.SPOTUP)).countSync();
    int spotUpTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.SPOTUP)).countSync();
    double spotUpTpRatio = 0.0;
    if (spotUpTpa != 0) {
      spotUpTpRatio = ((spotUpTpm/spotUpTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> spotUpStats = ["SPOT UP", spotUpFgm, spotUpFga, spotUpFgRatio, spotUpTpm, spotUpTpa, spotUpTpRatio];

    int handoffFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.HANDOFF)).countSync();
    int handoffFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.HANDOFF)).countSync();
    double handoffFgRatio = 0.0;
    if (handoffFga != 0) {
      handoffFgRatio = ((spotUpFgm/spotUpFga) * 100 * 10).round() / 10;
    }
    int handoffTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.HANDOFF)).countSync();
    int handoffTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.HANDOFF)).countSync();
    double handoffTpRatio = 0.0;
    if (handoffTpa != 0) {
      handoffTpRatio = ((handoffTpm/handoffTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> handoffStats = ["HAND OFF", handoffFgm, handoffFga, handoffFgRatio, handoffTpm, handoffTpa, handoffTpRatio];

    int cutFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    int cutFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    double cutFgRatio = 0.0;
    if (cutFga != 0) {
      cutFgRatio = ((cutFgm/cutFga) * 100 * 10).round() / 10;
    }
    int cutTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    int cutTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    double cutTpRatio = 0.0;
    if (cutTpa != 0) {
      cutTpRatio = ((cutTpm/cutTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> cutStats = ["CUT", cutFgm, cutFga, cutFgRatio, cutTpm, cutTpa, cutTpRatio];

    int offScreenFga = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MISS)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    int offScreenFgm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MADE).or().typeEqualTo(RecordType.TWO_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    double offScreenFgRatio = 0.0;
    if (offScreenFga != 0) {
      offScreenFgRatio = ((offScreenFgm/offScreenFga) * 100 * 10).round() / 10;
    }
    int offScreenTpa = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().group((q) => q.typeEqualTo(RecordType.THREE_POINT_MISS).or().typeEqualTo(RecordType.THREE_POINT_MADE)).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    int offScreenTpm = isar.pbps.filter().player((q) => q.idEqualTo(playerId)).and().typeEqualTo(RecordType.THREE_POINT_MADE).and().shotPosition((q) => q.playTypeEqualTo(PlayType.CUT)).countSync();
    double offScreenTpRatio = 0.0;
    if (offScreenTpa != 0) {
      offScreenTpRatio = ((offScreenTpm/offScreenTpa) * 100 * 10).round() / 10;
    }
    List<dynamic> offScreenStats = ["OFF SCREEN", offScreenFgm, offScreenFga, offScreenFgRatio, offScreenTpm, offScreenTpa, offScreenTpRatio];

    List<List<dynamic>> playTypeStats = [
      isolationStats,
      fastBreakStats,
      handlerStats,
      rollerStats,
      postUpStats,
      spotUpStats,
      handoffStats,
      cutStats,
      offScreenStats,
    ];

    return playTypeStats;
  }

  List<List<dynamic>> getAssistPlayerStats(int playerId) {
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
}