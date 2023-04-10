
import 'dart:math';

import 'package:bb_stats/src/components/game_stat.dart';
import 'package:bb_stats/src/components/opponent_shot.dart';
import 'package:bb_stats/src/components/play_by_play.dart';
import 'package:bb_stats/src/components/shot.dart';
import 'package:bb_stats/src/enums/GameAction.dart';
import 'package:bb_stats/src/enums/RecordType.dart';
import 'package:bb_stats/src/enums/PlayerAction.dart';
import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../collections/player/player.dart';

class GameRecordScreen extends ConsumerWidget {
  const GameRecordScreen(this.id,{Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final onGame = ref.watch(onGameProvider.notifier);
    final gamePreparation = ref.watch(gamePreparationProvider.notifier);
    final gameRecord = ref.watch(gameRecordProvider(id).notifier);
    final gameRecordInfo = ref.watch(gameRecordProvider(id));
    final gameStat = ref.watch(gameStatProvider(id).notifier);
    final gameSummary = ref.watch(gameSummaryProvider(id).notifier);
    final documentPath = ref.watch(documentPathProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Game Record'),
          actions: [
            PopupMenuButton(
              onSelected: (GameAction value) {
                if (value == GameAction.GAMESET) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Confirm'),
                        content: const Text('GameSet??'),
                        actions: [
                          SimpleDialogOption(
                            onPressed: () {
                              gameRecord.gameSet();
                              onGame.change(false);
                              gamePreparation.initState();
                              Navigator.of(context).pop();
                              Navigator.of(context).pop();
                            },
                            child: const Text('はい'),
                          ),
                          SimpleDialogOption(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('いいえ'),
                          ),
                        ],
                      );
                    }
                  );
                } else {
                  gameActionDialog(context, id, value);
                }
              },
              itemBuilder: (context) => [
                const PopupMenuItem(
                    value: GameAction.SHOT_CLOCK_TURNOVER,
                    child: Text('Shot Clock TurnOver')
                ),
                const PopupMenuItem(
                    value: GameAction.TIMEOUT,
                    child: Text('Timeout')
                ),
                const PopupMenuItem(
                    value: GameAction.GAMESET,
                    child: Text('GameSet')
                ),
              ]
            )
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TimePickerSpinner(
                    time: gameRecordInfo.time,
                    spacing: 50,
                    itemHeight: 50,
                    isForce2Digits: true,
                    onTimeChange: (time) {
                      gameRecord.updateTime(time);
                    }
                ),
                Expanded(
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('${documentPath.value}/teams/1.jpg'),
                              radius: 25.0,
                            ),
                            DropdownButton(
                              items: const [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text('1Q'),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text('2Q'),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text('3Q'),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text('4Q'),
                                ),
                              ],
                              onChanged: (int? value) {
                                gameRecord.updateQuarter(value!);
                              },
                              value: gameRecordInfo.currentQuarter,
                            ),
                            PopupMenuButton(
                              onSelected: (PlayerAction value) {
                                switch(value) {
                                  case PlayerAction.SHOT:
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => OpponentShot(id),
                                        fullscreenDialog: true, // true だとモーダル遷移になる
                                      ),
                                    );
                                    break;
                                  case PlayerAction.FT:
                                    ftDialog(context, id, null);
                                    break;
                                  case PlayerAction.REBOUND:
                                    reboundDialog(context, id, null);
                                    break;
                                  case PlayerAction.BLOCK:
                                    confirmDialog(context, 'Add Block', id, null, RecordType.BLOCK);
                                    break;
                                  case PlayerAction.STEAL:
                                    confirmDialog(context, 'Add Steal', id, null, RecordType.STEAL);
                                    break;
                                  case PlayerAction.TURNOVER:
                                    confirmDialog(context, 'Add TurnOver', id, null, RecordType.TURNOVER);
                                    break;
                                  case PlayerAction.ASSIST:
                                    confirmDialog(context, 'Add Assist', id, null, RecordType.ASSIST);
                                    break;
                                  case PlayerAction.FOUL:
                                    confirmDialog(context, 'Add Foul', id, null, RecordType.FOUL);
                                    break;
                                  default:
                                    break;
                                }
                              },
                              itemBuilder: (context) => [
                                const PopupMenuItem(
                                    value: PlayerAction.SHOT,
                                    child: Text('Shot')
                                ),
                                const PopupMenuItem(
                                    value: PlayerAction.FT,
                                    child: Text('FT')
                                ),
                                const PopupMenuItem(
                                    value: PlayerAction.REBOUND,
                                    child: Text('REBOUND')
                                ),
                                const PopupMenuItem(
                                    value: PlayerAction.BLOCK,
                                    child: Text('BLOCK')
                                ),
                                const PopupMenuItem(
                                    value: PlayerAction.STEAL,
                                    child: Text('STEAL')
                                ),
                                const PopupMenuItem(
                                    value: PlayerAction.TURNOVER,
                                    child: Text('TURNOVER')
                                ),
                                const PopupMenuItem(
                                    value: PlayerAction.ASSIST,
                                    child: Text('ASSIST')
                                ),const PopupMenuItem(
                                    value: PlayerAction.FOUL,
                                    child: Text('FOUL')
                                ),
                              ],
                              icon: CircleAvatar(
                                radius: 25,
                                backgroundImage: AssetImage('${documentPath.value}/teams/${gameRecordInfo.game.opponent.value!.id}.jpg'),
                                // backgroundImage: AssetImage(img),
                              ),
                              iconSize: 50,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${gameRecordInfo.game.myPts}', style: const TextStyle(fontSize: 25)),
                          const Text('-', style: TextStyle(fontSize: 20)),
                          Text('${gameRecordInfo.game.opponentPts}', style: const TextStyle(fontSize: 25)),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  child: _buildCircleAvatar(
                    id,
                    gameRecordInfo.player1!,
                    '${documentPath.value}/players/${gameRecordInfo.player1?.id}.jpg',
                    0
                  ),
                ),
                Expanded(
                  child: _buildCircleAvatar(
                    id,
                    gameRecordInfo.player2!,
                    '${documentPath.value}/players/${gameRecordInfo.player2?.id}.jpg',
                    1
                  ),
                ),
                Expanded(
                  child: _buildCircleAvatar(
                    id,
                    gameRecordInfo.player3!,
                    '${documentPath.value}/players/${gameRecordInfo.player3?.id}.jpg',
                    2
                  )
                ),
                Expanded(
                  child: _buildCircleAvatar(
                    id,
                    gameRecordInfo.player4!,
                    '${documentPath.value}/players/${gameRecordInfo.player4?.id}.jpg',
                    3
                  )
                ),
                Expanded(
                  child: _buildCircleAvatar(
                    id,
                    gameRecordInfo.player5!,
                    '${documentPath.value}/players/${gameRecordInfo.player5?.id}.jpg',
                    4
                  )
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
                child: ListView.builder(
                  controller: gameRecordInfo.controller,
                  itemCount: gameRecordInfo.records.length,
                  itemBuilder: (context, index) {
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        gameRecord.deletePbp(gameRecordInfo.records.elementAt(index));
                        gameSummary.update();
                        gameStat.updateStats();
                      },
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('確認'),
                              content: const Text('削除しますか'),
                              actions: [
                                SimpleDialogOption(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: const Text('はい'),
                                ),
                                SimpleDialogOption(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: const Text('いいえ'),
                                ),
                              ],
                            );
                          },
                        );
                      },
                      background: Container(
                        color: Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        child: gameRecordInfo.records.elementAt(index).myTeamPlay == false ? pbpOpponentRow(gameRecordInfo.records.elementAt(index), documentPath.value!, gameRecordInfo.game.opponent.value!.id) : pbpRow(gameRecordInfo.records.elementAt(index), documentPath.value!)
                      ),
                    );
                    
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 32, left: 16, right: 16),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    FloatingActionButton(
                      heroTag: "not gonna use1",
                      backgroundColor: Colors.redAccent,
                      onPressed: () {
                        gameRecord.scrollUp();
                      },
                      child: const Icon(Icons.arrow_upward)
                    ),
                    FloatingActionButton.extended(
                      heroTag: "not gonna use2",
                      icon: const Icon(Icons.query_stats),
                      label: const Text("Stats"),
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        gameStat.prepareImageProvider(1, null);
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => GameStat(id),
                            fullscreenDialog: true, // true だとモーダル遷移になる
                          ),
                        );
                      },
                    ),
                    FloatingActionButton(
                        heroTag: "not gonna use3",
                        backgroundColor: Colors.blueAccent,
                        onPressed: () {
                          gameRecord.scrollDown();
                        },
                        child: const Icon(Icons.arrow_downward)
                    ),
                  ]
              ),
            )
          ],
        )
    );
  }
}

Widget _buildCircleAvatar(int gameId, Player player, String img, int index) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final radius = min(constraints.maxHeight / 2, constraints.maxWidth / 2);

      return Column(
        children: [
          PopupMenuButton(
            onSelected: (PlayerAction value) {
              switch(value) {
                case PlayerAction.SHOT:
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => Shot(gameId, player.id),
                      fullscreenDialog: true, // true だとモーダル遷移になる
                    ),
                  );
                  break;
                case PlayerAction.FT:
                  ftDialog(context, gameId, player);
                  break;
                case PlayerAction.REBOUND:
                  reboundDialog(context, gameId, player);
                  break;
                case PlayerAction.BLOCK:
                  confirmDialog(context, 'Add Block', gameId, player, RecordType.BLOCK);
                  break;
                case PlayerAction.STEAL:
                  confirmDialog(context, 'Add Steal',gameId, player, RecordType.STEAL);
                  break;
                case PlayerAction.TURNOVER:
                  confirmDialog(context, 'Add Turnover',gameId, player, RecordType.TURNOVER);
                  break;
                case PlayerAction.FOUL:
                  confirmDialog(context, 'Add Foul',gameId, player, RecordType.FOUL);
                  break;
                case PlayerAction.SUBSTITUTE:
                  showModalBottomSheet(
                    context: context,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(top: Radius.circular(25.0)),
                    ),
                    builder: (builder) {
                      return substituteSheet(gameId, index);
                    }
                  );
                  break;
                default:
                  break;
              }
            },
            itemBuilder: (context) => [
              const PopupMenuItem(
                value: PlayerAction.SHOT,
                child: Text('Shot')
              ),
              const PopupMenuItem(
                  value: PlayerAction.FT,
                  child: Text('FT')
              ),
              const PopupMenuItem(
                value: PlayerAction.REBOUND,
                child: Text('Rebound')
              ),
              const PopupMenuItem(
                value: PlayerAction.BLOCK,
                child: Text('Block')
              ),
              const PopupMenuItem(
                value: PlayerAction.STEAL,
                child: Text('Steal')
              ),
              const PopupMenuItem(
                  value: PlayerAction.TURNOVER,
                  child: Text('Turnover')
              ),
              const PopupMenuItem(
                  value: PlayerAction.FOUL,
                  child: Text('Foul')
              ),
              const PopupMenuItem(
                  value: PlayerAction.SUBSTITUTE,
                  child: Text('Substitute')
              ),
            ],
            icon: CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage(img),
            ),
            iconSize: radius*2,
          ),
          Text(player.name, maxLines: 1,)
        ]
      );
    },
  );
}

Future<dynamic> confirmDialog(BuildContext context, String title, int gameId, Player? player, RecordType recordType) {
  bool myTeamPlay = player == null ? false : true;
  return showDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
          final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
          final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);
          final gameStat = ref.watch(gameStatProvider(gameId).notifier);
          return AlertDialog(
            title: const Text('Confirm'),
            content: Text(title),
            actions: [
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.updateBoxScore(player, recordType),
                  gameRecord.addPlayAction(player != null ? player.id : 0, recordType, gameRecordInfo.currentQuarter, null, null, myTeamPlay),
                  gameSummary.update(),
                  gameStat.updateStats(),
                  Navigator.of(context).pop(true),
                  gameRecord.scrollDown()
                },
                child: const Text('はい'),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('いいえ'),
              ),
            ],
          );
        });
      }
  );
}

Future<dynamic> ftDialog(BuildContext context, int gameId, Player? player) {
  bool myTeamPlay = player == null ? false : true;
  return showDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
          final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
          final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);
          final gameStat = ref.watch(gameStatProvider(gameId).notifier);
          return AlertDialog(
            title: const Text('Confirm'),
            content: const Text('FreeThrow'),
            actions: [
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.updateBoxScore(player, RecordType.FT_MADE),
                  gameRecord.addPlayAction(player != null ? player.id : 0, RecordType.FT_MADE, gameRecordInfo.currentQuarter, null, null, myTeamPlay),
                  gameSummary.update(),
                  gameStat.updateStats(),
                  Navigator.of(context).pop(true),
                  gameRecord.scrollDown()
                },
                child: const Text('Make'),
              ),
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.updateBoxScore(player, RecordType.FT_MISS),
                  gameRecord.addPlayAction(player != null ? player.id : 0, RecordType.FT_MISS, gameRecordInfo.currentQuarter, null, null, myTeamPlay),
                  Navigator.of(context).pop(true),
                  gameRecord.scrollDown()
                },
                child: const Text('Miss'),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
            ],
          );
        });
      }
  );
}

Future<dynamic> reboundDialog(BuildContext context, int gameId, Player? player) {
  bool myTeamPlay = player == null ? false : true;
  return showDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
          final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
          final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);
          final gameStat = ref.watch(gameStatProvider(gameId).notifier);
          return AlertDialog(
            title: const Text('Confirm'),
            content: const Text('Rebound'),
            actions: [
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.updateBoxScore(player, RecordType.OFFENCE_REBOUND),
                  gameRecord.addPlayAction(player != null ? player.id : 0, RecordType.OFFENCE_REBOUND, gameRecordInfo.currentQuarter, null, null, myTeamPlay),
                  gameSummary.update(),
                  gameStat.updateStats(),
                  Navigator.of(context).pop(true),
                  gameRecord.scrollDown()
                },
                child: const Text('OFFENCE'),
              ),
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.updateBoxScore(player, RecordType.DEFENCE_REBOUND),
                  gameRecord.addPlayAction(player != null ? player.id : 0, RecordType.DEFENCE_REBOUND, gameRecordInfo.currentQuarter, null, null, myTeamPlay),
                  gameSummary.update(),
                  gameStat.updateStats(),
                  Navigator.of(context).pop(true),
                  gameRecord.scrollDown()
                },
                child: const Text('DEFENCE'),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
            ],
          );
        });
      }
  );
}

Future<dynamic> gameActionDialog(BuildContext context, int gameId, GameAction gameAction) {
  String title;
  switch (gameAction) {
    case GameAction.TIMEOUT:
      title = 'TIMEOUT';
      break;
    case GameAction.SHOT_CLOCK_TURNOVER:
      title = 'Shot Clock Violation';
      break;
    default:
      title = '';
      break;
  }
  return showDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
          final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);
          final gameStat = ref.watch(gameStatProvider(gameId).notifier);
          return AlertDialog(
            title: const Text('Confirm'),
            content: Text(title),
            actions: [
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.addGameAction(gameAction, true),
                  gameSummary.update(),
                  gameStat.updateStats(),
                  Navigator.of(context).pop(true),
                  gameRecord.scrollDown()
                },
                child: const Text('US'),
              ),
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.addGameAction(gameAction, false),
                  gameSummary.update(),
                  gameStat.updateStats(),
                  Navigator.of(context).pop(true),
                  gameRecord.scrollDown()
                },
                child: const Text('THEM'),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text('Cancel'),
              ),
            ],
          );
        });
      }
  );
}

Widget substituteSheet(int gameId, int onCourtPlayerIndex) {
  return Consumer(builder: (context, ref, _) {
      final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
      final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
      final documentPath = ref.watch(documentPathProvider);
      return Container(
        height: 350.0,
        color: Colors.transparent,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text('Substitutes', style: TextStyle(fontSize: 20)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: Container(
                  height: 100,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      for (var i = 0; i < gameRecordInfo.substitutes.length; i++)
                        GestureDetector(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) {
                                    return AlertDialog(
                                      title: const Text('Confirm'),
                                      content: const Text('Substitute?'),
                                      actions: [
                                        SimpleDialogOption(
                                          onPressed: () => {
                                            gameRecord.substitute(gameRecordInfo.currentQuarter, gameRecordInfo.substitutes[i].player.value!, onCourtPlayerIndex),
                                            Navigator.of(context).pop(true),
                                            Navigator.pop(context),
                                            gameRecord.scrollDown()
                                          },
                                          child: const Text('はい'),
                                        ),
                                        SimpleDialogOption(
                                          onPressed: () => Navigator.of(context).pop(false),
                                          child: const Text('いいえ'),
                                        ),
                                      ],
                                    );
                                }
                            );
                          },
                          child: LayoutBuilder(
                            builder: (context, constraints) {
                              final radius = MediaQuery.of(context).size.width / 10;
                              return CircleAvatar(
                                radius: radius,
                                backgroundImage: AssetImage("${documentPath.value}/players/${gameRecordInfo.substitutes[i].player.value!.id}.jpg"),
                              );
                            },
                          ),
                        )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
  });
}
