import 'package:freezed_annotation/freezed_annotation.dart';
import '../game/game.dart';

part 'game_list_model.freezed.dart';

@freezed
class GameListModel with _$GameListModel {
  const factory GameListModel({
    required List<Game> games,
    required DateTime dateTime,
  }) = _GameListModel;
}