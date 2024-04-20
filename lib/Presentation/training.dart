import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../injection_container.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/Components/card.dart';
import 'Components/settings.dart';
import 'exercises.dart';
import 'meditations.dart';

class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {
    String textDesc =
        "I Center for Compassion forsøger vi at udbrede kendskabet til compassion gennem et bredt udvalg af aktiviteter, værktøjer, meditationer og øvelser der bidrager til din udvikling.";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Træning',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Constants.kBlackColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.settings_outlined,
              color: Constants.kBlackColor,
            ),
            onPressed: () {
              showModalBottomSheet(
                useRootNavigator: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Settings();
                },
              );
            },
          )
        ],
        backgroundColor: Constants.sduRedColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
                child: Text(
                  textDesc,
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 16,
                  ),
                ),
              ),
              CardWidget(
                title: "Meditationer",
                titleSize: 24,
                subtitle:
                    "Meditation kan styrke compassion ved at skærpe opmærksomheden på ens egne følelser og andres lidelse, hvilket kan føre til øget empati og medfølelse.",
                iconPath: 'solar_meditation-round-outline.svg',
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
                iconPath: 'exercise_brain.svg',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Exercises()),
                  );
                },
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
