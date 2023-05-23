import 'package:bb_stats/src/enums/PlayType.dart';
import 'package:bb_stats/src/enums/ShotType.dart';
import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../enums/ShotZone.dart';

class GameChartScreen extends ConsumerWidget {
  GameChartScreen(this.id,{Key? key}) : super(key: key);

  final int id;

  GlobalKey globalKey = GlobalKey();
  GlobalKey globalKey2 = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameChart = ref.watch(gameChartProvider(id).notifier);
    final gameChartInfo = ref.watch(gameChartProvider(id));

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("SHOT CHARTS"),
            DropdownButton(
              items: [
                const DropdownMenuItem(
                  value: 100,
                  child: Text('All'),
                ),
                const DropdownMenuItem(
                  value: 1,
                  child: Text('Q1'),
                ),
                const DropdownMenuItem(
                  value: 2,
                  child: Text('Q2'),
                ),
                const DropdownMenuItem(
                  value: 3,
                  child: Text('Q3'),
                ),
                const DropdownMenuItem(
                  value: 4,
                  child: Text('Q4'),
                ),
                for(int i = 1; i <= gameChart.getOtNum(); i++) ... {
                  DropdownMenuItem(
                    value: i+4,
                    child: Text('OT$i'),
                  ),
                }
              ],
              onChanged: (int? value) {
                gameChart.updatePeriod(value!);
              },
              value: gameChartInfo.period,
            ),
            const SizedBox(height: 20,),
            const Text('Scored By  '),
            DropdownButton(
              items: <DropdownMenuItem<int>>[
                const DropdownMenuItem(
                  value: null,
                  child: Text('-'),
                ),
                for (final player in gameChartInfo.players)
                  DropdownMenuItem(
                    value: player.id,
                    child: Text(player.name),
                  ),
              ],
              onChanged: (int? value) {
                gameChart.updatePlayerId(value);
              },
              value: gameChartInfo.selectedPlayerId,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Play Type"),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value:  PlayType.NONE,
                      child: Text('-'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.ISOLATION,
                      child: Text('ISOLATION'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.FASTBREAK,
                      child: Text('FAST BREAK'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.PICK_AND_ROLL_BALL_HANDLER,
                      child: Text('PICK&ROLL BALLER'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.PICK_AND_ROLL_ROLL_MAN,
                      child: Text('PICK&ROLL ROLLER'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.POSTUP,
                      child: Text('POST UP'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.SPOTUP,
                      child: Text('SPOT UP'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.HANDOFF,
                      child: Text('HANDOFF'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.CUT,
                      child: Text('CUT'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.OFF_SCREEN,
                      child: Text('OFF_SCREEN'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.SECOND_CHANCE,
                      child: Text('2nd Chance'),
                    ),
                  ],
                  onChanged: (PlayType? value) {
                    gameChart.updatePlayType(value!);
                  },
                  value: gameChartInfo.playType,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Shot Type"),
                DropdownButton(
                  items: const <DropdownMenuItem<ShotType>>[
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
                    gameChart.updateShotType(value!);
                  },
                  value: gameChartInfo.shotType,
                ),
              ],
            ),
            const Text('Shot Zone'),
            Row(
              children: [
                DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: ShotZone.ALL,
                      child: Text('-'),
                    ),
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
                    gameChart.updateShotZone(value!);
                  },
                  value: gameChartInfo.shotZone,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children:[
                  Expanded(
                    child: CupertinoSegmentedControl(
                        children: const {
                          1: Text('All'),
                          2: Text('Make'),
                          3: Text('Miss'),
                        },
                        groupValue: gameChartInfo.shotFilter,
                        onValueChanged: (int value) {
                          gameChart.updateShotFilter(value);
                        }
                    ),
                  )
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color:Colors.green,
              ),
              child: const Text("Home"),
            ),

            gameChartInfo.image != null ?
            GestureDetector(
              onLongPress: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirm'),
                      content: const Text('Download ShotChart'),
                      actions: [
                        SimpleDialogOption(
                          onPressed: () => {
                            gameChart.download(gameChartInfo.image!),
                            Navigator.of(context).pop(true),
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('画像を保存しました。'))
                            ),
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Image(
                key: globalKey,
                image: gameChartInfo.image!,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: 300,
              )
            )
              :
            const Text('No Image Taken', textAlign: TextAlign.center),

            const SizedBox(height: 20,),
            //  Opponent
            const Text("OPPONENT SHOT CHARTS"),
            DropdownButton(
              items: [
                const DropdownMenuItem(
                  value: 100,
                  child: Text('All'),
                ),
                const DropdownMenuItem(
                  value: 1,
                  child: Text('Q1'),
                ),
                const DropdownMenuItem(
                  value: 2,
                  child: Text('Q2'),
                ),
                const DropdownMenuItem(
                  value: 3,
                  child: Text('Q3'),
                ),
                const DropdownMenuItem(
                  value: 4,
                  child: Text('Q4'),
                ),
                for(int i = 1; i <= gameChart.getOtNum(); i++) ... {
                  DropdownMenuItem(
                    value: i+4,
                    child: Text('OT$i'),
                  ),
                }
              ],
              onChanged: (int? value) {
                gameChart.updateOpponentPeriod(value!);
              },
              value: gameChartInfo.opponentPeriod,
            ),
            const SizedBox(height: 20,),
            const Text('Defenced By  '),
            DropdownButton(
              items: <DropdownMenuItem<int>>[
                const DropdownMenuItem(
                  value: null,
                  child: Text('-'),
                ),
                for (final player in gameChartInfo.players)
                  DropdownMenuItem(
                    value: player.id,
                    child: Text(player.name),
                  ),
              ],
              onChanged: (int? value) {
                gameChart.updateDefencedPlayerId(value);
              },
              value: gameChartInfo.defencedPlayerId,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Play Type"),
                DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value:  PlayType.NONE,
                      child: Text('-'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.ISOLATION,
                      child: Text('ISOLATION'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.FASTBREAK,
                      child: Text('FAST BREAK'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.PICK_AND_ROLL_BALL_HANDLER,
                      child: Text('PICK&ROLL BALLER'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.PICK_AND_ROLL_ROLL_MAN,
                      child: Text('PICK&ROLL ROLLER'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.POSTUP,
                      child: Text('POST UP'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.SPOTUP,
                      child: Text('SPOT UP'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.HANDOFF,
                      child: Text('HANDOFF'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.CUT,
                      child: Text('CUT'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.OFF_SCREEN,
                      child: Text('OFF_SCREEN'),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.SECOND_CHANCE,
                      child: Text('2nd Chance'),
                    ),
                  ],
                  onChanged: (PlayType? value) {
                    gameChart.updateOpponentPlayType(value!);
                  },
                  value: gameChartInfo.opponentPlayType,
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Shot Type"),
                DropdownButton(
                  items: const <DropdownMenuItem<ShotType>>[
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
                      child: Text('FADEAWAY'),
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
                    gameChart.updateOpponentShotType(value!);
                  },
                  value: gameChartInfo.opponentShotType,
                ),
              ],
            ),
            const Text('Shot Zone'),
            Row(
              children: [
                DropdownButton(
                  items: const [
                    DropdownMenuItem(
                      value: ShotZone.ALL,
                      child: Text('-'),
                    ),
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
                    gameChart.updateOpponentShotZone(value!);
                  },
                  value: gameChartInfo.opponentShotZone,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children:[
                  Expanded(
                    child: CupertinoSegmentedControl(
                        children: const {
                          1: Text('All'),
                          2: Text('Make'),
                          3: Text('Miss'),
                        },
                        groupValue: gameChartInfo.opponentShotFilter,
                        onValueChanged: (int value) {
                          gameChart.updateOpponentShotFilter(value);
                        }
                    ),
                  )
                ],
              ),
            ),

            Container(
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color:Colors.green,
              ),
              child: const Text("Opponent"),
            ),

            gameChartInfo.opponentImage != null ?
            GestureDetector(
              onLongPress: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirm'),
                      content: const Text('DOWNLOAD SHOT CHART'),
                      actions: [
                        SimpleDialogOption(
                          onPressed: () => {
                            gameChart.download(gameChartInfo.opponentImage!),
                            Navigator.of(context).pop(true),
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('画像を保存しました。'))
                            ),
                          },
                          child: const Text('Save'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Image(
                key: globalKey2,
                image: gameChartInfo.opponentImage!,
                fit: BoxFit.fill,
                width: MediaQuery.of(context).size.width,
                height: 300,
              ),
            )
                :
            const Text('No Image Taken', textAlign: TextAlign.center),
          ],
        ),
      )
    );
  }
}