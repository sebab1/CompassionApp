import 'package:compassion_app/Presentation/Components/videoPlayer.dart';
import 'package:compassion_app/Presentation/exercises.dart';
import 'package:compassion_app/Presentation/knowledge.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import './Components/constants.dart';
import './Components/videoPlayer.dart';
import './home.dart';
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
    VideoPlayer(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex], // Display the current page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
        selectedItemColor: Constants.sduGoldColor,
        unselectedItemColor: Constants.kBlackColor,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        iconSize: 30,
        selectedFontSize: 15,
        backgroundColor: Constants.kWhiteColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.home),
            label: 'Hjem',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.briefcase),
            label: 'Træning',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.book),
            label: 'Viden',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'JustAClass',
          ),
        ],
      ),
    );
  }
}
