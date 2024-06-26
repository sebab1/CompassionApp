import 'package:compassion_app/Presentation/Components/audio.dart';
import '/Presentation/Components/littleCard.dart';
import 'package:flutter/material.dart';
import '/Presentation/Components/constants.dart';
import 'cardData.dart';

// -------------- Deklarerer alle menu-punkter -----------------
List<CardData> cardsBeginner = [
  // 1.
  CardData(
      "5 minutters meditation",
      "En kort meditation for begyndere som kan udføres siddende i løbet af dagen.",
      "assets/sounds/Meditation_1_5_min_meditation.mp3",
      null,
      'cil_audio.svg'),
  // 2.
  CardData(
      "Compassion i åndedrættet",
      "En længere meditation med fokus på kærlig venlighed og omsorg for dig selv og andre.",
      "assets/sounds/Meditation_2_Compassion_i_aandedraettet.mp3",
      null,
      'cil_audio.svg'),
  // 3.
  CardData(
      "Loving Kindness Meditation for begyndere",
      "10 minutters meditation for begyndere med fokus på kærlig venlighed",
      "assets/sounds/Meditation_3_Loving_Kindness_Meditation_for_begyndere.mp3",
      null,
      'cil_audio.svg'),
  // 4.
  CardData(
      "Opmærksomhedstræning med åndedrættet",
      "En kort opmærksomhedstræning med fokus på nærvær, lyde og åndedræt.",
      "assets/sounds/Meditation_4_Opmaerksomhedstraening_med_aandedraettet.mp3",
      null,
      'cil_audio.svg'),
];

List<CardData> cardsIntermediate = [
  // 5.
  CardData(
      "Vejrtrækning med maven",
      "En 2 minutters vejrtrækningsøvelse til afstresning.",
      "assets/sounds/Meditation_5_Vejrtraekning_med_maven.mp3",
      null,
      'cil_audio.svg'),
  // 6.
  CardData(
      "Selvcompassion pause",
      "5 minutters pause til at mærke dig selv og give dig selv omsorg, hvis noget er svært.",
      "assets/sounds/Meditation_6_Selvcompassion_pause.mp3",
      null,
      'cil_audio.svg'),
  // 7.
  CardData(
      "Vejrtrækningen som anker og en dejlig dag",
      "5 minutters pause til at mærke dig selv og give dig selv omsorg, hvis noget er svært.",
      "assets/sounds/Meditation_7_Vejrtraekningen_som_anker_og_en_dejlig_dag.mp3",
      null,
      'cil_audio.svg'),
];

List<CardData> cardsExperienced = [
  // 8.
  CardData(
      "Vejrtrækningsøvelse",
      "6 minutters meditation med fokus på vejrtrækningen.",
      "assets/sounds/Meditation_8_Vejrtraekningsoevelse.mp3",
      null,
      'cil_audio.svg'),
  // 9.
  CardData(
      "Ruths trick - Få værktøjer til at tæmme sindet",
      "Åndedræt og afslapning er de første skridt til at tæmme sindet. Denne meditation stammer fra bogen: Den magiske butik - En neurokirurgs søgen efter hjernens mysterier og hjertets hemmeligheder af læge James Doty.",
      "assets/sounds/Ruths_trick_nr_1.mp3",
      null,
      'cil_audio.svg'),
  // 10.
  CardData(
      "Ruths trick - Få værktøjer til at åbne dit hjerte",
      "Det betyder noget, at du har et åbent hjerte. Et åbent hjerte får kontakt med andre, og det ændrer alting. Denne meditation stammer fra bogen: Den magiske butik - En neurokirurgs søgen efter hjernens mysterier og hjertets hemmeligheder af læge James Doty.",
      "assets/sounds/Ruths_trick_nr_3.mp3",
      null,
      'cil_audio.svg'),
];

class Meditations extends StatelessWidget {
  Meditations({super.key});

  final EdgeInsets edgeI = EdgeInsets.fromLTRB(0, 4, 0, 4);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
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

              // ---------- Beginner level ---------------
              Container(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 0),
                child: const Text(
                  "Begynder-niveau",
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cardsBeginner.length,
                  itemBuilder: (context, index) {
                    CardData card = cardsBeginner[index];
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
                                        category: 'Meditation',
                                      )
                              ),
                            );
                          },
                          titleSize: 17,
                        ),
                      ),
                    );
                  }
              ),

              // ------------- Intermediate level -----------------
              Container(
                padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
                child: const Text(
                  "Middel-niveau",
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cardsIntermediate.length,
                  itemBuilder: (context, index) {
                    CardData card = cardsIntermediate[index];
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
                                    category: 'Meditation',
                                  )
                              ),
                            );
                          },
                          titleSize: 17,
                        ),
                      ),
                    );
                  }
              ),

              // ------------- Experienced level -----------------
              Container(
                padding: EdgeInsets.fromLTRB(25, 30, 25, 0),
                child: const Text(
                  "Erfaren-niveau",
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: cardsExperienced.length,
                  itemBuilder: (context, index) {
                    CardData card = cardsExperienced[index];
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
                                    category: 'Meditation',
                                  )
                              ),
                            );
                          },
                          titleSize: 17,
                        ),
                      ),
                    );
                  }
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
