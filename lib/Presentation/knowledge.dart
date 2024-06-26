import 'package:compassion_app/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Components/settings.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/Components/card.dart';
import 'aboutCompassionMenu.dart';
import 'kollega_cafe.dart';

class Knowledge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String textDesc =
        "I denne sektion finder du en masse materialer omhandlende compassion og self-compassion, samt inspiration til hvordan andre mennesker vælger at omfavne det i deres liv og hverdag.";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Viden',
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
                  style: const TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 16,
                  ),
                ),
              ),
              CardWidget(
                title: "Kollegacafé",
                titleSize: 24,
                subtitle:
                    "Vær med til at udvikle en langtidsholdbar kultur for sundhedspersonale.",
                iconPath: 'carbon_cafe.svg',
                onTap: () {
                  debugPrint("Tabbed: Kollegacafé");
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => sl<KollegaCafe>()));
                },
              ),
              CardWidget(
                title: "Om compassion",
                titleSize: 20,
                subtitle:
                    "Bliv klogere på de mange facetter af compassion og hvordan det kan gavne dig.",
                iconPath: 'icon-park_oval-love.svg',
                onTap: () {
                  debugPrint("Tabbed: Om compassion");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AboutCompassionMenu()));
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
