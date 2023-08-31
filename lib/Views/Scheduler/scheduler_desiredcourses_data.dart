import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_generate_courses.dart';
import 'package:survival_guide/constants/showDialog.dart';
import 'package:survival_guide/constants/widgets/show_modal.dart';
import 'package:survival_guide/models/SchedulerAppDataModel.dart';
import 'package:survival_guide/models/SchedulerDesiredCoursesModel.dart';
import 'package:survival_guide/models/SchedulerShoppingCartModel.dart';
import 'package:survival_guide/repository/college_scheduler_socket_client.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

import '../../constants/colors.dart';
import '../../constants/shimmer.dart';
import '../../constants/text.dart';
import '../../models/SchedulerGenerateCoursesModel.dart' as generateCourses;
import '../../models/SchedulerGenerateCoursesModel.dart';
import '../scheduler_screen.dart';

class SchedulerDesiredCoursesWidget extends StatefulWidget {
  final SchedulerApiService apiService;
  final String term;
  final SchedulerAppDataModel appData;
  final List<generateCourses.CurrentSections> currentSections;
  final List<String>? desiredCourses;

  SchedulerDesiredCoursesWidget({
    Key? key,
    required this.apiService,
    required this.term,
    required this.appData,
    this.desiredCourses,
    required this.currentSections,
  }) : super(key: key);

  @override
  _SchedulerDesiredCoursesWidgetState createState() =>
      _SchedulerDesiredCoursesWidgetState();
}

class _SchedulerDesiredCoursesWidgetState
    extends State<SchedulerDesiredCoursesWidget> {
  final ValueNotifier<List<String>> desiredCoursesNotifier =
      ValueNotifier<List<String>>([]);
  final ValueNotifier<List<SchedulerDesiredCoursesModel>>
      desiredCoursesObjectNotifier =
      ValueNotifier<List<SchedulerDesiredCoursesModel>>([]);
  late String term;
  late SchedulerApiService apiService;

  @override
  void initState() {
    super.initState();
    term = widget.term;
    apiService = widget.apiService;

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      apiService.fetchDesiredCourse(term).then((data) {
        desiredCoursesObjectNotifier.value = data;
        desiredCoursesNotifier.value = data.map((e) => e.id).toList();
      }).catchError((error) {
        // Handle error
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      _desiredCourses(),
      ValueListenableBuilder<List<String>>(
        valueListenable: desiredCoursesNotifier,
        builder: (context, desiredCourses, child) {
          return SchedulerGenerateCoursesButton(
            apiService: widget.apiService,
            term: widget.term,
            courses: desiredCourses,
            currentSections: widget.currentSections,
            breaks: widget.appData.breaks ?? [],
            onGenerate: (SchedulerGenerateCoursesModel response) {
              showGestureModal(context, ScheduleScreen(generatedScheduleCourses: response));
            },
          );
        },
      ),
      ElevatedButton(
          onPressed: () => {
                apiService.fetchWebSocketToken().then((token) {
                  List<SchedulerDesiredCoursesModel> desiredCoursesObject =
                      desiredCoursesObjectNotifier.value;
                  CollegeSchedulerSocketClient(
                    token: token,
                    shoppingCartItems: desiredCoursesObject,
                    termCode: widget.appData.terms?.last.code ?? '',
                    userId: widget.appData.studentUserId ?? 0,
                    onError: (errorCode, error) => alert(context,
                        "$errorCode " + error), // pass the callback here
                  );
                })
              },
          child: const Text('Send to shopping cart'))
    ]);
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
          desiredCoursesNotifier.value =
              snapshot.data!.map((e) => e.id).toList();
          return _buildListView(context, snapshot.data!);
        }
      },
    );
  }

  Widget _buildErrorWidget(dynamic error) {
    return Center(
      child: Text(
        'Error: $error',
        style: TextStyle(color: textColor, fontSize: 16.0),
      ),
    );
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
