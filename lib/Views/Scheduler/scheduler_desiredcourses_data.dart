import 'package:flutter/material.dart';
import 'package:survival_guide/models/SchedulerDesiredCoursesModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

import '../../constants/colors.dart';
import '../../constants/shimmer.dart';
import '../../constants/text.dart';
import '../../constants/widgets.dart';

class SchedulerDesiredCoursesWidget extends StatelessWidget {
  final SchedulerApiService apiService;
  final String term;

  const SchedulerDesiredCoursesWidget({super.key,
    required this.apiService,
    required this.term,
  });

  @override
  Widget build(BuildContext context) {
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
          return _buildDataTable(context, snapshot.data!);
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

  Widget _buildDataTable(BuildContext context, List<SchedulerDesiredCoursesModel> data) {
    return Card(
      elevation: 5.0,
      color: cardBackgroundColor,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 8.0),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 40,
            columnSpacing: 30,
            clipBehavior: Clip.antiAlias,
            columns: [
              DataColumn(label: Text('Status', style: headerTextStyle())),
              DataColumn(label: Text('Course', style: headerTextStyle())),
              DataColumn(label: Text('Instructor', style: headerTextStyle())),
            ],
            rows: data.map((course) => _buildDataRow(context, course)).toList(),
          ),
        ),
      ),
    );
  }


  DataRow _buildDataRow(BuildContext context, SchedulerDesiredCoursesModel course) {
    return DataRow(
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
        DataCell(
          buildDismissibleCell(
            context: context,
            title: 'Delete',
            onDeleteCallback: () => apiService.deleteDesiredCourse(term, course.id),
            course: course,
          ),
        ),
        DataCell(
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
        ),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                course.credits.isEmpty
                    ? 'TBA'
                    : course.credits,
                style: cellTextStyle(),
                softWrap: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
