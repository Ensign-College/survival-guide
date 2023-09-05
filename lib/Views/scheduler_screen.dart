import 'package:flutter/material.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:survival_guide/models/SchedulerGenerateCoursesModel.dart';

import 'Scheduler/schedule_table.dart';

class ScheduleScreen extends StatefulWidget {
  final SchedulerGenerateCoursesModel generatedScheduleCourses;

  ScheduleScreen({required this.generatedScheduleCourses});

  @override
  _ScheduleScreenState createState() => _ScheduleScreenState();
}

class _ScheduleScreenState extends State<ScheduleScreen> {
  PageController _pageController = PageController();
  int _currentPageIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      setState(() {
        _currentPageIndex = _pageController.page!.toInt();
      });
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Color darkBackgroundColor = Theme.of(context).scaffoldBackgroundColor;

    return Column(
      children: [
        Container(
          color: darkBackgroundColor,  // Set the background color to darkBackgroundColor
          child: Center(
            child: Container(
              margin: EdgeInsets.symmetric(vertical: 10),
              height: 5,
              width: 50,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(2.5),
              ),
            ),
          ),
        ),
        Container(
          color: darkBackgroundColor,
          padding: EdgeInsets.zero,
          width: double.infinity,
          child: Text(
            'Schedule ${_currentPageIndex + 1}',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        Expanded(
          child: Container(
            color: darkBackgroundColor,
            child: PageView(
              controller: _pageController,
              children: widget.generatedScheduleCourses.schedules.map((schedule) {
                final sectionIds = schedule['combination']
                    .map((combo) => combo.split('@')[1])
                    .toList()
                    .cast<String>();

                return SimpleScheduleList(
                  generatedScheduleCourses: widget.generatedScheduleCourses,
                  sectionIds: sectionIds,
                );
              }).toList(),
            ),
          ),
        ),
        Container(
          color: darkBackgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
                widget.generatedScheduleCourses.schedules.length, (index) {
              return Container(
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: index == _currentPageIndex
                      ? cardBackgroundColor
                      : Colors.grey,
                ),
              );
            }),
          ),
        ),
      ],
    );
  }
}
