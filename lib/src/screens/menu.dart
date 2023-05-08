import 'package:bb_stats/src/screens/setting_details.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../components/setting_row.dart';

class MenuScreen extends StatelessWidget {

  const MenuScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final aaa = test();
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
      body: Padding(
        padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width,
                height: 100.0,
                child: aaa,
              ),

              for(int i = 0; i < sidebarItems.length; i++) ... {
                sidebarItems.last == sidebarItems[i] ? const Spacer() : Container(),
                SidebarRow(item: sidebarItems[i])
              }
            ],
          ),
      )
    );
  }
}

AdWidget test() {
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