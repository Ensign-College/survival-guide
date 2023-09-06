// Importing required packages and components.
import 'package:flutter/material.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_courses.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_desiredcourses_data.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_term_data.dart' as termdata;
import 'package:survival_guide/constants/constant_strings.dart';
import 'package:survival_guide/models/SchedulerSubjectModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';
import 'package:survival_guide/utilities/convertCurrentSectionsAppData.dart';
import '../../constants/colors.dart';
import '../../constants/shimmer.dart';
import '../../constants/widgets/showDialog.dart';
import '../../constants/widgets/future_error_widgets.dart';
import '../../models/SchedulerAppDataModel.dart';
import '../../models/SchedulerGenerateCoursesModel.dart' as generate_courses;
import '../../models/SchedulerTermDataModel.dart';
import '../school_login.dart';

class SchedulerListPage extends StatefulWidget {
  final String cookie;
  final String term;
  final SchedulerAppDataModel appData;

  const SchedulerListPage({super.key, required this.cookie, required this.term, required this.appData});

  @override
  SchedulerListPageState createState() => SchedulerListPageState();
}

class SchedulerListPageState extends State<SchedulerListPage>
    with SingleTickerProviderStateMixin {
  // Variables to handle the fetching of subjects and to manage tabs.
  late final SchedulerApiService apiService;
  late final String term = widget.term;
  late Future<List<SchedulerSubjectModel>> subjects;
  late Future<SchedulerTermDataModel> termData;
  List<generate_courses.CurrentSections> currentSections = [];
  bool isCurrentSectionsPopulated = false;  // We don't want to read the current sections to the desired courses list every time the widget is rebuilt.

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
        MaterialPageRoute(builder: (context) => const SAMLLogin()),
      );
    });
    termData = apiService.fetchTermData(term);
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
              buildTermDataWidget(),
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
              SchedulerDesiredCoursesWidget(apiService: apiService, term: widget.term, appData: widget.appData, currentSections: currentSections,),
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

  void setCurrentSection(SchedulerTermDataModel? data) {
    if (isCurrentSectionsPopulated) {
      return; // Skip if already populated
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      currentSections.clear();  // Clear the list
      for (var currentSection in data!.currentSections) {
        currentSections.add(convertToCourseGenerator(currentSection));
      }
      setState(() {
        // This is an empty setState, but it should trigger a rebuild
      });
      isCurrentSectionsPopulated = true;  // Mark as populated
    });
  }

  Widget buildTermDataWidget() {
    return FutureBuilder<SchedulerTermDataModel>(
      future: termData,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return shimmerEffect(200);
        } else if (snapshot.hasError) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            alert(alertErrorHeader, snapshot.error.toString());
          });
          return buildErrorWidget(snapshot.error);
        } else if (!snapshot.hasData) {
          return buildNoDataWidget();
        } else {
          setCurrentSection(snapshot.data!);
          return termdata.SchedulerCoursesWidget(
            apiService: apiService, term: term, termData: snapshot.data!,
          );
        }
      },
    );
  }

}
