import 'package:flutter/material.dart';
import 'package:survival_guide/constants/text.dart';
import 'package:survival_guide/models/SchedulerTermDataModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

import '../../constants/colors.dart';

class SchedulerCoursesWidget extends StatelessWidget {
  final SchedulerApiService apiService;
  final String term;
  final SchedulerTermDataModel termData;

  const SchedulerCoursesWidget({super.key,
    required this.apiService,
    required this.term,
    required this.termData,
  });

  @override
  Widget build(BuildContext context) {
    return _buildDataTable(context, termData);
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
        DataCell(Text(course.enrollmentStatus, style: survivalGuideCellTextStyle())),
        DataCell(
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.25,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Text(
                course.title,
                style: survivalGuideCellTextStyle(),
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
                style: survivalGuideCellTextStyle(),
                softWrap: false,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
