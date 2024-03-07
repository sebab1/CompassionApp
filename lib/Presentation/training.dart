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
        "I Center for Compassion forsøger vi at udbrede kendskabet til compassion gennem et bredt udvalg af aktiviteter, værktøjer, meditationer og øvelser der bidrager til din udvikling.";

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
              padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
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
              titleSize: 24,
              subtitle:
              "Meditation kan styrke compassion ved at skærpe opmærksomheden på ens egne følelser og andres lidelse, hvilket kan føre til øget empati og medfølelse.",
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
              titleSize: 24,
              subtitle:
              "Styrk dit kendskab til compassion gennem en række øvelser du selv kan udføre.",
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
              titleSize: 24,
              subtitle:
              "Beskriv dagen dagbogskalenderen, eller sæt nogle positive intentioner for din dag.",
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
