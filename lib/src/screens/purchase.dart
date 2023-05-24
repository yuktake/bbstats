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
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
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
                const Text('You can output stats in CSV format for team, player, and game.'),
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                      'Team stats: (Our Team Screen)',
                      style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF242629))
                  )
                ),
                const Text('・Overall stats'),
                const Text('・Stats by wins and losses'),
                const Text('・Stats by PlayType'),
                const Text('・Stats by ShotZone'),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Player stats: (Players Screen)', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF242629)))
                ),
                const Text('・Overall stats'),
                const Text('・Stats by ShotType'),
                const Text('・Stats by ShotZone'),
                const Text('・Assisted Stats'),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Game stats: ', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF242629)))
                ),
                const Text('・BoxScores(Game Screen/Box Score Tab)'),
                const Text('・PlayByPlay Data(Game Screen/Play-By-Play Tab)'),

                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
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