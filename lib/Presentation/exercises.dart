import 'package:compassion_app/Presentation/Components/audio.dart';
import 'package:flutter/cupertino.dart';
import '/Presentation/Components/littleCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/Presentation/Components/constants.dart';

// ------------- Deklarerer alle menu-punkter -------------------
// 1.
String title1 = "Angst og svære følelser";
String desc1 =
    "En 9 minutters øvelse til brug når du her angst og kæmper med svære følelser.";
String audio1 = "assets/sounds/Oevelse_1_Angst_og_svaere_feolelser.mp3";

// 2.
String title2 = "Centrér vejrtrækningen";
String desc2 =
    "Dit åndedræt regulerer dit autonome nervesystem. Dybe vejrtrækninger med forlænget udånding gennem munden skaber ro ved at aktivere det parasympatiske nervesystem. Øvelse nr. 2 er en ultrakort øvelse til at berolige nervesystemet.";
String audio2 = "assets/sounds/Oevelse_2_Centrer_vejrtraekningen.mp3";

// 3.
String title3 = "Compassion vejrtrækning";
String desc3 =
    "Når vi er ophidsede, kan det være svært at fungere og reagere adækvat på det som sker omkring os. Det er som at opleve et indre stormvejr, mens vi prøver at navigere i den ydre verden. I stedet for at modstå og undertrykke de følelser, når den kommer op, hvilket kan føre til en intensivering, hjælper denne øvelse dig med at finde stabilitet og lede dig sikkert gennem processen.";
String audio3 = "assets/sounds/Oevelse_3_Compassion_vejrtraekning.mp3";

// 4.
String title4 = "Før arbejde";
String desc4 = "En øvelse der retter sig til dig, før du tager på arbejde";
String audio4 = "assets/sounds/Oevelse_4_Foer_arbejde.mp3";

// 5.
String title5 = "Efter arbejde";
String desc5 = "En øvelse der retter sig til dig, efter arbejde";
String audio5 = "assets/sounds/Oevelse_5_Efterarbejde.mp3";

// 6.
String title6 = "Vejrtrækning 1234";
String desc6 =
    "Når vores nervesystem er i overdrive, f.eks. når vi føler frygt, panik eller raseri, eller når vi oplever følelsesløshed eller magtesløshed, er vi oftest ikke i stand til at tænke klart eller reagere optimalt på, hvad der sker omkring os. Gennem Vejrtrækning-1234-øvelsens tælling engagerer din præfrontale cortex og regulerer nervesystemet.";
String audio6 = "assets/sounds/Oevelse_6_Vejrtraekning1234.mp3";

// 7.
String title7 = "Ligesom jeg";
String desc7 =
    "Resultaterne er entydige. Når en kliniker udviser compassion, forbedrer det patientens sundhedsresultater, patientens egenomsorg samt kvaliteten og plejeprocessen betydeligt. Desuden mindsker det medicinske fejl. Klinikerens niveau af compassion er også tæt forbundet med klinikerens egen velbefindende i hverdagen. Graden af compassion man udviser, udmønter sig i lavere niveauer af udbrændthed, færre stress- og depressionssymptomer og en generel større følelse af personlig præstation og forbedret livskvalitet. Når compassion er en integreret del af kulturen på arbejdspladsen, er niveauet af følelsesmæssig udmattelse og udbrændthed markant mindre. Derfor er compassion godt for alle involverede, både patienter, pårørende og personalet. Øvelse 7 er en måde at håndtere svære situationer på.";
String audio7 = "assets/sounds/Oevelse_7_ Ligesom_jeg.mp3";

class Exercises extends StatelessWidget {
  EdgeInsets edgeI = EdgeInsets.fromLTRB(0, 4, 0, 4);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Øvelser',
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
                  "Styrk dit kendskab til compassion gennem en række øvelser du selv kan udføre.",
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
                  "Disse øvelser retter sig mod sundhedsprofessionelle, med inspiration fra Compassion Institute",
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
                    iconData: null,
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
                margin: EdgeInsets.fromLTRB(0, 4, 0, 20),
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
            ],
          ),
        ),
      ),
    );
  }
}
