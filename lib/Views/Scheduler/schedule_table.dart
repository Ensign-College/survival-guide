import 'dart:convert';
import 'dart:math';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:survival_guide/constants/DateTime.dart';
import 'package:survival_guide/constants/colors.dart';
import '../../models/SchedulerGenerateCoursesModel.dart';
import '../../constants/text.dart';

class SimpleScheduleList extends StatelessWidget {
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

  Map<String, Color> sectionColorMap = {};

  void _addEventsToCalendar(List<Map<dynamic, dynamic>> sections) {
    for (var section in sections) {
      var meeting = section['meetings'][0];
      final Event event = Event(
        title: "${section['title']}",
        description: "${section['description']}",
        location: "${meeting['location']}",
        startDate: DateTime.parse(meeting['startDate']).toLocal(),
        endDate: DateTime.parse(meeting['endDate']).toLocal(),
      );

      Add2Calendar.addEvent2Cal(event);
    }
  }
  SimpleScheduleList({
    required this.generatedScheduleCourses,
    required this.sectionIds,
  });

  String formatTime(int time) {
    int hour = (time ~/ 100) % 12;
    hour = hour == 0 ? 12 : hour; // Replace 0 with 12
    final String minute = (time % 100).toString().padLeft(2, '0');
    final String ampm = time < 1200 ? 'AM' : 'PM';
    return '$hour:$minute $ampm';
  }


  String daysRawToFull(String daysRaw) {
    final Map<String, String> dayMapping = {
      'M': 'Monday',
      'T': 'Tuesday',
      'W': 'Wednesday',
      'R': 'Thursday',
      'F': 'Friday',
      'S': 'Saturday',
      'Su': 'Sunday'
    };
    return daysRaw.splitMapJoin(
        RegExp(r'M|T|W|R|F'),
        onMatch: (m) => dayMapping[m[0]]!.substring(0, 3) + ' ',
        onNonMatch: (n) => n)
      ..substring(0); // Remove trailing comma and space
  }
  var matchingSections;
  void getMatchingSections ()  {
    matchingSections = generatedScheduleCourses.sections.where((section) {
    return sectionIds.contains(section['id'].toString());
    }).toList();
  }

  void _showSectionInfo(BuildContext context, Map section) {
    showDialog(
      context: context,
      builder: (context) {
        var meeting = section['meetings'][0];
        var enrollmentRequirements = section['enrollmentRequirements'];
        return AlertDialog(
          backgroundColor: appBackgroundColor, // Set the background color
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Title: ${section['title']}", style: TextStyle(color: Colors.white)),
                Text("Class #: ${section['id']}", style: TextStyle(color: Colors.white)),
                Text("Section: ${section['sectionNumber']}", style: TextStyle(color: Colors.white)),
                Text("Subject: ${section['subject']}", style: TextStyle(color: Colors.white)),
                Text("Course: ${section['course']}", style: TextStyle(color: Colors.white)),
                Text("Seats Open: ${section['openSeats']}", style: TextStyle(color: Colors.white)),
                Text("Component: ${section['component']}", style: TextStyle(color: Colors.white)),
                Text("Session: ${section['partsOfTerm']}", style: TextStyle(color: Colors.white)),
                Text("Instructor: ${section['instructor'][0]['name']}", style: TextStyle(color: Colors.white)),
                Text("Campus: ${section['campusDescription']}", style: TextStyle(color: Colors.white)),
                Text("Credits: ${section['credits']}", style: TextStyle(color: Colors.white)),
                Text("Waitlist Open: ${section['waitlistOpen']}", style: TextStyle(color: Colors.white)),
                Text("Description: ${section['description']}", style: TextStyle(color: Colors.white)),
                SizedBox(height: 10),
                Text(
                  "Day(s) & Location(s):",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "${meeting['daysRaw']} ${formatTime(meeting['startTime'])} - ${formatTime(meeting['endTime'])} - ${meeting['location']}",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Dates: ${DateTime.parse(meeting['startDate']).toLocal().toFormattedString()} - ${DateTime.parse(meeting['endDate']).toLocal()}",
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  "Enrollment Requirement: ${enrollmentRequirements.isNotEmpty ? enrollmentRequirements[0]['description'] : 'None'}",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text("Close", style: TextStyle(color: Colors.white)),
            ),
          ],
        );
      },
    );
  }

  List<Widget> _buildClassCards(BuildContext context) {
    List<Widget> cards = [];
    Random rng = Random();
    getMatchingSections();

    for (var section in matchingSections) {
      var sectionId = section['id'].toString();

      if (!sectionColorMap.containsKey(sectionId)) {
        sectionColorMap[sectionId] = pastelColors[rng.nextInt(pastelColors.length)];
      }

      var meetings = section['meetings'] as List;
      if (meetings.isEmpty) continue;

      var meeting = meetings[0];
      var startTime = meeting['startTime'] as int? ?? 0;
      var endTime = meeting['endTime'] as int? ?? 0;
      var daysRaw = meeting['daysRaw'] as String? ?? 'N/A';
      String daysText = daysRawToFull(daysRaw);

      if (startTime == 0 || endTime == 0) continue;

      cards.add(
        Card(
          color: sectionColorMap[sectionId],
          margin: const EdgeInsets.symmetric(vertical: 8),
          child: ListTile(
            title: Text(
              '${section['subjectId']} ${section['course']}',
              style: TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              '${formatTime(startTime)} - ${formatTime(endTime)} | $daysText',
              style: TextStyle(color: Colors.black),
            ),
            onTap: () => _showSectionInfo(context, section),
          ),
        ),
      );
    }
    final exportToCalendarButton = ElevatedButton(
      onPressed: () => _addEventsToCalendar(matchingSections),
      child: Text("Export Entire Schedule to Calendar"),
    );

    cards.add(exportToCalendarButton);
    return cards;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(8),
      children: _buildClassCards(context),
    );
  }
}
