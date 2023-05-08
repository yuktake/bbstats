import 'package:flutter/material.dart';

class EnglishAgreement extends StatelessWidget {
  const EnglishAgreement({Key? key}) : super(key: key);

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
              const Text("This application is intended to record game data of your (supporting) team."),
              const Text(
                '※Currently, this application does not have a data transfer function, so data can only be retrieved using the CSV output function.',
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