import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/Presentation/Components/constants.dart';
import 'package:audioplayers/audioplayers.dart';

class Library extends StatelessWidget {
  final player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.kGreenColor,
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          )),
      home: Scaffold(
        body: Column(
          children: [
            ElevatedButton(
              child:
              Text('Play'),
              onPressed: (){
                player.play(AssetSource('sounds/sound1.mp3'));
                },
              ),
            ElevatedButton(
              child:
              Text('Stop'),
              onPressed: (){
                player.stop();
              },
            ),
            ],
        ),
      ),
    );
  }
}