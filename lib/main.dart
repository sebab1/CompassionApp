import 'package:compassion_app/Domain/ScraperController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Presentation/main_menu.dart';
import './Presentation/Components/Constants.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        //primaryColor: Constants.kAmberColor,
        scaffoldBackgroundColor: Constants.sduWhiteColor,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Constants.kBlackColor,
            statusBarColor: Constants.kBlackColor,
          ),
        ),
      ),
      home: Main_menu(),
    );
  }
}
