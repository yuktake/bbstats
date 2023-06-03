import 'dart:io';

import 'package:bb_stats/src/collections/pbp/pbp.dart';
import 'package:bb_stats/src/enums/RecordType.dart';
import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PlayByPlayScreen extends ConsumerWidget {
  const PlayByPlayScreen(this.id, {Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamePbpInfo = ref.watch(gamePbpProvider(id));
    final gamePbp = ref.watch(gamePbpProvider(id).notifier);
    final documentPath = ref.watch(documentPathProvider);

    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    double iconRadius = screenHeight*0.03;
    double smallFontSize = screenWidth / 40;

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CupertinoSegmentedControl(
                    children: {
                      1: Text('Q1', style: TextStyle(fontSize: smallFontSize),),
                      2: Text('Q2', style: TextStyle(fontSize: smallFontSize),),
                      3: Text('Q3', style: TextStyle(fontSize: smallFontSize),),
                      4: Text('Q4', style: TextStyle(fontSize: smallFontSize),),
                      for(int i = 1; i <= gamePbp.getOtNum(); i++) ... {
                        i+4: Text('OT$i', style: TextStyle(fontSize: smallFontSize),)
                      },
                      100: Text('All', style: TextStyle(fontSize: smallFontSize),),
                    },
                    groupValue: gamePbpInfo.quarter,
                    onValueChanged: (int value) {
                      gamePbp.updateQuarter(value);
                    }
                ),
              )
            ],
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, top: 16, right: 16),
            child: SizedBox(
              height: MediaQuery.of(context).size.height*0.7,
              child: ListView.builder(
                itemCount: gamePbpInfo.pbps.length,
                itemBuilder: (context, index) {
                  return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: gamePbpInfo.pbps.elementAt(index).player.value == null ?
                      pbpOpponentRow(gamePbpInfo.pbps.elementAt(index), documentPath.value!, gamePbpInfo.game.opponent.value!.id, iconRadius, smallFontSize) :
                      pbpRow(gamePbpInfo.pbps.elementAt(index), documentPath.value!, iconRadius, smallFontSize)
                  );
                },
              ),
            ),
          ),
        ],
      );
  }
}

Widget pbpRow(Pbp pbp, String path, double iconRadius, double fontSize) {
    if (pbp.type == RecordType.TIMEOUT || pbp.type == RecordType.SHOT_CLOCK_TURNOVER){
      final a = File('$path/teams/1.jpg');
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: MemoryImage(a.readAsBytesSync()),
            radius: iconRadius,
          ),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(pbp.description, style: TextStyle(fontSize: fontSize),)
            ),
          )
        ],
      );
    } else {
      final a = File('$path/players/${pbp.player.value!.id}.jpg');
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: MemoryImage(a.readAsBytesSync()),
            radius: iconRadius,
          ),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(pbp.description, style: TextStyle(fontSize: fontSize),)
            ),
          )
        ],
      );
    }
}

Widget pbpOpponentRow(Pbp pbp, String path, int opponentTeamId, double iconRadius, double fontSize) {
  final a = File('$path/teams/$opponentTeamId.jpg');
  if (pbp.type == RecordType.TIMEOUT || pbp.type == RecordType.SHOT_CLOCK_TURNOVER){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(pbp.description, style: TextStyle(fontSize: fontSize),)
          ),
        ),
        CircleAvatar(
          radius: iconRadius,
          backgroundImage: MemoryImage(a.readAsBytesSync()),
        ),
      ],
    );
  } else {
    final a = File('$path/teams/$opponentTeamId.jpg');
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(pbp.description, style: TextStyle(fontSize: fontSize),)
          ),
        ),
        CircleAvatar(
          radius: iconRadius,
          backgroundImage: MemoryImage(a.readAsBytesSync()),
        ),
      ],
    );
  }
}