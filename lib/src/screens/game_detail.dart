import 'package:bb_stats/src/components/game_chart.dart';
import 'package:bb_stats/src/components/play_by_play.dart';
import 'package:bb_stats/src/components/summary.dart';
import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../components/stat_datatable.dart';
import 'game_record.dart';


class GameDetailScreen extends ConsumerWidget {
  const GameDetailScreen(
      this.id,
      {Key? key}
  ) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final game = ref.watch(gameProvider(id).notifier);
    final gameInfo = ref.watch(gameProvider(id));
    final bool onGame = ref.watch(onGameProvider);

    const segmentedControlMaxWidth = 500.0;
    final selection = <int, Widget>{
      0: const Text("Summary"),
      1: const Text("Box Score"),
      2: const Text("Game Charts"),
      3: const Text("Play-By-Play"),
    };
    final pages = <int, Widget>{
      0: SummaryScreen(id),
      1: StatDataTable(id),
      2: GameChartScreen(id),
      3: PlayByPlayScreen(id),
    };

    return Scaffold(
      appBar: AppBar(
        title: const Text('GAME'),
        actions: gameInfo.page == 3 && !onGame ? (
            [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameRecordScreen(id),
                    ),
                  )
                },
              )
            ]
        ) : [],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              CupertinoPageScaffold(
                child: DefaultTextStyle(
                  style: CupertinoTheme.of(context)
                      .textTheme
                      .textStyle
                      .copyWith(fontSize: 13),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      SizedBox(height: 16),
                      SizedBox(
                        width: segmentedControlMaxWidth,
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: CupertinoSlidingSegmentedControl<int>(
                            children: selection,
                            onValueChanged: (value) => game.updateGameModel(value!),
                            groupValue: gameInfo.page,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              pages[gameInfo.page]!
            ],
          ),
        ),
      ),
    );
  }

}