import 'dart:math';

import 'package:bb_stats/src/collections/pbp/pbp.dart';
import 'package:bb_stats/src/collections/shot/shot_parameter.dart';
import 'package:bb_stats/src/components/shot.dart';
import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../collections/player/player.dart';
import '../enums/ShotZone.dart';
import '../providers/isar_provider.dart';

class OpponentShot extends ConsumerWidget {
  OpponentShot(
    this.gameId,
    {Key? key}
  ) : super(key: key);

  final int gameId;

  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
    final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
    final gameChart = ref.watch(gameChartProvider(gameId).notifier);
    final opponentShotInfo = ref.watch(opponentShotProvider(ShotParameter(gameId: gameId, playerId: 0)));
    final opponentShot = ref.watch(opponentShotProvider(ShotParameter(gameId: gameId, playerId: 0)).notifier);
    final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);
    final gameStat = ref.watch(gameStatProvider(gameId).notifier);
    final documentPath = ref.watch(documentPathProvider);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double normalFontSize = screenWidth / 27;
    double smallFontSize = screenWidth / 40;
    double shotChartHeight = screenHeight*0.5;
    double defencedPlayersBoxHeight = screenHeight * 0.1;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Opponent Shot'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            opponentShotInfo.image != null ?
            GestureDetector(
              onTapDown: (TapDownDetails details) => opponentShot.mixImage(context, globalKey, opponentShotInfo.src!, details),
              child: Image(
                key: globalKey,
                image: opponentShotInfo.image!,
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
                        groupValue: opponentShotInfo.result ? 1 : 0,
                        onValueChanged: (int value) {
                          // update result state
                          opponentShot.updateResult(value);
                        }
                    ),
                  )
                ],
              ),
            ),
            // change depend on support type
            Text('Defenced by', style: TextStyle(fontSize: normalFontSize),),
            SizedBox(
              height: defencedPlayersBoxHeight,
              child: ListView(
                // This next line does the trick.
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                      onTap: () {
                        opponentShot.updateDefencePlayer(null);
                      },
                      child: _buildCircleAvatar(opponentShotInfo.defencePlayerId, null, documentPath.value)
                  ),
                  for (var i = 0; i < opponentShotInfo.players.length; i++)
                    GestureDetector(
                        onTap: () {
                          opponentShot.updateDefencePlayer(opponentShotInfo.players[i].id);
                        },
                        child: _buildCircleAvatar(opponentShotInfo.defencePlayerId, opponentShotInfo.players[i], documentPath.value)
                    )
                ],
              ),
            ),
            Text('Points', style: TextStyle(fontSize: normalFontSize),),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoSegmentedControl(
                        children: {
                          2: Text('2', style: TextStyle(fontSize: smallFontSize)),
                          3: Text('3', style: TextStyle(fontSize: smallFontSize)),
                        },
                        groupValue: opponentShotInfo.point,
                        onValueChanged: (int value) {
                          // update point state
                          opponentShot.updatePoint(value);
                        }
                    ),
                  )
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Play Type', style: TextStyle(fontSize: normalFontSize)),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: PlayType.NONE,
                      child: Text('-', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: PlayType.ISOLATION,
                      child: Text('ISOLATION', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: PlayType.FASTBREAK,
                      child: Text('FAST BREAK', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: PlayType.PICK_AND_ROLL_BALL_HANDLER,
                      child: Text('P&R BALL MAN', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: PlayType.PICK_AND_ROLL_ROLL_MAN,
                      child: Text('P&R ROLL MAN', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: PlayType.POSTUP,
                      child: Text('POST UP', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: PlayType.SPOTUP,
                      child: Text('SPOT UP', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: PlayType.HANDOFF,
                      child: Text('HANDOFF', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: PlayType.CUT,
                      child: Text('CUT', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: PlayType.OFF_SCREEN,
                      child: Text('OFF SCREEN', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: PlayType.SECOND_CHANCE,
                      child: Text('2nd Chance', style: TextStyle(fontSize: smallFontSize)),
                    ),
                  ],
                  onChanged: (PlayType? value) {
                    opponentShot.updatePlayType(value!);
                  },
                  value: opponentShotInfo.playType,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Shot Type', style: TextStyle(fontSize: normalFontSize)),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: ShotType.NONE,
                      child: Text('-', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotType.LAYUP,
                      child: Text('LAYUP', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotType.CATCH_AND_SHOT,
                      child: Text('CATCH_AND_SHOT', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotType.PULLUP,
                      child: Text('PULL UP', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotType.FLOATING_SHOT,
                      child: Text('FLOATING_SHOT', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotType.HOOK_SHOT,
                      child: Text('HOOK_SHOT', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotType.TIP_SHOT,
                      child: Text('TIP_SHOT', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotType.FADEAWAY,
                      child: Text('FADE AWAY', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotType.DUNK,
                      child: Text('DUNK', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotType.ALLEY_OOP,
                      child: Text('ALLEY_OOP', style: TextStyle(fontSize: smallFontSize)),
                    ),
                  ],
                  onChanged: (ShotType? value) {
                    opponentShot.updateShotType(value!);
                  },
                  value: opponentShotInfo.shotType,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Shot Zone', style: TextStyle(fontSize: normalFontSize)),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: ShotZone.IN_THE_PAINT,
                      child: Text('IN_THE_PAINT', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.MIDDLE_AREA,
                      child: Text('MIDDLE_AREA', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.AROUND_TOP_THREE,
                      child: Text('AROUND_TOP_THREE', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.LEFT_CORNER_THREE,
                      child: Text('LEFT_CORNER_THREE', style: TextStyle(fontSize: smallFontSize)),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.RIGHT_CORNER_THREE,
                      child: Text('RIGHT_CORNER_THREE', style: TextStyle(fontSize: smallFontSize)),
                    ),
                  ],
                  onChanged: (ShotZone? value) {
                    opponentShot.updateShotZone(value!);
                  },
                  value: opponentShotInfo.shotZone,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 16),
              child: FloatingActionButton.extended(
                icon: Icon(Icons.sports_basketball, size: smallFontSize,),
                label: Text("Confirm", style: TextStyle(fontSize: smallFontSize)),
                backgroundColor: Colors.blue,
                onPressed: () {
                  if (opponentShotInfo.positionX == null || opponentShotInfo.positionY == null) {
                    noShotPositionDialog(context, normalFontSize, smallFontSize);
                    return;
                  }
                  opponentShot.confirm(gameId);
                  final shotPosition = ShotPosition()
                    ..positionX = opponentShotInfo.positionX!
                    ..positionY = opponentShotInfo.positionY!
                    ..playType = opponentShotInfo.playType
                    ..shotType = opponentShotInfo.shotType
                    ..shotZone = opponentShotInfo.shotZone
                    ..point = opponentShotInfo.point
                  ;
                  gameRecord.addPlayAction(
                      0,
                      opponentShot.getRecordType(),
                      gameRecordInfo.currentQuarter,
                      shotPosition,
                      opponentShotInfo.defencePlayerId,
                      false
                  );
                  gameStat.updateStats();
                  gameSummary.update();
                  gameChart.updateOpponentShotChart();
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

  Widget _buildCircleAvatar(int? selectedId, Player? playerHistory, String? documentPath) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final radius = min(constraints.maxHeight / 2, constraints.maxWidth / 2);
        return avatarImage(selectedId, radius, playerHistory, documentPath);
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
        return Container(
            padding: const EdgeInsets.all(5.0), // borde width
            decoration: const BoxDecoration(
              color: Colors.red, // border color
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage("$documentPath/players/${player.id}.jpg"),
            )
        );
      } else {
        return CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage("$documentPath/players/${player.id}.jpg"),
        );
      }
    }
  }
}