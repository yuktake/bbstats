import 'package:freezed_annotation/freezed_annotation.dart';

import '../team/team.dart';

part 'team_select_model.freezed.dart';

@freezed
class TeamSelectModel with _$TeamSelectModel {
  const factory TeamSelectModel({
    required List<Team> teams,
  }) = _TeamSelectModel;
}