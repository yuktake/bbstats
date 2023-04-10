import 'dart:async';
import 'dart:io';

import 'package:bb_stats/src/collections/player/player.dart';
import 'package:isar/isar.dart';

import '../collections/playerHistory/player_history.dart';

class PlayerHistoryRepository {
  PlayerHistoryRepository(this.isar);

  /// Isarインスタンス
  final Isar isar;

  List<Player> getAllPlayers() {
    if (!isar.isOpen) {
      return [];
    }

    final players = isar.players.filter().nameIsNotEmpty().findAllSync();
    // for (final player in players) {
    //   history.player.loadSync();
    //   history.stat.loadSync();
    //   // history.boxscores.loadSync();
    // }

    return players;
  }

  Player? getPlayer(int playerId) {
    if (!isar.isOpen) {
      return null;
    }
    final player = isar.players.filter().idEqualTo(playerId).findFirstSync();
    return player;
  }

  Future<void> addPlayerHistory({
    required Player player,
  }) async {
    if (!isar.isOpen) {
      return Future<void>(() {});
    }

    final now = DateTime.now();
    // final playerHistory = PlayerHistory()
    //   ..player.value = player
    //   ..season = now.year
    //   ..createdAt = now
    //   ..updatedAt = now
    // ;
    // await player.histories.load();
    // player.histories.add(playerHistory);

    // isar.writeTxnSync(() {
    //   // player.histories.save();
    //   isar.playerHistorys.put(playerHistory);
    //   // IsarLinkでリンクされているカテゴリを保存する必要がある
    //   playerHistory.player.save();
    // });
    // print(player.histories);
  }
}