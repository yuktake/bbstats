import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_model.freezed.dart';

@freezed
class TeamModel with _$TeamModel {
  const factory TeamModel({
    required String name,
    required String editName,
    required TextEditingController teamNameInputController,
    required String? image,
    required bool showPreview,
  }) = _TeamModel;
}