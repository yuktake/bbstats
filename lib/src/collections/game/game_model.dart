import 'package:bb_stats/src/collections/game/game.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'game_model.freezed.dart';

@freezed
class GameModel with _$GameModel {
  const factory GameModel({
    required Game? game,
    required int page,
  }) = _GameModel;
}