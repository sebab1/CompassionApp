import 'package:compassion_app/Presentation/dsaArticle.dart';
import 'package:flutter/material.dart';
import 'Components/Constants.dart';
import 'Components/basicCard.dart';

class AboutCompassionMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Om compassion',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Constants.kBlackColor,
          ),
        ),
        backgroundColor: Constants.sduRedColor,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: const EdgeInsets.fromLTRB(25, 20, 25, 10),
            child: Text(
              'Bliv klogere på de mange facetter af compassion og hvordan det kan gavne dig og folk omkring dig.',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 10),
            child: Text(
              'Her kan du læse mere om compassion og dets betydning i vores liv. Udforsk forskellige ressourcer, der kan hjælpe dig med at forstå og praktisere compassion og empati i din dagligdag.',
              style: TextStyle(
                fontSize: 15,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 4),
              children: <Widget>[
                BasicCard(
                  title: 'Oversygeplejerske stjal 5 minutter hver dag til meditation',
                  onTap: () {
                    debugPrint("Tabbed: Om compassion");
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DsaArticle()));
                  },
                  titleSize: 14,
                ),
                SizedBox(height: 8), // Add vertical margin between menu items
                BasicCard(
                  title: 'Hvad er compassion?',
                  iconData: Icons.library_books_outlined,
                  iconSize: 30,
                  onTap: () {
                    // Handle onTap event
                  },
                  titleSize: 18,
                ),
                SizedBox(height: 8), // Add vertical margin between menu items
                BasicCard(
                  title: 'Vigtigheden af self-compassion',
                  iconData: Icons.library_books_outlined,
                  iconSize: 30,
                  onTap: () {
                    // Handle onTap event
                  },
                  titleSize: 18,
                ),
                SizedBox(height: 8), // Add vertical margin between menu items
                // Add more littleCard widgets as needed
              ],
            ),
          ),
        ],
      ),
    );
  }
}
