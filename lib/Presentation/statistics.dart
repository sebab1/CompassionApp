import 'package:fl_chart/fl_chart.dart';
import '/Presentation/Components/indicator.dart';
import 'package:flutter/material.dart';
import '/Presentation/Components/constants.dart';
import 'dart:math';

class TimeAllocationPieChart extends StatefulWidget {
  const TimeAllocationPieChart({Key? key}) : super(key: key);

  @override
  State<TimeAllocationPieChart> createState() => _TimeAllocationPieChartState();
}

class _TimeAllocationPieChartState extends State<TimeAllocationPieChart> {
  final Map<String, double> _timeAllocationData = {
    'Work': 5.0,
    'Family': 3.0,
    'Free Time': 2.0,
    'Other': 1.0,
  };

  Map<String, double> _sectionAngles = {};

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.6,
      child: GestureDetector(
        onPanUpdate: (details) {
          _updateSectionAngles(details.localPosition);
        },
        child: PieChart(
          PieChartData(
            sections: _timeAllocationData.entries.map((entry) {
              return PieChartSectionData(
                value: entry.value,
                color: Colors.primaries[entry.key.hashCode % Colors.primaries.length],
                title: entry.key,
                radius: 50,
                showTitle: false,
                titleStyle: TextStyle(color: Colors.black), // Adjust as needed
              );
            }).toList(),
            centerSpaceRadius: 50,
          ),
        ),
      ),
    );
  }

  void _updateSectionAngles(Offset localPosition) {
    double touchAngle = atan2(
      localPosition.dy - 200, // Adjust according to your center
      localPosition.dx - 200, // Adjust according to your center
    );

    touchAngle = touchAngle < 0 ? 2 * pi + touchAngle : touchAngle;

    _timeAllocationData.forEach((key, value) {
      double sectionStartAngle = _sectionAngles[key] ?? 0;
      double sectionEndAngle = sectionStartAngle + value * 2 * pi / 100;

      if (touchAngle >= sectionStartAngle && touchAngle <= sectionEndAngle) {
        setState(() {
          _sectionAngles[key] = touchAngle;
        });
      }
    });
  }
}