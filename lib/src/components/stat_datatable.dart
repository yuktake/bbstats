import 'dart:math';

import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../consts/CsvColumns.dart';
import '../providers/isar_provider.dart';

class StatDataTable extends ConsumerWidget {
  StatDataTable(this.gameId,{Key? key}) : super(key: key);

  final int gameId;
  
  Widget PlayerColumn(String name, String path) {
    return (
      Container(
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
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
    final boxScoreList = ref.watch(boxScoreListProvider(gameId).notifier);
    final documentPath = ref.watch(documentPathProvider);
    return
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Container(
          height: MediaQuery.of(context).size.height*0.7,
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
                  sortColumnIndex: boxScoreListInfo.sortTargetIndex,
                  sortAscending: boxScoreListInfo.ascending,
                  columnSpacing: 12,
                  horizontalMargin: 12,
                  minWidth: 2000,
                  columns:  [
                    for(int i = 0; i < CsvColumns.boxScoreColumnList.length; i++) ... {
                      DataColumn(
                        label: Text(CsvColumns.boxScoreColumnList[i]),
                        onSort: (columnIndex, isAscending) {
                          boxScoreList.updateSortTargetIndex(i, boxScoreListInfo.ascending);
                        },
                      )
                    }
                  ],
                  rows: boxScoreList.getBoxScores(boxScoreListInfo.sortTargetIndex, boxScoreListInfo.ascending)
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