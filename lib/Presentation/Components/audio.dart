import 'dart:io';
import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart' as p;
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_waveform/just_waveform.dart';
import './constants.dart';

class Audio extends StatefulWidget {
  final String title;
  final String desc;
  final String audio;
  final String category;
  const Audio(
      {super.key,
      required this.title,
      required this.desc,
      required this.audio,
      required this.category});

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  late AudioPlayer player;
  final progressStream = BehaviorSubject<WaveformProgress>();


  Stream<PositionData> get _positionDataStream =>
      Rx.combineLatest3<Duration, Duration, Duration?, PositionData>(
        player.positionStream,
        player.bufferedPositionStream,
        player.durationStream,
        (position, bufferedPosition, duration) => PositionData(
          position,
          bufferedPosition,
          duration ?? Duration.zero,
        ),
      );

  @override
  void initState() {
    super.initState();
    player = AudioPlayer();
    player.setAudioSource(AudioSource.asset(widget.audio,
        tag: MediaItem(
            id: '0',
            title: widget.title,
            artist: widget.category,
            artUri: Uri.file('/assets/logos/compassionAppIcon.png',
                windows: false))));
    //_init();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.title,
          maxLines: 2,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Constants.kBlackColor),
        ),
        backgroundColor: Constants.sduRedColor,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(14, 0, 14, 0),
            child: Text(
              widget.desc,
              textAlign: TextAlign.center,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              StreamBuilder<PositionData>(
                stream: _positionDataStream,
                builder: (context, snapshot) {
                  final positionData = snapshot.data;
                  return Container(
                    padding: EdgeInsets.fromLTRB(16, 0, 16, 0),
                    child: ProgressBar(
                      progressBarColor: Colors.black,
                      baseBarColor: Colors.grey,
                      thumbColor: Constants.sduGoldColor,
                      progress: positionData?.position ?? Duration.zero,
                      buffered: positionData?.bufferedPosition ?? Duration.zero,
                      total: positionData?.duration ?? Duration.zero,
                      onSeek: player.seek,
                    ),
                  );
                },
              ),
              Controls(player: player)
            ],
          ),
        ],
      ),
    );
  }
}

class PositionData {
  const PositionData(
    this.position,
    this.bufferedPosition,
    this.duration,
  );

  final Duration position;
  final Duration bufferedPosition;
  final Duration duration;
}

class Controls extends StatelessWidget {
  const Controls({super.key, required this.player});

  final AudioPlayer player;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: player.playerStateStream,
        builder: (context, snapshot) {
          final playerState = snapshot.data;
          final processingState = playerState?.processingState;
          final playing = playerState?.playing;
          return Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    iconSize: 50,
                    onPressed: () async {
                      await player.seek(player.position - Duration(seconds: 5));
                    },
                    icon: Icon(
                      Icons.replay_5,
                      color: Colors.black,
                    )),
                IconButton(
                  iconSize: 75,
                  onPressed: () async {
                    if (playing ?? false) {
                      await player.pause();
                    } else {
                      await player.play();
                    }
                  },
                  icon: Icon(
                    playing ?? false
                        ? Icons.pause_rounded
                        : Icons.play_arrow_rounded,
                    color: Colors.black,
                  ),
                ),
                IconButton(
                    iconSize: 50,
                    onPressed: () async {
                      await player.seek(player.position + Duration(seconds: 5));
                    },
                    icon: Icon(
                      Icons.forward_5,
                      color: Colors.black,
                    )),
              ],
            ),
          );
        });
  }
}
