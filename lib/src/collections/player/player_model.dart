import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_model.freezed.dart';

@freezed
class PlayerModel with _$PlayerModel {
  const factory PlayerModel({
    required String name,
    required String editName,
    required TextEditingController playerNameInputController,
    required bool showPreview,
    required String? imagePath,
    required bool visible,
  }) = _PlayerModel;
}