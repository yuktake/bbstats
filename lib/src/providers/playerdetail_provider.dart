import 'package:bb_stats/src/collections/playerDetail/player_detail_model.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/pbp_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../consts/CsvColumns.dart';

class PlayerDetailStateNotifier extends StateNotifier<PlayerDetailModel> {
  PlayerDetailStateNotifier(
      this.playerId,
      this.boxScoreRepository,
      this.pbpRepository,
  ) : super(
    PlayerDetailModel(
      start: null,
      end: null,
      seasonStats: boxScoreRepository.getSeasonStats(playerId, null, null),
      shotTypeStats: pbpRepository.getShotTypeStatsByPlayer(playerId, 0, true),
      shotTypeSortTargetIndex: 0,
      shotTypeAscending: true,
      playTypeStats: pbpRepository.getPlayTypeStatsByPlayer(playerId, 0, true),
      playTypeSortTargetIndex: 0,
      playTypeAscending: true,
      assistPlayerStats: pbpRepository.getAssistPlayerStats(playerId, 0, true),
      assistSortTargetIndex: 0,
      assistAscending: true,
    )
  );
  final int playerId;
  final BoxscoreRepository boxScoreRepository;
  final PbpRepository pbpRepository;

  void updateStartDate(DateTime start) {
    List<dynamic> seasonStats = state.seasonStats;
    if (state.end != null) {
      seasonStats = boxScoreRepository.getSeasonStats(playerId, start, state.end);
    }

    state = state.copyWith(
      start: start,
      seasonStats: seasonStats
    );
  }

  void updateEndDate(DateTime end) {
    List<dynamic> seasonStats = state.seasonStats;
    if (state.start != null) {
      seasonStats = boxScoreRepository.getSeasonStats(playerId, state.start, end);
    }

    state = state.copyWith(
        end: end,
        seasonStats: seasonStats
    );
  }

  void updateShotTypeSortTargetIndex(int index, bool ascending) {
    List<List<dynamic>> shotTypeStats = pbpRepository.getShotTypeStatsByPlayer(playerId, index, ascending);

    state = state.copyWith(
      shotTypeStats: shotTypeStats,
      shotTypeSortTargetIndex: index,
      shotTypeAscending: !state.shotTypeAscending,
    );
  }

  void updatePlayTypeSortTargetIndex(int index, bool ascending) {
    List<List<dynamic>> playTypeStats = pbpRepository.getPlayTypeStatsByPlayer(playerId, index, ascending);

    state = state.copyWith(
      playTypeStats: playTypeStats,
      playTypeSortTargetIndex: index,
      playTypeAscending: !state.playTypeAscending,
    );
  }

  void updateAssistSortTargetIndex(int index, bool ascending) {
    List<List<dynamic>> assistPlayerStats = pbpRepository.getAssistPlayerStats(playerId, index, ascending);

    state = state.copyWith(
      assistPlayerStats: assistPlayerStats,
      assistSortTargetIndex: index,
      assistAscending: !state.assistAscending,
    );
  }

  String getStatsString(int id) {
    List<String> stats = [
      CsvColumns.playerStatColumnList.join(','),
    ];

    List<String> tmpList = [];
    for (var item in state.seasonStats) {
      tmpList.add(item.toString());
    }
    stats.add(tmpList.join(','));

    stats.add(CsvColumns.shotTypeColumnList.join(','));
    for (var stat in state.shotTypeStats) {
      List<String> tmpList = [];
      for (var item in stat) {
        tmpList.add(item.toString());
      }
      stats.add(tmpList.join(','));
    }

    stats.add(CsvColumns.playTypeColumnList.join(','));
    for (var stat in state.playTypeStats) {
      List<String> tmpList = [];
      for (var item in stat) {
        tmpList.add(item.toString());
      }
      stats.add(tmpList.join(','));
    }

    stats.add(CsvColumns.assistColumnList.join(','));
    for (var stat in state.assistPlayerStats) {
      List<String> tmpList = [];
      for (var item in stat) {
        tmpList.add(item.toString());
      }
      stats.add(tmpList.join(','));
    }

    return stats.join("\n");
  }
}