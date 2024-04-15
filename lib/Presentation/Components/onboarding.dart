import 'package:compassion_app/Presentation/main_menu.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import '/Presentation/Components/constants.dart';
import 'onboardingPages.dart';

class Onboarding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return IntroductionScreen(
      pages: onboardingPages,
      globalBackgroundColor: Constants.sduRedColor, // Set background color
      onDone: () {
        // Navigate to the next screen after the introduction
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Main_menu()),
        );
      },
      onSkip: () {
        // Navigate to the next screen if the user skips the introduction
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => Main_menu()),
        );
      },
      showSkipButton: true,
      skip: const Text(
          'Spring over',
        style: TextStyle(
            color: Constants.kBlackColor
        ),
      ),
      done: const Text(
          'Fortsæt',
        style: TextStyle(
            color: Constants.kWhiteColor
        ),
      ),
      next: const Icon(
          Icons.arrow_forward,
        size: 36,
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
    );
  }
}
