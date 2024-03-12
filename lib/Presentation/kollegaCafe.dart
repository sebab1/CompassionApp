import 'package:compassion_app/Domain/Controllers/ScraperController.dart';
import 'package:compassion_app/Presentation/Components/borderCard.dart';
import 'package:compassion_app/Presentation/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Components/videoPlayer.dart';
import 'Components/littleCard.dart';

class KollegaCafe extends StatefulWidget {
  KollegaCafe({super.key});


  @override
  _KollegaCafeState createState() => _KollegaCafeState();
}

class _KollegaCafeState extends State<KollegaCafe> {
  late var events;

  @override
  void initState() {
    super.initState();
    var sc = ScraperController();
    events = sc.initScraper();
  }

  // Future<void> _launchUrl(String url) async {
  //   final Uri uri = Uri(scheme: "https", host: url);
  //   if(!await launchUrl(
  //     uri,
  //     mode: LaunchMode.inAppWebView,
  //   )) {
  //     throw "Failed opening the link";
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
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
                padding: EdgeInsets.fromLTRB(25, 20, 25, 15),
                child: const Text(
                  'Velkommen til Kollegacafé, her finder du information og viden fra tidligere Kollegacaféer, samt et link med information om tilmelding og fremtidige møder.',
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: borderCard(
                  title: "Link til Kollegacafé",
                  iconData: Icons.coffee_rounded,
                  underline: true,
                  onTap: () async {
                    var url = Uri.https('sdu.dk', '/da/forskning/center_for_compassion/kollegacafe');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url);
                    }
                    debugPrint("Clicked link?");
                  },
                  trailingIconData: CupertinoIcons.chevron_forward,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 8),
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
                      return Container(
                        child: ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Container(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 4),
                              child: littleCard(
                                title: snapshot.data[index].title,
                                iconData: CupertinoIcons.play_rectangle,
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
                        ),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  })
            ],
          ),
        ),
      ),
    );
  }
}
