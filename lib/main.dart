import 'dart:io';

import 'package:bb_stats/src/collections/boxscore/boxscore.dart';
import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/pbp/pbp.dart';
import 'package:bb_stats/src/collections/player/player.dart';
import 'package:bb_stats/src/collections/team/team.dart';
import 'package:bb_stats/src/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'src/app.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Common.initialize();
  final dir = await getApplicationSupportDirectory();
  var path = dir.path;

  final isar = await Isar.open(
    [
      TeamSchema,
      // TeamHistorySchema,
      // TeamStatSchema,
      PlayerSchema,
      // PlayerHistorySchema,
      // PlayerStatSchema,
      GameSchema,
      BoxscoreSchema,
      PbpSchema,
    ],
    directory: path,
    inspector: true,
  );

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  bool first = prefs.getBool("first") ?? true;
  if (first) {
    await _initTeam(isar);
    await createDefaultTeamImageFromAssets("logos/default.png");

    prefs.setBool('first', false);
  }

  runApp(MyApp(isar: isar,));

  FlutterNativeSplash.remove();
}

Future<int> count() async {
  int count = 0;

  for (int i = 0; i < 1000000; i++) {
    count++;
  }

  await Future.delayed(Duration(seconds: 3));
  return count;
}

Future<void> _initTeam(Isar isar) async {
  try {
    final now = DateTime.now();

    final team = Team()
      ..name = "YOUR TEAM"
    ;

    // final teamStat = TeamStat()
    //   ..ppg = 0.0
    //   ..rpg = 0.0
    //   ..apg = 0.0
    //   ..oppg = 0.0
    //   ..createdAt = now
    //   ..updatedAt = now
    // ;

    isar.writeTxn(() async {
      await isar.teams.put(team);
      // await isar.teamStats.put(teamStat);
    });

    // final teamHistory = TeamHistory()
    //   ..team.value = team
    //   ..stat.value = teamStat
    //   ..season = 2022
    //   ..createdAt = now
    //   ..updatedAt = now
    // ;

    // isar.writeTxn(() async {
    //   await isar.teamHistorys.put(teamHistory);
    //   await teamHistory.team.save();
    //   await teamHistory.stat.save();
    // });

  } catch (e) {
    // debugPrint(e.toString());
  }
}

Future<File> createDefaultTeamImageFromAssets(String path) async {
  final byteData = await rootBundle.load('assets/$path');
  final data = byteData.buffer.asUint8List();
  var dir = Directory("${(await getApplicationDocumentsDirectory()).path}/teams");
  if (!(await dir.exists())) {
    dir.create();
  }
  final file = File('${(await getApplicationDocumentsDirectory()).path}/teams/1.jpg');
  await file.writeAsBytes(data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes));

  var csvDir = Directory("${(await getApplicationDocumentsDirectory()).path}/csvs");
  if (!(await csvDir.exists())) {
    csvDir.create();
  }
  // final csvFile = File('${(await getApplicationDocumentsDirectory()).path}/csvs/test.csv');
  // await csvFile.writeAsString('aaa,bbb');

  return file;
}