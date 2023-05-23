import 'dart:typed_data';

import 'package:bb_stats/src/collections/boxscore/boxscore.dart';
import 'package:bb_stats/src/collections/gameStat/game_stat_model.dart';
import 'package:bb_stats/src/enums/RecordType.dart';
import 'package:bb_stats/src/enums/ShotZone.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:bb_stats/src/repositories/pbp_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_editor/image_editor.dart';

import '../collections/player/player.dart';
import '../enums/PlayType.dart';
import '../enums/ShotType.dart';
import '../repositories/player_repository.dart';

class GameStatStateNotifier extends StateNotifier<GameStatModel> {
  GameStatStateNotifier(
      this.gameRepository,
      this.playerRepository,
      this.boxScoreRepository,
      this.pbpRepository,
      this.gameId
  ) : super (
      GameStatModel(
        game: gameRepository.findGame(gameId)!,
        image: null,
        blendMode: BlendMode.srcOver,
        src: null,
        pbps: pbpRepository.getShotChartPbps(gameId, 100, PlayType.NONE, ShotType.NONE, null, 1, ShotZone.ALL),
        shotFilter: 1,
        selectedPlayerId: null,
        detailPlayer: null,
        comparisonStats: gameRepository.getStatsForComparison(gameId),
      )
  ) {
    prepareImageProvider(state.shotFilter, null);
  }

  final GameRepository gameRepository;
  final PlayerRepository playerRepository;
  final BoxscoreRepository boxScoreRepository;
  final PbpRepository pbpRepository;
  final int gameId;

  List<Player> getPlayers() {
    return playerRepository.getAllPlayers(true);
  }

  List<List<dynamic>> getComparisonStats() {
    return gameRepository.getStatsForComparison(gameId);
  }

  void updateStats() {
    state = state.copyWith(
      game: gameRepository.findGame(gameId)!,
      comparisonStats: gameRepository.getStatsForComparison(gameId),
    );
  }

  void prepareImageProvider(int shotFilter, int? selectedPlayerId) async {
    state = state.copyWith(
      pbps: pbpRepository.getShotChartPbps(gameId, 100, PlayType.NONE, ShotType.NONE, selectedPlayerId, shotFilter, ShotZone.ALL)
    );
    String courtAsset = "assets/others/court.png"; //path to asset
    ByteData bytes = await rootBundle.load(courtAsset); //load sound from assets
    Uint8List? src = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    final ImageEditorOption optionGroup = ImageEditorOption();
    optionGroup.outputFormat = const OutputFormat.png();

    for (int i = 0; i < state.pbps.length; i++) {
      final Uint8List material = await loadFromAsset("assets/others/${(state.pbps[i].type == RecordType.THREE_POINT_MISS || state.pbps[i].type == RecordType.TWO_POINT_MISS) ? 'miss' : 'make'}.png");
      MixImageOption mio = MixImageOption(
        x: state.pbps[i].shotPosition!.positionX,
        y: state.pbps[i].shotPosition!.positionY,
        width: 50,
        height: 50,
        target: MemoryImageSource(material),
        blendMode: state.blendMode,
      );
      optionGroup.addOption(mio);
    }

    Uint8List? result = await ImageEditor.editImage(image: src, imageEditorOption: optionGroup);
    state = state.copyWith(
      image: MemoryImage(result!),
      src: src,
    );
  }

  void updateShotFilter(int shotFilter) {
    state = state.copyWith(
        shotFilter: shotFilter
    );
    prepareImageProvider(state.shotFilter, state.selectedPlayerId);
  }

  void updateDetailPlayer(Player player) {
    Boxscore? boxScore = boxScoreRepository.findOneByGameAndPlayer(gameId, player.id);

    if (state.selectedPlayerId == player.id) {
      state = state.copyWith(
        selectedPlayerId: null,
        detailPlayer: null,
      );
    } else {
      state = state.copyWith(
        selectedPlayerId: player.id,
        detailPlayer: boxScore,
      );
    }
    prepareImageProvider(state.shotFilter, state.selectedPlayerId);
  }

  Future<Uint8List> loadFromAsset(String key) async {
    final ByteData byteData = await rootBundle.load(key);
    return byteData.buffer.asUint8List();
  }
}