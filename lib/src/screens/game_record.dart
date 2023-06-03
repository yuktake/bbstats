
import 'dart:io';
import 'dart:math';

import 'package:bb_stats/src/components/game_stat.dart';
import 'package:bb_stats/src/components/opponent_shot.dart';
import 'package:bb_stats/src/components/play_by_play.dart';
import 'package:bb_stats/src/components/shot.dart';
import 'package:bb_stats/src/enums/GameAction.dart';
import 'package:bb_stats/src/enums/RecordType.dart';
import 'package:bb_stats/src/enums/PlayerAction.dart';
import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:bb_stats/src/screens/team_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

import '../collections/player/player.dart';
import '../collections/shot/shot_parameter.dart';

class GameRecordScreen extends ConsumerWidget {
  const GameRecordScreen(this.id,{Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameRecord = ref.watch(gameRecordProvider(id).notifier);
    final gameRecordInfo = ref.watch(gameRecordProvider(id));
    final gameStat = ref.watch(gameStatProvider(id).notifier);
    final gameSummary = ref.watch(gameSummaryProvider(id).notifier);
    final opponentShot = ref.watch(opponentShotProvider(ShotParameter(gameId: id, playerId: 0)).notifier);
    final documentPath = ref.watch(documentPathProvider);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double iconRadius = screenHeight*0.05;
    double pbpIconRadius = screenHeight*0.03;
    double timePickerWidth = screenWidth*0.15;
    double normalFontSize = screenWidth / 27;
    double smallFontSize = screenWidth / 40;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Game Record'),
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => {
                quarterChangeDialog(context, id, normalFontSize, smallFontSize)
              },
            ),
            showGameOperation(context, id, normalFontSize, smallFontSize),
          ],
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TimePickerSpinner(
                    time: gameRecordInfo.time,
                    spacing: 0,
                    itemWidth: timePickerWidth,
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
                            showCircleImage('${documentPath.value}/teams/1.jpg', iconRadius),
                            DropdownButton(
                              items: [
                                DropdownMenuItem(
                                  value: 1,
                                  child: Text('1Q', style: TextStyle(fontSize: smallFontSize),),
                                ),
                                DropdownMenuItem(
                                  value: 2,
                                  child: Text('2Q', style: TextStyle(fontSize: smallFontSize),),
                                ),
                                DropdownMenuItem(
                                  value: 3,
                                  child: Text('3Q', style: TextStyle(fontSize: smallFontSize),),
                                ),
                                DropdownMenuItem(
                                  value: 4,
                                  child: Text('4Q', style: TextStyle(fontSize: smallFontSize),),
                                ),

                                for(int i = 1; i <= gameRecord.getOtNum(); i++) ... {
                                  DropdownMenuItem(
                                      value: i+4,
                                      child: Text('OT$i', style: TextStyle(fontSize: smallFontSize),),
                                  )
                                }
                              ],
                              onChanged: (int? value) {
                                gameRecord.updateQuarter(value!);
                              },
                              value: gameRecordInfo.currentQuarter,
                            ),
                            PopupMenuButton(
                              onSelected: (PlayerAction value) {
                                if (!validateTime(gameRecordInfo.currentQuarter, gameRecordInfo.game.quarterMin, gameRecordInfo.game.overtimeQuarterMin, gameRecordInfo.time)) {
                                  timeAlertSnackBar(context);
                                  return;
                                }
                                switch(value) {
                                  case PlayerAction.SHOT:
                                    opponentShot.resetState();
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => OpponentShot(id),
                                        fullscreenDialog: true, // true だとモーダル遷移になる
                                      ),
                                    );
                                    break;
                                  case PlayerAction.FT:
                                    ftDialog(context, id, null, normalFontSize, smallFontSize);
                                    break;
                                  case PlayerAction.REBOUND:
                                    reboundDialog(context, id, null, normalFontSize, smallFontSize);
                                    break;
                                  case PlayerAction.BLOCK:
                                    confirmDialog(context, 'Add Block', id, null, RecordType.BLOCK, normalFontSize, smallFontSize);
                                    break;
                                  case PlayerAction.STEAL:
                                    confirmDialog(context, 'Add Steal', id, null, RecordType.STEAL, normalFontSize, smallFontSize);
                                    break;
                                  case PlayerAction.TURNOVER:
                                    confirmDialog(context, 'Add TurnOver', id, null, RecordType.TURNOVER, normalFontSize, smallFontSize);
                                    break;
                                  case PlayerAction.ASSIST:
                                    confirmDialog(context, 'Add Assist', id, null, RecordType.ASSIST, normalFontSize, smallFontSize);
                                    break;
                                  case PlayerAction.FOUL:
                                    confirmDialog(context, 'Add Foul', id, null, RecordType.FOUL, normalFontSize, smallFontSize);
                                    break;
                                  default:
                                    break;
                                }
                              },
                              itemBuilder: (context) => [
                                PopupMenuItem(
                                    value: PlayerAction.SHOT,
                                    child: Text('Shot', style: TextStyle(fontSize: smallFontSize),)
                                ),
                                PopupMenuItem(
                                    value: PlayerAction.FT,
                                    child: Text('FT', style: TextStyle(fontSize: smallFontSize),)
                                ),
                                PopupMenuItem(
                                    value: PlayerAction.REBOUND,
                                    child: Text('REBOUND', style: TextStyle(fontSize: smallFontSize),)
                                ),
                                PopupMenuItem(
                                    value: PlayerAction.BLOCK,
                                    child: Text('BLOCK', style: TextStyle(fontSize: smallFontSize),)
                                ),
                                PopupMenuItem(
                                    value: PlayerAction.STEAL,
                                    child: Text('STEAL', style: TextStyle(fontSize: smallFontSize),)
                                ),
                                PopupMenuItem(
                                    value: PlayerAction.TURNOVER,
                                    child: Text('TURNOVER', style: TextStyle(fontSize: smallFontSize),)
                                ),
                                PopupMenuItem(
                                    value: PlayerAction.ASSIST,
                                    child: Text('ASSIST', style: TextStyle(fontSize: smallFontSize),)
                                ),
                                PopupMenuItem(
                                    value: PlayerAction.FOUL,
                                    child: Text('FOUL', style: TextStyle(fontSize: smallFontSize),)
                                ),
                              ],
                              icon: showCircleImage('${documentPath.value}/teams/${gameRecordInfo.game.opponent.value!.id}.jpg', iconRadius),
                              iconSize: iconRadius*2,
                            ),
                          ],
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text('${gameRecordInfo.game.myPts}', style: TextStyle(fontSize: normalFontSize)),
                          Text('-', style: TextStyle(fontSize: normalFontSize)),
                          Text('${gameRecordInfo.game.opponentPts}', style: TextStyle(fontSize: normalFontSize)),
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
                    0,
                    normalFontSize,
                    smallFontSize,
                  ),
                ),
                Expanded(
                  child: _buildCircleAvatar(
                    id,
                    gameRecordInfo.player2!,
                    '${documentPath.value}/players/${gameRecordInfo.player2?.id}.jpg',
                    1,
                    normalFontSize,
                    smallFontSize,
                  ),
                ),
                Expanded(
                  child: _buildCircleAvatar(
                    id,
                    gameRecordInfo.player3!,
                    '${documentPath.value}/players/${gameRecordInfo.player3?.id}.jpg',
                    2,
                    normalFontSize,
                    smallFontSize,
                  )
                ),
                Expanded(
                  child: _buildCircleAvatar(
                    id,
                    gameRecordInfo.player4!,
                    '${documentPath.value}/players/${gameRecordInfo.player4?.id}.jpg',
                    3,
                    normalFontSize,
                    smallFontSize,
                  )
                ),
                Expanded(
                  child: _buildCircleAvatar(
                    id,
                    gameRecordInfo.player5!,
                    '${documentPath.value}/players/${gameRecordInfo.player5?.id}.jpg',
                    4,
                    normalFontSize,
                    smallFontSize,
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
                      },
                      confirmDismiss: (direction) async {
                        return await showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: Text('Confirm', style: TextStyle(fontSize: normalFontSize),),
                              content: Text('Delete This Record?', style: TextStyle(fontSize: smallFontSize),),
                              actions: [
                                SimpleDialogOption(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: Text('Delete', style: TextStyle(color: Colors.red, fontSize: smallFontSize),),
                                ),
                                SimpleDialogOption(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: Text('Cancel', style: TextStyle(fontSize: smallFontSize),),
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
                        child: gameRecordInfo.records.elementAt(index).myTeamPlay == false ?
                        pbpOpponentRow(gameRecordInfo.records.elementAt(index), documentPath.value!, gameRecordInfo.game.opponent.value!.id, pbpIconRadius, smallFontSize) :
                        pbpRow(gameRecordInfo.records.elementAt(index), documentPath.value!, pbpIconRadius, smallFontSize)
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
                      child: Icon(Icons.arrow_upward, size: normalFontSize,)
                    ),
                    FloatingActionButton.extended(
                      heroTag: "not gonna use2",
                      icon: Icon(Icons.query_stats, size: normalFontSize,),
                      label: Text("Stats", style: TextStyle(fontSize: smallFontSize),),
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
                        child: Icon(Icons.arrow_downward, size: normalFontSize)
                    ),
                  ]
              ),
            )
          ],
        )
    );
  }
}

Widget _buildCircleAvatar(int gameId, Player player, String img, int index, double normalFontSize, double smallFontSize) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final radius = min(constraints.maxHeight / 2, constraints.maxWidth / 2);
      var a = File(img);

      return Consumer(builder: (context, ref, _) {
        final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
        final shot = ref.watch(shotProvider(ShotParameter(gameId: gameId, playerId: player.id)).notifier);

        return Column(
            children: [
              PopupMenuButton(
                onSelected: (PlayerAction value) {
                  if (!validateTime(gameRecordInfo.currentQuarter, gameRecordInfo.game.quarterMin, gameRecordInfo.game.overtimeQuarterMin, gameRecordInfo.time)) {
                    timeAlertSnackBar(context);
                    return;
                  }
                  switch(value) {
                    case PlayerAction.SHOT:
                      shot.resetState();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Shot(gameId, player.id),
                          fullscreenDialog: true, // true だとモーダル遷移になる
                        ),
                      );
                      break;
                    case PlayerAction.FT:
                      ftDialog(context, gameId, player, normalFontSize, smallFontSize);
                      break;
                    case PlayerAction.REBOUND:
                      reboundDialog(context, gameId, player, normalFontSize, smallFontSize);
                      break;
                    case PlayerAction.BLOCK:
                      confirmDialog(context, 'Add Block', gameId, player, RecordType.BLOCK, normalFontSize, smallFontSize);
                      break;
                    case PlayerAction.STEAL:
                      confirmDialog(context, 'Add Steal',gameId, player, RecordType.STEAL, normalFontSize, smallFontSize);
                      break;
                    case PlayerAction.TURNOVER:
                      confirmDialog(context, 'Add Turnover',gameId, player, RecordType.TURNOVER, normalFontSize, smallFontSize);
                      break;
                    case PlayerAction.FOUL:
                      confirmDialog(context, 'Add Foul',gameId, player, RecordType.FOUL, normalFontSize, smallFontSize);
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
                  PopupMenuItem(
                      padding: const EdgeInsets.all(16),
                      value: PlayerAction.SHOT,
                      child: Text('Shot', style: TextStyle(fontSize: smallFontSize,))
                  ),
                  PopupMenuItem(
                      padding: const EdgeInsets.all(16),
                      value: PlayerAction.FT,
                      child: Text('FT', style: TextStyle(fontSize: smallFontSize,))
                  ),
                  PopupMenuItem(
                      padding: const EdgeInsets.all(16),
                      value: PlayerAction.REBOUND,
                      child: Text('Rebound', style: TextStyle(fontSize: smallFontSize,))
                  ),
                  PopupMenuItem(
                      padding: const EdgeInsets.all(16),
                      value: PlayerAction.BLOCK,
                      child: Text('Block', style: TextStyle(fontSize: smallFontSize,))
                  ),
                  PopupMenuItem(
                      padding: const EdgeInsets.all(16),
                      value: PlayerAction.STEAL,
                      child: Text('Steal', style: TextStyle(fontSize: smallFontSize,))
                  ),
                  PopupMenuItem(
                      padding: const EdgeInsets.all(16),
                      value: PlayerAction.TURNOVER,
                      child: Text('Turnover', style: TextStyle(fontSize: smallFontSize,))
                  ),
                  PopupMenuItem(
                      padding: const EdgeInsets.all(16),
                      value: PlayerAction.FOUL,
                      child: Text('Foul', style: TextStyle(fontSize: smallFontSize,))
                  ),
                  PopupMenuItem(
                      padding: const EdgeInsets.all(16),
                      value: PlayerAction.SUBSTITUTE,
                      child: Text('Substitute', style: TextStyle(fontSize: smallFontSize,))
                  ),
                ],
                icon: CircleAvatar(
                  radius: radius,
                  backgroundImage: MemoryImage(a.readAsBytesSync()),
                ),
                iconSize: radius*2,
              ),
              Text(player.name, maxLines: 1, style: TextStyle(fontSize: smallFontSize),)
            ]
        );
      });
    },
  );
}

Future<dynamic> confirmDialog(BuildContext context, String title, int gameId, Player? player, RecordType recordType, double normalFontSize, double smallFontSize) {
  bool myTeamPlay = player == null ? false : true;
  return showDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
          final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
          final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);

          return AlertDialog(
            title: Text('Confirm', style: TextStyle(fontSize: normalFontSize),),
            content: Text(title, style: TextStyle(fontSize: smallFontSize),),
            actions: [
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.updateBoxScore(player, recordType),
                  gameRecord.addPlayAction(
                      player != null ? player.id : 0,
                      recordType,
                      gameRecordInfo.currentQuarter,
                      null,
                      null,
                      myTeamPlay
                  ),
                  gameSummary.update(),
                  Navigator.of(context).pop(true),
                  gameRecord.scrollDown()
                },
                child: Text('Add', style: TextStyle(fontSize: smallFontSize),),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel', style: TextStyle(fontSize: smallFontSize),),
              ),
            ],
          );
        });
      }
  );
}

Future<dynamic> ftDialog(BuildContext context, int gameId, Player? player, double normalFontSize, double smallFontSize) {
  bool myTeamPlay = player == null ? false : true;
  return showDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
          final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
          final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);
          return AlertDialog(
            title: Text('Confirm', style: TextStyle(fontSize: normalFontSize),),
            content: Text('FreeThrow', style: TextStyle(fontSize: smallFontSize),),
            actions: [
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.updateBoxScore(player, RecordType.FT_MADE),
                  gameRecord.addPlayAction(player != null ? player.id : 0, RecordType.FT_MADE, gameRecordInfo.currentQuarter, null, null, myTeamPlay),
                  gameSummary.update(),
                  Navigator.of(context).pop(true),
                  gameRecord.scrollDown()
                },
                child: Text('Make', style: TextStyle(fontSize: smallFontSize),),
              ),
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.updateBoxScore(player, RecordType.FT_MISS),
                  gameRecord.addPlayAction(player != null ? player.id : 0, RecordType.FT_MISS, gameRecordInfo.currentQuarter, null, null, myTeamPlay),
                  Navigator.of(context).pop(true),
                  gameRecord.scrollDown()
                },
                child: Text('Miss', style: TextStyle(fontSize: smallFontSize),),
              ),
              SimpleDialogOption(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel', style: TextStyle(fontSize: smallFontSize),),
              ),
            ],
          );
        });
      }
  );
}

Future<dynamic> reboundDialog(BuildContext context, int gameId, Player? player, double normalFontSize, double smallFontSize) {
  bool myTeamPlay = player == null ? false : true;
  return showDialog(
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
          final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
          final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);
          return AlertDialog(
            title: Text('Confirm', style: TextStyle(fontSize: normalFontSize),),
            content: Text('Rebound', style: TextStyle(fontSize: smallFontSize),),
            actions: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SimpleDialogOption(
                    onPressed: () => {
                      gameRecord.updateBoxScore(player, RecordType.OFFENCE_REBOUND),
                      gameRecord.addPlayAction(player != null ? player.id : 0, RecordType.OFFENCE_REBOUND, gameRecordInfo.currentQuarter, null, null, myTeamPlay),
                      gameSummary.update(),
                      Navigator.of(context).pop(true),
                      gameRecord.scrollDown()
                    },
                    child: Text('OFF', style: TextStyle(fontSize: smallFontSize),),
                  ),
                  SimpleDialogOption(
                    onPressed: () => {
                      gameRecord.updateBoxScore(player, RecordType.DEFENCE_REBOUND),
                      gameRecord.addPlayAction(player != null ? player.id : 0, RecordType.DEFENCE_REBOUND, gameRecordInfo.currentQuarter, null, null, myTeamPlay),
                      gameSummary.update(),
                      Navigator.of(context).pop(true),
                      gameRecord.scrollDown()
                    },
                    child: Text('DEF', style: TextStyle(fontSize: smallFontSize),),
                  ),
                  SimpleDialogOption(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: Text('Cancel', style: TextStyle(fontSize: smallFontSize),),
                  ),
                ],
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
          final gameRecordInfo = ref.watch(gameRecordProvider(gameId));
          final gameSummary = ref.watch(gameSummaryProvider(gameId).notifier);
          return AlertDialog(
            title: const Text('Confirm'),
            content: Text(title),
            actions: [
              SimpleDialogOption(
                onPressed: () => {
                  if (!validateTime(gameRecordInfo.currentQuarter, gameRecordInfo.game.quarterMin, gameRecordInfo.game.overtimeQuarterMin, gameRecordInfo.time)) {
                    timeAlertSnackBar(context)
                  } else {
                    gameRecord.addGameAction(gameAction, true),
                    gameSummary.update(),
                    gameRecord.scrollDown()
                  },
                  Navigator.of(context).pop(true),
                },
                child: const Text('US'),
              ),
              SimpleDialogOption(
                onPressed: () => {
                  if (!validateTime(gameRecordInfo.currentQuarter, gameRecordInfo.game.quarterMin, gameRecordInfo.game.overtimeQuarterMin, gameRecordInfo.time)) {
                    timeAlertSnackBar(context)
                  } else {
                    gameRecord.addGameAction(gameAction, false),
                    gameSummary.update(),
                    gameRecord.scrollDown()
                  },
                  Navigator.of(context).pop(true),
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
                child: SizedBox(
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
                              final a = File("${documentPath.value}/players/${gameRecordInfo.substitutes[i].player.value!.id}.jpg");
                              return CircleAvatar(
                                radius: radius,
                                backgroundImage: MemoryImage(a.readAsBytesSync()),
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

Future<dynamic> quarterChangeDialog(BuildContext context, int gameId, double normalFontSize, double smallFontSize) {
  return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return Consumer(builder: (context, ref, _) {
          final gameRecord = ref.watch(gameRecordProvider(gameId).notifier);
          final gameRecordInfo = ref.watch(gameRecordProvider(gameId));

          return AlertDialog(
            title: Text('Settings', style: TextStyle(fontSize: normalFontSize),),
            content: SizedBox(
              width: MediaQuery.of(context).size.width*0.7,
              height: MediaQuery.of(context).size.height*0.3,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Quarter Min', style: TextStyle(fontSize: smallFontSize),),
                      DropdownButton(
                        items: [
                          for(int i = 24; i > 0; i--) ... {
                            DropdownMenuItem(
                              value:  i,
                              child: Text(i.toString(), style: TextStyle(fontSize: smallFontSize),),
                            )
                          }
                        ],
                        onChanged: (int? value) {
                          gameRecord.updateQuarterMinState(value!);
                        },
                        value: gameRecordInfo.quarterMin,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('OT Quarter Min', style: TextStyle(fontSize: smallFontSize),),
                      DropdownButton(
                        items: [
                          for(int i = 24; i > 0; i--) ... {
                            DropdownMenuItem(
                              value:  i,
                              child: Text(i.toString(), style: TextStyle(fontSize: smallFontSize),),
                            )
                          }
                        ],
                        onChanged: (int? value) {
                          gameRecord.updateOvertimeQuarterMinState(value!);
                        },
                        value: gameRecordInfo.overtimeQuarterMin,
                      ),
                    ],
                  )
                ],
              ),
            ),
            actions: [
              SimpleDialogOption(
                onPressed: () => {
                  if (gameRecord.beDeletedPbpExists()) {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                              title: Text('Warning', style: TextStyle(fontSize: normalFontSize),),
                              content: Text('There are some pbps to be deleted.', style: TextStyle(fontSize: smallFontSize),),
                              actions : [
                                SimpleDialogOption(
                                  onPressed: () => {
                                    gameRecord.deleteOutOfQuarterPbps(),
                                    gameRecord.deleteOutOfOtQuarterPbps(),
                                    gameRecord.updateQuarterMin(),
                                    Navigator.of(context).pop(false),
                                    Navigator.of(context).pop(false)
                                  },
                                  child: Text('Delete?', style: TextStyle(fontSize: smallFontSize),),
                                ),
                                SimpleDialogOption(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: Text('Cancel', style: TextStyle(fontSize: smallFontSize),),
                                ),
                              ]
                          );
                        }
                    ),
                  } else {
                    gameRecord.updateQuarterMin(),
                    Navigator.of(context).pop(false),
                  },
                },
                child: const Text('Update'),
              ),
              SimpleDialogOption(
                onPressed: () => {
                  gameRecord.resetQuarterMinState(),
                  Navigator.of(context).pop(false),
                },
                child: const Text('Cancel'),
              ),
            ],
          );
        });
      }
  );
}

void timeAlertSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('クォーターの時間を超えています。'))
  );
}

bool validateTime(int currentQuarter, int quarterMin, int overtimeQuarterMin, DateTime now) {
  DateTime quarterMinDateTime = DateTime(2000,1,1,quarterMin,0,0);
  DateTime overtimeQuarterMinDateTime = DateTime(2000,1,1,overtimeQuarterMin,0,0);

  if (currentQuarter <= 4) {
    if (quarterMinDateTime.compareTo(now) == -1) {
      return false;
    }
  } else {
    if (overtimeQuarterMinDateTime.compareTo(now) == -1) {
      return false;
    }
  }

  return true;
}

Widget showGameOperation(BuildContext context, int id, double normalFontSize, double smallFontSize) {
  return PopupMenuButton(
      onSelected: (GameAction value) {
        if (value == GameAction.GAMESET) {
          showDialog(
              context: context,
              builder: (context) {
                return Consumer(builder: (context, ref, _) {
                  final onGame = ref.watch(onGameProvider.notifier);
                  final gamePreparation = ref.watch(gamePreparationProvider.notifier);
                  final gameRecord = ref.watch(gameRecordProvider(id).notifier);
                  final gameRecordInfo = ref.watch(gameRecordProvider(id));

                  return AlertDialog(
                    title: Text('GameSet', style: TextStyle(fontSize: normalFontSize),),
                    content: gameRecordInfo.game.myPts == gameRecordInfo.game.opponentPts ? Text('Will the match enter into overtime?', style: TextStyle(fontSize: smallFontSize),) : Text('GameSet?', style: TextStyle(fontSize: smallFontSize),),
                    actions: [
                      gameRecordInfo.game.myPts == gameRecordInfo.game.opponentPts ?
                      SimpleDialogOption(
                        onPressed: () {
                          gameRecord.createOvertime();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameRecordScreen(id)
                              ),
                          );
                        },
                        child: Text('Yes', style: TextStyle(fontSize: smallFontSize),),
                      )
                      :
                      SimpleDialogOption(
                        onPressed: () {
                          gameRecord.gameSet();
                          onGame.change(false);
                          gamePreparation.initState();
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                        },
                        child: Text('Yes', style: TextStyle(fontSize: smallFontSize),),
                      ),
                      SimpleDialogOption(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: Text('No', style: TextStyle(fontSize: smallFontSize),),
                      ),
                    ],
                  );
                });
              }
          );
        } else {
          gameActionDialog(context, id, value);
        }
      },
      itemBuilder: (context) => [
        PopupMenuItem(
            value: GameAction.SHOT_CLOCK_TURNOVER,
            child: Text('Shot Clock TurnOver', style: TextStyle(fontSize: smallFontSize),)
        ),
        PopupMenuItem(
            value: GameAction.TIMEOUT,
            child: Text('Timeout', style: TextStyle(fontSize: smallFontSize),)
        ),
        PopupMenuItem(
            value: GameAction.GAMESET,
            child: Text('GameSet', style: TextStyle(color: Colors.red, fontSize: smallFontSize),)
        ),
      ]
  );
}