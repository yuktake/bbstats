import 'dart:async';

import 'package:bb_stats/src/collections/boxscore/boxscore.dart';
import 'package:bb_stats/src/collections/game/game.dart';
import 'package:bb_stats/src/collections/player/player.dart';
import 'package:isar/isar.dart';
import '../collections/team/team.dart';

class PlayerRepository {
  PlayerRepository(this.isar) {
    // Player一覧の変化を監視してストリームに流す
    // isar.players.watchLazy().listen((_) async {
    //   if (!isar.isOpen) {
    //     return;
    //   }
    //   if (_playerStreamController.isClosed) {
    //     return;
    //   }
    //   _playerStreamController.sink.add(await findPlayers());
    // });
  }

  /// Isarインスタンス
  final Isar isar;

  /// player一覧を監視したい場合はplayerStreamをlistenしてもらう
  // final _playerStreamController = StreamController<List<Player>>.broadcast();
  // Stream<List<Player>> get memoStream => _playerStreamController.stream;
  //
  // /// 終了処理
  // void dispose() {
  //   _playerStreamController.close();
  // }

  List<Player> getAllPlayers(bool visible) {
    if (!isar.isOpen) {
      return [];
    }

    List<Player> players = isar.players.filter().visibleEqualTo(visible).findAllSync();
    for (final player in players) {
       player.team.loadSync();
    }

    // デフォルトのソートはidの昇順
    return players;
  }

  Player? getPlayer(int id) {
    if (!isar.isOpen) {
      return null;
    }

    final player = isar.players.where().idEqualTo(id).findFirstSync();

    if (player == null) {
      return null;
    }

    player.team.loadSync();

    return player;
  }

  List<Player> getOnCourtPlayersExceptMe(int gameId, int playerId) {
    if (!isar.isOpen) {
      return [];
    }

    List<Player> players = [];

    final boxScores = isar.boxscores.filter()
    .game((q) => q.idEqualTo(gameId))
    .onCourtEqualTo(true)
    .player((q) => q.not().idEqualTo(playerId))
    .findAllSync()
    ;

    for (final boxScore in boxScores) {
      players.add(boxScore.player.value!);
    }

    return players;
  }

  List<Player> getPlayersExceptMe(int playerId) {
    if (!isar.isOpen) {
      return [];
    }

    final players = isar.players.filter().not().idEqualTo(playerId).findAllSync();

    return players;
  }

  String getName(int id) {
    if (!isar.isOpen) {
      return "";
    }
    final name =  isar.players.where().idEqualTo(id).nameProperty().findFirstSync();

    return name ?? "";
  }

  bool getVisible(int id) {
    if (!isar.isOpen) {
      return true;
    }
    final visible =  isar.players.where().idEqualTo(id).visibleProperty().findFirstSync();
    if (visible == null) {
      return true;
    }

    return visible;
  }

  void updateVisible(int id, bool visible) {
    if (!isar.isOpen) {
      return;
    }

    final player = isar.players.filter().idEqualTo(id).findFirstSync();
    if (player == null) {
      return;
    }
    player.visible = visible;

    isar.writeTxnSync(() {
      isar.players.putSync(player);
    });
  }

  /// Playerを追加する
  int addPlayer({
    required Team team,
    required String name,
  }) {
    if (!isar.isOpen) {
      return 0;
    }

    final now = DateTime.now();
    final player = Player()
      ..team.value = team
      ..name = name
      ..visible = true
      ..createdAt = now
      ..updatedAt = now;


    isar.writeTxnSync(() {
       isar.players.putSync(player);
       player.team.saveSync();
    });

    return player.id;
  }

  /// Playerを更新する
  void updatePlayer({
    required int id,
    required String name,
  }) {
    if (!isar.isOpen) {
      return;
    }

    Player? player = isar.players.filter().idEqualTo(id).findFirstSync();
    if (player == null) {
      return;
    }

    final now = DateTime.now();
    player
      ..name = name
      ..updatedAt = now;
    return isar.writeTxnSync(()  {
      isar.players.putSync(player);
    });
  }

  /// Playerを削除する
  Future<bool> deletePlayer(Player player) async {
    if (!isar.isOpen) {
      return false;
    }

    return isar.writeTxn(() async {
      return isar.players.delete(player.id);
    });
  }

}