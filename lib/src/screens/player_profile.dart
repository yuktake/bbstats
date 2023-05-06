import 'dart:io';

import 'package:bb_stats/src/screens/player_edit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../consts/CsvColumns.dart';
import '../providers/isar_provider.dart';

class PlayerProfile extends ConsumerWidget {
  const PlayerProfile(
      this.id,
      {Key? key}
  ) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final player = ref.watch(playerProvider(id).notifier);
    final playerInfo = ref.watch(playerProvider(id));
    final playerDetail = ref.watch(playerDetailProvider(id).notifier);
    final playerDetailInfo = ref.watch(playerDetailProvider(id));
    final players = ref.watch(playerListProvider.notifier);
    final documentPath = ref.watch(documentPathProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Profile'),
        actions: [
          playerInfo.visible ?
            IconButton(
              icon: const Icon(Icons.visibility_off),
              color: Colors.redAccent,
              onPressed: () => {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: const Text('Confirm'),
                      content: const Text('Be Invisible?'),
                      actions: [
                        SimpleDialogOption(
                          onPressed: () => {
                            player.updateVisible(false),
                            players.resetPlayerListState(),
                            Navigator.of(context).pop(true),
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
                )
              },
            )
          :
            IconButton(
              icon: const Icon(Icons.visibility),
              onPressed: () => {
                showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: const Text('Confirm'),
                        content: const Text('Be Visible?'),
                        actions: [
                          SimpleDialogOption(
                            onPressed: () => {
                              player.updateVisible(true),
                              players.resetPlayerListState(),
                              Navigator.of(context).pop(true),
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
                )
              },
            ),
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () async {
              final csvFile = File('${(await getApplicationDocumentsDirectory()).path}/csvs/player.csv');
              String csvString = playerDetail.getStatsString(id);
              await csvFile.writeAsString(csvString);
              Share.shareXFiles([XFile('${documentPath.value}/csvs/player.csv', name: 'player.csv')], subject: 'Export', text: 'Output Player Stats');
            },
          ),
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () => {
              player.setEditState('${documentPath.value}/players/$id.jpg'),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerEditScreen(id),
                ),
              )
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              decoration: const BoxDecoration(
                color:Colors.blue,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8),
                        child: showProfileImage('${documentPath.value}/players/$id.jpg')
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("Golden State Warriors | #11 | Guard"),
                            Text(
                              playerInfo.name,
                              style: const TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF242629),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                            padding:const EdgeInsets.only(right:10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: const [
                                    Text('PPG'),
                                    Text('-'),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('RPG'),
                                    Text('-'),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('APG'),
                                    Text('-'),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('PIE'),
                                    Text('-'),
                                  ],
                                ),

                                Column(
                                  children: [
                                    Column(
                                      children: const [
                                        Text('HEIGHT'),
                                        Text('1.98m')
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text('AGE'),
                                        Text('32')
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Column(
                                      children: const [
                                        Text('WEIGHT'),
                                        Text('100kg')
                                      ],
                                    ),
                                    Column(
                                      children: const [
                                        Text('BIRTHDAY'),
                                        Text('February 8, 1990')
                                      ],
                                    ),
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

            Row(
              children: [
                TextButton(
                  onPressed: () {
                    DatePicker.showDatePicker(context,
                        showTitleActions: true,
                        minTime: DateTime(1950, 1, 1),
                        maxTime: DateTime.now(),
                        onConfirm: (date) {
                          DateTime dateTime = DateTime(date.year,date.month,date.day,0,0,0);
                          playerDetail.updateStartDate(dateTime);
                        },
                        currentTime: playerDetailInfo.start,
                        locale: LocaleType.jp
                    );
                  },
                  child: Text(playerDetailInfo.start == null ? '-/-/-/' : DateFormat('yyyy-MM-dd').format(playerDetailInfo.start!), style: const TextStyle(color: Colors.black)),
                ),
                const Text('-'),
                TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1950, 1, 1),
                          maxTime: DateTime.now(),
                          onConfirm: (date) {
                            DateTime dateTime = DateTime(date.year,date.month,date.day,23,59,59);
                            playerDetail.updateEndDate(dateTime);
                          },
                          currentTime: playerDetailInfo.end,
                          locale: LocaleType.jp
                      );
                    },
                    child: Text(playerDetailInfo.end == null ? '-/-/-/' : DateFormat('yyyy-MM-dd').format(playerDetailInfo.end!), style: const TextStyle(color: Colors.black)),
                ),
              ],
            ),
            SizedBox(
              height: 100,
              child: DataTable2(
                columnSpacing: 16,
                minWidth: 1000,
                columns: [
                  for(int i = 0; i < CsvColumns.playerStatColumnList.length; i++) ... {
                    DataColumn(
                      label: Text(CsvColumns.playerStatColumnList[i]),
                    )
                  }
                ],
                rows: [
                  DataRow(
                    cells: playerDetail.getSeasonStats().map((e) =>
                      DataCell(
                        Text('$e'),
                      ),
                    ).toList(),
                  ),
                ],
              ),
            ),

            SizedBox(
              height: 500,
              child: DataTable2(
                fixedLeftColumns: 1,
                sortColumnIndex: playerDetailInfo.shotTypeSortTargetIndex,
                sortAscending: playerDetailInfo.shotTypeAscending,
                minWidth: 1000,
                columns: [
                  for(int i = 0; i < CsvColumns.shotTypeColumnList.length; i++) ... {
                    DataColumn(
                      label: Text(CsvColumns.shotTypeColumnList[i]),
                      onSort: (columnIndex, isAscending) {
                        playerDetail.updateShotTypeSortTargetIndex(i, playerDetailInfo.shotTypeAscending);
                      },
                    )
                  }
                ],
                rows: playerDetail.getShotTypeStats(playerDetailInfo.shotTypeSortTargetIndex, playerDetailInfo.shotTypeAscending).map((e) =>
                    DataRow(
                      cells: [
                        DataCell(
                          Text('${e[0]}'),
                        ),
                        DataCell(
                          Text('${e[1]}'),
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
                      ],
                    ),
                ).toList(),
              ),
            ),

            SizedBox(
              height: 500,
              child: DataTable2(
                fixedLeftColumns: 1,
                sortColumnIndex: playerDetailInfo.playTypeSortTargetIndex,
                sortAscending: playerDetailInfo.playTypeAscending,
                minWidth: 1000,
                columns:  [
                  for(int i = 0; i < CsvColumns.playTypeColumnList.length; i++) ... {
                    DataColumn(
                      label: Text(CsvColumns.playTypeColumnList[i]),
                      onSort: (columnIndex, isAscending) {
                        playerDetail.updatePlayTypeSortTargetIndex(i, playerDetailInfo.playTypeAscending);
                      },
                    )
                  }
                ],
                rows: playerDetail.getPlayTypeStats(playerDetailInfo.playTypeSortTargetIndex, playerDetailInfo.playTypeAscending).map((e) =>
                    DataRow(
                      cells: [
                        DataCell(
                          Text('${e[0]}'),
                        ),
                        DataCell(
                          Text('${e[1]}'),
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
                      ],
                    ),
                ).toList(),
              ),
            ),

            SizedBox(
              height: 500,
              child: DataTable2(
                fixedLeftColumns: 1,
                sortColumnIndex: playerDetailInfo.assistSortTargetIndex,
                sortAscending: playerDetailInfo.assistAscending,
                // minWidth: 1000,
                columns: [
                  for(int i = 0; i < CsvColumns.assistColumnList.length; i++) ... {
                    DataColumn(
                      label: Text(CsvColumns.assistColumnList[i]),
                      onSort: (columnIndex, isAscending) {
                        playerDetail.updateAssistSortTargetIndex(i, playerDetailInfo.assistAscending);
                      },
                    )
                  }
                ],
                rows: playerDetail.getAssistPlayerStats(playerDetailInfo.assistSortTargetIndex, playerDetailInfo.assistAscending).map((e) =>
                    DataRow(
                      cells: [
                        DataCell(
                          Text('${e[0]}'),
                        ),
                        DataCell(
                          Text('${e[1]}'),
                        ),
                      ],
                    ),
                ).toList(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget showProfileImage(String imagePath) {
  var a = File(imagePath);
  return CircleAvatar(
    radius: 50,
    backgroundImage: MemoryImage(a.readAsBytesSync()),
  );
}