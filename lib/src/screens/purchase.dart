import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PurchaseScreen extends ConsumerWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Advantages For Purchasing'),
        ),
        body: const SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    '・Export CSV',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF242629),
                    ),
                  ),
                ),
                Text('You can output stats in CSV format for team, player, and game.'),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                      'Team stats: (Our Team Screen)',
                      style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF242629))
                  )
                ),
                Text('・Overall stats'),
                Text('・Stats by wins and losses'),
                Text('・Stats by PlayType'),
                Text('・Stats by ShotZone'),
                Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Player stats: (Players Screen)', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF242629)))
                ),
                Text('・Overall stats'),
                Text('・Stats by ShotType'),
                Text('・Stats by ShotZone'),
                Text('・Assisted Stats'),
                Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Game stats: ', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF242629)))
                ),
                Text('・BoxScores(Game Screen/Box Score Tab)'),
                Text('・PlayByPlay Data(Game Screen/Play-By-Play Tab)'),

                Padding(
                  padding: EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "この機能は有料化の予定です",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),

                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "This feature is scheduled to be paid for",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                ),
              ]
            )
          )
        )
    );
  }

}