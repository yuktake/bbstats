import 'package:bb_stats/src/components/game_chart.dart';
import 'package:bb_stats/src/components/play_by_play.dart';
import 'package:bb_stats/src/components/summary.dart';
import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import '../components/stat_datatable.dart';
import 'game_record.dart';
import 'dart:io';


class GameDetailScreen extends ConsumerWidget {
  const GameDetailScreen(
      this.id,
      {Key? key}
  ) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentPath = ref.watch(documentPathProvider);
    final bool onGame = ref.watch(onGameProvider);
    final onGameNotifier = ref.watch(onGameProvider.notifier);

    final game = ref.watch(gameProvider(id).notifier);
    final gameInfo = ref.watch(gameProvider(id));
    final boxScoreList = ref.watch(boxScoreListProvider(id).notifier);
    final gamePbp = ref.watch(gamePbpProvider(id).notifier);
    final gameList = ref.watch(gameListProvider.notifier);

    Rect shareRect = const Rect.fromLTWH(0, 0, 50, 50);
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
        actions: [
          gameInfo.page == 0 ?
          IconButton(
            icon: const Icon(
              Icons.delete,
              color: Colors.red,
            ),
            onPressed: () {
              // Confirm
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Confirm'),
                    content: const Text('Delete???'),
                    actions: [
                      SimpleDialogOption(
                        onPressed: () {
                          if (gameInfo.game!.onGame) {
                            onGameNotifier.change(false);
                          }
                          game.deleteGame(id);
                          // stateの更新
                          gameList.initGameList();
                          Navigator.of(context).pop(false);
                          Navigator.of(context).pop(false);
                        },
                        child: const Text('Y'),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text('N'),
                      ),
                    ],
                  );
                }
              );
            },
          ) : Container(),

          gameInfo.page == 1 ?
          IconButton(
            icon: const Icon(Icons.download),
            color: Colors.white,
            onPressed: () async {
              final csvFile = File('${(await getApplicationDocumentsDirectory()).path}/csvs/box-scores.csv');
              String csvString = boxScoreList.getBoxScoresString();
              await csvFile.writeAsString(csvString);
              Share.shareXFiles(
                  [XFile('${documentPath.value}/csvs/box-scores.csv', name: 'box-scores.csv')],
                  subject: 'Export',
                  text: 'Output BoxScores',
                  sharePositionOrigin: shareRect,
              );
            },
          ) : Container(),

          gameInfo.page == 3 && !onGame ?
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Confirm'),
                    content: const Text('Do you want to edit it?'),
                    actions: [
                      SimpleDialogOption(
                        onPressed: () {
                          onGameNotifier.change(true);
                          gamePbp.editGame();
                          Navigator.of(context).pop(true);
                          Navigator.of(context).pop(true);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => GameRecordScreen(id),
                            ),
                          );
                        },
                        child: const Text('はい'),
                      ),
                      SimpleDialogOption(
                        onPressed: () {
                          Navigator.of(context).pop(true);
                        },
                        child: const Text('いいえ'),
                      ),
                    ],
                  );
                },
              ),
            },
          ) : Container(),

          gameInfo.page == 3 ?
          IconButton(
            icon: const Icon(Icons.download),
            color: Colors.white,
            onPressed: () async {
              final csvFile = File('${(await getApplicationDocumentsDirectory()).path}/csvs/pbp.csv');
              String csvString = gamePbp.getPbpString(id);
              await csvFile.writeAsString(csvString);
              Share.shareXFiles(
                  [XFile('${documentPath.value}/csvs/pbp.csv', name: 'pbp.csv')],
                  subject: 'Export',
                  text: 'Output Pbp',
                  sharePositionOrigin: shareRect,
              );
            },
          ) : Container(),
        ]

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
                      const SizedBox(height: 16),
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