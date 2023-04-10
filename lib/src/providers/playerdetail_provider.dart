import 'package:bb_stats/src/collections/playerDetail/player_detail_model.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/pbp_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
      shotTypeStats: pbpRepository.getShotTypeStatsByPlayer(playerId),
      playTypeStats: pbpRepository.getPlayTypeStatsByPlayer(playerId),
      assistPlayerStats: pbpRepository.getAssistPlayerStats(playerId),
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
}