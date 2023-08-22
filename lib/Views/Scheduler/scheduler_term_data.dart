import 'package:flutter/material.dart';
import 'package:survival_guide/constants/text.dart';
import 'package:survival_guide/models/SchedulerTermDataModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

import '../../constants/colors.dart';
import '../../constants/shimmer.dart';

class SchedulerCoursesWidget extends StatelessWidget {
  final SchedulerApiService apiService;
  final String term;


  SchedulerCoursesWidget({
    required this.apiService,
    required this.term,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SchedulerTermDataModel>(
      future: apiService.fetchTermData(term),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return shimmerEffect(200);
        } else if (snapshot.hasError) {
          return _buildErrorWidget(snapshot.error);
        } else if (!snapshot.hasData) {
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
        'No data available.',
        style: TextStyle(color: textColor, fontSize: 16.0),
      ),
    );
  }

  Widget _buildDataTable(BuildContext context, SchedulerTermDataModel data) {
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
            rows: data.currentSections
                .map((course) => _buildDataRow(context, course))
                .toList(),
          ),
        ),
      ),
    );
  }

  DataRow _buildDataRow(BuildContext context, CurrentSections course) {
    return DataRow(
      color:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Theme.of(context).colorScheme.primary.withOpacity(0.08);
        }
        return cardBackgroundColor; // make sure you have defined this somewhere in your code
      }),
      cells: [
        DataCell(Text(course.enrollmentStatus, style: cellTextStyle())),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                course.title,
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
                course.instructor.isEmpty
                    ? 'TBA'
                    : course.instructor.first.name,
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
