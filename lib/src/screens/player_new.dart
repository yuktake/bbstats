import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import '../providers/isar_provider.dart';
import '../providers/player_provider.dart';

class PlayerNewScreen extends ConsumerWidget {
  const PlayerNewScreen(this.id, {Key? key}) : super(key: key);

  final int id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scaffoldKey = GlobalKey<ScaffoldState>();
    final formKey = GlobalKey<FormState>();
    final player = ref.watch(playerProvider(id).notifier);
    final playerInfo = ref.watch(playerProvider(id));
    final playerList = ref.watch(playerListProvider.notifier);
    final documentPath = ref.watch(documentPathProvider);

    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          title: const Text('Register Player'),
          actions: [
            IconButton(
                icon: const Icon(Icons.save),
                color: Colors.white,
                onPressed: () async => {
                  if (!formKey.currentState!.validate()) {

                  } else if(!player.checkForm()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('画像が設定されていません。'))
                    )
                  } else {
                    await player.add(name: playerInfo.playerNameInputController.text,),
                    player.resetPlayerState(),
                    playerList.resetPlayerListState(),
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
                    width: MediaQuery.of(context).size.width/4,
                    height: MediaQuery.of(context).size.width/4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: showPlayerNewImage("${documentPath.value}/players/preview.jpg", playerInfo.showPreview, 50)
                    // })
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width/2,
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
                Consumer(builder: (context, ref, _) {
                  final player = ref.watch(playerProvider(id).notifier);
                  return ElevatedButton(
                    onPressed: () async {
                      await getPictureImage(player);
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.orange,
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

  Widget showPlayerNewImage(String previewImagePath, bool showPreview, double radius) {
    if (showPreview) {
      var a = File(previewImagePath);
      return CircleAvatar(
        backgroundImage: MemoryImage(a.readAsBytesSync()),
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

  Future<void> getPictureImage(PlayerStateNotifier playerStateNotifier) async {
    ImagePicker picker = ImagePicker();
    PickedFile? xfile = await picker.getImage(source: ImageSource.gallery);
    var dir = Directory("${(await getApplicationDocumentsDirectory()).path}/players");
    if (!(await dir.exists())) {
      dir.create();
    }
    String previewPath = "${dir.path}/preview.jpg";
    File previewFile = File(previewPath);
    if (xfile != null) {
      File file = File(xfile.path);
      Uint8List byteData = await file.readAsBytes();
      await previewFile.writeAsBytes(byteData.buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
      playerStateNotifier.updateShowPreview(true);
    }
  }
}
