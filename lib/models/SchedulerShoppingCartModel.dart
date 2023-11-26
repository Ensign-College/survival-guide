import 'package:survival_guide/models/SchedulerGenerateCoursesModel.dart';

import 'SchedulerDesiredCoursesModel.dart';

class CollegeSchedulerShoppingCartModel {
  final List<ShoppingCartSection> sections;
  final String termCode;
  final int userId;

  CollegeSchedulerShoppingCartModel({
    required this.sections,
    required this.termCode,
    required this.userId,
  });

  Map<String, dynamic> toJson() {
    return {
      'cartName': 'Schedule Planner Shopping Cart',
      'environment': 'ensign',
      'nativeCartRequest': true,
      'sections': sections.map((section) => section.toJson()).toList(),
      'studentIdentifierType': 'Cart-Wizard',
      'termCode': termCode,
      'userId': userId,
    };
  }
}

class ShoppingCartSection {
  final Action action;
  final int units;
  final String gradingBasis;
  final String regNumber;
  final String subjectCode;
  final String courseNumber;
  final String academicCareerCode;

  ShoppingCartSection({
    required this.action,
    required this.units,
    required this.gradingBasis,
    required this.regNumber,
    required this.subjectCode,
    required this.courseNumber,
    required this.academicCareerCode,
  });

  Map<String, dynamic> toJson() {
    return {
      'action': actionToString(action),
      'sectionParameterValues': {
        'units': units,
        'gradingBasis': gradingBasis,
      },
      'regNumber': regNumber,
      'subjectCode': subjectCode,
      'courseNumber': courseNumber,
      'academicCareerCode': academicCareerCode,
    };
  }
}

List<ShoppingCartSection> mapToShoppingCartSections(List<SchedulerDesiredCoursesModel> shoppingCartItems) {
  return shoppingCartItems.map((item) {
    return ShoppingCartSection(
      action: Action.PUT,
      units: 1,
      gradingBasis: 'ANC',
      regNumber: item.number,  // Assuming `subjectId` is the correct field
      subjectCode: item.subjectId, // Assuming `subjectId` is the correct field
      courseNumber: item.number, // Assuming `courseKey` is the correct field
      academicCareerCode: 'UGRD',
    );
  }).toList();
}

enum Action { PUT, DELETE }  // Enum definition

String actionToString(Action action) {
  return action.toString().split('.').last;
}