import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../collections/player/player_model.dart';
import '../collections/team/team.dart';
import '../repositories/player_repository.dart';
import '../repositories/team_repository.dart';

class PlayerStateNotifier extends StateNotifier<PlayerModel> {
  PlayerStateNotifier(
      this.teamRepository,
      this.playerRepository,
      this.playerId
  ) : super(PlayerModel(
    name: playerId == 0 ? "" : playerRepository.getName(playerId),
    editName: playerId == 0 ? "" : playerRepository.getName(playerId),
    playerNameInputController: TextEditingController(),
    showPreview: false,
    imagePath: null,
    visible: playerId == 0 ? true : playerRepository.getVisible(playerId),
  ));

  final TeamRepository teamRepository;
  final PlayerRepository playerRepository;
  final int playerId;

  void updateShowPreview(bool result) {
    state = state.copyWith(
      showPreview: result,
    );
  }

  void resetPlayerState() {
    state.playerNameInputController.text = '';
    state = state.copyWith(
      name: '',
      showPreview: false,
    );
  }

  void updateName() {
    state = state.copyWith(
      editName: state.playerNameInputController.text,
    );
  }

  void setNewState() {
    state.playerNameInputController.text = '';
    state = state.copyWith(
      showPreview: false,
      imagePath: null,
      name: '',
    );
  }

  void setEditState(String imagePath) {
    state = state.copyWith(
      showPreview: false,
      imagePath: imagePath,
      editName: playerRepository.getName(playerId),
    );
  }

  Future<void> add({
    required String name,
  }) async {
    Team? team = teamRepository.findTeam(1);
    int playerId = playerRepository.addPlayer(team: team!, name: name);
    String avatarPath = "${(await getApplicationDocumentsDirectory()).path}/players/$playerId.jpg";
    String avatarPreviewPath = "${(await getApplicationDocumentsDirectory()).path}/players/preview.jpg";
    File previewFile = File(avatarPreviewPath);
    File avatarFile = File(avatarPath);
    Uint8List byteData = await previewFile.readAsBytes();
    await avatarFile.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }

  Future<void> update({
    required String name,
  }) async {
    playerRepository.updatePlayer(id:playerId, name: name);
    state = state.copyWith(
      name: name,
    );
    if (state.showPreview) {
      String avatarPath = "${(await getApplicationDocumentsDirectory()).path}/players/$playerId.jpg";
      String avatarPreviewPath = "${(await getApplicationDocumentsDirectory()).path}/players/preview.jpg";
      File previewFile = File(avatarPreviewPath);
      File avatarFile = File(avatarPath);
      Uint8List byteData = await previewFile.readAsBytes();
      await avatarFile.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }
  }

  bool checkForm() {
    if (state.showPreview == true) {
      return true;
    }
    return false;
  }

  bool checkEditForm() {
    if (state.imagePath != null ) {
      return true;
    }
    return false;
  }

  void updateVisible(bool visible) {
    playerRepository.updateVisible(playerId, visible);
    state = state.copyWith(
      visible: visible
    );
  }
}