import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/english_agreement.dart';
import '../components/japanese_agreement.dart';

class AgreementPage extends StatefulWidget {
  const AgreementPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return AgreementPageState();
  }
}

class AgreementPageState extends State<AgreementPage> {

  final _screens = [
    const JapaneseAgreement(),
    const EnglishAgreement(),
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
          title: const Text('Agreement'),
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