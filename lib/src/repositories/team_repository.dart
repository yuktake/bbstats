import 'dart:async';

import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';

import '../collections/team/team.dart';

class TeamRepository {
  TeamRepository(this.isar) {
    // Player一覧の変化を監視してストリームに流す
    isar.teams.watchLazy().listen((_) async {
      if (!isar.isOpen) {
        return;
      }
      if (_teamStreamController.isClosed) {
        return;
      }
      _teamStreamController.sink.add(await findTeams());
    });
  }

  /// Isarインスタンス
  final Isar isar;

  /// player一覧を監視したい場合はplayerStreamをlistenしてもらう
  final _teamStreamController = StreamController<List<Team>>.broadcast();
  Stream<List<Team>> get teamStream => _teamStreamController.stream;

  /// 終了処理
  void dispose() {
    _teamStreamController.close();
  }

  /// チームを検索する
  List<Team> findTeams() {
    if (!isar.isOpen) {
      return [];
    }

    // デフォルトのソートはidの昇順
    return isar.teams.where().idNotEqualTo(1).findAllSync();
  }

  Team? findTeam(int id) {
    if (!isar.isOpen) {
      return null;
    }

    final team = isar.teams.where().idEqualTo(id).findFirstSync();

    // デフォルトのソートはidの昇順
    return team;
  }

  String? getTeamName(int id) {
    if (!isar.isOpen) {
      return "";
    }
    final name =  isar.teams.where().idEqualTo(id).nameProperty().findFirstSync();

    return name;
  }

  String? getMyTeamName() {
    if (!isar.isOpen) {
      return "";
    }
    final name =  isar.teams.where().idEqualTo(1).nameProperty().findFirstSync();

    return name;
  }

  Future<String?> getMyTeamImage() async {
    if (!isar.isOpen) {
      return null;
    }

    String avatarPath = "${(await getApplicationDocumentsDirectory()).path}/teams/1.jpg";
    return avatarPath;
  }

  /// Playerを追加する
  int addTeam({
    required String name,
  }) {
    if (!isar.isOpen) {
      return 0;
    }

    final team = Team()
      ..name = name;

    isar.writeTxnSync(() {
      isar.teams.putSync(team);
    });

    return team.id;
  }

  /// Teamを更新する
  Future<void> updateTeam({
    required Team team,
    required String name,
  }) {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    team.name = name;
    return isar.writeTxn(() async {
      await isar.teams.put(team);
    });
  }

  Future<void> updateImage (Team team) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }
    return isar.writeTxn(() async {
      await isar.teams.put(team);
    });
  }

  /// Teamを削除する
  Future<bool> deleteTeam(Team team) async {
    if (!isar.isOpen) {
      return false;
    }

    return isar.writeTxn(() async {
      return isar.teams.delete(team.id);
    });
  }
}