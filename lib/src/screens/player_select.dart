import 'package:bb_stats/src/screens/team_edit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/isar_provider.dart';

class PlayersSelectScreen extends ConsumerWidget {
  const PlayersSelectScreen(this.position,{Key? key}) : super(key: key);

  final String position;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamePreparation = ref.watch(gamePreparationProvider.notifier);
    final playersInfo = ref.watch(playerSelectProvider);
    final documentPath = ref.watch(documentPathProvider);

    double iconRadius = MediaQuery.of(context).size.height*0.05;
    double normalFontSize = MediaQuery.of(context).size.width / 27;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Player Select'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: playersInfo.players.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                gamePreparation.selectPlayer(playersInfo.players[index],position);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    showCircleImage("${documentPath.value}/players/${playersInfo.players[index].id}.jpg", iconRadius),
                    const SizedBox(width: 32.0),
                    Text(playersInfo.players[index].name, style: TextStyle(fontSize: normalFontSize),)
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}


