import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tutorial'),
        automaticallyImplyLeading: false,
      ),
      body: OverBoard(
        pages: pages,
        showBullets: true,
        skipCallback: () {
          // when user select SKIP
          Navigator.pop(context);
        },
        finishCallback: () {
          // when user select NEXT
          Navigator.pop(context);
        },
      ),
    );
  }

  final pages = [
    PageModel(
        color: const Color(0xFF0097A7),
        imageAssetPath: 'assets/logos/team_logo.png',
        title: 'Screen 1',
        body: 'Share your ideas with the team',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF536DFE),
        imageAssetPath: 'assets/logos/opponent.png',
        title: 'Screen 2',
        body: 'See the increase in productivity & output',
        doAnimateImage: true),
    PageModel(
        color: const Color(0xFF9B90BC),
        imageAssetPath: 'assets/logos/default.png',
        title: 'Screen 3',
        body: 'Connect with the people from different places',
        doAnimateImage: true),
  ];
}