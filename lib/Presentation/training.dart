import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_menu.dart';
import '/Presentation/Components/constants.dart';

class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.kWhiteColor,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          )),
      home: const Scaffold(
        body: Center(
            child: Text('Træning', style: TextStyle(fontSize: 60),)
        ),
      ),
    );
  }
}