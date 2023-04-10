import 'package:flutter/material.dart';

import '../components/setting_row.dart';

class SettingScreen extends StatelessWidget {

  const SettingScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                width: MediaQuery.of(context).size.width,
                height: 100,
                child: Text(
                    "General",
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF242629),
                    ),
                )
              ),
              for (final sidebarItem in sidebarItems)
                SidebarRow(item: sidebarItem)
            ],
          ),
        ),
      )
    );
  }
}