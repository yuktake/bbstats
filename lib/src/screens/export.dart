import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:share_plus/share_plus.dart';

class ExportScreen extends ConsumerWidget {
  ExportScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final documentPath = ref.watch(documentPathProvider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Export'),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              ElevatedButton(
                onPressed: () {
                  Share.shareXFiles([XFile('${documentPath.value}/csvs/test.csv', name: 'test.csv')], subject: 'title', text: 'Great picture');
                },
                child: const Text("Mail"),
                style: ElevatedButton.styleFrom(
                  primary: Colors.orange,
                  onPrimary: Colors.white,
                ),
              )
            ],
          ),
        )
    );
  }
}

