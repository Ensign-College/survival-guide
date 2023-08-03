import 'package:flutter/material.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_courses.dart';
import 'package:survival_guide/constants/developer.dart';
import 'package:survival_guide/models/SchedulerCourseModel.dart';
import 'package:survival_guide/models/SchedulerSubjectModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

import '../../constants/colors.dart';
import '../../models/SchedulerAppDataModel.dart';
import '../../models/SchedulerTermDataModel.dart';
import '../school_login.dart';

class SchedulerListPage extends StatefulWidget {
  final String cookie;
  final String term;

  SchedulerListPage({super.key, required this.cookie, required this.term});

  @override
  _SchedulerListPageState createState() => _SchedulerListPageState();
}

class _SchedulerListPageState extends State<SchedulerListPage> {
  late final SchedulerApiService apiService;
  late Future<List<SchedulerSubjectModel>> subjects;

  @override
  void initState() {
    super.initState();
    apiService = SchedulerApiService(cookie: widget.cookie);
    buildTermData();
    subjects = apiService.fetchSubjects(widget.term).catchError((e) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SAMLLogin()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scheduler')),
      backgroundColor: appBackgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text("Current Schedule: ", style: TextStyle(color: Colors.white, fontSize: 24.0),),
          Padding(padding: EdgeInsets.all(10.0),),
          buildTermData(),
          Padding(padding: EdgeInsets.all(10.0),),
          Text("Add classes: ", style: TextStyle(color: Colors.white, fontSize: 24.0),),
          Padding(padding: EdgeInsets.all(10.0),),
          SchedulerCoursesPage(apiService: apiService, subjects: subjects,),
        ],
      ),
    );
  }

  FutureBuilder<SchedulerTermDataModel> buildTermData() {
    return FutureBuilder<SchedulerTermDataModel>(
      future: apiService.fetchTermData(widget.term),
      builder: (context, snapshot) {
        print("fall first class: ${snapshot.data?.courses.first.title}");
        print("Instructor: ${snapshot.data?.currentSections.first.course}");
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          return Text(
            'Error: ${snapshot.error}',
            style: const TextStyle(color: Colors.white),
          );
        } else if (!snapshot.hasData) {
          return const Text(
            'No data available.',
            style: TextStyle(color: Colors.white),
          );
        } else {
          return DataTable(
            columns: const [
              DataColumn(
                  label: Text('Status',
                      style: TextStyle(color: Colors.white, fontSize: 18.0))),
              DataColumn(
                  label: Text('Course',
                      style: TextStyle(color: Colors.white, fontSize: 18.0))),
              DataColumn(
                  label: Text('Instructor',
                      style: TextStyle(color: Colors.white, fontSize: 18.0))),
            ],
            rows: snapshot.data!.currentSections
                .map((course) => DataRow(
                      cells: [
                        DataCell(Text(course.enrollmentStatus,
                            style: TextStyle(
                                color: Colors.white, fontSize: 18.0))),
                        DataCell(Text(course.course + " " + course.title,
                            style: TextStyle(
                                color: Colors.white, fontSize: 18.0))),
                        DataCell(Text(
                            course.instructor.isEmpty
                                ? "TBA"
                                : course.instructor.first.name,
                            style:
                                TextStyle(color: Colors.white, fontSize: 18.0)))
                      ],
                    ))
                .toList(),
          );
        }
      },
    );
  }
}
