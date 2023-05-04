import 'package:bb_stats/src/collections/teamDetail/team_detail_model.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:bb_stats/src/repositories/teamStatRepository.php.dart';
import 'package:bb_stats/src/repositories/team_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../consts/CsvColumns.dart';
import '../enums/Outcome.dart';
import '../repositories/boxscore_repository.dart';
import '../repositories/pbp_repository.dart';

class TeamDetailStateNotifier extends StateNotifier<TeamDetailModel> {
  TeamDetailStateNotifier(
      this.teamRepository,
      this.gameRepository,
      this.teamStatRepository,
      this.boxScoreRepository,
      this.pbpRepository,
  ) : super(
      TeamDetailModel(
        start: null,
        end: null,
        opponentTeamId: null,
        opponentTeams: teamRepository.findTeams(),
        overallStats: gameRepository.getOverallStats(null, null, null),
        winStats: gameRepository.getStatsByResult(null, null, null, Outcome.WIN),
        loseStats: gameRepository.getStatsByResult(null, null, null, Outcome.LOSE),
        playTypeStats: pbpRepository.getPlayTypeStats(null, 0, true),
        playTypeSortTargetIndex: 0,
        playTypeAscending: true,
        shotZoneStats: pbpRepository.getShotZoneStats(null, 0, true),
        shotZoneSortTargetIndex: 0,
        shotZoneAscending: true,
      )
  );

  final TeamRepository teamRepository;
  final GameRepository gameRepository;
  final TeamStatRepository teamStatRepository;
  final BoxscoreRepository boxScoreRepository;
  final PbpRepository pbpRepository;

  List<dynamic> getOverAllStats(DateTime? start, DateTime? end, int? opponentId) {
    return gameRepository.getOverallStats(start, end, opponentId);
  }

  List<dynamic> getWinStats(DateTime? start, DateTime? end, int? opponentId) {
    return gameRepository.getStatsByResult(start, end, opponentId, Outcome.WIN);
  }

  List<dynamic> getLoseStats(DateTime? start, DateTime? end, int? opponentId) {
    return gameRepository.getStatsByResult(start, end, opponentId, Outcome.LOSE);
  }

  List<List<dynamic>> getPlayTypeStats(int? opponentTeamId, int index, bool ascending) {
    return pbpRepository.getPlayTypeStats(opponentTeamId, index, ascending);
  }

  List<List<dynamic>> getShotZoneStats(int? opponentTeamId, int index, bool ascending) {
    return pbpRepository.getShotZoneStats(opponentTeamId, index, ascending);
  }

  void updateStartDate(DateTime start) {
    List<dynamic> overallStats = state.overallStats;
    List<dynamic> winStats = state.winStats;
    List<dynamic> loseStats = state.loseStats;
    List<List<dynamic>> playTypeStats = state.playTypeStats;
    List<List<dynamic>> shotZoneStats = state.shotZoneStats;
    if (state.end != null) {
      overallStats = gameRepository.getOverallStats(start, state.end, state.opponentTeamId);
      winStats = gameRepository.getStatsByResult(start, state.end, state.opponentTeamId, Outcome.WIN);
      loseStats = gameRepository.getStatsByResult(start, state.end, state.opponentTeamId, Outcome.LOSE);
      playTypeStats = pbpRepository.getPlayTypeStats(state.opponentTeamId, state.playTypeSortTargetIndex, state.playTypeAscending);
      shotZoneStats = pbpRepository.getShotZoneStats(state.opponentTeamId, state.shotZoneSortTargetIndex, state.shotZoneAscending);
    }

    state = state.copyWith(
        start: start,
        overallStats: overallStats,
        winStats: winStats,
        loseStats: loseStats,
        playTypeStats: playTypeStats,
        shotZoneStats: shotZoneStats,
    );
  }

  void updateEndDate(DateTime end) {
    List<dynamic> overallStats = state.overallStats;
    List<dynamic> winStats = state.winStats;
    List<dynamic> loseStats = state.loseStats;
    List<List<dynamic>> playTypeStats = state.playTypeStats;
    List<List<dynamic>> shotZoneStats = state.shotZoneStats;
    if (state.start != null) {
      overallStats = gameRepository.getOverallStats(state.start, end, state.opponentTeamId);
      winStats = gameRepository.getStatsByResult(state.start, end, state.opponentTeamId, Outcome.WIN);
      loseStats = gameRepository.getStatsByResult(state.start, end, state.opponentTeamId, Outcome.LOSE);
      playTypeStats = pbpRepository.getPlayTypeStats(state.opponentTeamId, state.playTypeSortTargetIndex, state.playTypeAscending);
      shotZoneStats = pbpRepository.getShotZoneStats(state.opponentTeamId, state.shotZoneSortTargetIndex, state.shotZoneAscending);
    }

    state = state.copyWith(
        end: end,
        overallStats: overallStats,
        winStats: winStats,
        loseStats: loseStats,
        playTypeStats: playTypeStats,
        shotZoneStats: shotZoneStats,
    );
  }

  void updateOpponentTeamId(int? teamId) {
    state = state.copyWith(
        opponentTeamId: teamId,
        overallStats: gameRepository.getOverallStats(state.start, state.end, teamId),
        playTypeStats: pbpRepository.getPlayTypeStats(teamId, state.playTypeSortTargetIndex, state.playTypeAscending),
        shotZoneStats: pbpRepository.getShotZoneStats(teamId, state.shotZoneSortTargetIndex, state.shotZoneAscending),
    );

  }

  void updatePlayTypeSortTargetIndex(int index, bool ascending) {
    List<List<dynamic>> playerTypeStats = pbpRepository.getPlayTypeStats(null, index, ascending);

    state = state.copyWith(
      playTypeStats: playerTypeStats,
      playTypeSortTargetIndex: index,
      playTypeAscending: !state.playTypeAscending,
    );
  }

  void updateShotZoneSortTargetIndex(int index, bool ascending) {
    List<List<dynamic>> shotZoneStats = pbpRepository.getShotZoneStats(null, index, ascending);

    state = state.copyWith(
      shotZoneStats: shotZoneStats,
      shotZoneSortTargetIndex: index,
      shotZoneAscending: !state.shotZoneAscending,
    );
  }

  String getStatsString(int id) {
    List<String> stats = [
      CsvColumns.teamStatColumnList.join(','),
    ];
    List<String> overallList = [];
    for (var item in state.overallStats) {
      overallList.add(item.toString());
    }
    stats.add(overallList.join(','));

    stats.add(CsvColumns.resultStatColumnList.join(','));
    List<String> winList = [];
    for (var item in state.winStats) {
      winList.add(item.toString());
    }
    stats.add(winList.join(','));
    List<String> loseList = [];
    for (var item in state.loseStats) {
      loseList.add(item.toString());
    }
    stats.add(loseList.join(','));

    stats.add(CsvColumns.playTypeColumnList.join(','));
    for (var stat in state.playTypeStats) {
      List<String> tmpList = [];
      for (var item in stat) {
        tmpList.add(item.toString());
      }
      stats.add(tmpList.join(','));
    }

    stats.add(CsvColumns.shotZoneColumnList.join(','));
    for (var stat in state.shotZoneStats) {
      List<String> tmpList = [];
      for (var item in stat) {
        tmpList.add(item.toString());
      }
      stats.add(tmpList.join(','));
    }

    return stats.join("\n");
  }
}