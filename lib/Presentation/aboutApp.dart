import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/Presentation/Components/constants.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Om Compassion App'en",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Constants.kBlackColor,
          ),
        ),
        backgroundColor: Constants.sduRedColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(0, 26, 0, 0),
              child: Center(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12), // Adjust the value as needed
                  child: Image(
                    image: AssetImage(
                      'assets/logos/compassionAppIcon.png',
                    ),
                    height: 80,
                    width: 80,
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(18, 26, 18, 10),
              child: const Text(
                'Denne app er er udviklet i forbindelse med et specialeprojekt på SDU ved '
                    'Mærsk Mc-Kinney Møller Institutet. Dette er sket i samarbejde med '
                    'H.C. Andersen Børne- og Ungehospital, der ønskede en app med viden og '
                    'værktøjer til træning af compassion og self-compassion, som deres personale '
                    'kunne anvende.'
                    '\n'
                    '\n'
                    'Compassion App vil altid forblive gratis, så alle kan få glæde og gavn af de '
                    'ting den tilbyder.'
                    '\n'
                    '\n'
                    'Vi håber inderligt at nogle af værktøjerne og ressourcerne fundet i denne app,'
                    'kan hjælpe netop dig til at finde mere ro og velvære i gennem udøvelse af '
                    'compassion og self-compassion.'
                    '\n'
                    '\n'
                    '\n'
                    'Til sidst skal der lyde et tak til Jane Clemensen og Katinka Fomsgaard Kjær for '
                    'deres hjælp til udviklingen af Compassion App.',
                style: TextStyle(
                  color: Constants.kBlackColor,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
