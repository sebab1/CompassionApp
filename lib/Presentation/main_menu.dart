import 'package:compassion_app/Presentation/knowledge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import '../main.dart';
import './Components/constants.dart';
import './statistics.dart';
import './library.dart';
import './home.dart';
import './survey.dart';
import './just_a_class.dart';
import './training.dart';

class Main_menu extends StatefulWidget {
  @override
  _Main_menuState createState() => _Main_menuState();
}
class _Main_menuState extends State<Main_menu> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Home(),
    Training(),
    Knowledge(),
    Survey(),
  ];

  final List<Color> colors = [Constants.kBlackColor, Constants.kRedColor, Constants.kGreenColor, Constants.kCyanColor, Constants.kPurpleColor];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Constants.kAmberColor,
        scaffoldBackgroundColor: Constants.kRedColor,
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            systemNavigationBarColor: Constants.kBlackColor,
            statusBarColor: Constants.kBlackColor,
          ),
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text("Hello test",
              style: TextStyle(
                color: Constants.kBlackColor
              )),
          backgroundColor: Constants.kWhiteColor,
          centerTitle: true,
        ),
        body: _pages[_currentIndex], // Display the current page
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          onTap: (index) => setState(() => _currentIndex = index),

          selectedItemColor: Constants.sduGoldColor,
          unselectedItemColor: Constants.kBlackColor,
          showSelectedLabels: true,
          /*unselectedLabelStyle: TextStyle(
            color: Constants.kGreyColor,
            overflow: TextOverflow.visible
          ),*/
          showUnselectedLabels: true,
          iconSize: 30,
          selectedFontSize: 15,
          backgroundColor: Constants.kWhiteColor,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.home),
                label: 'Hjem'),
            BottomNavigationBarItem(
                icon: Icon(CupertinoIcons.briefcase),
                label: 'Træning'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: 'Viden'),
            BottomNavigationBarItem(
                icon: Icon(Icons.library_music),
                label: 'Viden'),
          ],
        ),
      ),
    );
  }
}