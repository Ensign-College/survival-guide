// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:survival_guide/constants/text.dart';
import 'package:survival_guide/constants/widgets/show_info.dart';
import 'package:survival_guide/constants/widgets/show_modal.dart';
import 'package:survival_guide/models/SchedulerTermDataModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

import '../../constants/colors.dart';
import '../school_login.dart';

class SchedulerCoursesWidget extends StatelessWidget {
  final SchedulerApiService apiService;
  final String term;
  final SchedulerTermDataModel termData;

  const SchedulerCoursesWidget({
    super.key,
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
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: DataTable(
            headingRowHeight: 40,
            columnSpacing: 18,
            clipBehavior: Clip.antiAlias,
            columns: [
              DataColumn(label: Text('Status', style: headerTextStyle())),
              DataColumn(label: Text('Course', style: headerTextStyle())),
              DataColumn(label: Text('Instructor', style: headerTextStyle())),
              DataColumn(label: Text('Info', style: headerTextStyle())),
            ],
            // rows: data.currentSections
            //     .map((course) => _buildDataRow(context, course))
            //     .toList(),
            rows: _buildDataRows(context, data),
          ),
        ),
      ),
    );
  }

  List<DataRow> _buildDataRows(BuildContext context, SchedulerTermDataModel data) {
    List<DataRow> rows = [];

    for (var course in data.currentSections) {
      try {
        rows.add(_buildDataRow(context, course, handleError));
      } catch (e) {
        handleError(context, e);
      }
    }
    return rows;
  }

  DataRow _buildDataRow(BuildContext context, CurrentSections course, Function(BuildContext, dynamic) handleError) {
    return DataRow(
      color:
          MaterialStateProperty.resolveWith<Color>((Set<MaterialState> states) {
        if (states.contains(MaterialState.selected)) {
          return Theme.of(context).colorScheme.primary.withOpacity(0.08);
        }
        return cardBackgroundColor; // make sure you have defined this somewhere in your code
      }),
      cells: [
        DataCell(
            Text(course.enrollmentStatus, style: survivalGuideCellTextStyle())),
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
        DataCell(
          IconButton(
            // TODO: Figure out how to make sections work with classes
            icon: const Icon(
              Icons.info,
              color: EnsignColor.constantCardBackgroundColor,
            ),
            onPressed: () {
              showInfo(
                  context,
                  Column(
                    children: [
                      Text(course.description),
                      Row(
                        children: [
                         const Text(
                            'Instructor: ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold, // Set the fontWeight to bold
                            ),
                          ),
                          Text(course.instructor.first.name)
                        ],
                      )
                    ],
                  ),
              );
            },
          ),
        ),
      ],
    );
  }

  void handleError(BuildContext context, dynamic error) {
    // Handle the error, e.g., show a dialog or navigate to the login page
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SAMLLogin()),
    );
  }

}
