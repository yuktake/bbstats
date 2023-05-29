import 'dart:io';

import 'package:bb_stats/src/screens/player_new.dart';
import 'package:bb_stats/src/screens/player_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/isar_provider.dart';

class PlayersScreen extends ConsumerWidget {
  const PlayersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final players = ref.watch(playerListProvider.notifier);
    final playersInfo = ref.watch(playerListProvider);
    final player = ref.watch(playerProvider(0).notifier);
    final documentPath = ref.watch(documentPathProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Players'),
        actions: [
          playersInfo.visible ?
          IconButton(
            icon: const Icon(Icons.visibility_off),
            onPressed: () => {
              players.updateVisible(false)
            },
          ) :
          IconButton(
            icon: const Icon(Icons.visibility),
            onPressed: () => {
              players.updateVisible(true)
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => {
              player.setNewState(),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const PlayerNewScreen(0),
                ),
              )
            },
          ),
        ],
      ),
      body: GridView.count(
        crossAxisCount: 4,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        children:
        playersInfo.players.isEmpty ? [] : playersInfo.players.asMap().entries.map((id){
          int index = id.key;
          return GestureDetector(
            onTap: (){
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PlayerProfile(playersInfo.players[index].id),
                ),
              );
            },
            child: showPlayerImage("${documentPath.value}/players/${playersInfo.players[index].id}.jpg"),
          );
        }).toList()
        ,
      ),
    );
  }

  Widget showPlayerImage(String imagePath) {
    var a = File(imagePath);
    return CircleAvatar(
      backgroundImage: MemoryImage(a.readAsBytesSync()),
    );
  }
}


