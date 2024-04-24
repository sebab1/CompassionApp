import 'package:compassion_app/Presentation/Components/constants.dart';
import 'package:compassion_app/Presentation/Components/infoDialog.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class CupertinoBreathe extends StatefulWidget {
  @override
  _CupertinoBreatheState createState() => _CupertinoBreatheState();
}

class _CupertinoBreatheState extends State<CupertinoBreathe>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late TweenSequence<double> tweenSequence;
  late Animation<double> animation;
  late AnimationStatus animationStatus;
  String text = 'Visuelt åndedrætsøvelse';

  bool isAnimating = false;

  final inhaleDuration = Duration(seconds: 4);
   final holdBreathDuration = Duration(seconds: 7);
  final exhaleDuration = Duration(seconds: 8);

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 19),
      vsync: this,
    );


    tweenSequence = TweenSequence<double>([
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.2, end: 0.975)
              .chain(CurveTween(curve: Curves.easeOut)),
          weight: 21.1), // 4 sekunder
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.975, end: 1.0)
              .chain(CurveTween(curve: Curves.easeInOutBack)),
          weight: 36.8), // 7 sekunder
      TweenSequenceItem(
          tween: Tween<double>(begin: 1.0, end: 0.2)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 42.1) // 8 sekunder
    ]);

    animation = _controller.drive(tweenSequence)..addListener( () => getText());
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

    void getText() {
      if(_controller.lastElapsedDuration != null){
      final elapsedDuration = _controller.lastElapsedDuration!.inSeconds % Duration(seconds: 19).inSeconds;
          if (elapsedDuration < inhaleDuration.inSeconds) {
            text = 'Indånd'; 
          } else if (elapsedDuration < inhaleDuration.inSeconds + holdBreathDuration.inSeconds) {
            text = 'Hold vejret'; 
          } else {
            text = 'Udånd';
          }
      }
    setState(() {
      text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '4-7-8',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Constants.kBlackColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.info_outline,
              color: Constants.kBlackColor,
            ),
            onPressed: () {
                            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return InfoDialog(
                    '4-7-8-åndedrætsøvelsen er en simpel og effektiv metode til at reducere stress, berolige sindet og fremme afslapning gennem dyb vejrtrækning. Denne teknik indebærer tre trin, der udføres i en bestemt rækkefølge:'
            '\n'
            '1. Indånd dybt gennem næsen i 4 sekunder.'
            '\n'
            '2. Hold vejret 7 sekunder.'
            '\n'
            '3. Pust langsomt ud gennem munden i 8 sekunder.'
           ,'Om 4-7-8-åndedrætsøvelsen'); // Use the InfoDialog here
                },
              );
            },
          )
        ],
        backgroundColor: Constants.sduRedColor,
      ),
      backgroundColor: Constants.kWhiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(text, style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
          Center(
            child: AspectRatio(
              aspectRatio: 1.0,
              child: CustomPaint(
                  painter: _BreathePainter(animation),
                  size: MediaQuery.of(context).size),
            ),
          ),
          ElevatedButton(onPressed: () {
              if(!_controller.isAnimating){
                _controller.repeat();
                isAnimating = true;
              } else {
                _controller.removeListener(() { });
                _controller.reset();
                isAnimating = false;
                text = 'Visuelt åndedrætsøvelse';
              }
              setState(() {
                isAnimating;
                text;
              });
          }, child: Text(!isAnimating ? 'Start øvelsen' : 'Stop'))
        ],
      ),
    );
  }
}

class _BreathePainter extends CustomPainter {
  _BreathePainter(
    this.animation, {
    this.count = 6,
    Color color = const Color.fromARGB(189, 139, 97, 190),
  })  : circlePaint = Paint()..color = color,
        super(repaint: animation);

  final Animation<double> animation;
  final int count;
  Paint circlePaint;

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide * 0.25) * animation.value;
    for (int index = 0; index < count; index++) {
      circlePaint.color = index % 2 == 0
          ? Color.fromRGBO(209, 90, 86, 0.75)
          : Color.fromRGBO(209, 90, 86, 0.75);
      final indexAngle = (index * math.pi / count * 2);
      final angle = indexAngle + (math.pi * 1.5 * animation.value);
      final offset = Offset(math.sin(angle), math.cos(angle)) * radius * 0.985;
      canvas.drawCircle(center + offset * animation.value, radius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(_BreathePainter oldDelegate) =>
      animation != oldDelegate.animation || count != oldDelegate.count;
}
