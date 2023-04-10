import 'package:freezed_annotation/freezed_annotation.dart';

import '../player/player.dart';

part 'player_select_model.freezed.dart';

@freezed
class PlayerSelectModel with _$PlayerSelectModel {
  const factory PlayerSelectModel({
    required List<Player> players,
  }) = _PlayerSelectModel;
}