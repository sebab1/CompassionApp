import 'package:compassion_app/Domain/NotificationController.dart';
import 'package:compassion_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio_background/just_audio_background.dart';
import './Presentation/Components/Constants.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'Presentation/Components/onboarding.dart';
import 'injection_container.dart' as di;


Future<void> main() async {
  await JustAudioBackground.init(
    androidNotificationChannelId: 'com.ryanheise.bg_demo.channel.audio',
    androidNotificationChannelName: 'Audio playback',
    androidNotificationOngoing: true
  );

  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  initializeDateFormatting().then((_) => runApp(const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        //primaryColor: Constants.kAmberColor,
        scaffoldBackgroundColor: Constants.sduWhiteColor,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Constants.kBlackColor,
            statusBarColor: Constants.kBlackColor,
          ),
        ),
      ),
      home: Onboarding(),
    );
  }
}
