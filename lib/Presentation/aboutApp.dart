import 'package:compassion_app/injection_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Components/settings.dart';
import 'dsaArticle.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/Components/card.dart';
import 'aboutCompassionMenu.dart';
import 'kollega_cafe.dart';

class AboutApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Constants.sduRedColor,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(20, 25, 20, 10),
                child: Text(
                  'Om Compassion App',
                  style: const TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}
