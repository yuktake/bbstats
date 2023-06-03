import 'package:bb_stats/src/screens/team_edit.dart';
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

    double iconRadius = MediaQuery.of(context).size.height * 0.07;
    double normalFontSize = MediaQuery.of(context).size.width / 27;

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
                    showCircleImage("${documentPath.value}/teams/${teamsInfo.teams[index].id}.jpg", iconRadius),
                    const SizedBox(width: 32.0),
                    Text(teamsInfo.teams[index].name, style: TextStyle(fontSize: normalFontSize))
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
