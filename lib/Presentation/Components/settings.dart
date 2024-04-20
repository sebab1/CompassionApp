import 'package:compassion_app/Presentation/aboutApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Constants.dart';
import 'basicCard.dart';
import './Onboarding.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Settings extends StatelessWidget {
  void _resetOnboardingStatus(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasCompletedOnboarding', false);
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Onboarding(),
      ),
    );
  }

  Widget makeDissmissible(BuildContext context, {required Widget child}) =>
      GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () => Navigator.of(context).pop(),
        child: GestureDetector(onTap: () {}, child: child),
      );

  @override
  Widget build(BuildContext context) {
    return makeDissmissible(
      context,
      child: DraggableScrollableSheet(
        initialChildSize: 0.8,
        maxChildSize: 0.8,
        minChildSize: 0.5,
        expand: true,
        snap: true,
        snapSizes: [0.51],
        builder: (_, controller) => Container(
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
          padding: EdgeInsets.fromLTRB(0, 16, 0, 60),
          child: ListView(
            controller: controller,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 5,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 14),
                      height: 6,
                      decoration: BoxDecoration(
                        color: Constants.kDarkGreyColor,
                        borderRadius: BorderRadius.circular(3),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0, 16, 0, 12),
                child: const Text(
                  'Indstillinger',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              BasicCard(
                title: "Gense introduktion til app'en",
                onTap: () async {
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  await prefs.setBool('hasCompletedOnboarding', false);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Onboarding(),
                      ));
                },
                titleSize: 18,
              ),
              const SizedBox(height: 8), // Add vertical margin between menu items
              BasicCard(
                title: 'Om Compassion App',
                //iconData: Icons.library_books_outlined,
                iconSize: 30,
                onTap: () {
                  Navigator.of(context).pop();
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => AboutApp()));
                },
                titleSize: 18,
              ),
              //SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
