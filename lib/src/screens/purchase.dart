import 'package:bb_stats/src/providers/isar_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PurchaseScreen extends ConsumerWidget {
  const PurchaseScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool purchase = ref.watch(purchaseProvider);
    final purchaseNotifier = ref.watch(purchaseProvider.notifier);

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
                    '・No Advertisement',
                    style: TextStyle(
                      fontSize: 32.0,
                      fontWeight: FontWeight.w800,
                      color: Color(0xFF242629),
                    ),
                  ),
                ),
                const Text("You don't have to look at advertisements."),
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
                  child: Text('Team stats: ', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF242629)))
                ),
                const Text('・Overall stats'),
                const Text('・Stats by wins and losses'),
                const Text('・Stats by PlayType'),
                const Text('・Stats by ShotZone'),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Player stats: ', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF242629)))
                ),
                const Text('・Overall stats'),
                const Text('・Stats by ShotType'),
                const Text('・Stats by ShotZone'),
                const Text('・Assisted Stats'),
                const Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text('Game stats: ', style: TextStyle(fontWeight: FontWeight.w800, color: Color(0xFF242629)))
                ),
                const Text('・BoxScores'),
                const Text('・PlayByPlay Data'),

                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        "Price: 500 yen / 5 dollars",
                        style: TextStyle(
                          fontWeight: FontWeight.w800,
                          color: Color(0xFF242629),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FloatingActionButton.extended(
                        icon: const Icon(Icons.shopping_basket),
                        label: Text(purchase ? "Already Purchased" : "Purchase"),
                        backgroundColor: purchase ? Colors.black12 : Colors.blue,
                        onPressed: () {
                          // if (purchase) {
                          //   return;
                          // }
                          purchaseNotifier.change(!purchase);
                        },
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
    );
  }

}