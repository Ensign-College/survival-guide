import 'package:flutter/material.dart';
import 'package:survival_guide/constants/developer.dart';
import 'package:survival_guide/constants/extensions/text_extensions.dart';
import 'package:survival_guide/models/SchedulerDesiredCoursesModel.dart';
import 'package:survival_guide/models/SchedulerRegBlocksModel.dart';
import 'package:survival_guide/models/SchedulerTermDataModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

import '../../constants/colors.dart';

class SchedulerCourseSectionsView extends StatefulWidget {
  final SchedulerRegBlocksModel regBlocks;
  final SchedulerApiService apiService;
  final SchedulerDesiredCoursesModel course;
  final String term;
  const SchedulerCourseSectionsView({super.key, required this.regBlocks, required this.apiService, required this.course, required this.term});

  @override
  SchedulerCourseSectionsViewState createState() =>
      SchedulerCourseSectionsViewState();
}


class SchedulerCourseSectionsViewState
    extends State<SchedulerCourseSectionsView> {


  Map<int, bool> selectedBlocks = {};

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Course Sections'),
        backgroundColor: appBackgroundColor,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Select').survivalGuideWhiteText),
            DataColumn(label: Text('Section').survivalGuideWhiteText),
            DataColumn(label: Text('Instructor').survivalGuideWhiteText),
            DataColumn(label: Text('Seats Open').survivalGuideWhiteText),
          ],
          rows: widget.regBlocks.registrationBlocks.asMap().entries.map((entry) {
            int index = entry.key;
            var block = entry.value;
            var section = widget.regBlocks.sections[index];
            if (selectedBlocks[index] == null) {
              selectedBlocks[index] = block.selected;
            }

            return DataRow(cells: [
              DataCell(
                InkWell(
                  child: Checkbox(
                    value: selectedBlocks[index],
                    onChanged: (bool? value) {
                      setState(() {
                        print('value: $value');
                        selectedBlocks[index] = value!;
                        // Initialize filterRules if it's null
                        if (widget.course.filterRules == null) {
                          widget.course.filterRules = [];
                        }

                        // Find the existing rule for registrationNumber, if any
                        var existingRule = widget.course.filterRules.firstWhere(
                              (rule) => rule['type'] == 'registrationNumber',
                          orElse: () => null,
                        );

                        if (value == false) {
                          // If the rule doesn't exist, create one
                          if (existingRule == null) {
                            existingRule = {
                              "type": "registrationNumber",
                              "values": [section.registrationNumber],
                              "value": null,
                              "excluded": true,
                            };
                            widget.course.filterRules.add(existingRule);
                          } else {
                            // If the rule exists and the registration number is not in the list, add it
                            if (!existingRule['values'].contains(section.registrationNumber)) {
                              existingRule['values'].add(section.registrationNumber);
                            }
                          }
                        } else {
                          // Remove the registrationNumber from the values list if it exists
                          if (existingRule != null && existingRule['values'].contains(section.registrationNumber)) {
                            existingRule['values'].remove(section.registrationNumber);
                            print("registrationNumber removed: ${section.registrationNumber}");
                            // If the values list is empty, remove the rule
                            if (existingRule['values'].isEmpty) {
                              widget.course.filterRules.remove(existingRule);
                            }
                          }
                        }
                        // Debug print for verification
                        print("Updated rules: ${widget.course.filterRules}");
                        // Uncomment below when you're ready to update the course sections
                        widget.apiService.updateDesiredCourseSections(widget.course, widget.term);
                      });
                    },
                  ),
                ),
              ),
              DataCell(
                  Text(block.sectionIds.join(', ')).survivalGuideWhiteText),
              DataCell(Text(section.instructor.first.name).survivalGuideWhiteText),
              DataCell(Text(section.course).survivalGuideWhiteText),
            ]);
          }).toList(),
        ),
      ),
    );
  }
}

class SchedulerTab extends StatelessWidget {
  const SchedulerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text('Scheduler Content Here'));
  }
}

class CourseSectionsTab extends StatelessWidget {
  const CourseSectionsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Course Sections Content Here"));
  }
}