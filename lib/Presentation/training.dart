import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main_menu.dart';
import '/Presentation/Components/constants.dart';
import '/Presentation/Components/Card.dart';

class Training extends StatelessWidget {
  const Training({super.key});

  @override
  Widget build(BuildContext context) {

    String longSampleText = "Tekst om træning-sektionen og hvad man kan finde her. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam non sagittis risus, eget condimentum est. Donec sit amet rhoncus tellus. Duis ac ultrices massa. Sed lacinia ante eu eros congue ullamcorper. Mauris maximus dapibus fermentum. Ut maximus risus blandit nulla posuere porttitor. Vestibulum bibendum pretium odio a blandit.";

    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.kWhiteColor,
          appBarTheme: const AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          )),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Træning', style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Constants.kBlackColor),),
          backgroundColor: Constants.sduRedColor,
        ),
        body: Center(
          child: Column(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 25, 20, 25),
                  child:
                    Text(longSampleText, style: TextStyle(color: Constants.kBlackColor),
                    ),
                ),
                CardWidget(),
                CardWidget()
              ]
          ),
        ),
      ),
    );
  }
}