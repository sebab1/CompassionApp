import 'package:compassion_app/Domain/Controllers/ScraperController.dart';
import 'package:compassion_app/Presentation/Components/borderCard.dart';
import 'package:compassion_app/Presentation/Components/constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'Components/videoPlayer.dart';
import 'Components/littleCard.dart';

class KollegaCafe extends StatefulWidget {
  KollegaCafe({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: Text(
  //         'Kollegacaféer',
  //         style: TextStyle(
  //           fontSize: 28,
  //           fontWeight: FontWeight.bold,
  //           color: Constants.kBlackColor,
  //         ),
  //       ),
  //       backgroundColor: Constants.sduRedColor,
  //     ),
  //     body: SingleChildScrollView(
  //       child: Center(
  //         child: Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Container(
  //               padding: EdgeInsets.fromLTRB(25, 20, 25, 15),
  //               child: const Text(
  //                 'Velkommen til Kollegacafé, her finder du information og viden fra tidligere Kollegacaféer, samt linket til fremtidige møder.',
  //                 style: TextStyle(
  //                   color: Constants.kBlackColor,
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.normal,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
  //               child: borderCard(
  //                 title: "Link til Kollegacafé",
  //                 iconData: Icons.coffee_rounded,
  //                 underline: true,
  //                 onTap: () {
  //                   debugPrint("Tabbed: Dagbog genvej");
  //                 },
  //                 trailingIconData: CupertinoIcons.chevron_forward,
  //               ),
  //             ),
  //             Container(
  //               padding: EdgeInsets.fromLTRB(25, 20, 25, 15),
  //               child: const Text(
  //                 'Tidligere møder',
  //                 style: TextStyle(
  //                   color: Constants.kBlackColor,
  //                   fontSize: 20,
  //                   fontWeight: FontWeight.bold,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
  //               child: Align(
  //                 alignment: Alignment.center,
  //                 child: littleCard(
  //                   title: "Scraped title?",
  //                   iconData: CupertinoIcons.play_rectangle,
  //                   onTap: () {
  //                     debugPrint("Card tabbed");
  //                   },
  //                   titleSize: 17,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
  //               child: Align(
  //                 alignment: Alignment.center,
  //                 child: littleCard(
  //                   title: "Scraped title?",
  //                   iconData: CupertinoIcons.play_rectangle,
  //                   onTap: () {
  //                     debugPrint("Card tabbed");
  //                   },
  //                   titleSize: 17,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
  //               child: Align(
  //                 alignment: Alignment.center,
  //                 child: littleCard(
  //                   title: "Scraped title?",
  //                   iconData: CupertinoIcons.play_rectangle,
  //                   onTap: () {
  //                     debugPrint("Card tabbed");
  //                   },
  //                   titleSize: 17,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
  //               child: Align(
  //                 alignment: Alignment.center,
  //                 child: littleCard(
  //                   title: "Scraped title?",
  //                   iconData: CupertinoIcons.play_rectangle,
  //                   onTap: () {
  //                     debugPrint("Card tabbed");
  //                   },
  //                   titleSize: 17,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
  //               child: Align(
  //                 alignment: Alignment.center,
  //                 child: littleCard(
  //                   title: "Scraped title?",
  //                   iconData: CupertinoIcons.play_rectangle,
  //                   onTap: () {
  //                     debugPrint("Card tabbed");
  //                   },
  //                   titleSize: 17,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
  //               child: Align(
  //                 alignment: Alignment.center,
  //                 child: littleCard(
  //                   title: "Scraped title?",
  //                   iconData: CupertinoIcons.play_rectangle,
  //                   onTap: () {
  //                     debugPrint("Card tabbed");
  //                   },
  //                   titleSize: 17,
  //                 ),
  //               ),
  //             ),
  //             Container(
  //               margin: EdgeInsets.fromLTRB(0, 6, 0, 6),
  //               child: Align(
  //                 alignment: Alignment.center,
  //                 child: littleCard(
  //                   title: "Scraped title?",
  //                   iconData: CupertinoIcons.play_rectangle,
  //                   onTap: () {
  //                     debugPrint("Card tabbed");
  //                   },
  //                   titleSize: 17,
  //                 ),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Kollegacaféer',
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
                  'Velkommen til Kollegacafé, her finder du information og viden fra tidligere Kollegacaféer, samt linket til fremtidige møder.',
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 18,
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
                  onTap: () {
                    debugPrint("Tabbed: Dagbog genvej");
                  },
                  trailingIconData: CupertinoIcons.chevron_forward,
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(25, 20, 25, 15),
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
