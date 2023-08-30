import 'package:flutter/material.dart';
import 'package:survival_guide/Views/Scheduler/schedule_table.dart';

import '../models/SchedulerGenerateCoursesModel.dart';

class ScheduleScreen extends StatelessWidget {
  final List<CurrentSections> currentSections;
  final Color cardBackgroundColor = const Color.fromARGB(255, 0x2B, 0x5A, 0x47);

  ScheduleScreen({required this.currentSections});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Class Schedule')),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ScheduleTable(
          currentSections: currentSections,
          cardBackgroundColor: cardBackgroundColor,
        ),
      ),
    );
  }
}
