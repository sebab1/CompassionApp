import 'package:compassion_app/Presentation/journal.dart';
import 'package:compassion_app/Presentation/journalNew.dart';
import 'package:compassion_app/Presentation/meditations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'exercises.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/Components/Card.dart';

class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {
    String textDesc =
        "I Center for Compassion forsøger vi at udbrede kendskabet til compassion gennem et bredt udvalg af aktiviteter, kurser, meditationer og øvelser der bidrager til din udvikling.";

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Træning',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Constants.kBlackColor,
          ),
        ),
        backgroundColor: Constants.sduRedColor,
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
              child: Text(
                textDesc,
                style: TextStyle(
                  color: Constants.kBlackColor,
                  fontSize: 16
                ),
              ),
            ),
            CardWidget(
              title: "Meditationer",
              titleSize: 30,
              subtitle:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dignissim lectus leo, vitae.",
              iconData: CupertinoIcons.airplane,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Meditations()),
                );
              },
            ),
            CardWidget(
              title: "Øvelser",
              titleSize: 30,
              subtitle:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dignissim lectus leo, vitae.",
              iconData: CupertinoIcons.airplane,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Exercises()),
                );
              },
            ),
            CardWidget(
              title: "Dagbog",
              titleSize: 30,
              subtitle:
              "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris dignissim lectus leo, vitae.",
              iconData: CupertinoIcons.airplane,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const JournalNew()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
