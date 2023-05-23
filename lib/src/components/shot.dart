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
                width: MediaQuery.of(context).size.width,
                height: 300,
              ),
            )
              :
            const Text(
              'No Image Taken',
              textAlign: TextAlign.center,
            ),
            const Text('Make or Miss'),
            Padding(
              padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoSegmentedControl(
                        children: const {
                          1: Text('Make'),
                          0: Text('Miss'),
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
            Text(shotInfo.result ? 'Assisted By' : ''),
            shotInfo.result ?
            SizedBox(
              height: 100,
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

            const Text('Points'),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: CupertinoSegmentedControl(
                        children: const {
                          2: Text('2'),
                          3: Text('3'),
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
                const Text('Play Type'),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: PlayType.NONE,
                      child: Text('-'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.ISOLATION,
                      child: Text('ISOLATION'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.FASTBREAK,
                      child: Text('FAST BREAK'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.PICK_AND_ROLL_BALL_HANDLER,
                      child: Text('P&R BALLER'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.PICK_AND_ROLL_ROLL_MAN,
                      child: Text('P&R ROLLER'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.POSTUP,
                      child: Text('POST UP'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.SPOTUP,
                      child: Text('SPOT UP'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.HANDOFF,
                      child: Text('HANDOFF'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.CUT,
                      child: Text('CUT'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.OFF_SCREEN,
                      child: Text('OFF SCREEN'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.SECOND_CHANCE,
                      child: Text('2nd Chance'),
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
                const Text('Shot Type'),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: ShotType.NONE,
                      child: Text('-'),
                    ),
                    DropdownMenuItem(
                      value: ShotType.LAYUP,
                      child: Text('LAYUP'),
                    ),
                    DropdownMenuItem(
                      value: ShotType.CATCH_AND_SHOT,
                      child: Text('CATCH_AND_SHOT'),
                    ),
                    DropdownMenuItem(
                      value: ShotType.PULLUP,
                      child: Text('PULL UP'),
                    ),
                    DropdownMenuItem(
                      value: ShotType.FLOATING_SHOT,
                      child: Text('FLOATING_SHOT'),
                    ),
                    DropdownMenuItem(
                      value: ShotType.HOOK_SHOT,
                      child: Text('HOOK_SHOT'),
                    ),
                    DropdownMenuItem(
                      value: ShotType.TIP_SHOT,
                      child: Text('TIP_SHOT'),
                    ),
                    DropdownMenuItem(
                      value: ShotType.FADEAWAY,
                      child: Text('FADE AWAY'),
                    ),
                    DropdownMenuItem(
                      value: ShotType.DUNK,
                      child: Text('DUNK'),
                    ),
                    DropdownMenuItem(
                      value: ShotType.ALLEY_OOP,
                      child: Text('ALLEY_OOP'),
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
                const Text('Shot Zone'),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: ShotZone.IN_THE_PAINT,
                      child: Text('IN_THE_PAINT'),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.MIDDLE_AREA,
                      child: Text('MIDDLE_AREA'),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.AROUND_TOP_THREE,
                      child: Text('AROUND_TOP_THREE'),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.LEFT_CORNER_THREE,
                      child: Text('LEFT_CORNER_THREE'),
                    ),
                    DropdownMenuItem(
                      value: ShotZone.RIGHT_CORNER_THREE,
                      child: Text('RIGHT_CORNER_THREE'),
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
                    noShotPositionDialog(context);
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
        return Container(
          padding: const EdgeInsets.all(5.0),
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

Future<dynamic> noShotPositionDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Shot Position'),
        content: const Text('No shot position has been entered'),
        actions : [
          SimpleDialogOption(
            onPressed: () => Navigator.of(context).pop(false),
            child: const Text('OK'),
          ),
        ]
      );
    }
  );
}