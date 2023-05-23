import 'package:bb_stats/src/collections/boxscore/boxscore.dart';
import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/pbp/pbp.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../player/player.dart';

part 'game_record_model.freezed.dart';

@freezed
class GameRecordModel with _$GameRecordModel {
  const factory GameRecordModel({
    required Player? player1,
    required Player? player2,
    required Player? player3,
    required Player? player4,
    required Player? player5,
    required Game game,
    required int quarterMin,
    required int overtimeQuarterMin,
    required DateTime time,
    required int currentQuarter,
    required List<Pbp> records,
    required List<Boxscore> substitutes,
    required ScrollController controller
  }) = _GameRecordModel;
}