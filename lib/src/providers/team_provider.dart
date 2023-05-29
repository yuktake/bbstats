import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';

import '../collections/team/team.dart';
import '../collections/team/team_model.dart';
import '../repositories/team_repository.dart';

class TeamStateNotifier extends StateNotifier<TeamModel> {
  TeamStateNotifier(
      this.teamRepository,
      this.teamId
  ) : super(
      TeamModel(
        name: teamRepository.getTeamName(teamId) ?? "",
        editName: teamRepository.getTeamName(teamId) ?? "",
        teamNameInputController: TextEditingController(),
        image: null,
        showPreview: false,
      )
    );
  final TeamRepository teamRepository;
  final int teamId;

  Future<void> resetTeamState() async {
    state.teamNameInputController.text = '';
    state = state.copyWith(
      name: "",
      image: null,
      showPreview: false,
    );
  }

  void setEditState(String imagePath) {
    state = state.copyWith(
      showPreview: false,
      image: imagePath,
      editName: teamRepository.getTeamName(teamId) ?? "",
    );
  }

  bool checkForm() {
    if (state.showPreview == true) {
      return true;
    }

    return false;
  }

  void updateName() {
    state = state.copyWith(
      editName: state.teamNameInputController.text,
    );
  }

  void updateShowPreview(bool result)  {
    state = state.copyWith(
      showPreview: result,
    );
  }

  Future<void> showImage({required int id}) async {
    var teamImagePath = "${(await getApplicationDocumentsDirectory()).path}/teams/$id.jpg";
    state = state.copyWith(
      image: teamImagePath,
    );
  }

  Future<void> add({required String name}) async {
    int teamId = teamRepository.addTeam(name: name);
    String logoPath = "${(await getApplicationDocumentsDirectory()).path}/teams/$teamId.jpg";
    String previewPath = "${(await getApplicationDocumentsDirectory()).path}/teams/preview.jpg";
    File previewFile = File(previewPath);
    File logoFile = File(logoPath);
    Uint8List byteData = await previewFile.readAsBytes();
    await logoFile.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    Team? team = teamRepository.findTeam(teamId);
    await teamRepository.updateImage(team!);
  }

  Future<void> update({required int id, required String name}) async {
    Team? team = teamRepository.findTeam(id);
    await teamRepository.updateTeam(team: team!, name: name);
    state = state.copyWith(
      name: name,
    );

    if (state.showPreview) {
      String logoPath = "${(await getApplicationDocumentsDirectory()).path}/teams/$id.jpg";
      String previewPath = "${(await getApplicationDocumentsDirectory()).path}/teams/preview.jpg";
      File logoFile = File(logoPath);
      File previewFile = File(previewPath);
      Uint8List byteData = await previewFile.readAsBytes();
      await logoFile.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
    }

    state = state.copyWith(
      name: name,
      showPreview: false
    );
  }
}