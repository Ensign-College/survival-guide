import 'package:flutter/material.dart';
import 'package:survival_guide/Views/Scheduler/CourseSection/scheduler_course_sections.dart';
import 'package:survival_guide/Views/Scheduler/CourseSection/scheduler_course_sections_view_model.dart';
import 'package:survival_guide/Views/Scheduler/scheduler_generate_courses.dart';
import 'package:survival_guide/constants/constant_strings.dart';
import 'package:survival_guide/constants/widgets/showDialog.dart';
import 'package:survival_guide/constants/widgets/show_modal.dart';
import 'package:survival_guide/models/SchedulerAppDataModel.dart';
import 'package:survival_guide/models/SchedulerDesiredCoursesModel.dart';
import 'package:survival_guide/models/SchedulerRegBlocksModel.dart';
import 'package:survival_guide/repository/college_scheduler_socket_client.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

import '../../constants/colors.dart';
import '../../constants/shimmer.dart';
import '../../constants/text.dart';
import '../../models/SchedulerGenerateCoursesModel.dart' as generate_courses;
import '../../models/SchedulerGenerateCoursesModel.dart';
import '../scheduler_screen.dart';

class SchedulerDesiredCoursesWidget extends StatefulWidget {
  final SchedulerApiService apiService;
  final String term;
  final SchedulerAppDataModel appData;
  final List<generate_courses.CurrentSections> currentSections;
  final List<String>? desiredCourses;

  const SchedulerDesiredCoursesWidget({
    Key? key,
    required this.apiService,
    required this.term,
    required this.appData,
    this.desiredCourses,
    required this.currentSections,
  }) : super(key: key);

  @override
  SchedulerDesiredCoursesWidgetState createState() =>
      SchedulerDesiredCoursesWidgetState();
}

class SchedulerDesiredCoursesWidgetState
    extends State<SchedulerDesiredCoursesWidget> {
  final ValueNotifier<List<String>> desiredCoursesNotifier =
  ValueNotifier<List<String>>([]);
  final ValueNotifier<List<SchedulerDesiredCoursesModel>>
  desiredCoursesObjectNotifier =
  ValueNotifier<List<SchedulerDesiredCoursesModel>>([]);
  late String term;
  late SchedulerApiService apiService;
  bool isDesiredCoursesEmpty = false;

  @override
  void initState() {
    super.initState();
    term = widget.term;
    apiService = widget.apiService;

    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    return isDesiredCoursesEmpty ? _buildNoDataWidget() : _desiredCourses();
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
          return Column(
            children: [
              _buildListView(context, snapshot.data!),
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
                      showGestureModal(context,
                          ScheduleScreen(generatedScheduleCourses: response));
                    },
                  );
                },
              ),
              _sendToShoppingButton(),
            ],
          );
        }
      },
    );
  }

  ListView _desiredCoursesList(List<SchedulerDesiredCoursesModel> data) {

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final course = data[index];
        final regBlocks = apiService.fetchRegistrationBlocks(term, course.subjectShort, course.number);

        return Dismissible(
          key: Key(course.courseKey),
          background: Container(
            color: Colors.red,
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.delete, color: Colors.white),
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('Remove class',
                      style: TextStyle(color: Colors.white, fontSize: 18.0)),
                ),
              ],
            ),
          ),
          onDismissed: (direction) {
            apiService.deleteDesiredCourse(term, course.id);
            if (data.length == 1) {
              setState(() {
                isDesiredCoursesEmpty = true;
              });
            }
          },
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            subtitle: Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      '${course.subjectShort} ${course.title}',
                      style: survivalGuideCellTextStyle(),
                      softWrap: false,
                    ),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      alignment: Alignment.center,
                      child: Text(
                        course.credits.isEmpty ? 'TBA' : '\t        ${course.credits}',
                        style: TextStyle(
                          color: textColor,
                          fontSize: 16.0,
                        ),
                        softWrap: false,
                      ),
                    ),
                  ),
                ),
                // ElevatedButton(onPressed: () {
                //   apiService.fetchRegistrationBlocks(term, course.subjectShort, course.number);
                // }, child: const Text('Sections'))
                Expanded(
                  child: ElevatedButton(
                    onPressed: () async {
                      SchedulerRegBlocksModel resolvedRegBlocks = await regBlocks;
                      final courseSectionViewModel = SchedulerCourseSectionsViewModel(
                        regBlocks: resolvedRegBlocks,
                        apiService: apiService,
                        course: course,
                        term: widget.term,
                      );
                      courseSectionViewModel.initializeSelectedBlocks();
                        showGestureModal(context,
                          SchedulerCourseSectionsView(
                             viewModel: courseSectionViewModel,
                          ),
                      );
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.resolveWith((states) {
                        if (states.contains(MaterialState.pressed)) {
                          // Change this color if you want a different color when pressed
                          return constantCardBackgroundColor;
                        } else {
                          return constantCardBackgroundColor; // Use the default button color
                        }
                      }),
                    ),
                    child: const Text('Sections'),
                  ),
                ),
              ],
            ),
          ),
        );
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

  Widget _buildListView(BuildContext context, List<SchedulerDesiredCoursesModel> data) {
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
                children: [
                  Expanded(child: Text('Title', style: headerTextStyle())), // changed label to 'Course Key'
                  Expanded(child: Text('Credits', style: headerTextStyle())), // changed label to 'Course ID & Title'
                  Expanded(child: Text('Sections', style: headerTextStyle())),
                ],
              ),
            ),
            _desiredCoursesList(data),
          ],
        ),
      ),
    );
  }

  Widget _sendToShoppingButton() {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith((states) {
          return constantCardBackgroundColor;
        }),
      ),
      onPressed: () => {
        apiService.fetchWebSocketToken().then((token) {
          List<SchedulerDesiredCoursesModel> desiredCoursesObject =
              desiredCoursesObjectNotifier.value;
          CollegeSchedulerSocketClient(
            token: token,
            shoppingCartItems: desiredCoursesObject,
            termCode: widget.appData.terms?.last.code ?? '',
            userId: widget.appData.studentUserId ?? 0,
            onError: (errorCode, error) => alert(alertErrorHeader,
                '$errorCode $error'), // pass the callback here
          );
        })
      },
      child: const Text('Send to shopping cart'),
    );
  }
}
