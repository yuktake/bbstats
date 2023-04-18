import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/isar_provider.dart';

class StatDataTable extends ConsumerWidget {
  StatDataTable(this.gameId,{Key? key}) : super(key: key);

  final int gameId;

  var _isAscending = true;
  var _currentSortColumn = 0;
  final List<Map> overall_list = List.generate(10, (index) => {
    'PLAYER': index,
    'MIN':  index,
    'FGM': index,
    'FGA': Random().nextDouble() + 1,
    'FG%': Random().nextDouble() + 1,
    '3PM': index,
    '3PA': index,
    '3P%': index,
    'FTM': index,
    'FTA': index,
    'FT%': index,
    'OREB': index,
    'DREB': index,
    'REB': index,
    'AST': index,
    'STL': index,
    'BLK': index,
    'TO': index,
    'PF': index,
    'PTS': index,
    '+/-': index,
  },);
  
  Widget PlayerColumn(String name, String path) {
    return (
      Container(
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: CircleAvatar(
                backgroundImage: AssetImage(path),
              ),
            ),
            // Text(name),
          ],
        ),
      )
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final boxScoreListInfo = ref.watch(boxScoreListProvider(gameId));
    final documentPath = ref.watch(documentPathProvider);
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: overall_list.length*60,
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
                  sortColumnIndex: _currentSortColumn,
                  sortAscending: _isAscending,
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
                  rows: boxScoreListInfo.boxScores
                      .map(
                        (e) => DataRow(
                      cells: [
                        DataCell(
                          // Text('${e.playerHistory.value!.player.value?.name}'),
                          PlayerColumn(e.player.value!.name, '${documentPath.value}/players/${e.player.value!.id}.jpg')
                        ),
                        DataCell(
                          Text('${e.pts}'),
                        ),
                        DataCell(
                          Text('${e.fgm}'),
                        ),
                        DataCell(
                          Text('${e.fga}'),
                        ),
                        DataCell(
                          Text('${e.fgRatio}'),
                        ),
                        DataCell(
                          Text('${e.tpm}'),
                        ),
                        DataCell(
                          Text('${e.tpa}'),
                        ),
                        DataCell(
                          Text('${e.tpRatio}'),
                        ),
                        DataCell(
                          Text('${e.ftm}'),
                        ),
                        DataCell(
                          Text('${e.fta}'),
                        ),
                        DataCell(
                          Text('${e.ftRatio}'),
                        ),
                        DataCell(
                          Text('${e.oReb}'),
                        ),
                        DataCell(
                          Text('${e.dReb}'),
                        ),
                        DataCell(
                          Text('${e.reb}'),
                        ),
                        DataCell(
                          Text('${e.ast}'),
                        ),
                        DataCell(
                          Text('${e.stl}'),
                        ),
                        DataCell(
                          Text('${e.blk}'),
                        ),
                        DataCell(
                          Text('${e.to}'),
                        ),
                        DataCell(
                          Text('${e.pf}'),
                        ),
                      ],
                    ),
                  ).toList(),
                ),
              ),
            ],
          ),
        ),
      )
    ;
  }
}