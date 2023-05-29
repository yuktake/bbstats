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
                    child: showTeamNewImage(null, "${documentPath.value}/teams/preview.jpg", teamInfo.showPreview, 50.0)
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
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
                    style: ElevatedButton.styleFrom(
                      primary: Colors.orange,
                      onPrimary: Colors.white,
                    ),
                    child: const Text("画像選択"),
                  );
                }),
              ],
            ),
          ),
        )
    );
  }

  Widget showTeamNewImage(String? imagePath, String previewImagePath, bool showPreview, double radius) {
    if (showPreview) {
      var a = File(previewImagePath);
      return CircleAvatar(
        backgroundImage: MemoryImage(a.readAsBytesSync()),
        radius: radius,
      );
    } else if(imagePath != null) {
      var a = File(imagePath);
      return CircleAvatar(
        backgroundImage: AssetImage(a.readAsStringSync()),
        radius: radius,
      );
    } else {
      return CircleAvatar(
        radius: radius,
        backgroundColor: Colors.blue,
        child: const Text('No Image'),
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