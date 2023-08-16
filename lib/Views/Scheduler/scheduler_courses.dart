import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:survival_guide/models/SchedulerCourseModel.dart';

import '../../constants/colors.dart';
import '../../constants/shimmer.dart';
import '../../models/SchedulerSubjectModel.dart';
import '../../repository/scheduler_api_services.dart';

class SchedulerCoursesPage extends StatefulWidget {
  final SchedulerApiService apiService;
  final Future<List<SchedulerSubjectModel>> subjects;

  SchedulerCoursesPage({required this.apiService, required this.subjects});

  @override
  _SchedulerCoursesPageState createState() => _SchedulerCoursesPageState();
}

class _SchedulerCoursesPageState extends State<SchedulerCoursesPage> {
  SchedulerSubjectModel? selectedSubject;
  List<SchedulerCourseModel>? selectedCourses;
  SchedulerCourseModel? selectedCourse;
  bool showCourses = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        subjectsRow(),
        Padding(padding: EdgeInsets.all(8.0)),
        coursesRow(),
      ],
    );
  }

  void _onSubjectTap(SchedulerSubjectModel subject) async {
    try {
      final courses =
          await widget.apiService.fetchCoursesForSubject(subject.id);
      setState(() {
        selectedCourses = courses;
        selectedCourse = selectedCourses?.first;
        showCourses = true;
      });
    } catch (e) {
      debugPrint('Error fetching courses: $e');
    }
  }

  Widget coursesRow() {
    return showCourses
        ? Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Courses:',
                style: TextStyle(color: textColor, fontSize: 24),
              ),
              Expanded(child: buildCourses()),
            ],
          )
        : const SizedBox.shrink();
  }

  Row subjectsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Subjects:',
          style: TextStyle(color: textColor, fontSize: 24),
        ),
        Expanded(child: buildSubjects()),
      ],
    );
  }

  FutureBuilder<List<SchedulerSubjectModel>> buildSubjects() {
    return FutureBuilder<List<SchedulerSubjectModel>>(
      future: widget.subjects,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return shimmerEffect(50, baseColor: appBackgroundColor);
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.isEmpty) {
          return Text(
            'No subjects available.',
            style: TextStyle(color: textColor),
          );
        } else {
          return DropdownButton<SchedulerSubjectModel>(
            hint: Text(
              selectedSubject != null
                  ? selectedSubject!.title
                  : "Select a subject",
              style: TextStyle(color: textColor),
            ),
            dropdownColor: appBackgroundColor,
            icon: Icon(Icons.arrow_downward, color: textColor),
            iconSize: 24,
            style: TextStyle(color: textColor),
            onChanged: (SchedulerSubjectModel? newValue) async {
              setState(() {
                selectedSubject = newValue;
                showCourses = false;
                _onSubjectTap(selectedSubject!);
              });
            },
            items: snapshot.data!.map<DropdownMenuItem<SchedulerSubjectModel>>(
                (SchedulerSubjectModel value) {
              return DropdownMenuItem<SchedulerSubjectModel>(
                value: value,
                child: Text(
                  value.title,
                  style: TextStyle(color: textColor),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }

  Widget buildCourses() {
    if (selectedCourses == null || selectedCourses!.isEmpty) {
      return shimmerEffect(50, baseColor: appBackgroundColor);
    }
    return DropdownButton<SchedulerCourseModel>(
      hint: Text(
        selectedCourse != null ? selectedCourse!.title : 'Select a course',
        style: TextStyle(color: textColor),
      ),
      dropdownColor: appBackgroundColor,
      icon: Icon(Icons.arrow_downward, color: textColor),
      iconSize: 24,
      style: TextStyle(color: textColor),
      onChanged: (SchedulerCourseModel? newValue) {
        setState(() {
          selectedCourse = newValue;
        });
      },
      items: selectedCourses!.map<DropdownMenuItem<SchedulerCourseModel>>(
          (SchedulerCourseModel value) {
        return DropdownMenuItem<SchedulerCourseModel>(
          value: value,
          child: Text(
            value.number + " " + value.title,
            style: TextStyle(color: textColor),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        );
      }).toList(),
    );
  }
}
