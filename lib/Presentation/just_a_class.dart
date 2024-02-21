import 'package:compassion_app/Presentation/Components/audio.dart';
import 'package:compassion_app/Presentation/Components/videoPlayer.dart';
import 'package:flutter/cupertino.dart';
import 'package:compassion_app/Presentation/Components/littleCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/Presentation/Components/constants.dart';

class JustAClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Constants.kPurpleColor,
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          )),
      home: VideoPlayer(),
    );
  }
}
