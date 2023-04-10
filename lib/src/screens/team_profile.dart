import 'package:bb_stats/src/screens/player_profile.dart';
import 'package:bb_stats/src/screens/team_edit.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../providers/isar_provider.dart';

class TeamProfile extends ConsumerWidget {
  const TeamProfile(
      this.id,
      {Key? key}
  ) : super(key: key);

  final int id;

  final _isAscending = true;
  final _currentSortColumn = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                  sortColumnIndex: _currentSortColumn,
                  sortAscending: _isAscending,
                  columnSpacing: 16,
                  minWidth: 1000,
                  columns: const [
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
                      label: Text('TO'),
                    ),
                    DataColumn(
                      label: Text('STL'),
                    ),
                    DataColumn(
                      label: Text('BLK'),
                    ),
                    DataColumn(
                      label: Text('PF'),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: teamDetailInfo.overallStats.map((e) =>
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
                  sortColumnIndex: _currentSortColumn,
                  sortAscending: _isAscending,
                  columnSpacing: 16,
                  minWidth: 1000,
                  columns: const [
                    DataColumn(
                      label: Text(''),
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
                      label: Text('TO'),
                    ),
                    DataColumn(
                      label: Text('STL'),
                    ),
                    DataColumn(
                      label: Text('BLK'),
                    ),
                    DataColumn(
                      label: Text('PF'),
                    ),
                  ],
                  rows: [
                    DataRow(
                      cells: teamDetailInfo.winStats.map((e) =>
                          DataCell(
                            Text('$e'),
                          ),
                      ).toList(),
                    ),
                    DataRow(
                      cells: teamDetailInfo.loseStats.map((e) =>
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
                  sortColumnIndex: _currentSortColumn,
                  sortAscending: _isAscending,
                  minWidth: 1000,
                  columns: const [
                    DataColumn(
                      label: Text('PLAY TYPE'),
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
                  ],
                  rows: teamDetailInfo.playTypeStats.map((e) =>
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
                  sortColumnIndex: _currentSortColumn,
                  sortAscending: _isAscending,
                  minWidth: 1000,
                  columns: const [
                    DataColumn(
                      label: Text('SHOT ZONE'),
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
                  ],
                  rows: teamDetailInfo.shotZoneStats.map((e) =>
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