import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:bb_stats/src/screens/game_detail.dart';
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
    var formatter = DateFormat('yyyy/MM/dd(E)', "ja_JP");

    var width = MediaQuery.of(context).size.width / 10;
    print(width);

    return Scaffold(
      appBar: AppBar(
        title: const Text('GAME'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0,),
        child: Column(
          children: [
            Text(DateFormat('MMMM yyyy').format(gameListInfo.dateTime)),
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
                        height: 200,
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
                                  Column(
                                    children: [
                                      CircleAvatar(
                                        backgroundImage: AssetImage('${documentPath.value}/teams/1.jpg'),
                                        radius: width,
                                      ),
                                      Text(teamInfo.name),
                                    ],
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Text('${gameListInfo.games[index].myPts}-${gameListInfo.games[index].opponentPts}', style: const TextStyle(fontSize: 20)),
                                        Text(formatter.format(gameListInfo.games[index].gameDate)),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      showOpponentImage("${documentPath.value}/teams/${gameListInfo.games[index].opponent.value?.id}.jpg", width),
                                      Text(gameListInfo.games[index].opponent.value!.name),
                                    ],
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
    return CircleAvatar(
      backgroundImage: AssetImage(imagePath),
      radius: radius,
    );
  } else {
    return CircleAvatar(
      backgroundImage: const AssetImage('assets/logos/default.png'),
      radius: radius,
    );
  }
}