import 'package:flutter/material.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          color: Colors.white54,
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller,
                  children: const <Widget>[
                    Center(
                      child: FirstPage(),
                    ),
                    Center(
                      child: SecondPage(),
                    ),
                    Center(
                      child: ThirdPage(),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextButton(
                            onPressed: (){
                              controller.previousPage(duration: const Duration(milliseconds: 100), curve: Curves.linear);
                            },
                            child: const Text('Previous')
                        ),
                        TextButton(
                            onPressed: (){
                              controller.nextPage(duration: const Duration(milliseconds: 100), curve: Curves.linear);
                            },
                            child: const Text('Next')
                        ),
                      ],
                    ),
                  )
              )
            ]
          ),
        ),
      ),
    );
  }
}

class FirstPage extends StatelessWidget {
  const FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              const Text('first'),
              Image.asset(
                'assets/logos/team_logo.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              const Expanded(
                  child: SingleChildScrollView(
                    child: Text(
                        "This application is intended to record game data of your (supporting) team\n"
                        "※Please note that currently, the app does not have a data transfer feature. However, you can extract data using the CSV export feature (available for a fee)."
                    ),
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              const Text('second'),
              Image.asset(
                'assets/logos/team_logo.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Text(
                      "This application is intended to record game data of your (supporting) team\n"
                          "※Please note that currently, the app does not have a data transfer feature. However, you can extract data using the CSV export feature (available for a fee)."
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ThirdPage extends StatelessWidget {
  const ThirdPage({super.key});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height*0.9,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
          child: Column(
            children: [
              const Text('third'),
              Image.asset(
                'assets/logos/team_logo.png',
                width: MediaQuery.of(context).size.width / 2,
              ),
              const Expanded(
                child: SingleChildScrollView(
                  child: Text(
                      "This application is intended to record game data of your (supporting) team\n"
                          "※Please note that currently, the app does not have a data transfer feature. However, you can extract data using the CSV export feature (available for a fee)."
                  ),
                ),
              ),
              FloatingActionButton.extended(
                icon: const Icon(Icons.sports_basketball),
                label: const Text("Finish"),
                backgroundColor: Colors.blue,
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}