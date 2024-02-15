import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_menu.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/Components/littleCard.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.kWhiteColor,
        appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Hjem',
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
                  "Velkommen",
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 26,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
                child: Text(
                  "Udforsk værktøjer, øvelser og viden om compassion for at skabe mere forbindelse og velvære i dit liv.",
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
                child: Text(
                  "Genveje",
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    littleCard(),
                    littleCard(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}