import 'package:flutter/material.dart';
import 'package:survival_guide/constants/htmlParse.dart';
import '../../constants/colors.dart';
import '../../constants/showDialog.dart';
import '../../models/SchedulerGenerateCoursesModel.dart';
import '../../repository/scheduler_api_services.dart';

class SchedulerGenerateCoursesButton extends StatelessWidget {
  final List<String> courses;
  final List<CurrentSections> currentSections;
  final List<dynamic> breaks;
  final SchedulerApiService apiService;
  final String term;

  const SchedulerGenerateCoursesButton({super.key,
    required this.courses,
    required this.currentSections,
    required this.breaks,
    required this.apiService,
    required this.term
  });

  @override
  Widget build(BuildContext context) {
    void generateSchedule() async {
      try {
        SchedulerGenerateCoursesModel response = await apiService.generateScheduler(term, courses, currentSections, breaks);
        if (response.warnings.isNotEmpty) {
          for (var warning in response.warnings) {
            alert(context, removeHtmlTags(warning.warning));
          }
        }
      } catch (e) {
        alert(context, e.toString());
      }
    }

    return Center(
      child: ElevatedButton(
        onPressed: generateSchedule ,
        style: ElevatedButton.styleFrom(
          backgroundColor: cardBackgroundColor,
        ),
        child: const Text('Generate Schedule'),
      ),
    );
  }
}
