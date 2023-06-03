import 'dart:io';

import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:bb_stats/src/screens/game_detail.dart';
import 'package:bb_stats/src/screens/team_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:weekly_date_picker/weekly_date_picker.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final teamInfo = ref.watch(teamProvider(1));
    final gameList = ref.watch(gameListProvider.notifier);
    final gameListInfo = ref.watch(gameListProvider);
    final documentPath = ref.watch(documentPathProvider);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    var formatter = DateFormat('yyyy/MM/dd(E)', "ja_JP");
    double cardComponentWidth = (screenWidth - 42) / 3;
    double cardComponentHeight = screenHeight / 5;
    double iconRadius = screenHeight * 0.05;
    double normalFontSize = screenWidth / 27;
    double smallFontSize = MediaQuery.of(context).size.width / 40;

    return Scaffold(
      appBar: AppBar(
        title: const Text('GAME'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(DateFormat('MMMM yyyy').format(gameListInfo.dateTime), style: TextStyle(fontSize: normalFontSize)),
            WeeklyDatePicker(
              selectedDay: gameListInfo.dateTime,
              changeDay: (DateTime value) => gameList.updateGameListModel(value),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: gameListInfo.games.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => GameDetailScreen(gameListInfo.games[index].id),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top:20,left: 5,right: 5),
                      child: Container(
                        height: cardComponentHeight,
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
                              padding: const EdgeInsets.symmetric(horizontal: 8),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    width: cardComponentWidth,
                                    child: Column(
                                      children: [
                                        showCircleImage('${documentPath.value}/teams/1.jpg', iconRadius),
                                        Text(teamInfo.name, style: TextStyle(fontSize: normalFontSize),),
                                      ],
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text(
                                            '${gameListInfo.games[index].myPts}-${gameListInfo.games[index].opponentPts}',
                                            style: TextStyle(fontSize: normalFontSize))
                                        ,
                                        Text(
                                            formatter.format(gameListInfo.games[index].gameDate),
                                            style: TextStyle(fontSize: smallFontSize),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: cardComponentWidth,
                                    child: Column(
                                      children: [
                                        showOpponentImage("${documentPath.value}/teams/${gameListInfo.games[index].opponent.value?.id}.jpg", iconRadius),
                                        Text(gameListInfo.games[index].opponent.value!.name, style: TextStyle(fontSize: normalFontSize),),
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
          ],
        ),
      ),
    );
  }
}

Widget showOpponentImage(String? imagePath, double radius) {
  if(imagePath != null) {
    final a = File(imagePath);
    return CircleAvatar(
      backgroundImage: MemoryImage(a.readAsBytesSync()),
      radius: radius,
    );
  } else {
    return CircleAvatar(
      backgroundImage: const AssetImage('assets/logos/default.png'),
      radius: radius,
    );
  }
}