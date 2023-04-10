import 'package:bb_stats/src/repositories/team_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../collections/teamSelect/team_select_model.dart';

class TeamSelectStateNotifier extends StateNotifier<TeamSelectModel> {
  TeamSelectStateNotifier(this.teamRepository)
      : super (TeamSelectModel(
    teams: teamRepository.findTeams(),
  ));
  final TeamRepository teamRepository;

  void updateTeamListState() {
    state = state.copyWith(
      teams: teamRepository.findTeams()
    );
  }

}