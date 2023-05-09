import 'package:bb_stats/src/consts/CsvColumns.dart';
import 'package:bb_stats/src/consts/TeamStatColumns.dart';
import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'dart:io';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider.notifier);
    final homeInfo = ref.watch(homeProvider);
    final documentPath = ref.watch(documentPathProvider);
    final bool purchase = ref.watch(purchaseProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        actions: [
          IconButton(
            icon: Icon(Icons.download, color: purchase ? Colors.white : Colors.black12,),
            onPressed: () async {
              if (!purchase) {
                return;
              }
              final csvFile = File('${(await getApplicationDocumentsDirectory()).path}/csvs/home.csv');
              String csvString = home.getBoxScoresString();
              await csvFile.writeAsString(csvString);
              Share.shareXFiles([XFile('${documentPath.value}/csvs/home.csv', name: 'boxScores.csv')], subject: 'Export', text: 'Output Overall BoxScores');
            },
          )
        ],
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
                                        Text("${home.countWinGame().toString()}-${home.countLostGame().toString()}"),
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
                                      children: home.getTeamStat().asMap().entries.map((e) {
                                          final index = e.key;
                                          return Column(
                                            children: [
                                              Text(TeamStatColumns.teamStatColumnList[index]),
                                              Text(e.value.toString()),
                                            ],
                                          );
                                      }).toList(),
                                    ),
                                  )
                                ]
                            ),
                          ),
                        ],
                      ),
                    ),

                    Row(
                      children: [
                        TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1950, 1, 1),
                                maxTime: DateTime.now(),
                                onConfirm: (date) {
                                  home.updateStartDate(date);
                                },
                                currentTime: homeInfo.start,
                                locale: LocaleType.jp
                            );
                          },
                          child: Text(homeInfo.start == null ? '-/-/-/' : DateFormat('yyyy-MM-dd').format(homeInfo.start!), style: const TextStyle(color: Colors.black)),
                        ),
                        const Text('-'),
                        TextButton(
                          onPressed: () {
                            DatePicker.showDatePicker(context,
                                showTitleActions: true,
                                minTime: DateTime(1950, 1, 1),
                                maxTime: DateTime.now(),
                                onConfirm: (date) {
                                  DateTime modifiedDateTime = DateTime(date.year, date.month, date.day, 23, 59, 59);
                                  home.updateEndDate(modifiedDateTime);
                                },
                                currentTime: homeInfo.end,
                                locale: LocaleType.jp
                            );
                          },
                          child: Text(homeInfo.end == null ? '-/-/-/' : DateFormat('yyyy-MM-dd').format(homeInfo.end!), style: const TextStyle(color: Colors.black)),
                        ),
                      ],
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
                                sortColumnIndex: homeInfo.sortTargetIndex,
                                sortAscending: homeInfo.ascending,
                                columnSpacing: 12,
                                horizontalMargin: 12,
                                minWidth: 2000,
                                columns: [
                                  for(int i = 0; i < CsvColumns.boxScoreColumnList.length; i++) ... {
                                    DataColumn(
                                      label: Text(CsvColumns.boxScoreColumnList[i]),
                                      onSort: (columnIndex, isAscending) {
                                        home.updateSortTargetIndex(i, homeInfo.ascending);
                                      },
                                    )
                                  }
                                ],
                                rows: home.getPlayerStats(
                                  homeInfo.start,
                                  homeInfo.end,
                                  homeInfo.sortTargetIndex,
                                  homeInfo.ascending,
                                )
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