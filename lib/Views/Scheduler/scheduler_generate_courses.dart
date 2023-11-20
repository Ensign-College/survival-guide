import 'package:flutter/material.dart';
import 'package:survival_guide/constants/constant_strings.dart';
import 'package:survival_guide/constants/htmlParse.dart';
import '../../constants/colors.dart';
import '../../constants/widgets/showDialog.dart';
import '../../models/SchedulerGenerateCoursesModel.dart';
import '../../repository/scheduler_api_services.dart';
import '../school_login.dart';

class SchedulerGenerateCoursesButton extends StatefulWidget {
  final List<String> courses;
  final List<CurrentSections> currentSections;
  final List<dynamic> breaks;
  final SchedulerApiService apiService;
  final String term;
  final Function(SchedulerGenerateCoursesModel) onGenerate;

  const SchedulerGenerateCoursesButton({
    Key? key,
    required this.courses,
    required this.currentSections,
    required this.breaks,
    required this.apiService,
    required this.term,
    required this.onGenerate,
  }) : super(key: key);

  @override
  SchedulerGenerateCoursesButtonState createState() => SchedulerGenerateCoursesButtonState();
}

class SchedulerGenerateCoursesButtonState extends State<SchedulerGenerateCoursesButton> {
  void generateSchedule() async {
    try {
      SchedulerGenerateCoursesModel response = await widget.apiService.generateScheduler(
        widget.term,
        widget.courses,
        widget.currentSections,
        widget.breaks,
      );
      widget.onGenerate(response);
      if (response.warnings.isNotEmpty) {
        for (var warning in response.warnings) {
          alert(alertErrorHeader, removeHtmlTags(warning.warning));
        }
      }
    } catch (e) {
      // alert('Error', e.toString());
      handleError(context, e);
    }
  }

  void handleError(BuildContext context, dynamic error) {
    // Handle the error, e.g., show a dialog or navigate to the login page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SAMLLogin()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: generateSchedule,
        style: ElevatedButton.styleFrom(
          backgroundColor: cardBackgroundColor, // Replace with the actual color
        ),
        child: const Text('Generate Schedule'),
      ),
    );
  }
}
