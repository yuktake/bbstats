import 'package:flutter/material.dart';

class JapaneseAbout extends StatelessWidget {
  const JapaneseAbout({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/logos/team_logo.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
            ],
          ),
          const Text("このアプリはあなたの（応援している）チームの試合データを記録することを目的としたアプリです。"),
          const Text(
            '※現状、本アプリにはデータ引き継ぎ機能がないため、CSV出力機能(有料)でのみデータを取り出すことができます。',
            style: TextStyle(
              color: Colors.red
            ),
          ),

          // Tutorial1
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              '1.チーム・選手情報の登録',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.w800,
                color: Color(0xFF242629),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(""
                "試合を記録するためには、あなたのチーム名とプレイをする選手が必要です。\n"
                "Menuタブにある\n"
                "「Our Team」からチーム名とチームのロゴ\n"
                "「Players」から選手を登録してください。"
            ),
          ),

          // Tutorial2
          const Text(
            '2.ゲームの設定',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
              color: Color(0xFF242629),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(""
                "あなたが所属するリーグによってゲームのルールは異なります。\n"
                "現在アプリでは1クォータの時間を変更することができるようになっています。\n"
                "Menuタブの右上にある歯車マークから\n"
                "Minutes Per Quarterを変更し、右上のボタンで変更を保存してください。\n"
                "※1クォータの時間は試合ごとに保存されるため、途中でクォータ時間を変更しても過去のゲームに影響はありません。"
            ),
          ),

          // Tutorial3
          const Text(
            '3.ゲームの準備',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
              color: Color(0xFF242629),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top:4.0),
            child: Text(""
                "ゲームを作成する準備ができました。\n"
                "GAMEタブに移動し、必要な情報を入力しましょう"
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
                'ゲーム情報の設定',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF242629),
                )
            ),
          ),
          const Text(
              "画面上部中央にある日付をタップして、試合を行う日付を変更しましょう。\n"
              "また、今回の試合の1クォータあたりの時間も必要に応じて変更してください。\n"
              "※最初に表示されているクォータの時間は設定画面から設定した分数を表示しています。"
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
                '対戦相手の選択',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF242629),
                )
            ),
          ),
          const Text(
              "敵チームの選択は画面右上の?の画像をタップすることで敵チームの一覧が表示されます。\n"
              "今回初めての対戦相手の場合は、右上の+から新しい敵チームを登録してください。\n"
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
                'スターターの選択',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF242629),
                )
            ),
          ),
          const Text(
              "敵チームの登録ができたら、スターターの設定です。\n"
              "画面中央にある5つの円をタップし、選手一覧からスターターを選択してください。\n"
              "もちろん、同じ選手を2人以上選択していると試合を始めることができません。\n"
              "入力が全てできていれば、画面下部のボタンが青色になっているはずです。\n"
              "さぁ、試合を始めましょう"
          )
        ],
      ),
    );
  }

}