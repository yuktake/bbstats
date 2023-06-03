import 'dart:io';

import 'package:bb_stats/src/screens/team_edit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker_plus/flutter_datetime_picker_plus.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

import '../consts/CsvColumns.dart';
import '../consts/TeamStatColumns.dart';
import '../providers/isar_provider.dart';

class TeamProfile extends ConsumerWidget {
  const TeamProfile(
      this.id,
      {Key? key}
  ) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final home = ref.watch(homeProvider.notifier);
    final team = ref.watch(teamProvider(id).notifier);
    final teamInfo = ref.watch(teamProvider(id));
    final teamDetail = ref.watch(teamDetailProvider.notifier);
    final teamDetailInfo = ref.watch(teamDetailProvider);
    final documentPath = ref.watch(documentPathProvider);

    Rect shareRect = const Rect.fromLTWH(0, 0, 50, 50);
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double iconRadius = screenHeight * 0.05;
    double normalFontSize = screenWidth / 27;
    double smallFontSize = screenWidth / 40;

    return Scaffold(
        appBar: AppBar(
          title: Text('Team Profile', style: TextStyle(fontSize: smallFontSize)),
          actions: [
            IconButton(
              icon: const Icon(Icons.download),
              color: Colors.white,
              onPressed: () async {
                final csvFile = File('${(await getApplicationDocumentsDirectory()).path}/csvs/team.csv');
                String csvString = teamDetail.getStatsString(id);
                await csvFile.writeAsString(csvString);
                Share.shareXFiles(
                    [XFile('${documentPath.value}/csvs/team.csv', name: 'team.csv')],
                    subject: 'Export',
                    text: 'Output Team Stats',
                    sharePositionOrigin: shareRect,
                );
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => {
                team.setEditState('${documentPath.value}/teams/1.jpg'),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeamEditScreen(id),
                  ),
                ).then((value) => {
                  showCircleImage('${documentPath.value}/teams/$id.jpg', iconRadius)
                })
              },
            )
          ],
        ),
        body: SingleChildScrollView(
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          showCircleImage('${documentPath.value}/teams/$id.jpg', iconRadius),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(teamInfo.name, style: TextStyle(fontSize: normalFontSize)),
                                  Text("${home.countWinGame().toString()}-${home.countLostGame().toString()}", style: TextStyle(fontSize: smallFontSize)),
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
                                      Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          child: Text(
                                              TeamStatColumns.teamStatColumnList[index],
                                              style: TextStyle(fontSize: normalFontSize, fontWeight: FontWeight.w800)
                                          )
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                                          child: Text(
                                              e.value.toString(),
                                              style: TextStyle(fontSize: normalFontSize),
                                          )
                                      ),
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

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                    children: [
                      TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1950, 1, 1),
                              maxTime: DateTime.now(),
                              onConfirm: (date) {
                                DateTime dateTime = DateTime(date.year,date.month,date.day,0,0,0);
                                teamDetail.updateStartDate(dateTime);
                              },
                              currentTime: teamDetailInfo.start,
                              locale: LocaleType.jp
                          );
                        },
                        child: Text(teamDetailInfo.start == null ? '-/-/-/' : DateFormat('yyyy-MM-dd').format(teamDetailInfo.start!), style: TextStyle(color: Colors.black, fontSize: smallFontSize)),
                      ),
                      Text('~', style: TextStyle(color: Colors.black, fontSize: smallFontSize)),
                      TextButton(
                        onPressed: () {
                          DatePicker.showDatePicker(context,
                              showTitleActions: true,
                              minTime: DateTime(1950, 1, 1),
                              maxTime: DateTime.now(),
                              onConfirm: (date) {
                                DateTime dateTime = DateTime(date.year,date.month,date.day,23,59,59);
                                teamDetail.updateEndDate(dateTime);
                              },
                              currentTime: teamDetailInfo.end,
                              locale: LocaleType.jp
                          );
                        },
                        child: Text(teamDetailInfo.end == null ? '-/-/-/' : DateFormat('yyyy-MM-dd').format(teamDetailInfo.end!), style: TextStyle(color: Colors.black, fontSize: smallFontSize)),
                      ),
                    ],
                ),
              ),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    Text('VS  ', style: TextStyle(fontSize: smallFontSize)),
                    DropdownButton(
                      items: <DropdownMenuItem<int>>[
                        DropdownMenuItem(
                          value: null,
                          child: Text('-', style: TextStyle(fontSize: smallFontSize)),
                        ),
                        for (final opponentTeam in teamDetailInfo.opponentTeams)
                          DropdownMenuItem(
                            value: opponentTeam.id,
                            child: Text(opponentTeam.name, style: TextStyle(fontSize: smallFontSize)),
                          ),
                      ],
                      onChanged: (int? value) {
                        teamDetail.updateOpponentTeamId(value);
                      },
                      value: teamDetailInfo.opponentTeamId,
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 100,
                child: DataTable2(
                  columnSpacing: 16,
                  minWidth: 1000,
                  columns: [
                    for(int i = 0; i < CsvColumns.teamStatColumnList.length; i++) ... {
                      DataColumn(
                        label: Text(CsvColumns.teamStatColumnList[i]),
                      )
                    }
                  ],
                  rows: [
                    DataRow(
                      cells: teamDetail.getOverAllStats(teamDetailInfo.start, teamDetailInfo.end, teamDetailInfo.opponentTeamId).map((e) =>
                          DataCell(
                            Text('$e'),
                          ),
                      ).toList(),
                    ),
                  ],
                ),
              ),

              SizedBox(
                height: 200,
                child: DataTable2(
                  columnSpacing: 16,
                  minWidth: 1000,
                  columns: [
                    for(int i = 0; i < CsvColumns.resultStatColumnList.length; i++) ... {
                      DataColumn(
                        label: Text(CsvColumns.resultStatColumnList[i]),
                      )
                    }
                  ],
                  rows: [
                    DataRow(
                      cells: teamDetail.getWinStats(teamDetailInfo.start, teamDetailInfo.end, teamDetailInfo.opponentTeamId).map((e) =>
                          DataCell(
                            Text('$e'),
                          ),
                      ).toList(),
                    ),
                    DataRow(
                      cells: teamDetail.getLoseStats(teamDetailInfo.start, teamDetailInfo.end, teamDetailInfo.opponentTeamId).map((e) =>
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
                  sortColumnIndex: teamDetailInfo.playTypeSortTargetIndex,
                  sortAscending: teamDetailInfo.playTypeAscending,
                  minWidth: 1000,
                  columns:  [
                    for(int i = 0; i < CsvColumns.playTypeColumnList.length; i++) ... {
                      DataColumn(
                        label: Text(CsvColumns.playTypeColumnList[i]),
                        onSort: (columnIndex, isAscending) {
                          teamDetail.updatePlayTypeSortTargetIndex(i, teamDetailInfo.playTypeAscending);
                        },
                      )
                    }
                  ],
                  rows: teamDetail.getPlayTypeStats(teamDetailInfo.opponentTeamId, teamDetailInfo.playTypeSortTargetIndex, teamDetailInfo.playTypeAscending).map((e) =>
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
                  sortColumnIndex: teamDetailInfo.shotZoneSortTargetIndex,
                  sortAscending: teamDetailInfo.shotZoneAscending,
                  minWidth: 1000,
                  columns: [
                    for(int i = 0; i < CsvColumns.shotZoneColumnList.length; i++) ... {
                      DataColumn(
                        label: Text(CsvColumns.shotZoneColumnList[i]),
                        onSort: (columnIndex, isAscending) {
                          teamDetail.updateShotZoneSortTargetIndex(i, teamDetailInfo.shotZoneAscending);
                        },
                      )
                    }
                  ],
                  rows: teamDetail.getShotZoneStats(teamDetailInfo.opponentTeamId, teamDetailInfo.shotZoneSortTargetIndex, teamDetailInfo.shotZoneAscending).map((e) =>
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
            ],
          ),
        )
    );
  }
}