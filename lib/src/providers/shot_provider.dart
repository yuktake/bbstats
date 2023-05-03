import 'dart:typed_data';

import 'package:bb_stats/src/collections/shot/shot_model.dart';
import 'package:bb_stats/src/collections/shot/shot_parameter.dart';
import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/RecordType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:bb_stats/src/enums/ShotZone.dart';
import 'package:bb_stats/src/repositories/boxscore_repository.dart';
import 'package:bb_stats/src/repositories/game_repository.dart';
import 'package:bb_stats/src/repositories/teamStatRepository.php.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_editor/image_editor.dart';

import '../collections/boxscore/boxscore.dart';
import '../repositories/player_repository.dart';

class ShotStateNotifier extends StateNotifier<ShotModel> {
  ShotStateNotifier(
      this.playerRepository,
      this.gameRepository,
      this.teamStatRepository,
      this.boxScoreRepository,
      this.shotParameter,
  ) : super (
       ShotModel(
          image: null,
          blendMode: BlendMode.srcOver,
          src: null,
          positionX: null,
          positionY: null,
          result: false,
          players: playerRepository.getOnCourtPlayersExceptMe(shotParameter.gameId, shotParameter.playerId),
          supportPlayerId: null,
          playType: PlayType.NONE,
          shotType: ShotType.NONE,
          shotZone: ShotZone.IN_THE_PAINT,
          point: 2
      )
  ) {
    prepareImageProvider();
  }

  final PlayerRepository playerRepository;
  final GameRepository gameRepository;
  final TeamStatRepository teamStatRepository;
  final BoxscoreRepository boxScoreRepository;
  final ShotParameter shotParameter;

  void prepareImageProvider() async {
    String courtAsset = "assets/others/court.png"; //path to asset
    ByteData bytes = await rootBundle.load(courtAsset); //load sound from assets
    Uint8List? src = bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
    final Uint8List material = await loadFromAsset("assets/others/make.png");

    final ImageEditorOption optionGroup = ImageEditorOption();
    optionGroup.outputFormat = const OutputFormat.png();
    MixImageOption mio = MixImageOption(
      x: 1000,
      y: 0,
      width: 0,
      height: 0,
      target: MemoryImageSource(material),
      blendMode: state.blendMode,
    );

    optionGroup.addOption(mio);
    Uint8List? result = await ImageEditor.editImage(image: src, imageEditorOption: optionGroup);
    state = state.copyWith(
      image: MemoryImage(result!),
      src: src,
    );
  }

  void updateResult(int result) {
    state = state.copyWith(
      result: result == 0 ? false : true
    );
  }

  void updatePoint(int point) {
    state = state.copyWith(
        point: point
    );
  }

  void updatePlayType(PlayType playType) {
    state = state.copyWith(
        playType: playType
    );
  }

  void updateShotType(ShotType shotType) {
    int point = state.point;
    switch(shotType) {
      case ShotType.LAYUP:
      case ShotType.HOOK_SHOT:
      case ShotType.TIP_SHOT:
      case ShotType.FLOATING_SHOT:
      case ShotType.DUNK:
      case ShotType.ALLEY_OOP:
        point = 2;
        break;
      default:
        break;
    }
    state = state.copyWith(
        point: point,
        shotType: shotType
    );
  }

  void updateShotZone(ShotZone shotZone) {
    int point = state.point;
    switch(shotZone) {
      case ShotZone.IN_THE_PAINT:
      case ShotZone.MIDDLE_AREA:
        point = 2;
        break;
      case ShotZone.LEFT_CORNER_THREE:
      case ShotZone.RIGHT_CORNER_THREE:
      case ShotZone.AROUND_TOP_THREE:
        point = 3;
        break;
      default:
        break;
    }
    state = state.copyWith(
        point: point,
        shotZone: shotZone
    );
  }

  void updateSupportPlayer(int? supportPlayerId) {
    state = state.copyWith(
        supportPlayerId: supportPlayerId
    );
  }

  RecordType getRecordType() {
    RecordType recordType = RecordType.NONE;

    if (state.result) {
      if (state.point == 2) {
        recordType = RecordType.TWO_POINT_MADE;
      } else {
        recordType = RecordType.THREE_POINT_MADE;
      }
    } else {
      if (state.point == 2) {
        recordType = RecordType.TWO_POINT_MISS;
      } else {
        recordType = RecordType.THREE_POINT_MISS;
      }
    }

    return recordType;
  }

  void confirm(int gameId, int playerId) {
    Boxscore boxScore = boxScoreRepository.findOneByGameAndPlayer(gameId, playerId)!;
    RecordType recordType = RecordType.NONE;
    if (state.result) {
      if (state.point == 3) {
        recordType = RecordType.THREE_POINT_MADE;
      } else if (state.point == 2) {
        recordType = RecordType.TWO_POINT_MADE;
      }
    } else {
      if (state.point == 3) {
        recordType = RecordType.THREE_POINT_MISS;
      } else if (state.point == 2) {
        recordType = RecordType.TWO_POINT_MISS;
      }
    }

    if (recordType == RecordType.NONE) {
      // TODO:: ERROR
      return;
    }

    // Gameテーブルへの書き込み
    switch(recordType) {
      case RecordType.TWO_POINT_MADE:
      case RecordType.THREE_POINT_MADE:
        gameRepository.madeShot(gameId, recordType, boxScore.starter);
        break;
      case RecordType.TWO_POINT_MISS:
      case RecordType.THREE_POINT_MISS:
        gameRepository.missShot(gameId, recordType);
        break;
      default:
        // TODO:: ERROR
        return;
    }

    if (state.supportPlayerId != null) {
      if (state.result) {
        gameRepository.addAssist(gameId, true);
      } else {
        gameRepository.addOffenceRebound(gameId, true);
      }
    }

    // BoxScoreへの書き込み
    boxScoreRepository.makeShot(boxScore, recordType, state.supportPlayerId, state.playType, state.shotType, state.shotZone);
    // TeamStatへの書き込み
    teamStatRepository.makeShot(gameId, recordType, state.shotType, state.shotZone);
  }

  void mixImage(BuildContext context, GlobalKey globalKey, Uint8List src, TapDownDetails details) async {
    final Uint8List material = await loadFromAsset("assets/others/make.png");
    final ImageEditorOption optionGroup = ImageEditorOption();

    RenderBox getBox = globalKey.currentContext?.findRenderObject() as RenderBox;

    var localPos = getBox.globalToLocal(details.globalPosition);
    int x = localPos.dx.toInt();
    int y = localPos.dy.toInt();
    double xRatio = 1000 / MediaQuery.of(context).size.width;
    double yRatio = 1000 / 300;
    int modifiedX = (x*xRatio).toInt();
    int modifiedY = (y*yRatio).toInt();

    optionGroup.outputFormat = const OutputFormat.png();

    optionGroup.addOption(
      MixImageOption(
        x: modifiedX-25,
        y: modifiedY-25,
        width: 50,
        height: 50,
        target: MemoryImageSource(material),
        blendMode: state.blendMode,
      ),
    );
    final Uint8List? result = await ImageEditor.editImage(image: src, imageEditorOption: optionGroup);
    state = state.copyWith(
      positionX: modifiedX-25,
      positionY: modifiedY-25,
      image: MemoryImage(result!),
    );
  }

  Future<Uint8List> loadFromAsset(String key) async {
    final ByteData byteData = await rootBundle.load(key);
    return byteData.buffer.asUint8List();
  }
}