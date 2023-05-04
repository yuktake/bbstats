
import 'package:bb_stats/src/collections/boxscoreList/boxscore_list_model.dart';
import 'package:bb_stats/src/collections/gameChart/game_chart_model.dart';
import 'package:bb_stats/src/collections/gameList/game_list_model.dart';
import 'package:bb_stats/src/collections/gamePreparation/game_preparation_model.dart';
import 'package:bb_stats/src/collections/gameRecord/game_record_model.dart';
import 'package:bb_stats/src/collections/gameStat/game_stat_model.dart';
import 'package:bb_stats/src/collections/gameSummary/game_summary_model.dart';
import 'package:bb_stats/src/collections/home/home_model.dart';
import 'package:bb_stats/src/collections/playerDetail/player_detail_model.dart';
import 'package:bb_stats/src/collections/settingDetails/setting_details_model.dart';
import 'package:bb_stats/src/collections/shot/opponent_shot_model.dart';
import 'package:bb_stats/src/collections/shot/shot_model.dart';
import 'package:bb_stats/src/collections/shot/shot_parameter.dart';
import 'package:bb_stats/src/collections/teamDetail/team_detail_model.dart';
import 'package:bb_stats/src/providers/boxscorelist_provider.dart';
import 'package:bb_stats/src/providers/gamechart_provider.dart';
import 'package:bb_stats/src/providers/gamelist_provider.dart';
import 'package:bb_stats/src/providers/gamepreparation_provider.dart';
import 'package:bb_stats/src/providers/gamerecord_provider.dart';
import 'package:bb_stats/src/providers/gamestat_provider.dart';
import 'package:bb_stats/src/providers/gamesummary_provider.dart';
import 'package:bb_stats/src/providers/home_provider.dart';
import 'package:bb_stats/src/providers/ongame_provider.dart';
import 'package:bb_stats/src/providers/opponentshot_provider.dart';
import 'package:bb_stats/src/providers/player_provider.dart';
import 'package:bb_stats/src/providers/playerdetail_provider.dart';
import 'package:bb_stats/src/providers/playerlist_provider.dart';
import 'package:bb_stats/src/providers/playerselect_provider.dart';
import 'package:bb_stats/src/providers/settingdetails_provider.dart';
import 'package:bb_stats/src/providers/shot_provider.dart';
import 'package:bb_stats/src/providers/team_provider.dart';
import 'package:bb_stats/src/providers/teamdetail_provider.dart';
import 'package:bb_stats/src/providers/teamselect_provider.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:bb_stats/src/repositories/pbp_repository.dart';
import 'package:bb_stats/src/repositories/teamStatRepository.php.dart';
import 'package:bb_stats/src/repositories/team_repository.dart';
import 'package:flutter/material.dart';
import 'package:isar/isar.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import '../collections/game/game_model.dart';
import '../collections/gamePbp/game_pbp_model.dart';
import '../collections/playerList/player_list_model.dart';
import '../collections/player/player_model.dart';
import '../collections/playerSelect/player_select_model.dart';
import '../collections/team/team_model.dart';
import '../collections/teamSelect/team_select_model.dart';
import '../repositories/player_repository.dart';
import 'game_provider.dart';
import 'gamepbp_provider.dart';

// ダミーのProviderを用意する
final isarProvider = Provider<Isar>((_) {
  debugPrint('run isarProvider');
  throw throw UnimplementedError("アプリケーション起動時にmainでawaitして生成したインスタンスを使用する");
});

final playerRepositoryProvider = Provider((ref) => PlayerRepository(ref.watch(isarProvider)));
final teamRepositoryProvider = Provider((ref) => TeamRepository(ref.watch(isarProvider)));
final teamStatRepositoryProvider = Provider((ref) => TeamStatRepository(ref.watch(isarProvider)));
final gameRepositoryProvider = Provider((ref) => GameRepository(ref.watch(isarProvider)));
final boxscoreRepositoryProvider = Provider((ref) => BoxscoreRepository(ref.watch(isarProvider)));
final pbpRepositoryProvider = Provider((ref) => PbpRepository(ref.watch(isarProvider)));

final documentPathProvider = FutureProvider<String>((ref) async {
  var previewPath = (await getApplicationDocumentsDirectory()).path;
  return previewPath;
});

final onGameProvider = StateNotifierProvider<OnGameStateNotifier, bool>((ref) {
  return OnGameStateNotifier();
});

final homeProvider = StateNotifierProvider.autoDispose<HomeStateNotifier,HomeModel>((ref) {
  return HomeStateNotifier(
      ref.watch(gameRepositoryProvider),
      ref.watch(boxscoreRepositoryProvider),
      ref.watch(teamRepositoryProvider),
  );
});

final teamProvider = StateNotifierProvider.family<TeamStateNotifier,TeamModel,int>((ref,id) {
  return TeamStateNotifier(
      ref.watch(teamRepositoryProvider),
      id
  );
});

final playerProvider = StateNotifierProvider.family<PlayerStateNotifier,PlayerModel,int>((ref,id) {
  return PlayerStateNotifier(
      ref.watch(teamRepositoryProvider),
      ref.watch(playerRepositoryProvider),
      id
  );
});
final playerDetailProvider = StateNotifierProvider.family<PlayerDetailStateNotifier,PlayerDetailModel,int>((ref,id) {
  return PlayerDetailStateNotifier(
      id,
      ref.watch(boxscoreRepositoryProvider),
      ref.watch(pbpRepositoryProvider),
  );
});

final playerListProvider = StateNotifierProvider.autoDispose<PlayerListStateNotifier,PlayerListModel>((ref) {
  return PlayerListStateNotifier(ref.watch(playerRepositoryProvider));
});

final playerSelectProvider = StateNotifierProvider.autoDispose<PlayerSelectStateNotifier,PlayerSelectModel>((ref) {
  return PlayerSelectStateNotifier(ref.watch(playerRepositoryProvider));
});

final teamDetailProvider = StateNotifierProvider.autoDispose<TeamDetailStateNotifier,TeamDetailModel>((ref) {
  return TeamDetailStateNotifier(
    ref.watch(teamRepositoryProvider),
    ref.watch(gameRepositoryProvider),
    ref.watch(boxscoreRepositoryProvider),
    ref.watch(pbpRepositoryProvider),
  );
});

final teamsSelectProvider = StateNotifierProvider.autoDispose<TeamSelectStateNotifier,TeamSelectModel>((ref) {
  return TeamSelectStateNotifier(ref.watch(teamRepositoryProvider));
});

final gamePreparationProvider = StateNotifierProvider.autoDispose<GamePreparationStateNotifier,GamePreparationModel>((ref) {
  return GamePreparationStateNotifier(
      ref.watch(teamRepositoryProvider),
      ref.watch(teamStatRepositoryProvider),
      ref.watch(playerRepositoryProvider),
      ref.watch(gameRepositoryProvider),
      ref.watch(boxscoreRepositoryProvider),
  );
});

final gameProvider = StateNotifierProvider.family<GameStateNotifier,GameModel,int>((ref, id){
  return GameStateNotifier(
      ref.watch(isarProvider),
      ref.watch(gameRepositoryProvider),
      ref.watch(boxscoreRepositoryProvider),
      ref.watch(pbpRepositoryProvider),
      id
  );
});

final shotProvider = StateNotifierProvider.family<ShotStateNotifier,ShotModel,ShotParameter>((ref,shotParameter){
  return ShotStateNotifier(
      ref.watch(playerRepositoryProvider),
      ref.watch(gameRepositoryProvider),
      ref.watch(teamStatRepositoryProvider),
      ref.watch(boxscoreRepositoryProvider),
      shotParameter
  );
});

final opponentShotProvider = StateNotifierProvider.family<OpponentShotStateNotifier,OpponentShotModel,ShotParameter>((ref,shotParameter){
  return OpponentShotStateNotifier(
      ref.watch(playerRepositoryProvider),
      ref.watch(gameRepositoryProvider),
      ref.watch(boxscoreRepositoryProvider),
      shotParameter
  );
});

final gameListProvider = StateNotifierProvider.autoDispose<GameListStateNotifier,GameListModel>((ref){
  return GameListStateNotifier(ref.watch(gameRepositoryProvider));
});

final gameRecordProvider = StateNotifierProvider.family<GameRecordStateNotifier,GameRecordModel,int>((ref,id) {
  return GameRecordStateNotifier(
      id,
      ref.watch(playerRepositoryProvider),
      ref.watch(gameRepositoryProvider),
      ref.watch(teamStatRepositoryProvider),
      ref.watch(boxscoreRepositoryProvider),
      ref.watch(pbpRepositoryProvider)
  );
});

final gameSummaryProvider = StateNotifierProvider.family<GameSummaryStateNotifier,GameSummaryModel,int>((ref,id){
  return GameSummaryStateNotifier(
      id,
      ref.watch(gameRepositoryProvider),
      ref.watch(teamRepositoryProvider),
      ref.watch(pbpRepositoryProvider)
  );
});

final boxScoreListProvider = StateNotifierProvider.family<BoxScoreListStateNotifier,BoxScoreListModel,int>((ref,id){
  return BoxScoreListStateNotifier(
      id,
      ref.watch(boxscoreRepositoryProvider)
  );
});

final gameChartProvider = StateNotifierProvider.family<GameChartStateNotifier,GameChartModel,int>((ref,id) {
  return GameChartStateNotifier(
      id,
      ref.watch(playerRepositoryProvider),
      ref.watch(gameRepositoryProvider),
      ref.watch(boxscoreRepositoryProvider),
      ref.watch(pbpRepositoryProvider)
  );
});

final gamePbpProvider = StateNotifierProvider.family<GamePbpStateNotifier,GamePbpModel,int>((ref,id) {
  return GamePbpStateNotifier(
      id,
      ref.watch(playerRepositoryProvider),
      ref.watch(gameRepositoryProvider),
      ref.watch(boxscoreRepositoryProvider),
      ref.watch(pbpRepositoryProvider)
  );
});

final gameStatProvider = StateNotifierProvider.family<GameStatStateNotifier,GameStatModel,int>((ref,gameId){
  return GameStatStateNotifier(
      ref.watch(gameRepositoryProvider),
      ref.watch(playerRepositoryProvider),
      ref.watch(boxscoreRepositoryProvider),
      ref.watch(pbpRepositoryProvider),
      gameId
  );
});

final settingDetailsProvider = StateNotifierProvider.autoDispose<SettingDetailsStateNotifier,SettingDetailsModel>((ref){
  return SettingDetailsStateNotifier();
});