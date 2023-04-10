import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../providers/isar_provider.dart';
import '../providers/team_provider.dart';

class TeamNewScreen extends ConsumerWidget {
  const TeamNewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = GlobalKey<FormState>();
    // final teamNameInputController = TextEditingController();

    final teamInfo = ref.watch(teamProvider(0));
    final documentPath = ref.watch(documentPathProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Team New'),
          actions: [
            Consumer(builder: (context, ref, _) {
              final team = ref.watch(teamProvider(0).notifier);
              final teamList = ref.watch(teamsSelectProvider.notifier);
              return IconButton(
                icon: const Icon(Icons.save),
                onPressed: () async => {
                  if (!formKey.currentState!.validate()) {

                  } else if(!team.checkForm()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('画像を入力してください'))
                    )
                  } else {
                    await team.add(name: teamInfo.teamNameInputController.text),
                    await team.resetTeamState(),
                    teamList.updateTeamListState(),
                    Navigator.of(context).pop()
                  }
                },
              );
            }),
          ],
        ),
        body: Center(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    width: 100,
                    height: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: showProfileImage(null, "${documentPath.value}/teams/preview.jpg", teamInfo.showPreview )
                ),
                Container(
                  width: 100,
                  child: TextFormField(
                    controller: teamInfo.teamNameInputController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return '入力してください';
                      }
                      return null;
                    }
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer(builder: (context, ref, _) {
                  final team = ref.watch(teamProvider(0).notifier);
                  return ElevatedButton(
                    onPressed: () async {
                      await getPictureImage(team);
                    },
                    child: Text("画像選択"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                    ),
                  );
                }),
              ],
            ),
          ),
        )
    );
  }

  // Widget showProfileImage(File? image, File? previewImage) {
  Widget showProfileImage(String? imagePath, String previewImagePath, bool showPreview) {
    if (showPreview) {
      return CircleAvatar(
        // backgroundImage: AssetImage(previewImage.path),
        backgroundImage: AssetImage(previewImagePath),
      );
    } else if(imagePath != null) {
      return CircleAvatar(
        // backgroundImage: AssetImage(image.path),
        backgroundImage: AssetImage(imagePath),
      );
    } else {
      return const CircleAvatar(
        radius: 50,
        backgroundColor: Colors.blue,
        child: Text('No Image'),
      );
    }
  }

  Future<void> getPictureImage(TeamStateNotifier teamStateNotifier) async {
    ImagePicker picker = ImagePicker();
    PickedFile? xfile = await picker.getImage(source: ImageSource.gallery);
    // XFile? xfile = await picker.pickImage(source: ImageSource.gallery);

    String previewPath = "${(await getApplicationDocumentsDirectory()).path}/teams/preview.jpg";
    File previewFile = File(previewPath);
    if (xfile != null) {
      File file = File(xfile.path);
      Uint8List byteData = await file.readAsBytes();
      await previewFile.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      teamStateNotifier.updateShowPreview(true);
    }
  }
}