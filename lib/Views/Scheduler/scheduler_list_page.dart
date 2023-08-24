// Importing required packages and components.
import 'package:flutter/material.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_courses.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_desiredcourses_data.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_term_data.dart';
import 'package:survival_guide/models/SchedulerSubjectModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';
import '../../constants/colors.dart';
import '../../models/SchedulerAppDataModel.dart';
import '../school_login.dart';

class SchedulerListPage extends StatefulWidget {
  final String cookie;
  final String term;
  final SchedulerAppDataModel appData;

  SchedulerListPage({super.key, required this.cookie, required this.term, required this.appData});

  @override
  _SchedulerListPageState createState() => _SchedulerListPageState();
}

class _SchedulerListPageState extends State<SchedulerListPage>
    with SingleTickerProviderStateMixin {
  // Variables to handle the fetching of subjects and to manage tabs.
  late final SchedulerApiService apiService;
  late final String term = widget.term;
  late Future<List<SchedulerSubjectModel>> subjects;
  TabController? _tabController;

  // This function runs when the widget is created.
  @override
  void initState() {
    super.initState();

    // Initialize the API service with the given cookie.
    apiService = SchedulerApiService(cookie: widget.cookie);

    // Fetch the subjects and navigate to the login page if there's an error.
    subjects = apiService.fetchSubjects(widget.term).catchError((e) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SAMLLogin()),
      );
    });

    // Setup a tab controller for 2 tabs.
    _tabController = TabController(length: 2, vsync: this);
  }

  // This function runs when the widget is destroyed.
  @override
  void dispose() {
    // Dispose off the tab controller to free resources.
    _tabController?.dispose();
    super.dispose();
  }

  // This function describes the UI of the widget.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Setting up the top app bar with a title.
      appBar: AppBar(
        title: const Text('Scheduler'),
        backgroundColor: appBackgroundColor,
      ),
      backgroundColor: appBackgroundColor,
      // Setting up the bottom tab bar with two tabs.
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Enrolled Courses'),
          Tab(text: 'Desired Courses'),
        ],
      ),
      // Content of the tabs.
      body: TabBarView(
        controller: _tabController,
        children: [
          // First tab: showing enrolled courses.
          ListView(
            children: [
              // Displaying section titles and course lists.
              buildSectionTitle('Current Schedule'),
              const SizedBox(height: 10),
              SchedulerCoursesWidget(apiService: apiService, term: term),
              const SizedBox(height: 20),
              buildSectionTitle('Add classes'),
              const SizedBox(height: 10),
              SchedulerCoursesPage(
                apiService: apiService,
                subjects: subjects,
                term: widget.term,
              ),
            ],
          ),
          // Second tab: showing desired courses.
          ListView(
            children: [
              buildSectionTitle('Desired Courses'),
              const SizedBox(height: 10),
              SchedulerDesiredCoursesWidget(apiService: apiService, term: widget.term, appData: widget.appData,),
            ],
          ),
        ],
      ),
    );
  }

  // Function to build a styled section title.
  Text buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: textColor, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }
}
