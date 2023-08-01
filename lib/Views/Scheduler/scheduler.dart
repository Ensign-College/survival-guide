import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:survival_guide/Views/Scheduler/scheduler_courses.dart';
import 'dart:convert';

import 'package:survival_guide/models/SchedulerCourseModel.dart';
import 'package:survival_guide/models/SchedulerSubjectModel.dart';

import '../school_login.dart'; // Import jsonDecode

class SchedulerListPage extends StatefulWidget {
  final String cookie;

  SchedulerListPage({required this.cookie});

  @override
  _SchedulerListPageState createState() => _SchedulerListPageState();
}

class _SchedulerListPageState extends State<SchedulerListPage> {
  late Future<List<SchedulerSubjectModel>> subjects;

  @override
  void initState() {
    super.initState();
    print("Fetching subjects..."); // Log the initialization
    subjects = fetchSubjects();
  }

  Future<List<SchedulerSubjectModel>> fetchSubjects() async {
    print("Cookie: " + widget.cookie);
    final response = await http.get(
      Uri.parse(
          "https://ensign.collegescheduler.com/api/terms/2023%20Fall%20Semester/subjects"),
      headers: {'Cookie': ".AspNet.Cookies=" + widget.cookie},
    );

    print('Response status: ${response.statusCode}'); // Log response status
    print('Response body: ${response}'); // Log response body

    // Check for a condition that indicates a sign-in is required
    // For example, looking for a specific string in the response body:
    if (response.body.startsWith(
        '<!-- Copyright (C) Microsoft Corporation. All rights reserved. -->')) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SAMLLogin()),
      );
      // You might want to throw an exception or return an empty list here
      // since navigation away from this page may terminate the current operation.
      return []; // or throw Exception('Sign-in required');
    }

    final List<dynamic> parsedJson = jsonDecode(response.body);
    return parsedJson
        .map((subjectJson) => SchedulerSubjectModel.fromJson(subjectJson))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Subjects")),
      body: FutureBuilder<List<SchedulerSubjectModel>>(
        future: subjects,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text('Error: ${snapshot.error}',
                style: TextStyle(color: Colors.white));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Text('No subjects available.',
                style: TextStyle(color: Colors.white));
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                    title: Text(
                      snapshot.data![index]
                          .title, // Access the title property of the subject
                      style: TextStyle(
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    onTap: () async {
                      final subjectId = snapshot.data![index].id;
                      print(
                          'Tapped on subject with ID: $subjectId'); // Log tapped subject
                      final response = await http.get(
                        Uri.parse(
                            "https://ensign.collegescheduler.com/api/terms/2023%20Spring%20Semester/subjects/$subjectId/courses"),
                        headers: {'Cookie': ".AspNet.Cookies=" + widget.cookie},
                      );

                      if (response.statusCode == 200) {
                        // Check if response is successful
                        final List<dynamic> parsedJson =
                            jsonDecode(response.body);
                        final List<SchedulerCourseModel> courses = parsedJson
                            .map((courseJson) =>
                                SchedulerCourseModel.fromJson(courseJson))
                            .toList();

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SchedulerCoursesPage(courses: courses),
                          ),
                        );
                      } else {
                        // Handle error (e.g., show a dialog or a snackbar with an error message)
                        print(
                            'Failed to load courses'); // You can replace this with proper error handling
                      }
                    });
              },
            );
          }
        },
      ),
    );
  }
}
