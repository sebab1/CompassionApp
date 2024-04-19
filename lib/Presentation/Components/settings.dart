import 'package:flutter/material.dart';
import 'Constants.dart';
import 'basicCard.dart';
import './Onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  void _resetOnboardingStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedOnboarding', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Onboarding(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.fromLTRB(0, 20, 0, 60),
      height: 300,
      child: Column(
        //crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Expanded( // Use Expanded to center the title vertically
            child: Text(
              'Indstillinger',
              style: TextStyle(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          BasicCard(
            title: "Gense introduktion til app'en",
            onTap: () async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              await prefs.setBool('hasCompletedOnboarding', false);
              Navigator.pushReplacement(context, MaterialPageRoute(
                builder: (context) => Onboarding(),
              ));
            },
            titleSize: 18,
          ),
          SizedBox(height: 8), // Add vertical margin between menu items
          BasicCard(
            title: 'Om Compassion App',
            //iconData: Icons.library_books_outlined,
            iconSize: 30,
            onTap: () {
              // Handle onTap event
            },
            titleSize: 18,
          ),
          //SizedBox(height: 60),
        ],
      ),
    );
  }
}

