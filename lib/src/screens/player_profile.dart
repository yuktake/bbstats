import 'dart:io';

import 'package:bb_stats/src/screens/player_edit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
    final teamInfo = ref.watch(teamProvider(1));
    final documentPath = ref.watch(documentPathProvider);

    Rect shareRect = const Rect.fromLTWH(0, 0, 50, 50);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double iconRadius = screenHeight*0.05;
    double normalFontSize = screenWidth / 27;
    double smallFontSize = screenWidth / 40;
    double normalPadding = screenHeight / 40;
    double overallDataTableHeight = screenHeight * 0.1;
    double shotTypeDataTableHeight = screenHeight * 0.4;
    double playTypeDataTableHeight = screenHeight * 0.4;
    double playerDataTableHeight = screenHeight * 0.3;

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
            color: Colors.white,
            onPressed: () async {
              final csvFile = File('${(await getApplicationDocumentsDirectory()).path}/csvs/player.csv');
              String csvString = playerDetail.getStatsString(id);
              await csvFile.writeAsString(csvString);
              Share.shareXFiles(
                  [XFile('${documentPath.value}/csvs/player.csv', name: 'player.csv')],
                  subject: 'Export',
                  text: 'Output Player Stats',
                  sharePositionOrigin: shareRect,
              );
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
                        child: showPlayerProfileImage('${documentPath.value}/players/$id.jpg', iconRadius)
                      ),
                      Expanded(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(teamInfo.name, style: TextStyle(fontSize: normalFontSize),),
                            Text(
                              playerInfo.name,
                              style: TextStyle(
                                fontSize: smallFontSize,
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF242629),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
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
                  child: Text(playerDetailInfo.start == null ? '-/-/-/' : DateFormat('yyyy-MM-dd').format(playerDetailInfo.start!), style: TextStyle(color: Colors.black, fontSize: smallFontSize)),
                ),
                Text('~', style: TextStyle(fontSize: smallFontSize),),
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
                    child: Text(playerDetailInfo.end == null ? '-/-/-/' : DateFormat('yyyy-MM-dd').format(playerDetailInfo.end!), style: TextStyle(color: Colors.black, fontSize: smallFontSize)),
                ),
              ],
            ),

            SizedBox(
              height: overallDataTableHeight,
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
              height: shotTypeDataTableHeight,
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
              height: playTypeDataTableHeight,
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
              height: playerDataTableHeight,
              child: DataTable2(
                fixedLeftColumns: 1,
                sortColumnIndex: playerDetailInfo.assistSortTargetIndex,
                sortAscending: playerDetailInfo.assistAscending,
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

Widget showPlayerProfileImage(String imagePath, double radius) {
  var a = File(imagePath);
  return CircleAvatar(
    radius: radius,
    backgroundImage: MemoryImage(a.readAsBytesSync()),
  );
}