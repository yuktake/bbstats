import 'dart:typed_data';

import 'package:bb_stats/src/collections/boxscore/boxscore.dart';
import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/pbp/pbp.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../player/player.dart';

part 'game_stat_model.freezed.dart';

@freezed
class GameStatModel with _$GameStatModel {
  const factory GameStatModel({
    required Game game,
    required ImageProvider? image,
    required BlendMode blendMode,
    required Uint8List? src,
    required List<Pbp> pbps,
    required int shotFilter,
    required int? selectedPlayerId,
    required Boxscore? detailPlayer,
    required List<List<dynamic>> comparisonStats,
  }) = _GameStatModel;
}