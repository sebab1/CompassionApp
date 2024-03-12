import 'package:compassion_app/Presentation/Components/audio.dart';
import 'package:flutter/cupertino.dart';
import '/Presentation/Components/littleCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '/Presentation/Components/constants.dart';
import 'cardData.dart';

// ------------- Deklarerer alle menu-punkter -------------------
List<CardData> cards = [
  // 1.
  CardData(
      "Angst og svære følelser",
      "En 9 minutters øvelse til brug når du her angst og kæmper med svære følelser.",
      "assets/sounds/Oevelse_1_Angst_og_svaere_feolelser.mp3",
      null,
      'ic_round-looks-5.svg'),
  // 2.
  CardData(
      "Centrér vejrtrækningen",
      "Dit åndedræt regulerer dit autonome nervesystem. Dybe vejrtrækninger med forlænget udånding gennem munden skaber ro ved at aktivere det parasympatiske nervesystem. Øvelse nr. 2 er en ultrakort øvelse til at berolige nervesystemet.",
      "assets/sounds/Oevelse_1_Angst_og_svaere_feolelser.mp3",
      null,
      'icon-park_oval-love.svg'),
  // 3.
  CardData(
      "Compassion vejrtrækning",
      "Når vi er ophidsede, kan det være svært at fungere og reagere adækvat på det som sker omkring os. Det er som at opleve et indre stormvejr, mens vi prøver at navigere i den ydre verden. I stedet for at modstå og undertrykke de følelser, når den kommer op, hvilket kan føre til en intensivering, hjælper denne øvelse dig med at finde stabilitet og lede dig sikkert gennem processen.",
      "assets/sounds/Oevelse_3_Compassion_vejrtraekning.mp3",
      null,
      'icon-park_oval-love.svg'),
  // 4.
  CardData(
      "Før arbejde",
      "En øvelse der retter sig til dig, før du tager på arbejde",
      "assets/sounds/Oevelse_4_Foer_arbejde.mp3",
      null,
      'icon-park_oval-love.svg'),
  // 5.
  CardData(
      "Efter arbejde",
      "En øvelse der retter sig til dig, efter arbejde",
      "assets/sounds/Oevelse_5_Efterarbejde.mp3",
      null,
      'icon-park_oval-love.svg'),
  // 6.
  CardData(
      "Vejrtrækning 1234",
      "Når vores nervesystem er i overdrive, f.eks. når vi føler frygt, panik eller raseri, eller når vi oplever følelsesløshed eller magtesløshed, er vi oftest ikke i stand til at tænke klart eller reagere optimalt på, hvad der sker omkring os. Gennem Vejrtrækning-1234-øvelsens tælling engagerer din præfrontale cortex og regulerer nervesystemet.",
      "assets/sounds/Oevelse_6_Vejrtraekning1234.mp3",
      null,
      'icon-park_oval-love.svg'),
  // 7.
  CardData(
      "Ligesom jeg",
      "Resultaterne er entydige. Når en kliniker udviser compassion, forbedrer det patientens sundhedsresultater, patientens egenomsorg samt kvaliteten og plejeprocessen betydeligt. Desuden mindsker det medicinske fejl. Klinikerens niveau af compassion er også tæt forbundet med klinikerens egen velbefindende i hverdagen. Graden af compassion man udviser, udmønter sig i lavere niveauer af udbrændthed, færre stress- og depressionssymptomer og en generel større følelse af personlig præstation og forbedret livskvalitet. Når compassion er en integreret del af kulturen på arbejdspladsen, er niveauet af følelsesmæssig udmattelse og udbrændthed markant mindre. Derfor er compassion godt for alle involverede, både patienter, pårørende og personalet. Øvelse 7 er en måde at håndtere svære situationer på.",
      "assets/sounds/Oevelse_7_ Ligesom_jeg.mp3",
      null,
      'icon-park_oval-love.svg'),
];

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
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cards.length,
                  itemBuilder: (context, index) {
                    CardData card = cards[index];
                    return Container(
                      margin: EdgeInsets.fromLTRB(0, 4, 0, 4),
                      child: Align(
                        alignment: Alignment.center,
                        child: littleCard(
                          title: card.title,
                          iconData: card.icon,
                          customIcon: card.customIcon!,
                          onTap: () {
                            debugPrint("Card tabbed");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Audio(
                                        title: card.title,
                                        desc: card.desc,
                                        audio: card.audioPath,
                                      )),
                            );
                          },
                          titleSize: 17,
                        ),
                      ),
                    );
                  })
            ],
          ),
        ),
      ),
    );
  }
}
