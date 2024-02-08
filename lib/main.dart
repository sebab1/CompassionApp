import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import './Presentation/main_menu.dart';
import './Presentation/Components/Constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Main_menu(),
    );
  }
}
