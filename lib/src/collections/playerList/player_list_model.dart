import 'package:freezed_annotation/freezed_annotation.dart';

import '../player/player.dart';

part 'player_list_model.freezed.dart';

@freezed
class PlayerListModel with _$PlayerListModel {
  const factory PlayerListModel({
    required List<Player> players,
    required bool visible,
  }) = _PlayerListModel;
}