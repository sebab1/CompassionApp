import 'package:flutter/material.dart';
import '/Presentation/Components/constants.dart';

class AboutCompassion extends StatelessWidget {
  const AboutCompassion({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(14, 14, 14, 16),
                child: Text(
                  "Siden skal være her. Link: https://dsa.dk/katinka"
                ),
            )
          ],
        ),
      ),
    );
  }
}