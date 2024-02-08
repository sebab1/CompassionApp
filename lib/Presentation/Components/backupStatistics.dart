import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'main_menu.dart';
import '/Presentation/Components/constants.dart';

class Statistics extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.kRedColor,
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          )),
      home: Scaffold(
        body: Center(
            child: Text('Statistics', style: TextStyle(fontSize: 60),)
        ),
      ),
    );
  }
}