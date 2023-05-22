import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:bb_stats/src/collections/team/team.dart';

import '../game/game.dart';
import '../player/player.dart';

part 'game_preparation_model.freezed.dart';

@freezed
class GamePreparationModel with _$GamePreparationModel {
  const factory GamePreparationModel({
    required DateTime gameDate,
    required int quarterMin,
    required int overtimeQuarterMin,
    required Team myTeam,
    required Team? opponentTeam,
    required Player? pg,
    required Player? sg,
    required Player? sf,
    required Player? pf,
    required Player? c,
    required List<Game> histories,
    required bool startable,
  }) = _GamePreparationModel;
}