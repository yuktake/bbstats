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

    var isChecked = List.filled(playersInfo.players.length, false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Player Select'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: playersInfo.players.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                gamePreparation.selectPlayer(playersInfo.players[index],position);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      // backgroundImage: AssetImage(playersInfo.players[index].image == null ? "assets/logos/default.png" : playersInfo.players[index].image!.path),
                      backgroundImage: AssetImage("${documentPath.value}/players/${playersInfo.players[index].id}.jpg"),
                    ),
                    SizedBox(width: 32.0),
                    Text(playersInfo.players[index].name)
                  ],
                ),
              ),
            );
          },
        ),

        // child: ListView(
        //   children: [
        //     for (var i = 0; i < playersInfo.playerHistories.length; i++)
        //       CheckboxListTile(
        //         title: Text(playersInfo.playerHistories[i].player.value!.name),
        //         secondary: CircleAvatar(
        //           radius: 40,
        //           backgroundImage: AssetImage("${documentPath.value}/players/${playersInfo.playerHistories[i].player.value!.id}.jpg"),
        //         ),
        //         value: isChecked[i],
        //         onChanged: (bool? value) {
        //           isChecked[i] = value!;
        //         },
        //         controlAffinity: ListTileControlAffinity.leading,
        //     )
        //   ],
        // ),
      ),
    );
  }
}


