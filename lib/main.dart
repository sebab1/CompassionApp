import 'package:compassion_app/Data/SqlDatabase.dart';
import 'package:compassion_app/Domain/Controllers/JournalController.dart';
import 'package:compassion_app/Domain/Controllers/ScraperController.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import './Presentation/main_menu.dart';
import './Presentation/Components/Constants.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  var sql = SqlDatabase();
  var cl;
  sql.init().then((value) => JournalController(sql).getJournals());

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
