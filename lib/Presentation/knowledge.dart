import 'package:compassion_app/Presentation/kollegaCafe.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'aboutCompassion.dart';
import 'main_menu.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/Components/Card.dart';

class Knowledge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String textDesc =
        "I denne sektion finder du en masse materialer omhandlende compassion og self-compassion, samt inspiration til hvordan andre mennesker vælge at omfavne det i deres liv og hverdag.";

    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.kWhiteColor,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Viden',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Constants.kBlackColor),
          ),
          backgroundColor: Constants.sduRedColor,
        ),
        body: Center(
          child: Column(children: [
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
              title: "Kollegacafé",
              titleSize: 24,
              subtitle:
                  "Vær med til at udvikle en langtidsholdbar kultur for sundhedspersonale via kollegacafé.",
              iconData: CupertinoIcons.airplane,
              onTap: () {
                debugPrint("Tabbed: Kollegacafé");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => KollegaCafe()));
              },
            ),
            CardWidget(
              title: "Om compassion",
              titleSize: 24,
              subtitle:
                  "Bliv klogere på de mange facetter af compassion og hvordan det kan gavne dig og folk omkring dig.",
              iconData: CupertinoIcons.airplane,
              onTap: () {
                debugPrint("Tabbed: Om compassion");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const AboutCompassion()));
              },
            )
          ]),
        ),
      ),
    );
  }
}
