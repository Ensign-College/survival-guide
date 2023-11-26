import 'package:flutter/material.dart';
import 'package:survival_guide/models/SchedulerDesiredCoursesModel.dart';
import 'package:survival_guide/models/SchedulerRegBlocksModel.dart';
import 'package:survival_guide/repository/scheduler_api_services.dart';

class SchedulerCourseSectionsViewModel with ChangeNotifier {
  SchedulerRegBlocksModel regBlocks;
  SchedulerApiService apiService;
  SchedulerDesiredCoursesModel course;
  String term;
  Map<int, bool> selectedBlocks = {};

  SchedulerCourseSectionsViewModel({
    required this.regBlocks,
    required this.apiService,
    required this.course,
    required this.term,
  });

  void initializeSelectedBlocks() {
    for (int i = 0; i < regBlocks.registrationBlocks.length; i++) {
      selectedBlocks[i] = regBlocks.registrationBlocks[i].selected;
    }
    notifyListeners();
  }

  void toggleBlockSelection(int index, bool value) {
    // Update the local state
    selectedBlocks[index] = value;

    // Initialize filterRules if it's null
    if (course.filterRules == null) {
      course.filterRules = [];
    }

    // Find the existing rule for registrationNumber, if any
    var existingRule = course.filterRules.firstWhere(
          (rule) => rule['type'] == 'registrationNumber',
      orElse: () => null,
    );

    var section = regBlocks.sections[index];

    if (value == false) {
      // If the rule doesn't exist, create one
      if (existingRule == null) {
        existingRule = {
          "type": "registrationNumber",
          "values": [section.registrationNumber],
          "value": null,
          "excluded": true,
        };
        course.filterRules.add(existingRule);
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

        // If the values list is empty, remove the rule
        if (existingRule['values'].isEmpty) {
          course.filterRules.remove(existingRule);
        }
      }
    }

    // Update the course sections through API
    apiService.updateDesiredCourseSections(course, term);

    // Notify UI to rebuild
    notifyListeners();
  }

}
