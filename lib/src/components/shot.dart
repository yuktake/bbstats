import 'dart:io';
import 'dart:math';

import 'package:bb_stats/src/collections/pbp/pbp.dart';
import 'package:bb_stats/src/collections/shot/shot_parameter.dart';
import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:bb_stats/src/enums/ShotZone.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../collections/player/player.dart';
import '../providers/isar_provider.dart';

class Shot extends ConsumerWidget {
  Shot(
      this.gameId,
      this.playerId,
      {Key? key}
  ) : super(key: key);

  final int gameId;

  final int playerId;

  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
    final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
    final gameChart = ref.watch(gameChartProvider(gameId).notifier);
    final shotInfo = ref.watch(shotProvider(ShotParameter(gameId: gameId, playerId: playerId)));
    final shot = ref.watch(shotProvider(ShotParameter(gameId: gameId, playerId: playerId)).notifier);
    final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);
    final gameStat = ref.watch(gameStatProvider(gameId).notifier);
    final documentPath = ref.watch(documentPathProvider);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double normalFontSize = screenWidth / 27;
    double smallFontSize = screenWidth / 40;
    double assistedPlayersBoxHeight = screenHeight * 0.1;
    double shotChartHeight = screenHeight*0.5;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Shot'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            shotInfo.image != null ?
            GestureDetector(
              onTapDown: (TapDownDetails details) => shot.mixImage(context, globalKey, shotInfo.src!, details),
              child: Image(
                key: globalKey,
                image: shotInfo.image!,
                fit: BoxFit.fill,
                width: screenWidth,
                height: shotChartHeight,
              ),
            )
              :
            const Text(
              'No Image Taken',
              textAlign: TextAlign.center,
            ),
            Text('Make or Miss', style: TextStyle(fontSize: normalFontSize),),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoSegmentedControl(
                        children: {
                          1: Text('Make', style: TextStyle(fontSize: smallFontSize),),
                          0: Text('Miss', style: TextStyle(fontSize: smallFontSize),),
                        },
                        groupValue: shotInfo.result ? 1 : 0,
                        onValueChanged: (int value) {
                          shot.updateResult(value);
                        }
                    ),
                  )
                ],
              ),
            ),
            // change depend on support type
            Text(shotInfo.result ? 'Assisted By' : '', style: TextStyle(fontSize: normalFontSize),),
            shotInfo.result ?
            SizedBox(
              height: assistedPlayersBoxHeight,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                      onTap: () {
                        shot.updateSupportPlayer(null);
                      },
                      child: _buildCircleAvatar(shotInfo.supportPlayerId, null, documentPath.value)
                  ),
                  for (var i = 0; i < shotInfo.players.length; i++)
                    GestureDetector(
                      onTap: () {
                        shot.updateSupportPlayer(shotInfo.players[i].id);
                      },
                      child: _buildCircleAvatar(shotInfo.supportPlayerId, shotInfo.players[i], documentPath.value)
                    )
                ],
              ),
            ) : Container(),

            Text('Points', style: TextStyle(fontSize: normalFontSize),),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoSegmentedControl(
                        children: {
                          2: Text('2', style: TextStyle(fontSize: smallFontSize),),
                          3: Text('3', style: TextStyle(fontSize: smallFontSize),),
                        },
                        groupValue: shotInfo.point,
                        onValueChanged: (int value) {
                          // update point state
                          shot.updatePoint(value);
                        }
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Play Type', style: TextStyle(fontSize: normalFontSize),),
                DropdownButton(
                  padding: const EdgeInsets.all(16),
                  items: [
                    DropdownMenuItem(
                      value: PlayType.NONE,
                      child: Text('-', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: PlayType.ISOLATION,
                      child: Text('ISOLATION', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: PlayType.FASTBREAK,
                      child: Text('FAST BREAK', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: PlayType.PICK_AND_ROLL_BALL_HANDLER,
                      child: Text('P&R BALLER', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: PlayType.PICK_AND_ROLL_ROLL_MAN,
                      child: Text('P&R ROLLER', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: PlayType.POSTUP,
                      child: Text('POST UP', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: PlayType.SPOTUP,
                      child: Text('SPOT UP', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: PlayType.HANDOFF,
                      child: Text('HANDOFF', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: PlayType.CUT,
                      child: Text('CUT', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: PlayType.OFF_SCREEN,
                      child: Text('OFF SCREEN', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: PlayType.SECOND_CHANCE,
                      child: Text('2nd Chance', style: TextStyle(fontSize: smallFontSize),),
                    ),
                  ],
                  onChanged: (PlayType? value) {
                    shot.updatePlayType(value!);
                  },
                  value: shotInfo.playType,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Shot Type', style: TextStyle(fontSize: normalFontSize),),
                DropdownButton(
                  padding: const EdgeInsets.all(16),
                  items: [
                    DropdownMenuItem(
                      value: ShotType.NONE,
                      child: Text('-', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotType.LAYUP,
                      child: Text('LAYUP', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotType.CATCH_AND_SHOT,
                      child: Text('CATCH_AND_SHOT', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotType.PULLUP,
                      child: Text('PULL UP', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotType.FLOATING_SHOT,
                      child: Text('FLOATING_SHOT', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotType.HOOK_SHOT,
                      child: Text('HOOK_SHOT', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotType.TIP_SHOT,
                      child: Text('TIP_SHOT', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotType.FADEAWAY,
                      child: Text('FADE AWAY', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotType.DUNK,
                      child: Text('DUNK', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotType.ALLEY_OOP,
                      child: Text('ALLEY_OOP', style: TextStyle(fontSize: smallFontSize),),
                    ),
                  ],
                  onChanged: (ShotType? value) {
                    shot.updateShotType(value!);
                  },
                  value: shotInfo.shotType,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Shot Zone', style: TextStyle(fontSize: normalFontSize),),
                DropdownButton(
                  padding: const EdgeInsets.all(16),
                  items: [
                    DropdownMenuItem(
                      value: ShotZone.IN_THE_PAINT,
                      child: Text('IN_THE_PAINT', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.MIDDLE_AREA,
                      child: Text('MIDDLE_AREA', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.AROUND_TOP_THREE,
                      child: Text('AROUND_TOP_THREE', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.LEFT_CORNER_THREE,
                      child: Text('LEFT_CORNER_THREE', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.RIGHT_CORNER_THREE,
                      child: Text('RIGHT_CORNER_THREE', style: TextStyle(fontSize: smallFontSize),),
                    ),
                  ],
                  onChanged: (ShotZone? value) {
                    shot.updateShotZone(value!);
                  },
                  value: shotInfo.shotZone,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FloatingActionButton.extended(
                icon: const Icon(Icons.sports_basketball),
                label: const Text("Confirm"),
                backgroundColor: Colors.blue,
                onPressed: () {
                  if (shotInfo.positionX == null || shotInfo.positionY == null) {
                    noShotPositionDialog(context, normalFontSize, smallFontSize);
                    return;
                  }
                  shot.confirm(gameId, playerId);
                  final shotPosition = ShotPosition()
                  ..positionX = shotInfo.positionX!
                  ..positionY = shotInfo.positionY!
                  ..playType = shotInfo.playType
                  ..shotType = shotInfo.shotType
                  ..shotZone = shotInfo.shotZone
                  ..point = shotInfo.point
                  ;
                  gameRecord.addPlayAction(
                    playerId,
                    shot.getRecordType(),
                    gameRecordInfo.currentQuarter,
                    shotPosition,
                    shotInfo.supportPlayerId,
                    true
                  );
                  gameStat.updateStats();
                  gameSummary.update();
                  gameChart.updateShotChart();
                  Navigator.of(context).pop();
                  gameRecord.scrollDown();
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildCircleAvatar(int? selectedId, Player? player, String? documentPath) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight / 2, constraints.maxWidth / 2);
        return avatarImage(selectedId, radius, player, documentPath);
      },
    );
  }

  Widget avatarImage(int? selectedId, double radius, Player? player, String? documentPath) {
    if (player == null) {
      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.blue,
        child: const Text('None'),
      );
    } else {
      if(selectedId == player.id) {
        var a = File("$documentPath/players/${player.id}.jpg");
        return Container(
          padding: const EdgeInsets.all(5.0),
          decoration: const BoxDecoration(
            color: Colors.red, // border color
            shape: BoxShape.circle,
          ),
          child: CircleAvatar(
            radius: radius,
            backgroundImage: MemoryImage(a.readAsBytesSync()),
          )
        );
      } else {
        var a = File("$documentPath/players/${player.id}.jpg");
        return CircleAvatar(
          radius: radius,
          backgroundImage: MemoryImage(a.readAsBytesSync()),
        );
      }
    }
  }
}

Future<dynamic> noShotPositionDialog(BuildContext context, double normalFontSize, double smallFontSize) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: Text('Shot Position', style: TextStyle(fontSize: normalFontSize),),
        content: Text('No shot position has been entered', style: TextStyle(fontSize: smallFontSize),),
        actions : [
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(false),
            child: Text('OK', style: TextStyle(fontSize: smallFontSize),),
          ),
        ]
      );
    }
  );
}