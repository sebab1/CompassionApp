import 'package:flutter/material.dart';
import '/Presentation/Components/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutCompassion extends StatelessWidget {
  const AboutCompassion({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Om compassion',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Constants.kBlackColor,
          ),
        ),
        backgroundColor: Constants.sduRedColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 14, 14, 0),
              child: Text(
                  "Oversygeplejerske stjal 5 minutter hver dag til meditation: Ville skabe et sundt arbejdsmiljø",
                style: TextStyle(
                  fontSize: 24, fontWeight: FontWeight.bold
                ),
              ),
            ),
            //SizedBox(height: 10), // Optional spacing between widgets
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 10, 14, 0),
              child: Text(
                "Som oversygeplejerske er det en vigtig opgave for Katinka Fomsgaard Kjær at være med til at skabe et "
                    "sundt arbejdsmiljø, hvor hendes medarbejdere trives. Selv har hun taget en uddannelse i compassion, "
                    "der medvirker til at styrke den mentale sundhed og træner evnen til at rumme det svære. Næste skridt "
                    "er at lære det videre til medarbejderne.",
                style: TextStyle(
                  fontSize: 18
                ),
              ),
            ),
            //SizedBox(height: 10), // Optional spacing between widgets
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 18, 14, 0),
              child: Text(
                "For noget tid siden valgte Katinka Fomsgaard Kjær at markere den europæiske arbejdsmiljøuge på sin afdeling "
                    "ved hver dag at ”stjæle” fem minutter fra morgenkonferencen til en meditationspraksis for de 25 sygeplejersker "
                    "og socialrådgivere, hun er leder for. \n\n"
                    "”Jeg guidede dem igennem en meditation for at give dem en oplevelse af, hvordan fem minutters bevidst opmærksomhed "
                    "kan være med til at give kroppen og hjernen ro og nærvær. Jeg var meget spændt, fordi det krævede både en overvindelse "
                    "af mig personligt og en enorm tillid leder og medarbejder imellem,” siger Katinka Fomsgaard Kjær, der er "
                    "oversygeplejerske på Børne- og Ungeklinikken på H.C. Andersen Børne- og Ungehospital på OUH i Odense. \n\n"
                    "Hvordan medarbejderne reagerede på, at Katinka Fomsgaard Kjær i virkeligheden gav dem en oplevelse af at træne compassion, "
                    "kommer vi tilbage til.",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 18, 14, 0),
              child: Image.asset('assets/images/aboutCompassion/articleImg1.jpeg'),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 18, 14, 0),
              child: Text(
                "Patienterne på H.C. Andersen Børne- og Ungehospital er børn og unge mellem 0 og 18 år med både akutte og kroniske alvorlige "
                    "diagnoser som for eksempel diabetes, kroniske tarm- eller nyresygdomme, neurologiske lidelser eller andet. Når børn er syge, "
                    "involverer det hele familien, hvilket indimellem kan gøre behandlingsopgaven kompleks.\n\n"
                    "”Det er krævende, fordi der er flere relationer, man skal være opmærksom på, og man skal kommunikere på flere niveauer,” "
                    "forklarer Katinka Fomsgaard Kjær, der har arbejdet i pædiatrien i alle de 25 år, hun har været sygeplejerske.\n\n"
                    "Da hun blev ledende sygeplejerske, tog hun som det første en master i offentlig ledelse, der gav hende et solidt grundlag for "
                    "ledelsesteori og mange redskaber til at være leder på et hospital.\n\n"
                    "”Det er et godt ståsted, men samtidig synes jeg også, at man som leder har en forpligtelse til at udvikle sig og være nysgerrig "
                    "og reflekterende. Og så stødte jeg på begrebet compassion ...”\n\n"
                    "Compassion kan defineres som ”at være opmærksom på og give plads til egne og andres svære følelser, reaktioner og udfordringer”. "
                    "Når vi handler med compassion, kan vi reagere på lidelse med forståelse, venlighed og tålmodighed.",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 20, 14, 20),
              child: InkWell(
                child: const Text(
                  "Har du brug for at styrke din trivsel, kan du tilmelde dig et gratis temamøde her",
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    decoration: TextDecoration.underline
                  ),
                ),
                onTap: () async {
                  var url = Uri.https('dsa.dk',
                      '/sygdom-og-stress/trivsel-i-hverdagen/temamoder-om-trivsel/');
                  if (await canLaunchUrl(url)) {
                    await launchUrl(url);
                  }
                  debugPrint("Clicked link?");
                },
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Text(
                "En leder på kursus",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Text(
                "Katinka Fomsgaard Kjær meldte sig til et otte ugers program i compassion på Dansk Center for Mindfulness, der er et selvstændigt "
                    "forskningscenter under Institut for Klinisk Medicin, Health, Aarhus Universitet.\n\n"
                    "”Forløbet indeholdt både elementer af compassion for andre og mig selv, og jeg lærte at træne min opmærksomhed, på at skabe "
                    "stabilitet og positivt overskud. Vores medarbejdere mærker lynhurtigt, om man er en følelsesmæssigt robust leder eller én, der "
                    "reagerer uhensigtsmæssigt på udfordringer.”\n\n"
                    "Katinka Fomsgaard Kjær oplevede, at træningen i compassion gav hende et stort fokus på positivt samarbejde, mental trivsel og "
                    "sunde relationer, og hun havde lyst til at lade metoden flytte længere ind i hendes arbejdsliv. Hun søgte derfor sin ledelse om "
                    "at tage et toårigt uddannelsesforløb i compassion for professionelle, som også har fokus på at lære at træne andre i compassion.\n\n"
                    "Om kort tid er Katinka færdig med sin uddannelse, men hun bruger allerede begreberne i dagligdagen på børne- og ungeafdelingen. "
                    "Hun har blandt andet holdt flere oplæg på sin afdeling – og derudover var der indsatsen med de daglige meditationer.\n\n"
                    "”Medarbejderne mærker altid, når en leder har været på kursus. Og så mærker man selvfølgelig også, når lederne er optaget "
                    "af et nyt begreb, som compassion er i sundhedsvæsenet,” griner hun.\n\n"
                    "For Katinka Fomsgaard Kjærs eget vedkommende har compassion blandt andet skabt en opmærksomhed på at få viden om menneskets natur "
                    "og hjernens systemer og på at bremse op og reflektere i en verden, hvor alt går meget hurtigt.\n\n"
                    "”I første omgang er det et temposkift, der sker i hjernen. Hvor man giver sig tid til at stoppe op og reflektere over, hvordan man "
                    "gør tingene bedre,” siger hun og fortsætter:\n\n"
                    "”Hvordan skaber jeg en arbejdsplads med fokus på sunde relationer og mental sundhed? Det er jo nogle gange nede i mikrohandlinger. "
                    "Jeg tænker meget over, hvordan jeg responderer på de forskellige ting, jeg støder på. Lige så snart jeg har fokus på, hvordan vi løser "
                    "problemer nuanceret, signalerer jeg, at jeg har alles trivsel på sinde. Og så spreder det sig som ringe i vandet.\n",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Center(
                child: Image.asset('assets/images/aboutCompassion/articleImg2.jpeg'),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Text(
                "\nDen blide, venlige røst",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
              child: Text(
                "At træne compassion er især en fordel for sundhedsfaglige, som i hverdagen kan stå i følelsesmæssigt "
                    "krævende situationer, hvor tiden samtidig er knap.\n\n"
                    "”Medarbejderne i sundhedsvæsenet er jo ofte pressede på tid og ressourcer. Og vi vil samtidig gerne "
                    "værne om værdier som ordentlighed, respekt, kvalitet og mennesket først. Men det kan også være med "
                    "til at presse den enkelte, for hvornår er det godt nok? Så kan vi komme til at tale til os selv og andre "
                    "med en hård og kritisk røst, men vi kan også vende den rundt og forsøge at fremhæve den blide og venlige røst. "
                    "At tale til sig selv med forståelse og rumme, når man har en følelse, der er både uordentlig og svær,” "
                    "siger Katinka Fomsgaard Kjær.\n\n"
                    "Det er hjælper os ikke altid at løbe stærkere eller arbejde hurtigere, hvis vi ikke samtidig handler klogt. "
                    "Og så er vi tilbage ved Katinkas indsats med meditation, som efterfølgende blev mødt med reaktioner som: "
                    "”Jeg synes, jeg har truffet bedre beslutninger i dag”.\n\n"
                    "”Den enkelte medarbejder blev opmærksom på, hvor mange tanker, de var fyldt op af. De var jo i gang med en "
                    "samtale, de havde i forgårs, hvad de skulle spise til aftensmad og det, der skulle ske senere den dag. "
                    "Så det handlede om at stoppe op og blive opmærksom på alle vores tanker. Eksempelvis være mere til stede "
                    "over for den familie, jeg sidder med lige nu. Nogle gange er vi bange for at bremse tempoet i vores job, "
                    "for uf, så er vi ikke effektive. Men det er ikke altid tempoet, der afgør, om vi handler klogt eller siger det rigtige.”\n\n"
                    "Katinka Fomsgaard Kjær håber at kunne udbyde træning i compassion på sin arbejdsplads fremover. "
                    "Noget, hun mener, mange sygeplejersker med patientkontakt vil have glæde af.\n\n"
                    "”Den enkelte patient skal jo møde et personale, der evner at indgå i sunde relationer, der kan skabe tryghed "
                    "og vise omsorg. Det er vigtigt, at de mennesker, der skal tage vare på patienter, har et godt og sundt "
                    "arbejdsmiljø og deraf det overskud, der skal til. Vi træder ind i sundhedsfaget med et meget stort og "
                    "blødt omsorgshjerte, men det er en evne, der også kan trænes og vedligeholdes.”\n",
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(14, 20, 14, 20),
              child: Container(
                color: Constants.kDarkBlueColor, // Change color as per your requirement
                padding: EdgeInsets.all(16),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Compassion-forløb",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                        color: Colors.white, // Text color
                      ),
                    ),
                    SizedBox(height: 10), // Optional spacing
                    Text(
                      "I 2005 mødtes forskere fra vesten og meditationseksperter fra Tibet. Dalai Lama bad forskerne "
                          "om at undersøge compassion og positive kvaliteter i sindet på samme måde, som de dengang "
                          "undersøgte negative tilstande i sindet. På det tidspunkt var ordet compassion ikke nævnt "
                          "i vestlige lærebøger eller videnskabelige artikler om psykologi.\n\n"
                          "I dag er der over 1.000 videnskabelige artikler, der viser, at compassion er en kvalitet, "
                          "der kan trænes, og som alle altid kan forbedre.\n\n"
                          "Omkring 2010 blev de første compassion træningsprogrammer udviklet for at give et "
                          "systematisk bud på, hvordan compassion kunne udbredes i samfundet. Et af de programmer, "
                          "som Dansk Center for Mindfulness var de første til at tilbyde til den danske befolkning i "
                          "2016, var Compassion Cultivation Training (CCT) udviklet ved Stanford University i 2009.\n\n"
                          "Læs meget mere om compassion på mindfulness.au.dk, hvor der også ligger en lang række øvelser til fri afbenyttelse.",
                      style: TextStyle(
                        color: Colors.white, // Text color
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
