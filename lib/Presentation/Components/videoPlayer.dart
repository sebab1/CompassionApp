import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'Constants.dart';

class VideoPlayer extends StatelessWidget {
  const VideoPlayer({Key? key});

  @override
  Widget build(BuildContext context) {
    // Replace this YouTube video URL with your own video URL
    String videoUrl = 'https://www.youtube.com/watch?v=u0LaoQks5mY&ab_channel=MigosVEVO';
    const String desc = 'Beskrivelse af den specifikke kollegacafe';
    const String title = 'Titel på den kollegacafe';

    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(videoUrl) ?? '',
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
        title: Text(title),
        /*leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),*/
      ),
      body: SingleChildScrollView( // Lige nu fucker den når man sætter videoen i fullscreen. Det skal fixes på en måde
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(2, 0, 2, 10),
                child: YoutubePlayer(
                  controller: controller,
                  showVideoProgressIndicator: true,
                  progressIndicatorColor: Constants.sduRedColor,
                  progressColors: const ProgressBarColors(
                    playedColor: Constants.sduRedColor,
                    handleColor: Constants.sduGoldColor,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.fromLTRB(25, 20, 25, 15),
                child: const Text(
                  desc,
                  style: TextStyle(
                    color: Constants.kBlackColor,
                    fontSize: 13,
                    fontWeight: FontWeight.normal,
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
