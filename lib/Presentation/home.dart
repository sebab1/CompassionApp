import 'package:compassion_app/Presentation/Components/CupertinoBreath.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'Components/borderCard.dart';
import '/Presentation/Components/constants.dart';
import 'Components/settings.dart';
import 'aboutCompassionMenu.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Hjem',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Constants.kBlackColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.settings_outlined,
              color: Constants.kBlackColor,
            ),
            onPressed: () {
              showModalBottomSheet(
                useRootNavigator: true,
                isScrollControlled: true,
                backgroundColor: Colors.transparent,
                context: context,
                builder: (BuildContext context) {
                  return Settings();
                },
              );
            },
          )
        ],
        backgroundColor: Constants.sduRedColor,
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 10),
              child: Text(
                "Velkommen",
                style: TextStyle(
                  color: Constants.kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 26,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 10, 25, 25),
              child: Text(
                "Udforsk værktøjer, øvelser og viden om compassion for at skabe mere forbindelse og velvære i dit liv.",
                style: TextStyle(
                  color: Constants.kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(25, 25, 25, 0),
              child: Text(
                "Genveje",
                style: TextStyle(
                  color: Constants.kBlackColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  borderCard(
                    title: "Hurtig\nvejrtrækningsøvelse",
                    iconPath: 'breathing_icon.svg',
                    underline: false,
                    titleSize: 14,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CupertinoBreathe()),
                      );
                    },
                    trailingIconData: CupertinoIcons.chevron_forward,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
