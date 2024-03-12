import 'package:compassion_app/Presentation/Components/audio.dart';
import 'package:flutter/cupertino.dart';
import '/Presentation/Components/littleCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/Presentation/Components/constants.dart';

// -------------- Deklarerer alle menu-punkter -----------------
List<String> data = [];

// 1.
String title1 = "5 minutters meditation";
String desc1 =
    "En kort meditation for begyndere som kan udføres siddende i løbet af dagen.";
String audio1 = "assets/sounds/Meditation_1_5_min_meditation.mp3";

// 2.
String title2 = "Compassion i åndedrættet";
String desc2 =
    "En længere meditation med fokus på kærlig venlighed og omsorg for dig selv og andre.";
String audio2 = "assets/sounds/Meditation_2_Compassion_i_aandedraettet.mp3";

// 3.
String title3 = "Loving Kindness Meditation for begyndere";
String desc3 =
    "10 minutters meditation for begyndere med fokus på kærlig venlighed";
String audio3 =
    "assets/sounds/Meditation_3_Loving_Kindness_Meditation_for_begyndere.mp3";

// 4.
String title4 = "Opmærksomhedstræning med åndedrættet";
String desc4 =
    "En kort opmærksomhedstræning med fokus på nærvær, lyde og åndedræt.";
String audio4 =
    "assets/sounds/Meditation_4_Opmaerksomhedstraening_med_aandedraettet.mp3";

// 5.
String title5 = "Vejrtrækning med maven";
String desc5 = "En 2 minutters vejrtrækningsøvelse til afstresning.";
String audio5 = "assets/sounds/Meditation_5_Vejrtraekning_med_maven.mp3";

// 6.
String title6 = "Selvcompassion pause";
String desc6 =
    "5 minutters pause til at mærke dig selv og give dig selv omsorg, hvis noget er svært.";
String audio6 = "assets/sounds/Meditation_6_Selvcompassion_pause.mp3";

// 7.
String title7 = "Vejrtrækningen som anker og en dejlig dag";
String desc7 =
    "5 minutters meditation med fokus på vejrtrækningen og brug af vejrtrækningen som ankerpunkt.";
String audio7 =
    "assets/sounds/Meditation_7_Vejrtraekningen_som_anker_og_en_dejlig_dag.mp3";

// 8.
String title8 = "Vejrtrækningsøvelse";
String desc8 = "6 minutters meditation med fokus på vejrtrækningen.";
String audio8 = "assets/sounds/Meditation_8_Vejrtraekningsoevelse.mp3";

// 9.
String title9 = "Ruths trick - Få værktøjer til at tæmme sindet";
String desc9 =
    "Åndedræt og afslapning er de første skridt til at tæmme sindet. Denne meditation stammer fra bogen: Den magiske butik - En neurokirurgs søgen efter hjernens mysterier og hjertets hemmeligheder af læge James Doty.";
String audio9 = "assets/sounds/Ruths_trick_nr_1.mp3";

// 10.
String title10 = "Ruths trick - Få værktøjer til at åbne dit hjerte";
String desc10 =
    "Det betyder noget, at du har et åbent hjerte. Et åbent hjerte får kontakt med andre, og det ændrer alting. Denne meditation stammer fra bogen: Den magiske butik - En neurokirurgs søgen efter hjernens mysterier og hjertets hemmeligheder af læge James Doty.";
String audio10 = "assets/sounds/Ruths_trick_nr_3.mp3";

class Meditations extends StatelessWidget {
  EdgeInsets edgeI = EdgeInsets.fromLTRB(0, 4, 0, 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Meditationer',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Constants.kBlackColor,
          ),
        ),
        backgroundColor: Constants.sduRedColor,
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
                    title: title1,
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                  title: title1,
                                  desc: desc1,
                                  audio: audio1,
                                )),
                      );
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
                    title: title2,
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                  title: title2,
                                  desc: desc2,
                                  audio: audio2,
                                )),
                      );
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
                    title: title3,
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                  title: title3,
                                  desc: desc3,
                                  audio: audio3,
                                )),
                      );
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
                    title: title4,
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                  title: title4,
                                  desc: desc4,
                                  audio: audio4,
                                )),
                      );
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
                    title: title5,
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                  title: title5,
                                  desc: desc5,
                                  audio: audio5,
                                )),
                      );
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
                    title: title6,
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                  title: title6,
                                  desc: desc6,
                                  audio: audio6,
                                )),
                      );
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
                    title: title7,
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                  title: title7,
                                  desc: desc7,
                                  audio: audio7,
                                )),
                      );
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
                    title: title8,
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                  title: title8,
                                  desc: desc8,
                                  audio: audio8,
                                )),
                      );
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
                    title: title9,
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                  title: title9,
                                  desc: desc9,
                                  audio: audio9,
                                )),
                      );
                    },
                    titleSize: 17,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 4, 0, 20),
                child: Align(
                  alignment: Alignment.center,
                  child: littleCard(
                    title: title10,
                    iconData: CupertinoIcons.ant,
                    onTap: () {
                      debugPrint("Card tabbed");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Audio(
                                  title: title10,
                                  desc: desc10,
                                  audio: audio10,
                                )),
                      );
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
