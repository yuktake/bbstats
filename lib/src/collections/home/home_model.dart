import 'package:freezed_annotation/freezed_annotation.dart';
import '../team/team.dart';

part 'home_model.freezed.dart';

@freezed
class HomeModel with _$HomeModel {
  const factory HomeModel({
    required List<dynamic> teamStat,
    required DateTime? start,
    required DateTime? end,
    required List<List<dynamic>> playerStats,
    required Team team,
    required int win,
    required int lost,
    required int sortTargetIndex,
    required bool ascending,
  }) = _HomeModel;
}