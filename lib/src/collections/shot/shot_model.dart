import 'dart:typed_data';

import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:bb_stats/src/enums/ShotZone.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../player/player.dart';

part 'shot_model.freezed.dart';

@freezed
class ShotModel with _$ShotModel {
  const factory ShotModel({
    required ImageProvider? image,
    required BlendMode blendMode,
    required Uint8List? src,
    required int? positionX,
    required int? positionY,
    required bool result,
    required List<Player> players,
    required int? supportPlayerId,
    required PlayType playType,
    required ShotType shotType,
    required ShotZone shotZone,
    required int point,
  }) = _ShotModel;
}