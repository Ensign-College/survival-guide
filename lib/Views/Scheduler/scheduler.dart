import 'package:flutter/material.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_courses.dart';
import 'package:survival_guide/constants/developer.dart';
import 'package:survival_guide/models/SchedulerCourseModel.dart';
import 'package:survival_guide/models/SchedulerSubjectModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

import '../../models/SchedulerAppDataModel.dart';
import '../school_login.dart';

class SchedulerListPage extends StatefulWidget {
  final String cookie;

  SchedulerListPage({required this.cookie});

  @override
  _SchedulerListPageState createState() => _SchedulerListPageState();
}

class _SchedulerListPageState extends State<SchedulerListPage> {
  late Future<List<SchedulerSubjectModel>> subjects;
  late final SchedulerApiService apiService;

  @override
  void initState() {
    super.initState();
    print("Fetching subjects..."); // Log the initialization
    apiService = SchedulerApiService(cookie: widget.cookie);
    subjects = apiService.fetchSubjects().catchError((e) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SAMLLogin()),
      );
    });

    _callPrint();
  }


  void _callPrint() async {
   await printAppData();
  }
  Future<void> printAppData() async {
    final appdata = await apiService.fetchAppData();
    printWrapped('appdata is ${appdata.terms?.first.title} ${appdata.terms?.last.title}' );
  }

  void _onSubjectTap(SchedulerSubjectModel subject) async {
    try {
      final List<SchedulerCourseModel> courses =
          await apiService.fetchCoursesForSubject(subject.id);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) {
            return SchedulerCoursesPage(courses: courses);
          },
        ),
      );
    } catch (e) {
      print(e.toString());
      // Handle error (e.g., show a dialog or a snackbar with an error message)
      print(
          'Failed to load courses'); // You can replace this with proper error handling
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Scheduler")),
      body: FutureBuilder<List<SchedulerSubjectModel>>(
        future: subjects,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasError) {
            return Text(
              'Error: ${snapshot.error}',
              style: const TextStyle(color: Colors.white),
            );
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Text(
              'No subjects available.',
              style: TextStyle(color: Colors.white),
            );
          } else {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(
                    snapshot.data![index]
                        .title, // Access the title property of the subject
                    style: const TextStyle(color: Colors.white),
                  ),
                  onTap: () => _onSubjectTap(snapshot.data![index]),
                );
              },
            );
          }
        },
      ),
    );
  }
}
