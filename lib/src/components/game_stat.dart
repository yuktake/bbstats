import 'dart:math';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../collections/player/player.dart';
import '../providers/isar_provider.dart';

class GameStat extends ConsumerWidget {
  GameStat(this.gameId, {Key? key}) : super(key: key);

  final int gameId;

  static const shadowColor = Colors.redAccent;

  static const titles = [
    "OREB",
    "DREB",
    "AST",
    "STL",
    "BLK",
    "TO",
  ];

  GlobalKey globalKey = GlobalKey();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gameStatInfo = ref.watch(gameStatProvider(gameId));
    final gameStat = ref.watch(gameStatProvider(gameId).notifier);
    final documentPath = ref.watch(documentPathProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Game Stat'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Team/Opponent'),
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
                                      '${gameStatInfo.game.fgRatio.toString()}%',
                                      style: TextStyle(
                                        color: gameStatInfo.game.fgRatio > gameStatInfo.game.opponentFgRatio ? Colors.greenAccent : Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const Text('/'),
                                    Text(
                                      '${gameStatInfo.game.opponentFgRatio.toString()}%',
                                      style: TextStyle(
                                        color: gameStatInfo.game.fgRatio < gameStatInfo.game.opponentFgRatio ? Colors.redAccent : Colors.black,
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
                                      '${gameStatInfo.game.tpRatio.toString()}%',
                                      style: TextStyle(
                                        color: gameStatInfo.game.tpRatio > gameStatInfo.game.opponentTpRatio ? Colors.greenAccent : Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const Text('/'),
                                    Text(
                                      '${gameStatInfo.game.opponentTpRatio.toString()}%',
                                      style: TextStyle(
                                        color: gameStatInfo.game.tpRatio < gameStatInfo.game.opponentTpRatio ? Colors.redAccent : Colors.black,
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
                                      '${gameStatInfo.game.ftRatio.toString()}%',
                                      style: TextStyle(
                                        color: gameStatInfo.game.ftRatio > gameStatInfo.game.opponentFtRatio ? Colors.greenAccent : Colors.black,
                                        fontSize: 15,
                                      ),
                                    ),
                                    const Text('/'),
                                    Text(
                                      '${gameStatInfo.game.opponentFtRatio.toString()}%',
                                      style: TextStyle(
                                        color: gameStatInfo.game.ftRatio < gameStatInfo.game.opponentFtRatio ? Colors.redAccent : Colors.black,
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

                Card(
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
                              barGroups: gameStat.getComparisonStats().asMap().entries.map((e) {
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

                const Text('Shot Chart'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Row(
                    children:[
                      Expanded(
                        child: CupertinoSegmentedControl(
                            children: const {
                              1: Text('All'),
                              2: Text('Make'),
                              3: Text('Miss'),
                            },
                            groupValue: gameStatInfo.shotFilter,
                            onValueChanged: (int value) {
                              gameStat.updateShotFilter(value);
                            }
                        ),
                      )
                    ],
                  ),
                ),
                gameStatInfo.image != null ?
                Image(
                  key: globalKey,
                  image: gameStatInfo.image!,
                  fit: BoxFit.fill,
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height*0.5,
                )
                :
                const Text(
                  'No Image Taken',
                  textAlign: TextAlign.center,
                ),

                const Text('Player Stats'),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  child: Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            child: SizedBox(
                              height: MediaQuery.of(context).size.height*0.1,
                              child: ListView(
                                // This next line does the trick.
                                scrollDirection: Axis.horizontal,
                                children: gameStat.getPlayers().asMap().entries.map((e) {
                                  return GestureDetector(
                                      onTap: () {
                                        gameStat.updateDetailPlayer(e.value);
                                      },
                                      child: _buildCircleAvatar(gameStatInfo.selectedPlayerId ,e.value, documentPath.value)
                                  );
                                }).toList(),
                              ),
                            ),
                          ),
                        ],
                      )
                  ),
                ),
              ]
            ),
          )
        )
    );
  }
}

Widget _buildCircleAvatar(int? selectedId, Player player, String? documentPath) {
  return LayoutBuilder(
    builder: (context, constraints) {
      final radius = min(constraints.maxHeight / 2, constraints.maxWidth / 2);
      return avatarImage(selectedId, radius, player, documentPath);
    },
  );
}

Widget avatarImage(int? selectedId, double radius, Player player, String? documentPath) {
  if(selectedId == player.id) {
    return Container(
        padding: const EdgeInsets.all(5.0), // borde width
        decoration: const BoxDecoration(
          color: Colors.red, // border color
          shape: BoxShape.circle,
        ),
        child: CircleAvatar(
          radius: radius,
          backgroundImage: AssetImage("$documentPath/players/${player.id}.jpg"),
        )
    );
  } else {
    return CircleAvatar(
      radius: radius,
      backgroundImage: AssetImage("$documentPath/players/${player.id}.jpg"),
    );
  }
}

BarChartGroupData generateBarGroup(
    int x,
    Color color,
    double value,
    double shadowValue,
    ) {
  return BarChartGroupData(
    x: x,
    barRods: [
      BarChartRodData(
        toY: value,
        color: color,
        width: 6,
      ),
      BarChartRodData(
        toY: shadowValue,
        color: GameStat.shadowColor,
        width: 6,
      ),
    ],

  );
}