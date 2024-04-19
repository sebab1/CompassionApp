import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '/Presentation/Components/constants.dart';
import 'onboardingPages.dart';
import 'package:compassion_app/Presentation/main_menu.dart';

class Onboarding extends StatefulWidget {
  @override
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  late SharedPreferences _prefs;
  bool _showOnboarding = true;

  @override
  void initState() {
    super.initState();
    _checkIfFirstTime();
  }

  Future<void> _checkIfFirstTime() async {
    _prefs = await SharedPreferences.getInstance();
    bool hasCompletedOnboarding =
        _prefs.getBool('hasCompletedOnboarding') ?? false;

    print('hasCompletedOnboarding: $hasCompletedOnboarding');

    if (hasCompletedOnboarding) {
      setState(() {
        _showOnboarding = false;
      });
    }
  }

  void _completeOnboarding() async {
    await _prefs.setBool('hasCompletedOnboarding', true);
  }

  @override
  Widget build(BuildContext context) {
    return _showOnboarding
        ? IntroductionScreen(
      pages: onboardingPages,
      globalBackgroundColor: Constants.sduRedColor,
      onDone: () {
        // Mark onboarding as completed and navigate to the main menu
        _completeOnboarding();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Main_menu()),
        );
      },
      onSkip: () {
        // Mark onboarding as completed and navigate to the main menu
        _completeOnboarding();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Main_menu()),
        );
      },
      showSkipButton: true,
      skip: const Text(
        'Spring over',
        style: TextStyle(color: Constants.kBlackColor),
      ),
      done: const Text(
        'Fortsæt',
        style: TextStyle(color: Constants.kWhiteColor, fontSize: 18),
      ),
      next: const Icon(
        Icons.arrow_forward,
        size: 30,
        color: Constants.sduGoldColor,
      ),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Constants.sduWhiteColor,
        activeColor: Constants.sduGoldColor,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    )
        : Main_menu();
  }
}
