import 'package:freezed_annotation/freezed_annotation.dart';

part 'shot_parameter.freezed.dart';

@freezed
class ShotParameter with _$ShotParameter {
  const factory ShotParameter({
    required int gameId,
    required int playerId,
  }) = _ShotParameter;
}