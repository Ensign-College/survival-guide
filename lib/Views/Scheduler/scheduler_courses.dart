import 'package:flutter/material.dart';
import 'package:survival_guide/models/SchedulerCourseModel.dart';

class SchedulerCoursesPage extends StatelessWidget {
  final List<SchedulerCourseModel> courses;

  SchedulerCoursesPage({required this.courses});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Courses"), backgroundColor: Colors.white),
      body: ListView.builder(
        itemCount: courses.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              courses[index].title,
              style: TextStyle(color: Colors.white),
            ),
            // Add other details as needed
          );
        },
      ),
    );
  }
}
