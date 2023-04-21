import 'package:bb_stats/src/screens/players.dart';
import 'package:bb_stats/src/screens/setting_details.dart';
import 'package:flutter/material.dart';

import '../screens/export.dart';
import '../screens/team_profile.dart';

class SidebarRow extends StatelessWidget {
  SidebarRow({required this.item});

  final SidebarItem item;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: GestureDetector(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => item.screen,
              ),
            );
          },
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 42.0,
                    height: 42.0,
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(14.0),
                      gradient: item.background,
                    ),
                    child: item.icon,
                  ),
                  const SizedBox(width: 24),
                  Text(
                    item.title,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF242629),
                    ),
                  ),
                  const Spacer(),
                  const Icon(Icons.chevron_right),
                ],
              ),
              const SizedBox(
                height: 8.0,
              ),
              Container(
                height: 1,
                decoration: const BoxDecoration(
                  color:Colors.lightBlue,
                ),
                // width: MediaQuery.of(context).size.width,
              )
            ]
          ),
        ),
      )
    ;
  }
}

class SidebarItem {
  SidebarItem({required this.title, required this.background, required this.icon, required this.screen});

  String title;
  LinearGradient background;
  Icon icon;
  Widget screen;
}

var sidebarItems = [
  SidebarItem(
    title: "Our Team",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [
        Color(0xFF00AEFF),
        Color(0xFF0076FF),
      ],
    ),
    icon: const Icon(
      Icons.group,
      color: Colors.white,
    ),
    screen: const TeamProfile(1),
  ),
  SidebarItem(
    title: "Players",
    background: const LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xFFFA7d75), Color(0xFFC23D61)]),
    icon: const Icon(
      Icons.face,
      color: Colors.white,
    ),
    screen: const PlayersScreen(),
  ),
  // SidebarItem(
  //   title: "Opponent Teams",
  //   background: const LinearGradient(
  //     begin: Alignment.topLeft,
  //     end: Alignment.bottomRight,
  //     colors: [Color(0xFF434244), Color(0xFF101013)],
  //   ),
  //   icon: const Icon(
  //     Icons.folder_shared,
  //     color: Colors.white,
  //   ),
  //   screen: const PlayersScreen(),
  // ),
  // SidebarItem(
  //   title: "Data Export",
  //   background: const LinearGradient(
  //       begin: Alignment.topLeft,
  //       end: Alignment.bottomRight,
  //       colors: [Color(0xFFFAD64A), Color(0xFFEA880F)]),
  //   icon: const Icon(
  //     Icons.import_export,
  //     color: Colors.white,
  //   ),
  //   screen: ExportScreen(),
  // ),
  SidebarItem(
    title: "Setting Details",
    background: const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment.bottomRight,
      colors: [Colors.orangeAccent, Colors.deepOrangeAccent],
    ),
    icon: const Icon(
      Icons.settings,
      color: Colors.white,
    ),
    screen: const SettingDetailsScreen(),
  ),

  // SidebarItem(
  //   title: "Agreement",
  //   background: const LinearGradient(
  //     begin: Alignment.topLeft,
  //     end: Alignment.bottomRight,
  //     colors: [Color(0xFF4E62CC), Color(0xFF202A78)],
  //   ),
  //   icon: const Icon(
  //     Icons.article,
  //     color: Colors.white,
  //   ),
  //   screen: const PlayersScreen(),
  // ),
];