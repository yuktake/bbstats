import 'package:bb_stats/src/screens/team_new.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/isar_provider.dart';

class TeamsSelectScreen extends ConsumerWidget {
  const TeamsSelectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final gamePreparation = ref.watch(gamePreparationProvider.notifier);
    final team = ref.watch(teamProvider(0).notifier);
    final teamsInfo = ref.watch(teamsSelectProvider);
    final documentPath = ref.watch(documentPathProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Team Select'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () => {
              team.resetTeamState(),
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const TeamNewScreen(),
                ),
              )
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: teamsInfo.teams.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                gamePreparation.selectOpponent(teamsInfo.teams[index]);
                gamePreparation.updateHistories(teamsInfo.teams[index]);
                Navigator.of(context).pop();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundImage: AssetImage("${documentPath.value}/teams/${teamsInfo.teams[index].id}.jpg"),
                    ),
                    const SizedBox(width: 32.0),
                    Text(teamsInfo.teams[index].name)
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
