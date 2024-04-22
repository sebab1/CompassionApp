import 'package:compassion_app/Domain/Controllers/IScraperController.dart';
import 'package:compassion_app/Domain/Controllers/ScraperController.dart';
import 'package:compassion_app/Presentation/Components/borderCard.dart';
import 'package:compassion_app/Presentation/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Components/kollegacafeContent.dart';
import 'Components/littleCard.dart';

class KollegaCafe extends StatefulWidget {
  final IScraperController sc;

  const KollegaCafe({super.key, required this.sc});

  @override
  _KollegaCafeState createState() => _KollegaCafeState();
}

class _KollegaCafeState extends State<KollegaCafe> {
  late var events;

  @override
  void initState() {
    super.initState();
    events = widget.sc.getEvents();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Kollegacafé',
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
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 15),
                child: const Text(
                      'Er du også optaget af omsorg for andre mennesker? '
                      'Det være sig patienter, studerende, arbejdskollegaer og ikke mindst dig selv '
                      '- så deltag i kollegacaféen.\n'
                          '\n'
                      'Her kan du mødes uformelt med kollegaer, deltage '
                      'i guidede meditationer og få tips til hvordan compassion og mindfulness kan '
                      'integreres i arbejdslivet, samt få anbefalet bøger og lignende.\n'
                      '\n'
                      'På denne side finder du '
                      'information og viden fra tidligere '
                      'Kollegacaféer samt et link med information om tilmelding til fremtidige møder.',
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: borderCard(
                  title: "Link til Kollegacafé",
                  iconPath: 'carbon_cafe.svg',
                  underline: true,
                  onTap: () async {
                    var url = Uri.https('sdu.dk',
                        '/da/forskning/center_for_compassion/kollegacafe');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                    debugPrint("Clicked link?");
                  },
                  trailingIconData: CupertinoIcons.chevron_forward,
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 8),
                child: const Text(
                  'Tidligere møder',
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              FutureBuilder(
                  future: events,
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Container(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 4),
                            child: littleCard(
                              title: snapshot.data[index].title,
                              iconData: CupertinoIcons.play_rectangle,
                              customIcon: null,
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VideoPlayer(
                                            event: snapshot.data[index])));
                              },
                              titleSize: 15,
                            ),
                          );
                        },
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  }),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
