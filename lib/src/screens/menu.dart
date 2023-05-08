import 'package:bb_stats/src/screens/setting_details.dart';
import 'package:flutter/material.dart';

import '../components/setting_row.dart';

class MenuScreen extends StatelessWidget {

  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const SettingDetailsScreen(),
                  ),
                );
              },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for(int i = 0; i < sidebarItems.length; i++) ... {
                sidebarItems.last == sidebarItems[i] ? const Spacer() : Container(),
                SidebarRow(item: sidebarItems[i])
              }
            ],
          ),
      )
    );
  }
}