import 'package:compassion_app/Presentation/Components/audio.dart';
import 'package:flutter/cupertino.dart';
import '/Presentation/Components/littleCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/Presentation/Components/constants.dart';

class Exercises extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Øvelser'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 15),
                child: const Text(
                  "Styrk dit kendskab til compassion gennem en række øvelser du selv kan udføre.",
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                child: const Text(
                  "Disse øvelser retter sig mod sundhedsprofessionelle med inspiration fra Compassion Institute",
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Angst og svære følelser",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                exercise: 'Angst og svære følelser',
                                desc:
                                    'En 9 minutters øvelse til brug når du her angst og kæmper med svære følelser.')),
                      );
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Centrér vejrtrækningen",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Compassion vejrtrækning",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Før arbejde",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Efter arbejde",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Vejrtrækning 1234",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Ligesom jeg",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
