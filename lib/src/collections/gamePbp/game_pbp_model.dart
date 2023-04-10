import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/pbp/pbp.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_pbp_model.freezed.dart';

@freezed
class GamePbpModel with _$GamePbpModel {
  const factory GamePbpModel({
    required Game game,
    required List<Pbp> pbps,
    required int quarter,
  }) = _GamePbpModel;
}