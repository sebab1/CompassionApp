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
        "Dyk ned i diverse afslappende meditationer og øvelser, der kan hjælpe til at styrke din evne "
        "til at udvise compassion, både over for dig selv og andre.";

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
                padding: EdgeInsets.fromLTRB(20, 25, 20, 20),
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
                    "Find guidede meditationer der passer lige netop til dig og hvad du gerne vil opnå.",
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
                    "Styrk dit kendskab til compassion med en række øvelser du selv kan udføre.",
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
