import 'package:bb_stats/src/screens/setting_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../components/setting_row.dart';

class MenuScreen extends ConsumerWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    double deviceWidth = MediaQuery.of(context).size.width;
    double itemHeight = MediaQuery.of(context).size.height*0.1;

    final adWidget = createAd();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Menu'),
        actions: [
          IconButton(
            icon: const Icon(
                Icons.settings,
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const SettingDetailsScreen(),
                  ),
                );
              },
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  alignment: Alignment.center,
                  width: deviceWidth,
                  height: itemHeight,
                  child: adWidget,
                ),

                for(int i = 0; i < sidebarItems.length; i++) ... {
                  i == sidebarItems.length-2 ? mediumAd(MediaQuery.of(context).size.width) : Container(),
                  SidebarRow(item: sidebarItems[i])
                }
              ],
            ),
        ),
      )
    );
  }
}

AdWidget createAd() {
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/2934735716',
    size: AdSize.banner,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );
  myBanner.load();
  final AdWidget adWidget = AdWidget(ad: myBanner);

  return adWidget;
}

AdWidget createMidAd() {
  final BannerAd myBanner = BannerAd(
    adUnitId: 'ca-app-pub-3940256099942544/2934735716',
    size: AdSize.mediumRectangle,
    request: const AdRequest(),
    listener: const BannerAdListener(),
  );
  myBanner.load();
  final AdWidget adWidget = AdWidget(ad: myBanner);

  return adWidget;
}

Widget mediumAd(double width) {
  final adWidget = createMidAd();
  return Expanded(
      child: Container(
        alignment: Alignment.center,
        width: width,
        child: adWidget,
      )
  );
}