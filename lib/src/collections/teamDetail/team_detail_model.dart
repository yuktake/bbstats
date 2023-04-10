import 'package:bb_stats/src/collections/team/team.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'team_detail_model.freezed.dart';

@freezed
class TeamDetailModel with _$TeamDetailModel {
  const factory TeamDetailModel({
    required DateTime? start,
    required DateTime? end,
    required int? opponentTeamId,
    required List<Team> opponentTeams,
    required List<dynamic> overallStats,
    required List<dynamic> winStats,
    required List<dynamic> loseStats,
    required List<List<dynamic>> playTypeStats,
    required List<List<dynamic>> shotZoneStats,
  }) = _TeamDetailModel;
}