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

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double normalFontSize = screenWidth / 27;
    double smallFontSize = screenWidth / 40;
    double shotChartHeight = screenHeight*0.5;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("SHOT CHARTS", style: TextStyle(fontSize: normalFontSize),),
            DropdownButton(
              items: [
                DropdownMenuItem(
                  value: 100,
                  child: Text('All', style: TextStyle(fontSize: smallFontSize),),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('Q1', style: TextStyle(fontSize: smallFontSize),),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Q2', style: TextStyle(fontSize: smallFontSize),),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text('Q3', style: TextStyle(fontSize: smallFontSize),),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text('Q4', style: TextStyle(fontSize: smallFontSize),),
                ),
                for(int i = 1; i <= gameChart.getOtNum(); i++) ... {
                  DropdownMenuItem(
                    value: i+4,
                    child: Text('OT$i', style: TextStyle(fontSize: smallFontSize),),
                  ),
                }
              ],
              onChanged: (int? value) {
                gameChart.updatePeriod(value!);
              },
              value: gameChartInfo.period,
            ),
            const SizedBox(height: 20,),
            Text('Scored By  ', style: TextStyle(fontSize: normalFontSize),),
            DropdownButton(
              items: <DropdownMenuItem<int>>[
                DropdownMenuItem(
                  value: null,
                  child: Text('-', style: TextStyle(fontSize: smallFontSize),),
                ),
                for (final player in gameChartInfo.players)
                  DropdownMenuItem(
                    value: player.id,
                    child: Text(player.name, style: TextStyle(fontSize: smallFontSize),),
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
                Text("Play Type", style: TextStyle(fontSize: normalFontSize),),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value:  PlayType.NONE,
                      child: Text('-', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.ISOLATION,
                      child: Text('ISOLATION', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.FASTBREAK,
                      child: Text('FAST BREAK', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.PICK_AND_ROLL_BALL_HANDLER,
                      child: Text('PICK&ROLL BALLER', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.PICK_AND_ROLL_ROLL_MAN,
                      child: Text('PICK&ROLL ROLLER', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.POSTUP,
                      child: Text('POST UP', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.SPOTUP,
                      child: Text('SPOT UP', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.HANDOFF,
                      child: Text('HANDOFF', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.CUT,
                      child: Text('CUT', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.OFF_SCREEN,
                      child: Text('OFF_SCREEN', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.SECOND_CHANCE,
                      child: Text('2nd Chance', style: TextStyle(fontSize: smallFontSize),),
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
                Text("Shot Type", style: TextStyle(fontSize: normalFontSize),),
                DropdownButton(
                  items: <DropdownMenuItem<ShotType>>[
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
                    gameChart.updateShotType(value!);
                  },
                  value: gameChartInfo.shotType,
                ),
              ],
            ),
            Text('Shot Zone', style: TextStyle(fontSize: normalFontSize),),
            Row(
              children: [
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: ShotZone.ALL,
                      child: Text('-', style: TextStyle(fontSize: smallFontSize),),
                    ),
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
                        children: {
                          1: Text('All', style: TextStyle(fontSize: smallFontSize),),
                          2: Text('Make', style: TextStyle(fontSize: smallFontSize),),
                          3: Text('Miss', style: TextStyle(fontSize: smallFontSize),),
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

            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Text(gameChartInfo.players[0].team.value!.name, style: TextStyle(fontSize: smallFontSize),),
            ),

            gameChartInfo.image != null ?
            GestureDetector(
              onLongPress: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Confirm', style: TextStyle(fontSize: normalFontSize),),
                      content: Text('Download ShotChart', style: TextStyle(fontSize: smallFontSize),),
                      actions: [
                        SimpleDialogOption(
                          onPressed: () => {
                            gameChart.download(gameChartInfo.image!),
                            Navigator.of(context).pop(true),
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text('画像を保存しました。'))
                            ),
                          },
                          child: Text('Save', style: TextStyle(fontSize: smallFontSize),),
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
                height: shotChartHeight,
              )
            )
              :
            const Text('No Image Taken', textAlign: TextAlign.center),

            const SizedBox(height: 20,),
            //  Opponent
            Text("OPPONENT SHOT CHARTS", style: TextStyle(fontSize: normalFontSize),),
            DropdownButton(
              items: [
                DropdownMenuItem(
                  value: 100,
                  child: Text('All', style: TextStyle(fontSize: smallFontSize),),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text('Q1', style: TextStyle(fontSize: smallFontSize),),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Q2', style: TextStyle(fontSize: smallFontSize),),
                ),
                DropdownMenuItem(
                  value: 3,
                  child: Text('Q3', style: TextStyle(fontSize: smallFontSize),),
                ),
                DropdownMenuItem(
                  value: 4,
                  child: Text('Q4', style: TextStyle(fontSize: smallFontSize),),
                ),
                for(int i = 1; i <= gameChart.getOtNum(); i++) ... {
                  DropdownMenuItem(
                    value: i+4,
                    child: Text('OT$i', style: TextStyle(fontSize: smallFontSize),),
                  ),
                }
              ],
              onChanged: (int? value) {
                gameChart.updateOpponentPeriod(value!);
              },
              value: gameChartInfo.opponentPeriod,
            ),
            const SizedBox(height: 20,),
            Text('Defenced By  ', style: TextStyle(fontSize: normalFontSize),),
            DropdownButton(
              items: <DropdownMenuItem<int>>[
                DropdownMenuItem(
                  value: null,
                  child: Text('-', style: TextStyle(fontSize: smallFontSize),),
                ),
                for (final player in gameChartInfo.players)
                  DropdownMenuItem(
                    value: player.id,
                    child: Text(player.name, style: TextStyle(fontSize: smallFontSize),),
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
                Text("Play Type", style: TextStyle(fontSize: normalFontSize),),
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value:  PlayType.NONE,
                      child: Text('-', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.ISOLATION,
                      child: Text('ISOLATION', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.FASTBREAK,
                      child: Text('FAST BREAK', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.PICK_AND_ROLL_BALL_HANDLER,
                      child: Text('PICK&ROLL BALLER', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.PICK_AND_ROLL_ROLL_MAN,
                      child: Text('PICK&ROLL ROLLER', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.POSTUP,
                      child: Text('POST UP', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.SPOTUP,
                      child: Text('SPOT UP', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.HANDOFF,
                      child: Text('HANDOFF', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.CUT,
                      child: Text('CUT', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.OFF_SCREEN,
                      child: Text('OFF_SCREEN', style: TextStyle(fontSize: smallFontSize),),
                    ),
                    DropdownMenuItem(
                      value:  PlayType.SECOND_CHANCE,
                      child: Text('2nd Chance', style: TextStyle(fontSize: smallFontSize),),
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
                Text("Shot Type", style: TextStyle(fontSize: normalFontSize),),
                DropdownButton(
                  items: <DropdownMenuItem<ShotType>>[
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
                      child: Text('FADEAWAY', style: TextStyle(fontSize: smallFontSize),),
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
                    gameChart.updateOpponentShotType(value!);
                  },
                  value: gameChartInfo.opponentShotType,
                ),
              ],
            ),
            Text('Shot Zone', style: TextStyle(fontSize: normalFontSize),),
            Row(
              children: [
                DropdownButton(
                  items: [
                    DropdownMenuItem(
                      value: ShotZone.ALL,
                      child: Text('-', style: TextStyle(fontSize: smallFontSize),),
                    ),
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
                        children: {
                          1: Text('All', style: TextStyle(fontSize: smallFontSize),),
                          2: Text('Make', style: TextStyle(fontSize: smallFontSize),),
                          3: Text('Miss', style: TextStyle(fontSize: smallFontSize),),
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
              child: Text("Opponent", style: TextStyle(fontSize: smallFontSize),),
            ),

            gameChartInfo.opponentImage != null ?
            GestureDetector(
              onLongPress: (){
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Confirm', style: TextStyle(fontSize: normalFontSize),),
                      content: Text('DOWNLOAD SHOT CHART', style: TextStyle(fontSize: smallFontSize),),
                      actions: [
                        SimpleDialogOption(
                          onPressed: () => {
                            gameChart.download(gameChartInfo.opponentImage!),
                            Navigator.of(context).pop(true),
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('画像を保存しました。'))
                            ),
                          },
                          child: Text('Save', style: TextStyle(fontSize: smallFontSize),),
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
                height: shotChartHeight,
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