import 'dart:math';
import 'package:add_2_calendar/add_2_calendar.dart';
import 'package:flutter/material.dart';
import 'package:survival_guide/constants/DateTime.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:survival_guide/constants/developer.dart';
import 'package:survival_guide/constants/extensions/text_extensions.dart';
import '../../models/SchedulerGenerateCoursesModel.dart';

class SimpleScheduleList extends StatefulWidget {
  final SchedulerGenerateCoursesModel generatedScheduleCourses;
  final List<String> sectionIds;
  const SimpleScheduleList({
    super.key,
    required this.generatedScheduleCourses,
    required this.sectionIds,
  });

  @override
  State<SimpleScheduleList> createState() => _SimpleScheduleListState();
}

class _SimpleScheduleListState extends State<SimpleScheduleList> {
  final List<Color> pastelColors = [
    Colors.pink[100]!,
    Colors.green[100]!,
    Colors.blue[100]!,
    Colors.purple[100]!,
    Colors.orange[100]!,
    Colors.teal[100]!
  ];

  Map<String, Color> sectionColorMap = {};

  void _addEventsToCalendar(dynamic section) {
    // TODO: fix calendar - work in progress
    var meeting = section['meetings'][0];

    DateTime startDate = DateTime.parse(meeting['startDate']).toLocal();
    DateTime endDate = DateTime.parse(meeting['endDate']).toLocal();

// Calculating the number of weeks between start and end date
    int daysDifference = endDate.difference(startDate).inDays;
    int totalWeeks = (daysDifference / 7).ceil();

    String meetingDays = meeting['days']; // "MW" in this case

// Assuming the meeting occurs every time on the days mentioned in 'meetingDays'
    int occurrencesPerWeek = 0;

// Loop through meetingDays to accurately count the days
    for (int i = 0; i < meetingDays.length; i++) {
      // Check for 'T' as it can be part of 'TTH'
      if (meetingDays[i] == 'T') {
        if (i + 1 < meetingDays.length && meetingDays[i + 1] == 'H') {
          occurrencesPerWeek++;
          i++; // skip the next character as it's part of 'TH'
        } else {
          occurrencesPerWeek++;
        }
      } else {
        occurrencesPerWeek++;
      }
    }

// The rest of your code, such as calculating totalOccurrences, remains the same
    int totalOccurrences = totalWeeks * occurrencesPerWeek;

    final Event event = Event(
      title: "${section['title']}",
      description: "${section['description']}",
      location: "${meeting['location']}",
      startDate: startDate,
      endDate: endDate,
      recurrence: Recurrence(
        frequency: Frequency.weekly,
        interval: 1, // Assuming each meeting happens weekly
        ocurrences: totalOccurrences,
      ),
    );

    Add2Calendar.addEvent2Cal(event);

  }

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
    return daysRaw.splitMapJoin(RegExp(r'M|T|W|R|F'),
        onMatch: (m) => '${dayMapping[m[0]]!.substring(0, 3)} ',
        onNonMatch: (n) => n)
      ..substring(0); // Remove trailing comma and space
  }

  dynamic matchingSections;

  void getMatchingSections() {
    matchingSections = widget.generatedScheduleCourses.sections.where((section) {
      return widget.sectionIds.contains(section.id);
    }).toList();
    printWrapped("matchingSections: $matchingSections");
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
                Text("Title: ${section['title']}").survivalGuideWhiteText,
                Text("Class#: ${section['id']}").survivalGuideWhiteText,
                Text("Section: ${section['sectionNumber']}")
                    .survivalGuideWhiteText,
                Text("Subject: ${section['subject']}").survivalGuideWhiteText,
                Text("Course: ${section['course']}").survivalGuideWhiteText,
                Text("Seats Open: ${section['openSeats']}")
                    .survivalGuideWhiteText,
                Text("Component: ${section['component']}")
                    .survivalGuideWhiteText,
                Text("Session: ${section['partsOfTerm']}")
                    .survivalGuideWhiteText,
                Text("Instructor: ${section['instructor'][0]['name']}")
                    .survivalGuideWhiteText,
                Text("Campus: ${section['campusDescription']}")
                    .survivalGuideWhiteText,
                Text("Credits: ${section['credits']}").survivalGuideWhiteText,
                Text("Waitlist Open: ${section['waitlistOpen']}")
                    .survivalGuideWhiteText,
                Text("Description: ${section['description']}")
                    .survivalGuideWhiteText,
                const SizedBox(height: 10),
                const Text('Day(s) & Location(s):').survivalGuideWhiteText,
                Text(
                  "${meeting['daysRaw']} ${formatTime(meeting['startTime'])} - ${formatTime(meeting['endTime'])} - ${meeting['location']}",
                ).survivalGuideWhiteText,
                Text(
                  "Dates: ${DateTime.parse(meeting['startDate']).toLocal().toFormattedString()} - ${DateTime.parse(meeting['endDate']).toLocal()}",
                ).survivalGuideWhiteText,
                Text(
                  "Enrollment Requirement: ${enrollmentRequirements.isNotEmpty ? enrollmentRequirements[0]['description'] : 'None'}",
                ).survivalGuideWhiteText,
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Close').survivalGuideWhiteText,
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
      printWrapped("section: ${section.toString()}");
      var sectionId = section['id'];

      if (!sectionColorMap.containsKey(sectionId)) {
        sectionColorMap[sectionId] =
            pastelColors[rng.nextInt(pastelColors.length)];
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
              style: const TextStyle(color: Colors.black),
            ),
            subtitle: Text(
              '${formatTime(startTime)} - ${formatTime(endTime)} | $daysText',
              style: const TextStyle(color: Colors.black),
            ),
            trailing: _exportClassToCalendar(section),
            onTap: () => _showSectionInfo(context, section),
          ),
        ),
      );
    }

    return cards;
  }

  ElevatedButton _exportClassToCalendar(dynamic section) {
    return ElevatedButton(
      onPressed: () => _addEventsToCalendar(section),
      child: const Text('Export class to Calendar').survivalGuideWhiteText,
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        if (matchingSections != null) // Check if matchingSections is not null
         for (var section in matchingSections.where((s) => s != null)) // Loop iterates only over non-null sections
           ListTile(
               title: Text(section['title']),
                onTap: () => _addEventsToCalendar(section), // Callback calls the _addEventsToCalendar() method with the current section as the parameter.
               ),
         ],
    );
}
