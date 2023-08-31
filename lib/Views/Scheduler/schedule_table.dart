import 'dart:math';

import 'package:flutter/material.dart';
import '../../models/SchedulerGenerateCoursesModel.dart';

class ScheduleTable extends StatelessWidget {
  final SchedulerGenerateCoursesModel generatedScheduleCourses;
  final List<String> sectionIds;

  final List<Color> pastelColors = [
    Colors.pink[100]!,
    Colors.green[100]!,
    Colors.blue[100]!,
    Colors.purple[100]!,
    Colors.orange[100]!,
    Colors.teal[100]!
  ];

  ScheduleTable({
    required this.generatedScheduleCourses,
    required this.sectionIds,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Table(
          border: TableBorder.all(
            color: Colors.grey,
            width: 0.5,
          ),
          children: [
            _buildDayRow(),
            for (int hour = 8; hour <= 20; hour++) _buildHourRow(hour),
          ],
        ),
      ),
    );
  }

  TableRow _buildDayRow() {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('Time',
                style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
          ),
        ),
        for (String day in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'])
          TableCell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(day, style: TextStyle(color: Colors.white)),
            ),
          ),
      ],
    );
  }

  TableRow _buildHourRow(int hour) {
    return TableRow(
      children: [
        TableCell(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('$hour:00', style: TextStyle(color: Colors.white)),
          ),
        ),
        for (String day in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'])
          TableCell(
            child: _getClassCard(day, hour),
          ),
      ],
    );
  }

  Widget _getClassCard(String day, int hour) {
    final Map<String, String> dayMapping = {
      'Mon': 'M',
      'Tue': 'T',
      'Wed': 'W',
      'Thu': 'Th',
      'Fri': 'F',
    };

    final String shortDay = dayMapping[day] ?? '';

    final matchingSections = generatedScheduleCourses.sections.where((section) {
      return sectionIds.contains(section['id'].toString()) &&
          section['meetings'].any((meeting) {
            return meeting['days'].contains(shortDay) &&
                (meeting['startTime'] ~/ 100 == hour ||
                    (meeting['startTime'] ~/ 100 < hour &&
                        meeting['endTime'] ~/ 100 > hour));
          });
    }).toList();

    if (matchingSections.isNotEmpty) {
      final uniqueStr = matchingSections.map((section) => section['id'].toString()).join('_');
      final colorIndex = uniqueStr.hashCode % pastelColors.length;
      final backgroundColor = pastelColors[colorIndex];
      final textColor = (backgroundColor.computeLuminance() > 0.5)
          ? Colors.black
          : Colors.white;

      return Card(
        color: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              matchingSections
                  .map((section) =>
              '${section['subjectId']} ${section['course']} ${section['subject']}')
                  .join('\n'),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: textColor,
              ),
            ),
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
