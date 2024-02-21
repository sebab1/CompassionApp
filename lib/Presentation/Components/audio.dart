import 'dart:io';
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rxdart/rxdart.dart';
import 'package:path/path.dart' as p;
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:just_waveform/just_waveform.dart';
import './constants.dart';

class Audio extends StatefulWidget {
  final String exercise;
  final String desc;
  const Audio({super.key, required this.exercise, required this.desc});

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

  Future<void> _init() async {
    final audioFileName = 'assets/sounds/sound1.mp3';
    final ByteData data = await rootBundle.load(audioFileName);

    final List<int> bytes = data.buffer.asUint8List();
    final audioFile =
        File(p.join((await getTemporaryDirectory()).path, 'sound1.mp3'));

    try {
      await audioFile.writeAsBytes(bytes);
      final waveFile =
          File(p.join((await getTemporaryDirectory()).path, 'waveform.wave'));
      JustWaveform.extract(audioInFile: audioFile, waveOutFile: waveFile)
          .listen(progressStream.add, onError: progressStream.addError);
    } catch (e) {
      progressStream.addError(e);
    }
  }

  @override
  void initState() {
    super.initState();
    player = AudioPlayer()..setAsset('assets/sounds/sound1.mp3');
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
        title: Text(widget.exercise),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            widget.desc,
            textAlign: TextAlign.center,
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

// @override
// Widget build(BuildContext context) {
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Container(
//         height: 150.0,
//         decoration: BoxDecoration(
//           color: Colors.white,
//           borderRadius: const BorderRadius.all(Radius.circular(20.0)),
//         ),
//         padding: const EdgeInsets.all(16.0),
//         width: double.maxFinite,
//         child: StreamBuilder<WaveformProgress>(
//           stream: progressStream,
//           builder: (context, snapshot) {
//             final progress = snapshot.data?.progress ?? 0.0;
//             final waveform = snapshot.data?.waveform;
//             if (waveform == null) {
//               return const LinearProgressIndicator();
//             }
//             return AudioWaveformWidget(
//               waveform: waveform,
//               start: Duration.zero,
//               duration: waveform.duration,
//             );
//           },
//         ),
//       ),
//       Controls(player: player),
//     ],
//   );
// }

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

// class AudioWaveformWidget extends StatefulWidget {
//   final Color waveColor;
//   final double scale;
//   final double strokeWidth;
//   final double pixelsPerStep;
//   final Waveform waveform;
//   final Duration start;
//   final Duration duration;

//   const AudioWaveformWidget({
//     Key? key,
//     required this.waveform,
//     required this.start,
//     required this.duration,
//     this.waveColor = Colors.blue,
//     this.scale = 1.0,
//     this.strokeWidth = 5.0,
//     this.pixelsPerStep = 8.0,
//   }) : super(key: key);

//   @override
//   _AudioWaveformState createState() => _AudioWaveformState();
// }

// class _AudioWaveformState extends State<AudioWaveformWidget> {
//   @override
//   Widget build(BuildContext context) {
//     return ClipRect(
//       child: CustomPaint(
//         painter: AudioWaveformPainter(
//           waveColor: widget.waveColor,
//           waveform: widget.waveform,
//           start: widget.start,
//           duration: widget.duration,
//           scale: widget.scale,
//           strokeWidth: widget.strokeWidth,
//           pixelsPerStep: widget.pixelsPerStep,
//         ),
//       ),
//     );
//   }
// }

// class AudioWaveformPainter extends CustomPainter {
//   final double scale;
//   final double strokeWidth;
//   final double pixelsPerStep;
//   final Paint wavePaint;
//   final Waveform waveform;
//   final Duration start;
//   final Duration duration;

//   AudioWaveformPainter({
//     required this.waveform,
//     required this.start,
//     required this.duration,
//     Color waveColor = Colors.blue,
//     this.scale = 1.0,
//     this.strokeWidth = 5.0,
//     this.pixelsPerStep = 8.0,
//   }) : wavePaint = Paint()
//           ..style = PaintingStyle.stroke
//           ..strokeWidth = strokeWidth
//           ..strokeCap = StrokeCap.round
//           ..color = waveColor;

//   @override
//   void paint(Canvas canvas, Size size) {
//     if (duration == Duration.zero) return;

//     double width = size.width;
//     double height = size.height;

//     final waveformPixelsPerWindow = waveform.positionToPixel(duration).toInt();
//     final waveformPixelsPerDevicePixel = waveformPixelsPerWindow / width;
//     final waveformPixelsPerStep = waveformPixelsPerDevicePixel * pixelsPerStep;
//     final sampleOffset = waveform.positionToPixel(start);
//     final sampleStart = -sampleOffset % waveformPixelsPerStep;
//     for (var i = sampleStart.toDouble();
//         i <= waveformPixelsPerWindow + 1.0;
//         i += waveformPixelsPerStep) {
//       final sampleIdx = (sampleOffset + i).toInt();
//       final x = i / waveformPixelsPerDevicePixel;
//       final minY = normalise(waveform.getPixelMin(sampleIdx), height);
//       final maxY = normalise(waveform.getPixelMax(sampleIdx), height);
//       canvas.drawLine(
//         Offset(x + strokeWidth / 2, max(strokeWidth * 0.75, minY)),
//         Offset(x + strokeWidth / 2, min(height - strokeWidth * 0.75, maxY)),
//         wavePaint,
//       );
//     }
//   }

//   @override
//   bool shouldRepaint(covariant AudioWaveformPainter oldDelegate) {
//     return false;
//   }

//   double normalise(int s, double height) {
//     if (waveform.flags == 0) {
//       final y = 32768 + (scale * s).clamp(-32768.0, 32767.0).toDouble();
//       return height - 1 - y * height / 65536;
//     } else {
//       final y = 128 + (scale * s).clamp(-128.0, 127.0).toDouble();
//       return height - 1 - y * height / 256;
//     }
//   }
// }
