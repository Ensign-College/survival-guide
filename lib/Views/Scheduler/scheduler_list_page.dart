import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_courses.dart';
import 'package:survival_guide/constants/developer.dart';
import 'package:survival_guide/models/SchedulerCourseModel.dart';
import 'package:survival_guide/models/SchedulerSubjectModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';
import '../../constants/colors.dart';
import '../../constants/shimmer.dart';
import '../../models/SchedulerAppDataModel.dart';
import '../../models/SchedulerDesiredCoursesModel.dart';
import '../../models/SchedulerTermDataModel.dart';
import '../school_login.dart';

class SchedulerListPage extends StatefulWidget {
  final String cookie;
  final String term;

  SchedulerListPage({super.key, required this.cookie, required this.term});

  @override
  _SchedulerListPageState createState() => _SchedulerListPageState();
}

class _SchedulerListPageState extends State<SchedulerListPage>
    with SingleTickerProviderStateMixin {
  late final SchedulerApiService apiService;
  late Future<List<SchedulerSubjectModel>> subjects;

  TabController? _tabController;

  @override
  void initState() {
    super.initState();

    apiService = SchedulerApiService(cookie: widget.cookie);
    subjects = apiService.fetchSubjects(widget.term).catchError((e) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => SAMLLogin()),
      );
    });
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scheduler'),
        backgroundColor: appBackgroundColor,
      ),
      backgroundColor: appBackgroundColor,
      bottomNavigationBar: TabBar(
        controller: _tabController,
        tabs: const [
          Tab(text: 'Enrolled Courses'),
          Tab(text: 'Desired Courses'),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: [
              buildSectionTitle('Current Schedule'),
              const SizedBox(height: 10),
              buildTermData(), // This displays enrolled courses
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
          ListView(
            children: [
              buildSectionTitle('Desired Courses'),
              const SizedBox(height: 10),
              buildDesiredCoursesData(), // This will display desired courses
            ],
          ),
        ],
      ),
    );
  }

  Text buildSectionTitle(String title) {
    return Text(
      title,
      style: TextStyle(
          color: textColor, fontSize: 24.0, fontWeight: FontWeight.bold),
    );
  }

  TextStyle _headerTextStyle() {
    return TextStyle(
        color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold);
  }

  TextStyle _cellTextStyle() {
    return TextStyle(
      color: textColor,
      fontSize: 16.0,
      overflow: TextOverflow.ellipsis,
    );
  }

  FutureBuilder<List<SchedulerDesiredCoursesModel>> buildDesiredCoursesData() {
    return FutureBuilder<List<SchedulerDesiredCoursesModel>>(
      future: apiService.fetchDesiredCourse(widget.term),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return shimmerEffect(200); // Change here
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: textColor, fontSize: 16.0),
            ),
          );
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(
            child: Text(
              'No data available.',
              style: TextStyle(color: textColor, fontSize: 16.0),
            ),
          );
        } else {
          for (final c in snapshot.data!) {
            printWrapped("Desired courses: ${c.title}");
          }
          return Text("Desired courses: ${snapshot.data?.first.title}");
        }
      },
    );
  }


  FutureBuilder<SchedulerTermDataModel> buildTermData() {
    return FutureBuilder<SchedulerTermDataModel>(
      future: apiService.fetchTermData(widget.term),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return shimmerEffect(200); // Change here
        } else if (snapshot.hasError) {
          return Center(
            child: Text(
              'Error: ${snapshot.error}',
              style: TextStyle(color: textColor, fontSize: 16.0),
            ),
          );
        } else if (!snapshot.hasData) {
          return Center(
            child: Text(
              'No data available.',
              style: TextStyle(color: textColor, fontSize: 16.0),
            ),
          );
        } else {
          return Card(
            elevation: 5.0,
            color: cardBackgroundColor,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: SingleChildScrollView(
                // Added scrollview
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  headingRowHeight: 40,
                  columnSpacing: 30,
                  clipBehavior: Clip.antiAlias,
                  columns: [
                    DataColumn(
                        label: Text('Status', style: _headerTextStyle())),
                    DataColumn(
                        label: Text('Course', style: _headerTextStyle())),
                    DataColumn(
                        label: Text('Instructor', style: _headerTextStyle())),
                  ],
                  rows: snapshot.data!.currentSections
                      .map((course) => DataRow(
                            color: MaterialStateProperty.resolveWith<Color>(
                              (Set<MaterialState> states) {
                                if (states.contains(MaterialState.selected)) {
                                  return Theme.of(context)
                                      .colorScheme
                                      .primary
                                      .withOpacity(0.08);
                                }
                                return cardBackgroundColor;
                              },
                            ),
                            cells: [
                              DataCell(Text(course.enrollmentStatus,
                                  style: _cellTextStyle())),
                              DataCell(
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      course.course + " " + course.title,
                                      style: _cellTextStyle(),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ),
                              DataCell(
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.25,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Text(
                                      course.instructor.isEmpty
                                          ? "TBA"
                                          : course.instructor.first.name,
                                      style: _cellTextStyle(),
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ))
                      .toList(),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}
