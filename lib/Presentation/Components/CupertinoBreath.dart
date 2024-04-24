import 'package:compassion_app/Presentation/Components/constants.dart';
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

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 19),
      vsync: this,
    )..forward();

    tweenSequence = TweenSequence<double>([
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.1, end: 0.975)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 21.1), // 4 sekunder
      TweenSequenceItem(
          tween: Tween<double>(begin: 0.975, end: 1.0)
              .chain(CurveTween(curve: Curves.easeInOutBack)),
          weight: 36.8), // 7 sekunder
      TweenSequenceItem(
          tween: Tween<double>(begin: 1.0, end: 0.1)
              .chain(CurveTween(curve: Curves.linear)),
          weight: 42.1) // 8 sekunder
    ]);

    animation = _controller.drive(tweenSequence);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
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
            onPressed: () {},
          )
        ],
        backgroundColor: Constants.sduRedColor,
      ),
      backgroundColor: Constants.kWhiteColor,
      body: Center(
        child: AspectRatio(
          aspectRatio: 1.0,
          child: CustomPaint(
              painter: _BreathePainter(animation),
              size: MediaQuery.of(context).size),
        ),
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
