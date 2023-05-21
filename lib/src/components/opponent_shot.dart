import 'dart:math';

import 'package:bb_stats/src/collections/pbp/pbp.dart';
import 'package:bb_stats/src/collections/shot/shot_parameter.dart';
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
    final opponentShotInfo = ref.watch(opponentShotProvider(ShotParameter(gameId: gameId, playerId: 0)));
    final opponentShot = ref.watch(opponentShotProvider(ShotParameter(gameId: gameId, playerId: 0)).notifier);
    final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);
    final gameStat = ref.watch(gameStatProvider(gameId).notifier);
    final documentPath = ref.watch(documentPathProvider);

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
            const Text('Defenced by'),
            SizedBox(
              height: 100,
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
                      child: Text('P&R BALL MAN'),
                    ),
                    DropdownMenuItem(
                      value: PlayType.PICK_AND_ROLL_ROLL_MAN,
                      child: Text('P&R ROLL MAN'),
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
                    opponentShot.updatePlayType(value!);
                  },
                  value: opponentShotInfo.playType,
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
                    opponentShot.updateShotType(value!);
                  },
                  value: opponentShotInfo.shotType,
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
                    opponentShot.updateShotZone(value!);
                  },
                  value: opponentShotInfo.shotZone,
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
                  if (opponentShotInfo.positionX == null || opponentShotInfo.positionY == null) {
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