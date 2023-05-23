import 'dart:typed_data';

import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../enums/ShotZone.dart';
import '../pbp/pbp.dart';
import '../player/player.dart';

part 'game_chart_model.freezed.dart';

@freezed
class GameChartModel with _$GameChartModel {
  const factory GameChartModel({
    required BlendMode blendMode,
    required List<Player> players,

    required MemoryImage? image,
    required Uint8List? src,
    required List<Pbp> pbps,
    required int period,
    required PlayType playType,
    required ShotType shotType,
    required ShotZone shotZone,
    required int shotFilter,
    required int? selectedPlayerId,

    required MemoryImage? opponentImage,
    required Uint8List? opponentSrc,
    required List<Pbp> opponentPbps,
    required int opponentPeriod,
    required PlayType opponentPlayType,
    required ShotType opponentShotType,
    required ShotZone opponentShotZone,
    required int opponentShotFilter,
    required int? defencedPlayerId,
  }) = _GameChartModel;
}