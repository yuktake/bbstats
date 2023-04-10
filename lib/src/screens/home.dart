import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:bb_stats/src/screens/tutorial.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends ConsumerWidget {
  HomeScreen({Key? key}) : super(key: key){

  }

  void _showTutorial(BuildContext context) async {
    final preference = await SharedPreferences.getInstance();
    // 最初の起動ならチュートリアル表示
    bool tutorialDone = preference.getBool("tutorial") ?? false;
    if (!tutorialDone) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TutorialPage(),
        ),
      );
      preference.setBool('tutorial', true);
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeInfo = ref.watch(homeProvider);
    final documentPath = ref.watch(documentPathProvider);
    _showTutorial(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                        color:Colors.blue,
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                CircleAvatar(
                                  backgroundImage: AssetImage('${documentPath.value}/teams/1.jpg'),
                                  radius: 50.0,
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 16),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(homeInfo.team.name),
                                        Text("${homeInfo.win.toString()}-${homeInfo.lost.toString()}"),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blueGrey.withOpacity(0.3)
                            ),
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right:10),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Column(
                                          children: [
                                            const Text('PPG'),
                                            Text(homeInfo.teamStat[0].toString()),
                                          ],
                                        ),
                                        const VerticalDivider(
                                          color: Colors.red,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            const Text('RPG'),
                                            Text(homeInfo.teamStat[1].toString()),
                                          ],
                                        ),
                                        const VerticalDivider(
                                          color: Colors.red,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            const Text('APG'),
                                            Text(homeInfo.teamStat[2].toString()),
                                          ],
                                        ),
                                        const VerticalDivider(
                                          color: Colors.red,
                                          thickness: 1,
                                          indent: 0,
                                          endIndent: 0,
                                          width: 10,
                                        ),
                                        Column(
                                          children: [
                                            const Text('OPPG'),
                                            Text(homeInfo.teamStat[3].toString()),
                                          ],
                                        ),
                                      ],
                                    ),
                                  )
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height*0.6,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 0),
                                blurRadius: 5.0
                            ),
                            BoxShadow(
                                color: Colors.black.withOpacity(0.3),
                                offset: const Offset(0, 10),
                                blurRadius: 10.0
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              // ソートしないならbottomMarginのために普通のdatatableか他のものでいいかも
                              child: DataTable2(
                                fixedLeftColumns: 1,
                                // sortColumnIndex: _currentSortColumn,
                                // sortAscending: _isAscending,
                                columnSpacing: 12,
                                horizontalMargin: 12,
                                minWidth: 2000,
                                columns: const [
                                  DataColumn(
                                    label: Text('PLAYER'),
                                  ),
                                  DataColumn(
                                    label: Text('PTS'),
                                  ),
                                  DataColumn(
                                    label: Text('FGM'),
                                  ),
                                  DataColumn(
                                    label: Text('FGA'),
                                  ),
                                  DataColumn(
                                    label: Text('FG%'),
                                  ),
                                  DataColumn(
                                    label: Text('3PM'),
                                  ),
                                  DataColumn(
                                    label: Text('3PA'),
                                  ),
                                  DataColumn(
                                    label: Text('3P%'),
                                  ),
                                  DataColumn(
                                    label: Text('FTM'),
                                  ),
                                  DataColumn(
                                    label: Text('FTA'),
                                  ),
                                  DataColumn(
                                    label: Text('FT%'),
                                  ),
                                  DataColumn(
                                    label: Text('OREB'),
                                  ),
                                  DataColumn(
                                    label: Text('DREB'),
                                  ),
                                  DataColumn(
                                    label: Text('REB'),
                                  ),
                                  DataColumn(
                                    label: Text('AST'),
                                  ),
                                  DataColumn(
                                    label: Text('STL'),
                                  ),
                                  DataColumn(
                                    label: Text('BLK'),
                                  ),
                                  DataColumn(
                                    label: Text('TO'),
                                  ),
                                  DataColumn(
                                    label: Text('PF'),
                                  ),
                                ],
                                rows: homeInfo.playerStats
                                    .map(
                                      (e) => DataRow(
                                    cells: [
                                      DataCell(
                                        // Text('${e.playerHistory.value!.player.value?.name}'),
                                          playerColumn('${e[1]}', '${documentPath.value}/players/${e[0]}.jpg')
                                      ),
                                      DataCell(
                                        Text('${e[2]}'),
                                      ),
                                      DataCell(
                                        Text('${e[3]}'),
                                      ),
                                      DataCell(
                                        Text('${e[4]}'),
                                      ),
                                      DataCell(
                                        Text('${e[5]}'),
                                      ),
                                      DataCell(
                                        Text('${e[6]}'),
                                      ),
                                      DataCell(
                                        Text('${e[7]}'),
                                      ),
                                      DataCell(
                                        Text('${e[8]}'),
                                      ),
                                      DataCell(
                                        Text('${e[9]}'),
                                      ),
                                      DataCell(
                                        Text('${e[10]}'),
                                      ),
                                      DataCell(
                                        Text('${e[11]}'),
                                      ),
                                      DataCell(
                                        Text('${e[12]}'),
                                      ),
                                      DataCell(
                                        Text('${e[13]}'),
                                      ),
                                      DataCell(
                                        Text('${e[14]}'),
                                      ),
                                      DataCell(
                                        Text('${e[15]}'),
                                      ),
                                      DataCell(
                                        Text('${e[16]}'),
                                      ),
                                      DataCell(
                                        Text('${e[17]}'),
                                      ),
                                      DataCell(
                                        Text('${e[18]}'),
                                      ),
                                      DataCell(
                                        Text('${e[19]}'),
                                      ),
                                    ],
                                  ),
                                ).toList(),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),

    );
  }

  Widget playerColumn(String name, String path) {
    return (
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(path),
              ),
            ),
            // Text(name),
          ],
        )
    );
  }
}