import 'dart:typed_data';
import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import '../../enums/ShotZone.dart';
import '../player/player.dart';

part 'opponent_shot_model.freezed.dart';

@freezed
class OpponentShotModel with _$OpponentShotModel {
  const factory OpponentShotModel({
    required ImageProvider? image,
    required BlendMode blendMode,
    required Uint8List? src,
    required int? positionX,
    required int? positionY,
    required bool result,
    required List<Player> players,
    required int? defencePlayerId,
    required PlayType playType,
    required ShotType shotType,
    required ShotZone shotZone,
    required int point,
  }) = _OpponentShotModel;
}