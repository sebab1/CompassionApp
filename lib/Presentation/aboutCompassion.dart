import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'Components/borderCard.dart';
import 'journal.dart';
import 'main_menu.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/Components/littleCard.dart';

class AboutCompassion extends StatelessWidget {
  const AboutCompassion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Om compassion',
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
              child: Text(
                "Hvad er compassion og hvorfor er det vigtigt?",
                style: TextStyle(
                  color: Constants.kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
              child: Text(
                "Lav her en tekst der forklarer en masse om compassion osv.",
                style: TextStyle(
                  color: Constants.kBlackColor,
                  fontWeight: FontWeight.normal,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}