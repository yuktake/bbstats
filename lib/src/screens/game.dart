import 'dart:math';
import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:bb_stats/src/screens/player_select.dart';
import 'package:bb_stats/src/screens/team_edit.dart';
import 'package:bb_stats/src/screens/team_select.dart';

import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../collections/player/player.dart';
import '../collections/team/team.dart';
import 'game_detail.dart';
import 'game_record.dart';
import 'history.dart';
import 'dart:io';

class GameScreen extends ConsumerWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamePreparation = ref.watch(gamePreparationProvider.notifier);
    final gamePreparationInfo = ref.watch(gamePreparationProvider);
    final documentPath = ref.watch(documentPathProvider);

    final bool onGame = ref.watch(onGameProvider);
    final onGameNotifier = ref.watch(onGameProvider.notifier);
    var formatter = DateFormat('yyyy/MM/dd(E)', "ja_JP");

    double iconRadius = MediaQuery.of(context).size.height * 0.07;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Game'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            height: MediaQuery.of(context).size.height*0.25,
            decoration: const BoxDecoration(
              color: Colors.blueGrey,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      showCircleImage('${documentPath.value}/teams/1.jpg', iconRadius),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            onGame ? Text(
                                DateFormat('yyyy-MM-dd').format(gamePreparationInfo.gameDate),
                                style: const TextStyle(color: Colors.black)
                            ) :
                            TextButton(
                              onPressed: () {
                                DatePicker.showDatePicker(context,
                                    showTitleActions: true,
                                    minTime: DateTime(1950, 1, 1),
                                    maxTime: DateTime.now(),
                                    onConfirm: (date) {
                                      gamePreparation.updateGameDate(date);
                                    },
                                    currentTime: gamePreparationInfo.gameDate,
                                    locale: LocaleType.jp
                                );
                              },
                              child: Text(
                                  DateFormat('yyyy-MM-dd').format(gamePreparationInfo.gameDate),
                                  style: const TextStyle(color: Colors.black)
                              ),
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("${gamePreparationInfo.quarterMin} Min Per Quarter", style: const TextStyle(color: Colors.black))
                            ),
                            Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Text("OT ${gamePreparationInfo.overtimeQuarterMin} Minutes", style: const TextStyle(color: Colors.black))
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (!onGame) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const TeamsSelectScreen(),
                              ),
                            );
                          }
                        },
                        child: teamImage(
                          iconRadius,
                          gamePreparationInfo.opponentTeam,
                          documentPath.value,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),

          const SizedBox(height: 28),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        if (!onGame) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const PlayersSelectScreen("pg"),
                            ),
                          );
                        }
                      },
                      child: _buildCircleAvatar(gamePreparationInfo.pg, documentPath.value)
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        if (!onGame) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const PlayersSelectScreen("sg"),
                            ),
                          );
                        }
                      },
                      child: _buildCircleAvatar(gamePreparationInfo.sg, documentPath.value)
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        if (!onGame) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const PlayersSelectScreen("sf"),
                            ),
                          );
                        }
                      },
                      child: _buildCircleAvatar(gamePreparationInfo.sf, documentPath.value)
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        if (!onGame) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const PlayersSelectScreen("pf"),
                            ),
                          );
                        }
                      },
                      child: _buildCircleAvatar(gamePreparationInfo.pf, documentPath.value)
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                      onTap: () {
                        if (!onGame) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                              const PlayersSelectScreen("c"),
                            ),
                          );
                        }
                      },
                      child: _buildCircleAvatar(gamePreparationInfo.c, documentPath.value)
                  ),
                ),
              ],
            ),
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text('Past 3 games')
          ),

          gamePreparationInfo.opponentTeam != null ?
              
            gamePreparationInfo.histories.isEmpty ?
                const Expanded(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 32.0),
                      child: Text('No History Data')
                    )
                )
            :
                Expanded(
                  child: ListView.builder(
                      itemCount: gamePreparationInfo.histories.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GameDetailScreen(gamePreparationInfo.histories[index].id),
                              ),
                            );
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(20.0),
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(0, 0),
                                      blurRadius: 5.0),
                                  BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      offset: const Offset(0, 10),
                                      blurRadius: 10.0)
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        SizedBox(
                                          width: 100,
                                          child: Column(
                                            children: [
                                              showCircleImage('${documentPath.value}/teams/1.jpg', 25.0),
                                              Text(gamePreparationInfo.myTeam.name),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.center,
                                            children: [
                                              Text('${gamePreparationInfo.histories[index].myPts}-${gamePreparationInfo.histories[index].opponentPts}', style: const TextStyle(fontSize: 20)),
                                              Text(formatter.format(gamePreparationInfo.histories[index].gameDate)),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          width: 100,
                                          child: Column(
                                            children: [
                                              showOpponentImage("${documentPath.value}/teams/${gamePreparationInfo.histories[index].opponent.value?.id}.jpg", 25),
                                              Text(gamePreparationInfo.histories[index].opponent.value!.name),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                )
          :
              const Spacer(),

           Padding(
             padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton.extended(
                  icon: const Icon(Icons.sports_basketball),
                  label: Text(onGame ? "Continue Game" : "Start Game"),
                  backgroundColor: gamePreparationInfo.startable
                      ? Colors.blue
                      : Colors.black12,
                  onPressed: !gamePreparationInfo.startable ? null : () async {
                    int? gameId;
                    if (onGame) {
                      gameId = gamePreparation.getOnGame()?.id;
                    } else {
                      gameId = await gamePreparation.startGame();
                      onGameNotifier.change(true);
                    }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => GameRecordScreen(gameId!),
                      ),
                    );
                  },
                )
              ],
            ),
          )
        ],
      ),
      // )
    );
  }
}

Widget _buildCircleAvatar(Player? player, String? documentPath) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final radius = min(constraints.maxHeight / 2, constraints.maxWidth / 2);
      return Column(
          children: [
            avatarImage(radius, player, documentPath)
          ]
      );
    },
  );
}

CircleAvatar avatarImage(double radius, Player? player, String? documentPath) {
  if (player == null) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blue,
      child: const Text('?'),
    );
  } else {
    var a = File("$documentPath/players/${player.id}.jpg");
    return CircleAvatar(
      radius: radius,
      backgroundImage: MemoryImage(a.readAsBytesSync()),
    );
  }
}

CircleAvatar teamImage(double radius, Team? team, String? documentPath) {
  if (team == null) {
    return CircleAvatar(
      radius: radius,
      backgroundColor: Colors.blue,
      child: const Text('?'),
    );
  } else {
    var a = File("$documentPath/teams/${team.id}.jpg");
    return CircleAvatar(
      radius: radius,
      backgroundImage: MemoryImage(a.readAsBytesSync()),
    );
  }
}