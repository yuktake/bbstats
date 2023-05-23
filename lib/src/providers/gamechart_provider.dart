import 'dart:typed_data';

import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/gameChart/game_chart_model.dart';
import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_editor/image_editor.dart';

import '../enums/RecordType.dart';
import '../enums/ShotZone.dart';
import '../repositories/boxscore_repository.dart';
import '../repositories/pbp_repository.dart';
import '../repositories/player_repository.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';

class GameChartStateNotifier extends StateNotifier<GameChartModel> {
  GameChartStateNotifier(
      this.gameId,
      this.playerRepository,
      this.gameRepository,
      this.boxScoreRepository,
      this.pbpRepository
  )
  : super (GameChartModel(
    blendMode: BlendMode.srcOver,
    players: playerRepository.getAllPlayers(true),

    image: null,
    src: null,
    pbps: pbpRepository.getShotChartPbps(gameId, 100, PlayType.NONE, ShotType.NONE, null, 1, ShotZone.ALL),
    period: 100,
    playType: PlayType.NONE,
    shotType: ShotType.NONE,
    shotZone: ShotZone.ALL,
    shotFilter: 1,
    selectedPlayerId: null,

    opponentImage: null,
    opponentSrc: null,
    opponentPbps: pbpRepository.getOpponentShotChartPbps(gameId, 100, PlayType.NONE, ShotType.NONE, null, 1, ShotZone.ALL),
    opponentPeriod: 100,
    opponentPlayType: PlayType.NONE,
    opponentShotType: ShotType.NONE,
    opponentShotZone: ShotZone.ALL,
    opponentShotFilter: 1,
    defencedPlayerId: null,
  )){
    prepareImageProvider(100, PlayType.NONE, ShotType.NONE, null, 1, ShotZone.ALL);
    prepareOpponentImageProvider(100, PlayType.NONE, ShotType.NONE, null, 1, ShotZone.ALL);
  }

  final int gameId;
  final PlayerRepository playerRepository;
  final GameRepository gameRepository;
  final BoxscoreRepository boxScoreRepository;
  final PbpRepository pbpRepository;

  void download(MemoryImage memoryImage) async {
    await ImageGallerySaver.saveImage(memoryImage.bytes);
  }

  void prepareImageProvider(int period, PlayType playType, ShotType shotType, int? selectedPlayerId, int shotFilter, ShotZone shotZone) async {
    state = state.copyWith(
        pbps: pbpRepository.getShotChartPbps(gameId, period, playType, shotType, selectedPlayerId, shotFilter, shotZone)
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

  void prepareOpponentImageProvider(int period, PlayType playType, ShotType shotType, int? defencedPlayerId, int shotFilter, ShotZone shotZone) async {
    state = state.copyWith(
        opponentPbps: pbpRepository.getOpponentShotChartPbps(gameId, period, playType, shotType, defencedPlayerId, shotFilter, shotZone)
    );
    String courtAsset = "assets/others/court.png"; //path to asset
    ByteData bytes = await rootBundle.load(courtAsset); //load sound from assets
    Uint8List? src = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);

    final ImageEditorOption optionGroup = ImageEditorOption();
    optionGroup.outputFormat = const OutputFormat.png();

    for (int i = 0; i < state.opponentPbps.length; i++) {
      final Uint8List material = await loadFromAsset("assets/others/${(state.opponentPbps[i].type == RecordType.THREE_POINT_MISS || state.opponentPbps[i].type == RecordType.TWO_POINT_MISS) ? 'miss' : 'make'}.png");
      MixImageOption mio = MixImageOption(
        x: state.opponentPbps[i].shotPosition!.positionX,
        y: state.opponentPbps[i].shotPosition!.positionY,
        width: 50,
        height: 50,
        target: MemoryImageSource(material),
        blendMode: state.blendMode,
      );
      optionGroup.addOption(mio);
    }


    Uint8List? result = await ImageEditor.editImage(image: src, imageEditorOption: optionGroup);
    state = state.copyWith(
      opponentImage: MemoryImage(result!),
      opponentSrc: src,
    );
  }

  void updateShotChart() {
    prepareImageProvider(state.period, state.playType, state.shotType, state.selectedPlayerId, state.shotFilter, state.shotZone);
  }

  void updateOpponentShotChart() {
    prepareOpponentImageProvider(state.opponentPeriod, state.opponentPlayType, state.opponentShotType, state.defencedPlayerId, state.opponentShotFilter, state.opponentShotZone);
  }

  void updatePeriod(int period) {
    state = state.copyWith(
        period: period
    );
    prepareImageProvider(state.period, state.playType, state.shotType, state.selectedPlayerId, state.shotFilter, state.shotZone);
  }

  void updateOpponentPeriod(int period) {
    state = state.copyWith(
        opponentPeriod: period
    );
    prepareOpponentImageProvider(state.opponentPeriod, state.opponentPlayType, state.opponentShotType, state.defencedPlayerId, state.opponentShotFilter, state.opponentShotZone);
  }

  void updatePlayType(PlayType playType) {
    state = state.copyWith(
        playType: playType
    );
    prepareImageProvider(state.period, state.playType, state.shotType, state.selectedPlayerId, state.shotFilter, state.shotZone);
  }

  void updateOpponentPlayType(PlayType playType) {
    state = state.copyWith(
        opponentPlayType: playType
    );
    prepareOpponentImageProvider(state.opponentPeriod, state.opponentPlayType, state.opponentShotType, state.defencedPlayerId, state.opponentShotFilter, state.opponentShotZone);
  }

  void updateShotType(ShotType shotType) {
    state = state.copyWith(
        shotType: shotType
    );
    prepareImageProvider(state.period, state.playType, state.shotType, state.selectedPlayerId, state.shotFilter, state.shotZone);
  }

  void updateOpponentShotType(ShotType shotType) {
    state = state.copyWith(
        opponentShotType: shotType
    );
    prepareOpponentImageProvider(state.opponentPeriod, state.opponentPlayType, state.opponentShotType, state.defencedPlayerId, state.opponentShotFilter, state.opponentShotZone);
  }

  void updateShotZone(ShotZone shotZone) {
    state = state.copyWith(
        shotZone: shotZone
    );
    prepareImageProvider(state.period, state.playType, state.shotType, state.selectedPlayerId, state.shotFilter, state.shotZone);
  }

  void updateOpponentShotZone(ShotZone opponentShotZone) {
    state = state.copyWith(
        opponentShotZone: opponentShotZone
    );
    prepareOpponentImageProvider(state.opponentPeriod, state.opponentPlayType, state.opponentShotType, state.defencedPlayerId, state.opponentShotFilter, state.opponentShotZone);
  }

  void updatePlayerId(int? playerId) {
    state = state.copyWith(
      selectedPlayerId: playerId
    );
    prepareImageProvider(state.period, state.playType, state.shotType, state.selectedPlayerId, state.shotFilter, state.shotZone);
  }

  void updateDefencedPlayerId(int? playerId) {
    state = state.copyWith(
        defencedPlayerId: playerId
    );
    prepareOpponentImageProvider(state.opponentPeriod, state.opponentPlayType, state.opponentShotType, state.defencedPlayerId, state.opponentShotFilter, state.opponentShotZone);
  }

  void updateShotFilter(int shotFilter) {
    state = state.copyWith(
        shotFilter: shotFilter
    );
    prepareImageProvider(state.period, state.playType, state.shotType, state.selectedPlayerId, state.shotFilter, state.shotZone);
  }

  void updateOpponentShotFilter(int shotFilter) {
    state = state.copyWith(
        opponentShotFilter: shotFilter
    );
    prepareOpponentImageProvider(state.opponentPeriod, state.opponentPlayType, state.opponentShotType, state.defencedPlayerId, state.opponentShotFilter, state.opponentShotZone);
  }

  Future<Uint8List> loadFromAsset(String key) async {
    final ByteData byteData = await rootBundle.load(key);
    return byteData.buffer.asUint8List();
  }

  int getOtNum() {
    Game game = gameRepository.findGame(gameId)!;

    return game.otNum;
  }
}