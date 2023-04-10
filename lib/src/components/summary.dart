import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/isar_provider.dart';
import 'game_stat.dart';

class SummaryScreen extends ConsumerWidget {
  const SummaryScreen(this.id,{Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameInfo = ref.watch(gameProvider(id));
    final gameSummaryInfo = ref.watch(gameSummaryProvider(id));
    final documentPath = ref.watch(documentPathProvider);

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 150,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('${documentPath.value}/teams/1.jpg',),
                              radius: 50.0,
                            ),
                            Text(gameSummaryInfo.myTeam!.name),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${gameSummaryInfo.game.myPts}-${gameSummaryInfo.game.opponentPts}',
                               style: const TextStyle(fontSize: 20)
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width/3,
                        child: Column(
                          children: [
                            CircleAvatar(
                              backgroundImage: AssetImage('${documentPath.value}/teams/${gameInfo.game?.opponent.value?.id}.jpg'),
                              radius: 50.0,
                            ),
                            Text(gameInfo.game!.opponent.value!.name),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: 300,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child:
              LineChart(
                LineChartData(
                  borderData: FlBorderData(
                      border: const Border(
                        top: BorderSide.none,
                        right: BorderSide.none,
                        left: BorderSide.none,
                        bottom: BorderSide.none,
                      )
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    topTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    rightTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: false,
                      ),
                    ),
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        interval: 1,
                        getTitlesWidget: bottomTitles,
                      ),
                    ),
                    leftTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        reservedSize: 40,
                      ),
                    ),
                  ),
                  lineBarsData: [
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.greenAccent,
                      barWidth: 8,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.greenAccent.withOpacity(0.2),
                      ),
                      spots: gameSummaryInfo.scores.asMap().entries.map((e) {
                        final index = e.key;
                        final data = e.value;
                        return FlSpot(index.toDouble(), data.toDouble());
                      }).toList(),
                    ),
                    LineChartBarData(
                      isCurved: true,
                      color: Colors.redAccent,
                      barWidth: 8,
                      isStrokeCapRound: true,
                      dotData: FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Colors.redAccent.withOpacity(0.2),
                      ),
                      spots: gameSummaryInfo.opponentScores.asMap().entries.map((e) {
                        final index = e.key;
                        final data = e.value;
                        return FlSpot(index.toDouble(), data.toDouble());
                      }).toList(),
                    ),
                  ],
                ),
                swapAnimationDuration: const Duration(milliseconds: 250),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: DataTable(
                        showBottomBorder: true,
                        showCheckboxColumn: false,
                        columnSpacing: MediaQuery.of(context).size.width/11,
                        columns: const [
                          DataColumn(
                            label: Text(''),
                          ),
                          DataColumn(
                            label: Text('Q1'),
                          ),
                          DataColumn(
                            label: Text('Q2'),
                          ),
                          DataColumn(
                            label: Text('Q3'),
                          ),
                          DataColumn(
                            label: Text('Q4'),
                          ),
                          DataColumn(
                              label: Text('FINAL')
                          )
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text(gameSummaryInfo.myTeam!.name)),
                              DataCell(Text(gameSummaryInfo.scoreByQuarter[0].toString())),
                              DataCell(Text(gameSummaryInfo.scoreByQuarter[1].toString())),
                              DataCell(Text(gameSummaryInfo.scoreByQuarter[2].toString())),
                              DataCell(Text(gameSummaryInfo.scoreByQuarter[3].toString())),
                              DataCell(Text(gameSummaryInfo.scoreByQuarter[4].toString()))
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text(gameInfo.game!.opponent.value!.name)),
                              DataCell(Text(gameSummaryInfo.opponentScoreByQuarter[0].toString())),
                              DataCell(Text(gameSummaryInfo.opponentScoreByQuarter[1].toString())),
                              DataCell(Text(gameSummaryInfo.opponentScoreByQuarter[2].toString())),
                              DataCell(Text(gameSummaryInfo.opponentScoreByQuarter[3].toString())),
                              DataCell(Text(gameSummaryInfo.opponentScoreByQuarter[4].toString())),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]
                ),
              ),
            ),
          ),

          const Padding(
              padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Text('Team/Opponent'),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      children: [
                        const Text('FG%'),
                        Padding(
                          padding: const EdgeInsets.only(top:16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${gameSummaryInfo.game.fgRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.fgRatio > gameSummaryInfo.game.opponentFgRatio ? Colors.greenAccent : Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              const Text('/'),
                              Text(
                                '${gameSummaryInfo.game.opponentFgRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.fgRatio < gameSummaryInfo.game.opponentFgRatio ? Colors.redAccent : Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      children: [
                        const Text('3P%'),
                        Padding(
                          padding: const EdgeInsets.only(top:16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${gameSummaryInfo.game.tpRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.tpRatio > gameSummaryInfo.game.opponentTpRatio ? Colors.greenAccent : Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              const Text('/'),
                              Text(
                                '${gameSummaryInfo.game.opponentTpRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.tpRatio < gameSummaryInfo.game.opponentTpRatio ? Colors.redAccent : Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 80,
                    child: Column(
                      children: [
                        const Text('FT%'),
                        Padding(
                          padding: const EdgeInsets.only(top:16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${gameSummaryInfo.game.ftRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.ftRatio > gameSummaryInfo.game.opponentFtRatio ? Colors.greenAccent : Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                              const Text('/'),
                              Text(
                                '${gameSummaryInfo.game.opponentFtRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.ftRatio < gameSummaryInfo.game.opponentFtRatio ? Colors.redAccent : Colors.black,
                                  fontSize: 15,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              color: Colors.white,
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    AspectRatio(
                      aspectRatio: 1.4,
                      child: BarChart(
                        BarChartData(
                          alignment: BarChartAlignment.spaceBetween,
                          borderData: FlBorderData(
                            show: true,
                            border: const Border.symmetric(
                              horizontal: BorderSide(
                                color: Color(0xFFececec),
                              ),
                            ),
                          ),
                          titlesData: FlTitlesData(
                            show: true,
                            leftTitles: AxisTitles(
                              drawBehindEverything: true,
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 30,
                                getTitlesWidget: (value, meta) {
                                  return Text(
                                    value.toInt().toString(),
                                    style: const TextStyle(
                                      color: Color(0xFF606060),
                                    ),
                                    textAlign: TextAlign.left,
                                  );
                                },
                              ),
                            ),
                            bottomTitles: AxisTitles(
                              sideTitles: SideTitles(
                                showTitles: true,
                                reservedSize: 36,
                                getTitlesWidget: (value, meta) {
                                  final index = value.toInt();
                                  return SideTitleWidget(
                                    axisSide: meta.axisSide,
                                    child: Text(GameStat.titles[index]),
                                  );
                                },
                              ),
                            ),
                            rightTitles: AxisTitles(),
                            topTitles: AxisTitles(),
                          ),
                          gridData: FlGridData(
                            show: true,
                            drawVerticalLine: false,
                            getDrawingHorizontalLine: (value) => FlLine(
                              color: const Color(0xFFececec),
                              dashArray: null,
                              strokeWidth: 1,
                            ),
                          ),
                          barGroups: gameSummaryInfo.comparisonStats.asMap().entries.map((e) {
                            final index = e.key;
                            return generateBarGroup(index, Colors.greenAccent, e.value[0], e.value[1]);
                          }).toList(),
                          maxY: 50,
                          barTouchData: BarTouchData(
                            enabled: true,
                            handleBuiltInTouches: false,
                            touchTooltipData: BarTouchTooltipData(
                                tooltipBgColor: Colors.transparent,
                                tooltipMargin: 0,
                                getTooltipItem: (
                                    BarChartGroupData group,
                                    int groupIndex,
                                    BarChartRodData rod,
                                    int rodIndex
                                    ) {
                                  return BarTooltipItem(
                                    rod.toY.toString(),
                                    TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: rod.color!,
                                        fontSize: 18,
                                        shadows: const [
                                          Shadow(
                                            color: Colors.black26,
                                            blurRadius: 12,
                                          )
                                        ]),
                                  );
                                }),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('PickUp Stats'),
          ),

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: DataTable(
                          showBottomBorder: true,
                          showCheckboxColumn: false,
                          columnSpacing: MediaQuery.of(context).size.width / 20,
                          columns: const [
                            DataColumn(
                              label: Text(''),
                            ),
                            DataColumn(
                              label: Text('PITP'),
                            ),
                            DataColumn(
                              label: Text('FB PTS'),
                            ),
                            DataColumn(
                              label: Text('2ND CHANCE'),
                            ),
                            DataColumn(
                              label: Text('BENCH PTS'),
                            ),
                          ],
                          rows: [
                            DataRow(
                              cells: [
                                DataCell(Text(gameSummaryInfo.myTeam!.name)),
                                DataCell(Text(gameSummaryInfo.pickupStats[0].toString())),
                                DataCell(Text(gameSummaryInfo.pickupStats[1].toString())),
                                DataCell(Text(gameSummaryInfo.pickupStats[2].toString())),
                                DataCell(Text(gameSummaryInfo.pickupStats[3].toString())),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text(gameInfo.game!.opponent.value!.name)),
                                DataCell(Text(gameSummaryInfo.opponentPickupStats[0].toString())),
                                DataCell(Text(gameSummaryInfo.opponentPickupStats[1].toString())),
                                DataCell(Text(gameSummaryInfo.opponentPickupStats[2].toString())),
                                DataCell(Text(gameSummaryInfo.opponentPickupStats[3].toString())),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget bottomTitles(double value, TitleMeta meta) {
  const style = TextStyle(color: Color(0xff939393), fontSize: 15);
  String text;
  int intValue = value.toInt();
  if (intValue == 0) {
    text = '1Q';
  } else if (intValue == 12) {
    text = '2Q';
  } else if (intValue == 24) {
    text = '3Q';
  } else if (intValue == 36) {
    text = '4Q';
  } else {
    text = '';
  }
  return SideTitleWidget(
    axisSide: meta.axisSide,
    child: Text(text, style: style),
  );
}