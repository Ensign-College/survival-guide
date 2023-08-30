import 'package:flutter/material.dart';

import '../../models/SchedulerGenerateCoursesModel.dart';

class ScheduleTable extends StatelessWidget {
  final List<CurrentSections> currentSections;
  final Color cardBackgroundColor;

  ScheduleTable({
    required this.currentSections,
    required this.cardBackgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    // You can create a more dynamic structure based on your specific needs
    // Here, I'm assuming that classes can start at 8 AM and go until 6 PM
    return Table(
      border: TableBorder.all(),
      children: [
        _buildDayRow(),
        for (int hour = 8; hour <= 18; hour++) _buildHourRow(hour),
      ],
    );
  }

  TableRow _buildDayRow() {
    return TableRow(
      children: [
        TableCell(
          child: Text('Time'),
        ),
        for (String day in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri']) TableCell(child: Text(day)),
      ],
    );
  }

  TableRow _buildHourRow(int hour) {
    return TableRow(
      children: [
        TableCell(
          child: Text('$hour:00'),
        ),
        for (String day in ['Mon', 'Tue', 'Wed', 'Thu', 'Fri'])
          TableCell(
            child: _getClassCard(day, hour),
          ),
      ],
    );
  }

  Widget _getClassCard(String day, int hour) {
    // Filter out the classes that match the current day and hour.
    // You might need to adjust the filtering logic based on how your data is structured
    final matchingSections = currentSections.where((section) {
      return section.meetings.any((meeting) {
        return meeting['days'].contains(day) && meeting['startTime'] ~/ 100 == hour;
      });
    }).toList();

    if (matchingSections.isNotEmpty) {
      return Card(
        color: cardBackgroundColor,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Text(
            matchingSections.map((section) => section.course).join('\n'),
            textAlign: TextAlign.center,
          ),
        ),
      );
    } else {
      return SizedBox.shrink();
    }
  }
}
