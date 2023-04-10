import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingDetailsScreen extends ConsumerWidget {
  const SettingDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingDetails = ref.watch(settingDetailsProvider.notifier);
    final settingDetailsInfo = ref.watch(settingDetailsProvider);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Setting Details'),
          actions: [
            IconButton(
              icon: const Icon(Icons.save),
              onPressed: () => {
                settingDetails.save()
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Minutes Per Quarter"),
                  DropdownButton(
                    items: [
                      for(int i = 24; i > 0; i--) ... {
                        DropdownMenuItem(
                          value:  i,
                          child: Text(i.toString()),
                        )
                      }
                    ],
                    onChanged: (int? value) {
                      settingDetails.updateQuarterMinState(value!);
                    },
                    value: settingDetailsInfo.quarterMin,
                  ),
                ],
              )
            ],
          ),
        ),
    );
  }
}