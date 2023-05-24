import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../providers/isar_provider.dart';
import '../providers/team_provider.dart';

class TeamEditScreen extends ConsumerWidget {
  const TeamEditScreen(
      this.id,
      {Key? key}
  ) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final formKey = GlobalKey<FormState>();
    final team = ref.watch(teamProvider(id).notifier);
    final teamInfo = ref.watch(teamProvider(id));
    final documentPath = ref.watch(documentPathProvider);
    teamInfo.teamNameInputController.text = teamInfo.editName;

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Team Edit'),
          actions: [
            Consumer(builder: (context, ref, _) {
              final team = ref.watch(teamProvider(id).notifier);
              return IconButton(
                icon: const Icon(Icons.save),
                onPressed: () async => {
                  if (formKey.currentState!.validate() && team.checkForm()) {
                    await team.update(id:id, name: teamInfo.teamNameInputController.text),
                    team.updateShowPreview(false),
                    Navigator.of(context).pop()
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('チーム画像を設定してください。'))
                    )
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
                  width: MediaQuery.of(context).size.width/4,
                  height: MediaQuery.of(context).size.width/4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: showProfileImage(teamInfo.image!, "${documentPath.value}/teams/preview.jpg", teamInfo.showPreview)
                ),
                // }),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
                  child: TextFormField(
                      controller: teamInfo.teamNameInputController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return '入力してください';
                        }
                        if (value.contains(' ') && value.trim() == '') {
                          return '空文字は受け付けていません。';
                        }
                        if (value.contains('　') && value.trim() == '') {
                          return '空文字は受け付けていません。';
                        }
                        if (value.length > 10) {
                          return '10文字以下にしてください';
                        }
                        return null;
                      },
                    )
                  // })
                ),
                const SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () async {
                      team.updateName();
                      await getPictureImage(team);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
                    ),
                    child: const Text("画像選択"),
                  )
                // }),
              ],
            ),
          ),
        )
    );
  }

  Widget showProfileImage(String imagePath, String previewImagePath, bool showPreview) {
    if (showPreview) {
      var a = File(previewImagePath);
      return CircleAvatar(
        radius: 50,
        backgroundImage: MemoryImage(a.readAsBytesSync()),
      );
    } else {
      var a = File(imagePath);
      return CircleAvatar(
        radius: 50,
        backgroundImage: MemoryImage(a.readAsBytesSync()),
      );
    }
  }

  Future<void> getPictureImage(TeamStateNotifier teamStateNotifier) async {
    ImagePicker picker = ImagePicker();
    PickedFile? xFile = await picker.getImage(source: ImageSource.gallery);
    var dir = Directory("${(await getApplicationDocumentsDirectory()).path}/teams");
    if (!(await dir.exists())) {
      dir.create();
    }
    String previewPath = "${dir.path}/preview.jpg";
    File previewFile = File(previewPath);
    if (xFile != null) {
      File file = File(xFile.path);
      Uint8List byteData = await file.readAsBytes();
      await previewFile.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      teamStateNotifier.updateShowPreview(true);
    }
  }
}
