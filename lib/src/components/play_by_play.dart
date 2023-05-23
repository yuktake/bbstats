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

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: CupertinoSegmentedControl(
                    children: {
                      1: const Text('Q1'),
                      2: const Text('Q2'),
                      3: const Text('Q3'),
                      4: const Text('Q4'),
                      for(int i = 1; i <= gamePbp.getOtNum(); i++) ... {
                        i+4: Text('OT$i')
                      },
                      100: const Text('All'),
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
                      child: gamePbpInfo.pbps.elementAt(index).player.value == null ? pbpOpponentRow(gamePbpInfo.pbps.elementAt(index), documentPath.value!, gamePbpInfo.game.opponent.value!.id) : pbpRow(gamePbpInfo.pbps.elementAt(index), documentPath.value!)
                  );
                },
              ),
            ),
          ),
        ],
      );
  }
}

Widget pbpRow(Pbp pbp, String path) {
    if (pbp.type == RecordType.TIMEOUT || pbp.type == RecordType.SHOT_CLOCK_TURNOVER){
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('$path/teams/1.jpg'),
            radius: 20,
          ),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(pbp.description)
            ),
          )
        ],
      );
    } else {
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage('$path/players/${pbp.player.value!.id}.jpg'),
            radius: 20,
          ),
          Flexible(
            child: Padding(
                padding: const EdgeInsets.only(left: 16),
                child: Text(pbp.description)
            ),
          )
        ],
      );
    }
}

Widget pbpOpponentRow(Pbp pbp, String path, int opponentTeamId) {
  if (pbp.type == RecordType.TIMEOUT || pbp.type == RecordType.SHOT_CLOCK_TURNOVER){
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(pbp.description)
          ),
        ),
        CircleAvatar(
          backgroundImage: AssetImage('$path/teams/$opponentTeamId.jpg'),
        ),
      ],
    );
  } else {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Flexible(
          child: Padding(
              padding: const EdgeInsets.only(right: 16),
              child: Text(pbp.description)
          ),
        ),
        CircleAvatar(
          backgroundImage: AssetImage('$path/teams/$opponentTeamId.jpg'),
        ),
      ],
    );
  }
}