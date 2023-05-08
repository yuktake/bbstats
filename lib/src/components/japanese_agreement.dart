import 'package:flutter/material.dart';

class JapaneseAgreement extends StatelessWidget {
  const JapaneseAgreement({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Image.asset(
                'assets/logos/team_logo.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              const Text("このアプリはあなたの（応援している）チームの試合データを記録することを目的としたアプリです。"),
              const Text(
                '※現状、本アプリにはデータ引き継ぎ機能がないため、CSV出力機能でのみデータを取り出すことができます。',
                style: TextStyle(
                    color: Colors.red
                ),
              ),

              // Tutorial1

              // Tutorial2

              // Tutorial3
            ],
          ),
        )
    );
  }

}