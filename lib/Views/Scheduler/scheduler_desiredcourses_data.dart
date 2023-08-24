import 'package:flutter/material.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_generate_courses.dart';
import 'package:survival_guide/models/SchedulerAppDataModel.dart';
import 'package:survival_guide/models/SchedulerDesiredCoursesModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

import '../../constants/colors.dart';
import '../../constants/shimmer.dart';
import '../../constants/text.dart';

class SchedulerDesiredCoursesWidget extends StatefulWidget {
  final SchedulerApiService apiService;
  final String term;
  final SchedulerAppDataModel appData;
  final List<String>? desiredCourses;

  SchedulerDesiredCoursesWidget({
    Key? key,
    required this.apiService,
    required this.term,
    required this.appData,
    this.desiredCourses,
  }) : super(key: key);

  @override
  _SchedulerDesiredCoursesWidgetState createState() => _SchedulerDesiredCoursesWidgetState();
}

class _SchedulerDesiredCoursesWidgetState extends State<SchedulerDesiredCoursesWidget> {
  List<String>? desiredCourses;
  late String term;
  late SchedulerApiService apiService;
  @override
  void initState() {
    term = widget.term;
    apiService = widget.apiService;
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _desiredCourses(),
      SchedulerGenerateCoursesButton(
          apiService: widget.apiService,
          term: widget.term,
          courses: desiredCourses ?? [],
          currentSections: [],
          breaks: widget.appData.breaks ?? []),
    ]);
  }

  Widget _buildErrorWidget(dynamic error) {
    return Center(
      child: Text(
        'Error: $error',
        style: TextStyle(color: textColor, fontSize: 16.0),
      ),
    );
  }

  FutureBuilder _desiredCourses() {
    return FutureBuilder<List<SchedulerDesiredCoursesModel>>(
        future: apiService.fetchDesiredCourse(term),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return shimmerEffect(200); // Your shimmerEffect widget
          } else if (snapshot.hasError) {
            return _buildErrorWidget(snapshot.error);
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return _buildNoDataWidget();
          } else {
            return _buildListView(context, snapshot.data!);
          }
        });
  }

  Widget _buildNoDataWidget() {
    return Center(
      child: Text(
        'You have no desired courses.',
        style: TextStyle(color: textColor, fontSize: 16.0),
      ),
    );
  }

  Widget _buildListView(
      BuildContext context, List<SchedulerDesiredCoursesModel> data) {
    desiredCourses = data.map((e) => e.courseKey).toList();
    return Card(
      elevation: 5.0,
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Course', style: headerTextStyle()),
                  Text('Course', style: headerTextStyle()),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.25),
                  Text('Instructor', style: headerTextStyle()),
                ],
              ),
            ),
            ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final course = data[index];
                return Dismissible(
                  key: Key(course.courseKey),
                  background: Container(color: Colors.red),
                  // or any custom background you prefer
                  onDismissed: (direction) {
                    apiService.deleteDesiredCourse(term, course.id);
                  },
                  child: ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(course.title, style: cellTextStyle()),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(course.courseKey, style: cellTextStyle()),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              '${course.id} ${course.title}',
                              style: cellTextStyle(),
                              softWrap: false,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.25,
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Text(
                              course.credits.isEmpty ? 'TBA' : course.credits,
                              style: cellTextStyle(),
                              softWrap: false,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
