import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';

import '../providers/isar_provider.dart';
import '../providers/player_provider.dart';

class PlayerEditScreen extends ConsumerWidget {
  PlayerEditScreen(this.id, {Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final formKey = GlobalKey<FormState>();
    final player = ref.watch(playerProvider(id).notifier);
    final playerInfo = ref.watch(playerProvider(id));
    final players = ref.watch(playerListProvider.notifier);
    final documentPath = ref.watch(documentPathProvider);
    playerInfo.playerNameInputController.text = playerInfo.editName;

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: const Text('Player Edit'),
        actions: [
          // Consumer(builder: (context, ref, _) {
            IconButton(
              icon: const Icon(Icons.save),
              color: Colors.white,
              onPressed: () async => {
                if (!formKey.currentState!.validate()) {

                } else if(!player.checkEditForm()) {
                  ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('画像が設定されていません。'))
                  )
                } else {
                  await player.update(name: playerInfo.playerNameInputController.text),
                  player.updateShowPreview(false),
                  players.resetPlayerListState(),
                  Navigator.of(context).pop()
                }
              },
            )
          // })
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
                  child: showEditProfileImage(playerInfo.imagePath!, "${documentPath.value}/players/preview.jpg", playerInfo.showPreview)
                  // })
              ),
              SizedBox(
                width: 200,
                child: TextFormField(
                  controller: playerInfo.playerNameInputController,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    if (value.length > 20) {
                      return '20文字以下にしてください';
                    }
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 10,
              ),
                ElevatedButton(
                  onPressed: () async {
                    player.updateName();
                    await getPictureImage(player);
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.orange,
                    onPrimary: Colors.white,
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

  Widget showEditProfileImage(String imagePath, String previewImagePath, bool showPreview) {
    if (showPreview) {
      var a = File(previewImagePath);
      return CircleAvatar(
        backgroundImage: MemoryImage(a.readAsBytesSync()),
      );
    } else {
      var a = File(imagePath);
      return CircleAvatar(
        backgroundImage: MemoryImage(a.readAsBytesSync()),
      );
    }
  }

  Future<void> getPictureImage(PlayerStateNotifier playerStateNotifier) async {
    ImagePicker picker = ImagePicker();
    PickedFile? xFile = await picker.getImage(source: ImageSource.gallery);
    var dir = Directory("${(await getApplicationDocumentsDirectory()).path}/players");
    if (!(await dir.exists())) {
      dir.create();
    }
    String previewPath = "${dir.path}/preview.jpg";
    File previewFile = File(previewPath);
    if (xFile != null) {
      File file = File(xFile.path);
      Uint8List byteData = await file.readAsBytes();
      await previewFile.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      playerStateNotifier.updateShowPreview(true);
    }
  }
}
