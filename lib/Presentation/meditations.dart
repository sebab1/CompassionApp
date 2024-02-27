import 'package:flutter/cupertino.dart';
import '/Presentation/Components/littleCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/Presentation/Components/constants.dart';

class Meditations extends StatelessWidget {
  EdgeInsets edgeI = EdgeInsets.fromLTRB(0, 4, 0, 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meditationer'),
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
                  "Meditation kan styrke compassion ved at skærpe opmærksomheden på ens egne følelser og andres lidelse, hvilket kan føre til øget empati og medfølelse.",
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 0, 25, 10),
                child: const Text(
                  "Herunder finder du en række meditationsøvelser der kan hjælpe dig til at styrke compassion.",
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 15,
                    //fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                margin: edgeI,
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "5 minutters meditation",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: edgeI,
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Compassion i åndedrættet",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: edgeI,
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Loving Kindness Meditation for begyndere",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: edgeI,
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Opmærksomhedstræning med åndedrættet",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: edgeI,
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Vejrtrækning med maven",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: edgeI,
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Selvcompassion pause",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: edgeI,
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Vejrtrækningen som anker og en dejlig dag",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: edgeI,
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Vejrtrækningsøvelse",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: edgeI,
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Ruths trick - Få værktøjer til at tæmme sindet",
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: edgeI,
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: "Ruths trick - Få værktøjer til at åbne dit hjerte",
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
