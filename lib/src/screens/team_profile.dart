import 'dart:io';

import 'package:bb_stats/src/screens/player_profile.dart';
import 'package:bb_stats/src/screens/team_edit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
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
    final homeInfo = ref.watch(homeProvider);
    final team = ref.watch(teamProvider(id).notifier);
    final teamInfo = ref.watch(teamProvider(id));
    final teamDetail = ref.watch(teamDetailProvider.notifier);
    final teamDetailInfo = ref.watch(teamDetailProvider);
    final documentPath = ref.watch(documentPathProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Team Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.download),
              onPressed: () async {
                final csvFile = File('${(await getApplicationDocumentsDirectory()).path}/csvs/team.csv');
                String csvString = teamDetail.getStatsString(id);
                await csvFile.writeAsString(csvString);
                Share.shareXFiles([XFile('${documentPath.value}/csvs/team.csv', name: 'team.csv')], subject: 'Export', text: 'Output Team Stats');
              },
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () => {
                team.setEditState('${documentPath.value}/teams/$id.jpg'),
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TeamEditScreen(id),
                  ),
                ).then((value) => {
                  showProfileImage('${documentPath.value}/teams/$id.jpg')
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
                          showProfileImage('${documentPath.value}/teams/$id.jpg'),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 16),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(teamInfo.name),
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
                            teamDetail.updateStartDate(date);
                          },
                          currentTime: teamDetailInfo.start,
                          locale: LocaleType.jp
                      );
                    },
                    child: Text(teamDetailInfo.start == null ? '-/-/-/' : DateFormat('yyyy-MM-dd').format(teamDetailInfo.start!), style: const TextStyle(color: Colors.black)),
                  ),
                  const Text('-'),
                  TextButton(
                    onPressed: () {
                      DatePicker.showDatePicker(context,
                          showTitleActions: true,
                          minTime: DateTime(1950, 1, 1),
                          maxTime: DateTime.now(),
                          onConfirm: (date) {
                            teamDetail.updateEndDate(date);
                          },
                          currentTime: teamDetailInfo.end,
                          locale: LocaleType.jp
                      );
                    },
                    child: Text(teamDetailInfo.end == null ? '-/-/-/' : DateFormat('yyyy-MM-dd').format(teamDetailInfo.end!), style: const TextStyle(color: Colors.black)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text('VS  '),
                    DropdownButton(
                      items: <DropdownMenuItem<int>>[
                        const DropdownMenuItem(
                          value: null,
                          child: Text('-'),
                        ),
                        for (final opponentTeam in teamDetailInfo.opponentTeams)
                          DropdownMenuItem(
                            value: opponentTeam.id,
                            child: Text(opponentTeam.name),
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