import 'package:flutter/material.dart';
import 'package:survival_guide/models/SchedulerCourseModel.dart';

import '../../constants/colors.dart';
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
      children: [
        subjectsRow(),
        coursesRow(),
      ],
    );
  }

  void _onSubjectTap(SchedulerSubjectModel subject) async {
    try {
      final courses = await widget.apiService.fetchCoursesForSubject(subject.id);
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
              const Text(
                'Courses:',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
              buildCourses(),
            ],
          )
        : const SizedBox.shrink();
  }

  Row subjectsRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Padding(
          padding: EdgeInsets.only(right: 8.0), // Adjust the padding as needed
          child: Text(
            'Subjects:',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
        ),
        buildSubjects(),
      ],
    );
  }

  FutureBuilder<List<SchedulerSubjectModel>> buildSubjects() {
    return FutureBuilder<List<SchedulerSubjectModel>>(
      future: widget.subjects,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.isEmpty) {
          return const Text(
            'No subjects available.',
            style: TextStyle(color: Colors.white),
          );
        } else {
          return DropdownButton<SchedulerSubjectModel>(
            hint: Text(
              selectedSubject != null
                  ? selectedSubject!.title
                  : "Select a subject",
              style: const TextStyle(color: Colors.white),
            ),
            dropdownColor: appBackgroundColor,
            icon: const Icon(Icons.arrow_downward, color: Colors.white),
            iconSize: 24,
            style: const TextStyle(color: Colors.white),
            onChanged: (SchedulerSubjectModel? newValue) {
              setState(() async {
                selectedSubject = newValue;
                showCourses = true;
                _onSubjectTap(selectedSubject!);
              });
            },
            items: snapshot.data!.map<DropdownMenuItem<SchedulerSubjectModel>>(
                (SchedulerSubjectModel value) {
              return DropdownMenuItem<SchedulerSubjectModel>(
                value: value,
                child: Text(
                  value.title,
                  style: TextStyle(color: Colors.white),
                ),
              );
            }).toList(),
          );
        }
      },
    );
  }

  Widget buildCourses() {
    return DropdownButton<SchedulerCourseModel>(
      hint: Text(
        selectedCourse != null ? selectedCourse!.title : 'Select a course',
        style: const TextStyle(color: Colors.white),
      ),
      dropdownColor: appBackgroundColor,
      icon: const Icon(Icons.arrow_downward, color: Colors.white),
      iconSize: 24,
      style: const TextStyle(color: Colors.white),
      onChanged: (SchedulerCourseModel? newValue) {
        setState(() {
          selectedCourse = newValue; // Assign the selected course value
        });
      },
      items: selectedCourses!.map<DropdownMenuItem<SchedulerCourseModel>>(
          (SchedulerCourseModel value) {
        return DropdownMenuItem<SchedulerCourseModel>(
          value: value,
          child: Text(
             value.number + " " + value.title,
            style: TextStyle(color: Colors.white),
          ),
        );
      }).toList(),
    );
  }
}
