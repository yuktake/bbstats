import 'package:bb_stats/src/components/english_about.dart';
import 'package:bb_stats/src/components/japanese_about.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AboutPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return AboutPageState();
  }
}

class AboutPageState extends State<AboutPage> {

  final _screens = [
    JapaneseAbout(),
    EnglishAbout(),
  ];

  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('About'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                      child: CupertinoSegmentedControl(
                          children: const {
                            0: Text('日本語'),
                            1: Text('English'),
                          },
                          groupValue: _selectedIndex,
                          onValueChanged: (int value) {
                            _onItemTapped(value);
                          }
                      ),
                  )
                ],
              ),
              _screens[_selectedIndex],
            ],
          ),
        )
    );
  }
  
}