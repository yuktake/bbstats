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
    final gameSummary = ref.watch(gameSummaryProvider(id).notifier);
    final gameSummaryInfo = ref.watch(gameSummaryProvider(id));
    final documentPath = ref.watch(documentPathProvider);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    double iconRadius = screenHeight*0.05;
    double normalFontSize = screenWidth / 27;
    double smallFontSize = screenWidth / 40;
    double heroHeight = screenHeight * 0.2;
    double scoreChartHeight = screenHeight * 0.3;
    double shotComparisonHeight = screenHeight * 0.1;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: heroHeight,
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
                              radius: iconRadius,
                            ),
                            Text(gameSummaryInfo.myTeam!.name, style: TextStyle(fontSize: normalFontSize),),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              '${gameSummaryInfo.game.myPts}-${gameSummaryInfo.game.opponentPts}',
                              style: TextStyle(fontSize: normalFontSize),
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
                              radius: iconRadius,
                            ),
                            Text(gameInfo.game!.opponent.value!.name, style: TextStyle(fontSize: normalFontSize),),
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
            height: scoreChartHeight,
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
                      spots: gameSummary.getScores().asMap().entries.map((e) {
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
                      spots: gameSummary.getOpponentScores().asMap().entries.map((e) {
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
                        columns: [
                          const DataColumn(
                            label: Text(''),
                          ),
                          const DataColumn(
                            label: Text('Q1'),
                          ),
                          const DataColumn(
                            label: Text('Q2'),
                          ),
                          const DataColumn(
                            label: Text('Q3'),
                          ),
                          const DataColumn(
                            label: Text('Q4'),
                          ),
                          for(int i = 1; i <= gameSummary.getOtNum(); i++) ... {
                            DataColumn(
                              label: Text('OT$i'),
                            ),
                          },
                          const DataColumn(
                              label: Text('FINAL')
                          )
                        ],
                        rows: [
                          DataRow(
                            cells: [
                              DataCell(Text(gameSummaryInfo.myTeam!.name)),
                              for (final element in gameSummary.getScoreByQuarter())
                                DataCell(Text(element.toString())),
                            ],
                          ),
                          DataRow(
                            cells: [
                              DataCell(Text(gameInfo.game!.opponent.value!.name)),
                              for (final element in gameSummary.getOpponentScoreByQuarter())
                                DataCell(Text(element.toString())),
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

          Padding(
              padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
              child: Text('Team/Opponent', style: TextStyle(fontSize: normalFontSize),),
          ),

          Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: shotComparisonHeight,
                    child: Column(
                      children: [
                        Text('FG%', style: TextStyle(fontSize: normalFontSize),),
                        Padding(
                          padding: const EdgeInsets.only(top:16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${gameSummaryInfo.game.fgRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.fgRatio > gameSummaryInfo.game.opponentFgRatio ? Colors.greenAccent : Colors.black,
                                  fontSize: smallFontSize,
                                ),
                              ),
                              Text('/', style: TextStyle(fontSize: smallFontSize),),
                              Text(
                                '${gameSummaryInfo.game.opponentFgRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.fgRatio < gameSummaryInfo.game.opponentFgRatio ? Colors.redAccent : Colors.black,
                                  fontSize: smallFontSize,
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
                    height: shotComparisonHeight,
                    child: Column(
                      children: [
                        Text('3P%', style: TextStyle(fontSize: normalFontSize),),
                        Padding(
                          padding: const EdgeInsets.only(top:16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${gameSummaryInfo.game.tpRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.tpRatio > gameSummaryInfo.game.opponentTpRatio ? Colors.greenAccent : Colors.black,
                                  fontSize: smallFontSize,
                                ),
                              ),
                              Text('/', style: TextStyle(fontSize: smallFontSize),),
                              Text(
                                '${gameSummaryInfo.game.opponentTpRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.tpRatio < gameSummaryInfo.game.opponentTpRatio ? Colors.redAccent : Colors.black,
                                  fontSize: smallFontSize,
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
                    height: shotComparisonHeight,
                    child: Column(
                      children: [
                        Text('FT%', style: TextStyle(fontSize: normalFontSize),),
                        Padding(
                          padding: const EdgeInsets.only(top:16),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${gameSummaryInfo.game.ftRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.ftRatio > gameSummaryInfo.game.opponentFtRatio ? Colors.greenAccent : Colors.black,
                                  fontSize: smallFontSize,
                                ),
                              ),
                              Text('/', style: TextStyle(fontSize: smallFontSize),),
                              Text(
                                '${gameSummaryInfo.game.opponentFtRatio.toString()}%',
                                style: TextStyle(
                                  color: gameSummaryInfo.game.ftRatio < gameSummaryInfo.game.opponentFtRatio ? Colors.redAccent : Colors.black,
                                  fontSize: smallFontSize,
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
                          barGroups: gameSummary.getComparisonStats().asMap().entries.map((e) {
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

          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text('PickUp Stats', style: TextStyle(fontSize: normalFontSize),),
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
                                for (final element in gameSummary.getPickUpStats())
                                  DataCell(Text(element.toString())),
                              ],
                            ),
                            DataRow(
                              cells: [
                                DataCell(Text(gameInfo.game!.opponent.value!.name)),
                                for (final element in gameSummary.getOpponentPickUpStats())
                                  DataCell(Text(element.toString())),
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

  Widget bottomTitles(double value, TitleMeta meta) {
    return Consumer(builder: (context, ref, _) {
      final gameSummaryInfo = ref.watch(gameSummaryProvider(id));

      const style = TextStyle(color: Color(0xff939393), fontSize: 15);
      String text;
      int intValue = value.toInt();
      int maxValue = meta.max.toInt();
      int fourQuarterValue = maxValue - (gameSummaryInfo.game.overtimeQuarterMin * gameSummaryInfo.game.otNum);
      int quarter = (fourQuarterValue~/4)+1;

      if (intValue == 0) {
        text = '1Q';
      } else if (intValue == quarter) {
        text = '2Q';
      } else if (intValue == quarter*2) {
        text = '3Q';
      } else if (intValue == quarter*3) {
        text = '4Q';
      } else if ((intValue > fourQuarterValue) && (maxValue - (intValue-1)) % gameSummaryInfo.game.overtimeQuarterMin == 0) {
        int tmp = (maxValue - (intValue-1)) ~/ gameSummaryInfo.game.overtimeQuarterMin;
        int otIndex = gameSummaryInfo.game.otNum - tmp + 1;
        text = 'OT$otIndex';
      } else {
        text = '';
      }

      return SideTitleWidget(
        axisSide: meta.axisSide,
        child: Text(text, style: style),
      );
    });
  }
}