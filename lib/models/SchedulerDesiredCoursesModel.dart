class SchedulerDesiredCoursesModel {
  String id;
  String subjectShort;
  String subjectLong;
  String subjectId;
  String number;
  dynamic topic;
  String title;
  dynamic topicTitle;
  String description;
  List<dynamic> enrollmentRequirements;
  dynamic notes;
  dynamic component;
  String courseAttributes;
  String credits;
  String corequisites;
  String prerequisites;
  String lockedRegistrationBlockId;
  bool isRequired;
  bool isLocked;
  bool isLearningCommunity;
  bool hasHonors;
  bool hasCorequisites;
  bool hasPrerequisites;
  bool hasRequisites;
  bool hasRestrictions;
  bool hasReserveCaps;
  bool hasWritingEnhanced;
  bool hasOptional;
  bool hasSectionNotes;
  bool hasFreeTextbook;
  bool hasLowCostTextbook;
  String courseKey;
  List<dynamic> filteredRegBlockIds;
  List<dynamic> selectedOptionalSectionIds;
  List<dynamic> filterRules;
  List<dynamic> flags;
  List<dynamic> optionMessages;
  dynamic addedMessage;

  SchedulerDesiredCoursesModel({
    required this.id,
    required this.subjectShort,
    required this.subjectLong,
    required this.subjectId,
    required this.number,
    required this.topic,
    required this.title,
    required this.topicTitle,
    required this.description,
    required this.enrollmentRequirements,
    required this.notes,
    required this.component,
    required this.courseAttributes,
    required this.credits,
    required this.corequisites,
    required this.prerequisites,
    required this.lockedRegistrationBlockId,
    required this.isRequired,
    required this.isLocked,
    required this.isLearningCommunity,
    required this.hasHonors,
    required this.hasCorequisites,
    required this.hasPrerequisites,
    required this.hasRequisites,
    required this.hasRestrictions,
    required this.hasReserveCaps,
    required this.hasWritingEnhanced,
    required this.hasOptional,
    required this.hasSectionNotes,
    required this.hasFreeTextbook,
    required this.hasLowCostTextbook,
    required this.courseKey,
    required this.filteredRegBlockIds,
    required this.selectedOptionalSectionIds,
    required this.filterRules,
    required this.flags,
    required this.optionMessages,
    required this.addedMessage,
  });
  SchedulerDesiredCoursesModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        subjectShort = json['subjectShort'],
        subjectLong = json['subjectLong'],
        subjectId = json['subjectId'],
        number = json['number'],
        topic = json['topic'],
        title = json['title'],
        topicTitle = json['topicTitle'],
        description = json['description'],
        enrollmentRequirements = List<dynamic>.from(json['enrollmentRequirements']),
        notes = json['notes'],
        component = json['component'],
        courseAttributes = json['courseAttributes'],
        credits = json['credits'],
        corequisites = json['corequisites'],
        prerequisites = json['prerequisites'],
        lockedRegistrationBlockId = json['lockedRegistrationBlockId'],
        isRequired = json['isRequired'],
        isLocked = json['isLocked'],
        isLearningCommunity = json['isLearningCommunity'],
        hasHonors = json['hasHonors'],
        hasCorequisites = json['hasCorequisites'],
        hasPrerequisites = json['hasPrerequisites'],
        hasRequisites = json['hasRequisites'],
        hasRestrictions = json['hasRestrictions'],
        hasReserveCaps = json['hasReserveCaps'],
        hasWritingEnhanced = json['hasWritingEnhanced'],
        hasOptional = json['hasOptional'],
        hasSectionNotes = json['hasSectionNotes'],
        hasFreeTextbook = json['hasFreeTextbook'],
        hasLowCostTextbook = json['hasLowCostTextbook'],
        courseKey = json['courseKey'],
        filteredRegBlockIds = List<dynamic>.from(json['filteredRegBlockIds']),
        selectedOptionalSectionIds = List<dynamic>.from(json['selectedOptionalSectionIds']),
        filterRules = List<dynamic>.from(json['filterRules']),
        flags = List<dynamic>.from(json['flags']),
        optionMessages = List<dynamic>.from(json['optionMessages']),
        addedMessage = json['addedMessage'];

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'subjectShort': subjectShort,
      'subjectLong': subjectLong,
      'subjectId': subjectId,
      'number': number,
      'topic': topic,
      'title': title,
      'topicTitle': topicTitle,
      'description': description,
      'enrollmentRequirements': enrollmentRequirements,
      'notes': notes,
      'component': component,
      'courseAttributes': courseAttributes,
      'credits': credits,
      'corequisites': corequisites,
      'prerequisites': prerequisites,
      'lockedRegistrationBlockId': lockedRegistrationBlockId,
      'isRequired': isRequired,
      'isLocked': isLocked,
      'isLearningCommunity': isLearningCommunity,
      'hasHonors': hasHonors,
      'hasCorequisites': hasCorequisites,
      'hasPrerequisites': hasPrerequisites,
      'hasRequisites': hasRequisites,
      'hasRestrictions': hasRestrictions,
      'hasReserveCaps': hasReserveCaps,
      'hasWritingEnhanced': hasWritingEnhanced,
      'hasOptional': hasOptional,
      'hasSectionNotes': hasSectionNotes,
      'hasFreeTextbook': hasFreeTextbook,
      'hasLowCostTextbook': hasLowCostTextbook,
      'courseKey': courseKey,
      'filteredRegBlockIds': filteredRegBlockIds,
      'selectedOptionalSectionIds': selectedOptionalSectionIds,
      'filterRules': filterRules,
      'flags': flags,
      'optionMessages': optionMessages,
      'addedMessage': addedMessage,
    };
  }
}
