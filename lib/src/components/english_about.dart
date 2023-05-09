import 'package:flutter/material.dart';

class EnglishAbout extends StatelessWidget {
  const EnglishAbout({Key? key}) : super(key: key);

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
            ]
          ),
          const Text("This application is intended to record game data of your (supporting) team."),
          const Text(
            '※Currently, this application does not have a data transfer function, so data can only be retrieved using the CSV output function.',
            style: TextStyle(
                color: Colors.red
            ),
          ),

          // Tutorial1
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              '1.Registration of team and player information',
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
                "To record a game, you need your team name and players.\n"
                "Register your team name and logo from 「Our Team」and your players from 「Players」in the 「Menu」 tab"
            ),
          ),

          // Tutorial2
          const Text(
            '2.Game Settings',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
              color: Color(0xFF242629),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(""
                "The rules of the game vary depending on the league you belong to.\n"
                "Currently the app allows you to change the time of one quarter.\n"
                "Change 「Minutes Per Quarter」 from the gear symbol in the upper right corner of the Menu tab and save the changes using the button in the upper right corner.\n"
                "※The time of one quarter is saved for each game, so changing the quarter time does not affect past games."
            ),
          ),

          // Tutorial3
          const Text(
            '3.Game Preparation',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w800,
              color: Color(0xFF242629),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top:4.0),
            child: Text(""
                "Ready to start the game.\n"
                "Go to the 「GAME」 tab and enter the required information!"
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
                'Game Information Settings',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF242629),
                )
            ),
          ),
          const Text(
              "Tap the date at the top center of the screen to change the date of the game.\n"
              "Also, change the time per quarter for this match as necessary.\n"
              "※The first quarter time displayed shows the number of minutes set from the settings screen."
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
                'Selecting an Opponent',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF242629),
                )
            ),
          ),
          const Text(
              "To select an enemy team, tap the ? in the upper right corner of the screen to display a list of opponent teams.\n"
              "If this is the first time you are playing against this opponent, please register a new opponent team from the + in the upper right corner."
          ),

          const Padding(
            padding: EdgeInsets.symmetric(vertical: 4.0),
            child: Text(
                'Starter Selection',
                style: TextStyle(
                  fontWeight: FontWeight.w800,
                  color: Color(0xFF242629),
                )
            ),
          ),
          const Text(
              "Once the enemy team has been registered, we will proceed with setting up the starters.\n"
              "Please tap on the five circles in the center of the screen and select the starters from the player list.\n"
              "Certainly, if you have selected the same player more than once, you will not be able to start the game.\n"
              "If all inputs have been completed, the button at the bottom of the screen should be highlighted in blue.\n"
              "Let's begin the match!"
          )
        ],
      ),
    );
  }

}