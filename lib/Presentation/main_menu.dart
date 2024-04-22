import 'package:compassion_app/Presentation/journalNew.dart';
import 'package:compassion_app/Presentation/knowledge.dart';
import 'package:compassion_app/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/svg.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import './Components/constants.dart';
import './home.dart';
import './training.dart';

class Main_menu extends StatefulWidget {
  @override
  _Main_menuState createState() => _Main_menuState();
}

class _Main_menuState extends State<Main_menu> {
  var activeColor = Constants.sduGoldColor;
  var unSelectedColor = Constants.kBlackColor;

  late PersistentTabController _controller;
  late bool _hideNavBar;

  @override
  void initState() {
    super.initState();
    _controller = PersistentTabController(initialIndex: 0);
    _hideNavBar = false;
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }

  List<Widget> _buildScreens() {
    return [Home(), Training(), Knowledge(), sl<JournalNew>()];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.home),
        title: "Hjem",
        activeColorPrimary: activeColor,
        inactiveColorPrimary: unSelectedColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.briefcase),
        title: "Træning",
        activeColorPrimary: activeColor,
        inactiveColorPrimary: unSelectedColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.book),
        title: "Viden",
        activeColorPrimary: activeColor,
        inactiveColorPrimary: unSelectedColor,
      ),
      PersistentBottomNavBarItem(
        icon: Icon(CupertinoIcons.calendar_today),
        title: "Dagbogsnotat",
        activeColorPrimary: activeColor,
        inactiveColorPrimary: unSelectedColor,
      )
    ];
  }
}
