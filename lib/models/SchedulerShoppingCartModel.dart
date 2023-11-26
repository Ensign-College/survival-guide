import 'package:survival_guide/constants/developer.dart';
import 'package:survival_guide/constants/widgets/showDialog.dart';
import 'package:survival_guide/models/SchedulerGenerateCoursesModel.dart';
import 'package:survival_guide/models/SchedulerRegBlocksModel.dart';

import '../repository/scheduler_api_services.dart';
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

List<ShoppingCartSection> mapToShoppingCartSections(List<SchedulerDesiredCoursesModel> shoppingCartItems, List<SchedulerRegBlocksModel> regNumbers) {

  return shoppingCartItems.map((item) {
    RegistrationBlocks matchingRegistrationBlock = findMatchingRegistrationBlock(item, regNumbers);

    String selectedSectionId = getSelectedSectionId(matchingRegistrationBlock);

    return ShoppingCartSection(
      action: Action.PUT,
      units: item.credits == '' ? 0 : int.parse(item.credits),
      gradingBasis: 'ANC',
      regNumber: selectedSectionId, // Step 3: Assign the selected section ID
      subjectCode: item.subjectId,
      courseNumber: item.number,
      academicCareerCode: 'UGRD',
    );
  }).toList();
}

RegistrationBlocks findMatchingRegistrationBlock(
    SchedulerDesiredCoursesModel item,
    List<SchedulerRegBlocksModel> regNumbers
    ) {

  for (var regBlock in regNumbers) {
    for (var section in regBlock.sections) {
      if (section.subjectId == item.subjectShort && section.course == item.number) {
        return regBlock.registrationBlocks.first;
      }
    }
  }

  // Handle the case where no matching block is found
  alert('Error', 'No matching registration block found for item: ${item.subjectShort} ${item.number}');
  throw Exception('No matching registration block found for item: ${item.subjectShort} ${item.number}');
}



String getSelectedSectionId(RegistrationBlocks registrationBlock) {
  print('getSelectedSectionId' + registrationBlock.id);
  return registrationBlock.sectionIds.first;
}

enum Action { PUT, DELETE }  // Enum definition

String actionToString(Action action) {
  return action.toString().split('.').last;
}