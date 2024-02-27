import 'package:flutter/material.dart';
import 'package:flutter_widget_from_html/flutter_widget_from_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../Domain/Event.dart';
import 'Constants.dart';

class VideoPlayer extends StatelessWidget {
  final Event event;

  const VideoPlayer({Key? key, required this.event});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(event.title as String),
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),*/
      ),
      body: SingleChildScrollView(
        // Lige nu fucker den når man sætter videoen i fullscreen. Det skal fixes på en måde
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: HtmlWidget(event.content as String,
                      onTapUrl: (url) => launchUrl(Uri.parse(url)))),
            ],
          ),
        ),
      ),
    );
  }
}
