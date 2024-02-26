import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../Domain/Event.dart';
import 'Constants.dart';

class VideoPlayer extends StatelessWidget {
  final Event event;

  const VideoPlayer({Key? key, required this.event});

  @override
  Widget build(BuildContext context) {
    String url = event.video_link ?? '';
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(url) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        loop: false,
        isLive: false,
        showLiveFullscreenButton: false,
        hideControls: false,
        enableCaption: false,
        controlsVisibleAtStart: false,
      ),
    );

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
                padding: const EdgeInsets.fromLTRB(2, 0, 2, 10),
                child: event.video_link != null
                    ? YoutubePlayer(
                        controller: controller,
                        showVideoProgressIndicator: true,
                        progressIndicatorColor: Constants.sduRedColor,
                        progressColors: const ProgressBarColors(
                          playedColor: Constants.sduRedColor,
                          handleColor: Constants.sduGoldColor,
                        ),
                      )
                    : null,
              ),
              Container(
                  padding: const EdgeInsets.fromLTRB(25, 10, 25, 0),
                  child: ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: event.description.length,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 5),
                          child:
                              Text(event.description[index].content as String,
                                  style: TextStyle(
                                    decoration:
                                        event.description[index].link != null
                                            ? TextDecoration.underline
                                            : null,
                                    color: Constants.kBlackColor,
                                    fontSize: 13,
                                    fontWeight: FontWeight.normal,
                                  )),
                        );
                      })),
            ],
          ),
        ),
      ),
    );
  }
}
