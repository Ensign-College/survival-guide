import 'SchedulerGenerateCoursesModel.dart';

class SchedulerTermDataModel {
  SchedulerTermDataModel({
    required this.showDegreePlanWarning,
    required this.showDegreePlanWarningOnConfirm,
    required this.currentSections,
    required this.degreePlanCourses,
    required this.courses,
    required this.favorites,
    required this.academicCareers,
    required this.academicGroups,
    required this.campuses,
    required this.instructionModes,
    required this.locations,
    required this.partsOfTerm,
    required this.sessions,
    required this.holds,
    required this.registrationWarnings,
    required this.cartSections,
    required this.studentAttributes,
    this.selectedCareer,
    required this.userTermContext,
  });
  late final bool showDegreePlanWarning;
  late final bool showDegreePlanWarningOnConfirm;
  late final List<CurrentSections> currentSections;
  late final List<dynamic> degreePlanCourses;
  late final List<Courses> courses;
  late final List<dynamic> favorites;
  late final List<AcademicCareers> academicCareers;
  late final List<AcademicGroups> academicGroups;
  late final List<Campuses> campuses;
  late final List<InstructionModes> instructionModes;
  late final List<Locations> locations;
  late final List<PartsOfTerm> partsOfTerm;
  late final List<dynamic> sessions;
  late final List<dynamic> holds;
  late final List<dynamic> registrationWarnings;
  late final List<dynamic> cartSections;
  late final List<dynamic> studentAttributes;
  late final Null selectedCareer;
  late final UserTermContext userTermContext;

  SchedulerTermDataModel.fromJson(Map<String, dynamic> json){
    showDegreePlanWarning = json['showDegreePlanWarning'];
    showDegreePlanWarningOnConfirm = json['showDegreePlanWarningOnConfirm'];
    currentSections = List.from(json['currentSections']).map((e)=>CurrentSections.fromJson(e)).toList();
    degreePlanCourses = List.castFrom<dynamic, dynamic>(json['degreePlanCourses']);
    courses = List.from(json['courses']).map((e)=>Courses.fromJson(e)).toList();
    favorites = List.castFrom<dynamic, dynamic>(json['favorites']);
    academicCareers = List.from(json['academicCareers']).map((e)=>AcademicCareers.fromJson(e)).toList();
    academicGroups = List.from(json['academicGroups']).map((e)=>AcademicGroups.fromJson(e)).toList();
    campuses = List.from(json['campuses']).map((e)=>Campuses.fromJson(e)).toList();
    instructionModes = List.from(json['instructionModes']).map((e)=>InstructionModes.fromJson(e)).toList();
    locations = List.from(json['locations']).map((e)=>Locations.fromJson(e)).toList();
    partsOfTerm = List.from(json['partsOfTerm']).map((e)=>PartsOfTerm.fromJson(e)).toList();
    sessions = List.castFrom<dynamic, dynamic>(json['sessions']);
    holds = List.castFrom<dynamic, dynamic>(json['holds']);
    registrationWarnings = List.castFrom<dynamic, dynamic>(json['registrationWarnings']);
    cartSections = List.castFrom<dynamic, dynamic>(json['cartSections']);
    studentAttributes = List.castFrom<dynamic, dynamic>(json['studentAttributes']);
    selectedCareer = null;
    userTermContext = UserTermContext.fromJson(json['userTermContext']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['showDegreePlanWarning'] = showDegreePlanWarning;
    data['showDegreePlanWarningOnConfirm'] = showDegreePlanWarningOnConfirm;
    data['currentSections'] = currentSections.map((e)=>e.toJson()).toList();
    data['degreePlanCourses'] = degreePlanCourses;
    data['courses'] = courses.map((e)=>e.toJson()).toList();
    data['favorites'] = favorites;
    data['academicCareers'] = academicCareers.map((e)=>e.toJson()).toList();
    data['academicGroups'] = academicGroups.map((e)=>e.toJson()).toList();
    data['campuses'] = campuses.map((e)=>e.toJson()).toList();
    data['instructionModes'] = instructionModes.map((e)=>e.toJson()).toList();
    data['locations'] = locations.map((e)=>e.toJson()).toList();
    data['partsOfTerm'] = partsOfTerm.map((e)=>e.toJson()).toList();
    data['sessions'] = sessions;
    data['holds'] = holds;
    data['registrationWarnings'] = registrationWarnings;
    data['cartSections'] = cartSections;
    data['studentAttributes'] = studentAttributes;
    data['selectedCareer'] = selectedCareer;
    data['userTermContext'] = userTermContext.toJson();
    return data;
  }
}

class CurrentSections {
  CurrentSections({
    required this.actions,
    required this.additionalData,
    required this.sectionParameterValues,
    required this.sectionParameterOptions,
    required this.approval,
    required this.approvalCode,
    required this.hasCorequisites,
    required this.hasFreetextbook,
    required this.hasLowCostTextbook,
    required this.hasPrerequisites,
    required this.hasReserveCaps,
    required this.hasRestrictions,
    required this.hasSectionCorequisites,
    required this.hasSectionNotes,
    required this.isExternal,
    required this.isHonors,
    required this.isOnline,
    required this.isWritingEnhanced,
    required this.optional,
    required this.registrationClosed,
    required this.lastWaitListDate,
    required this.partOfTermBeginDate,
    required this.registrationEnds,
    required this.creditsMax,
    required this.creditsMin,
    required this.openSeats,
    this.topicId,
    required this.institutionCode,
    this.institution,
    this.institutionAbbreviation,
    required this.sectionAttributes,
    required this.corequisiteSections,
    required this.enrollmentRequirements,
    required this.exams,
    required this.instructor,
    required this.meetings,
    required this.reserveCaps,
    required this.courseRestrictions,
    required this.sectionRestrictions,
    required this.disabledReasons,
    required this.flags,
    required this.linkedSectionRegNumbers,
    required this.textbooks,
    required this.registrationOptions,
    required this.academicCareer,
    required this.academicCareerDescr,
    required this.academicCareerDescrShort,
    required this.academicGroup,
    required this.academicGroupDescr,
    required this.campus,
    required this.campusCode,
    required this.campusDescription,
    required this.campusDescriptionRaw,
    this.campusShort,
    required this.classAssociations,
    required this.component,
    required this.corequisites,
    required this.course,
    required this.courseAttributes,
    required this.credits,
    required this.customData,
    required this.department,
    required this.description,
    required this.enrollmentStatus,
    required this.fees,
    required this.freeFormTopics,
    required this.freeTextbookIndicated,
    required this.lowCostTextbookIndicated,
    required this.id,
    required this.instructionMode,
    required this.location,
    this.lrnComTitle,
    required this.notes,
    required this.notesShort,
    required this.partsOfTerm,
    required this.prerequisites,
    required this.registrationNumber,
    required this.registrationType,
    required this.requirementDesignationDescr,
    required this.seatsCapacity,
    required this.seatsFilled,
    required this.sectionNumber,
    required this.sectionStatus,
    required this.subject,
    required this.subjectId,
    required this.textbook,
    required this.title,
    required this.topicTitle,
    required this.waitlist,
    required this.waitlistOpen,
    this.waitlistPosition,
  });
  late final List<dynamic> actions;
  late final AdditionalData additionalData;
  late final SectionParameterValues sectionParameterValues;
  late final SectionParameterOptions sectionParameterOptions;
  late final String approval;
  late final String approvalCode;
  late final bool hasCorequisites;
  late final bool hasFreetextbook;
  late final bool hasLowCostTextbook;
  late final bool hasPrerequisites;
  late final bool hasReserveCaps;
  late final bool hasRestrictions;
  late final bool hasSectionCorequisites;
  late final bool hasSectionNotes;
  late final bool isExternal;
  late final bool isHonors;
  late final bool isOnline;
  late final bool isWritingEnhanced;
  late final bool optional;
  late final bool registrationClosed;
  late final String lastWaitListDate;
  late final String partOfTermBeginDate;
  late final String registrationEnds;
  late final double creditsMax;
  late final double creditsMin;
  late final int openSeats;
  late final Null topicId;
  late final String institutionCode;
  late final Null institution;
  late final Null institutionAbbreviation;
  late final List<dynamic> sectionAttributes;
  late final List<dynamic> corequisiteSections;
  late final List<EnrollmentRequirements> enrollmentRequirements;
  late final List<dynamic> exams;
  late final List<Instructor> instructor;
  late final List<Meetings> meetings;
  late final List<dynamic> reserveCaps;
  late final List<dynamic> courseRestrictions;
  late final List<dynamic> sectionRestrictions;
  late final List<dynamic> disabledReasons;
  late final List<dynamic> flags;
  late final List<dynamic> linkedSectionRegNumbers;
  late final List<dynamic> textbooks;
  late final RegistrationOptions registrationOptions;
  late final String academicCareer;
  late final String academicCareerDescr;
  late final String academicCareerDescrShort;
  late final String academicGroup;
  late final String academicGroupDescr;
  late final String campus;
  late final String campusCode;
  late final String campusDescription;
  late final String campusDescriptionRaw;
  late final Null campusShort;
  late final String classAssociations;
  late final String component;
  late final String corequisites;
  late final String course;
  late final String courseAttributes;
  late final String credits;
  late final String customData;
  late final String department;
  late final String description;
  late final String enrollmentStatus;
  late final String fees;
  late final String freeFormTopics;
  late final String freeTextbookIndicated;
  late final String lowCostTextbookIndicated;
  late final String id;
  late final String instructionMode;
  late final String location;
  late final Null lrnComTitle;
  late final String notes;
  late final String notesShort;
  late final String partsOfTerm;
  late final String prerequisites;
  late final String registrationNumber;
  late final String registrationType;
  late final String requirementDesignationDescr;
  late final String seatsCapacity;
  late final String seatsFilled;
  late final String sectionNumber;
  late final String sectionStatus;
  late final String subject;
  late final String subjectId;
  late final String textbook;
  late final String title;
  late final String topicTitle;
  late final String waitlist;
  late final String waitlistOpen;
  late final Null waitlistPosition;

  CurrentSections.fromJson(Map<String, dynamic> json){
    actions = List.castFrom<dynamic, dynamic>(json['actions']);
    additionalData = AdditionalData.fromJson(json['additionalData']);
    sectionParameterValues = SectionParameterValues.fromJson(json['sectionParameterValues']);
    sectionParameterOptions = SectionParameterOptions.fromJson(json['sectionParameterOptions']);
    approval = json['approval'];
    approvalCode = json['approvalCode'];
    hasCorequisites = json['hasCorequisites'];
    hasFreetextbook = json['hasFreetextbook'];
    hasLowCostTextbook = json['hasLowCostTextbook'];
    hasPrerequisites = json['hasPrerequisites'];
    hasReserveCaps = json['hasReserveCaps'];
    hasRestrictions = json['hasRestrictions'];
    hasSectionCorequisites = json['hasSectionCorequisites'];
    hasSectionNotes = json['hasSectionNotes'];
    isExternal = json['isExternal'];
    isHonors = json['isHonors'];
    isOnline = json['isOnline'];
    isWritingEnhanced = json['isWritingEnhanced'];
    optional = json['optional'];
    registrationClosed = json['registrationClosed'];
    lastWaitListDate = json['lastWaitListDate'];
    partOfTermBeginDate = json['partOfTermBeginDate'];
    registrationEnds = json['registrationEnds'];
    creditsMax = json['creditsMax'];
    creditsMin = json['creditsMin'];
    openSeats = json['openSeats'];
    topicId = null;
    institutionCode = json['institutionCode'];
    institution = null;
    institutionAbbreviation = null;
    sectionAttributes = List.castFrom<dynamic, dynamic>(json['sectionAttributes']);
    corequisiteSections = List.castFrom<dynamic, dynamic>(json['corequisiteSections']);
    enrollmentRequirements = List.from(json['enrollmentRequirements']).map((e)=>EnrollmentRequirements.fromJson(e)).toList();
    exams = List.castFrom<dynamic, dynamic>(json['exams']);
    instructor = List.from(json['instructor']).map((e)=>Instructor.fromJson(e)).toList();
    meetings = List.from(json['meetings']).map((e)=>Meetings.fromJson(e)).toList();
    reserveCaps = List.castFrom<dynamic, dynamic>(json['reserveCaps']);
    courseRestrictions = List.castFrom<dynamic, dynamic>(json['courseRestrictions']);
    sectionRestrictions = List.castFrom<dynamic, dynamic>(json['sectionRestrictions']);
    disabledReasons = List.castFrom<dynamic, dynamic>(json['disabledReasons']);
    flags = List.castFrom<dynamic, dynamic>(json['flags']);
    linkedSectionRegNumbers = List.castFrom<dynamic, dynamic>(json['linkedSectionRegNumbers']);
    textbooks = List.castFrom<dynamic, dynamic>(json['textbooks']);
    registrationOptions = RegistrationOptions.fromJson(json['registrationOptions']);
    academicCareer = json['academicCareer'];
    academicCareerDescr = json['academicCareerDescr'];
    academicCareerDescrShort = json['academicCareerDescrShort'];
    academicGroup = json['academicGroup'];
    academicGroupDescr = json['academicGroupDescr'];
    campus = json['campus'];
    campusCode = json['campusCode'];
    campusDescription = json['campusDescription'];
    campusDescriptionRaw = json['campusDescriptionRaw'];
    campusShort = null;
    classAssociations = json['classAssociations'];
    component = json['component'];
    corequisites = json['corequisites'];
    course = json['course'];
    courseAttributes = json['courseAttributes'];
    credits = json['credits'];
    customData = json['customData'];
    department = json['department'];
    description = json['description'];
    enrollmentStatus = json['enrollmentStatus'];
    fees = json['fees'];
    freeFormTopics = json['freeFormTopics'];
    freeTextbookIndicated = json['freeTextbookIndicated'];
    lowCostTextbookIndicated = json['lowCostTextbookIndicated'];
    id = json['id'];
    instructionMode = json['instructionMode'];
    location = json['location'];
    lrnComTitle = null;
    notes = json['notes'];
    notesShort = json['notesShort'];
    partsOfTerm = json['partsOfTerm'];
    prerequisites = json['prerequisites'];
    registrationNumber = json['registrationNumber'];
    registrationType = json['registrationType'];
    requirementDesignationDescr = json['requirementDesignationDescr'];
    seatsCapacity = json['seatsCapacity'];
    seatsFilled = json['seatsFilled'];
    sectionNumber = json['sectionNumber'];
    sectionStatus = json['sectionStatus'];
    subject = json['subject'];
    subjectId = json['subjectId'];
    textbook = json['textbook'];
    title = json['title'];
    topicTitle = json['topicTitle'];
    waitlist = json['waitlist'];
    waitlistOpen = json['waitlistOpen'];
    waitlistPosition = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['actions'] = actions;
    data['additionalData'] = additionalData.toJson();
    data['sectionParameterValues'] = sectionParameterValues.toJson();
    data['sectionParameterOptions'] = sectionParameterOptions.toJson();
    data['approval'] = approval;
    data['approvalCode'] = approvalCode;
    data['hasCorequisites'] = hasCorequisites;
    data['hasFreetextbook'] = hasFreetextbook;
    data['hasLowCostTextbook'] = hasLowCostTextbook;
    data['hasPrerequisites'] = hasPrerequisites;
    data['hasReserveCaps'] = hasReserveCaps;
    data['hasRestrictions'] = hasRestrictions;
    data['hasSectionCorequisites'] = hasSectionCorequisites;
    data['hasSectionNotes'] = hasSectionNotes;
    data['isExternal'] = isExternal;
    data['isHonors'] = isHonors;
    data['isOnline'] = isOnline;
    data['isWritingEnhanced'] = isWritingEnhanced;
    data['optional'] = optional;
    data['registrationClosed'] = registrationClosed;
    data['lastWaitListDate'] = lastWaitListDate;
    data['partOfTermBeginDate'] = partOfTermBeginDate;
    data['registrationEnds'] = registrationEnds;
    data['creditsMax'] = creditsMax;
    data['creditsMin'] = creditsMin;
    data['openSeats'] = openSeats;
    data['topicId'] = topicId;
    data['institutionCode'] = institutionCode;
    data['institution'] = institution;
    data['institutionAbbreviation'] = institutionAbbreviation;
    data['sectionAttributes'] = sectionAttributes;
    data['corequisiteSections'] = corequisiteSections;
    data['enrollmentRequirements'] = enrollmentRequirements.map((e)=>e.toJson()).toList();
    data['exams'] = exams;
    data['instructor'] = instructor.map((e)=>e.toJson()).toList();
    data['meetings'] = meetings.map((e)=>e.toJson()).toList();
    data['reserveCaps'] = reserveCaps;
    data['courseRestrictions'] = courseRestrictions;
    data['sectionRestrictions'] = sectionRestrictions;
    data['disabledReasons'] = disabledReasons;
    data['flags'] = flags;
    data['linkedSectionRegNumbers'] = linkedSectionRegNumbers;
    data['textbooks'] = textbooks;
    data['registrationOptions'] = registrationOptions.toJson();
    data['academicCareer'] = academicCareer;
    data['academicCareerDescr'] = academicCareerDescr;
    data['academicCareerDescrShort'] = academicCareerDescrShort;
    data['academicGroup'] = academicGroup;
    data['academicGroupDescr'] = academicGroupDescr;
    data['campus'] = campus;
    data['campusCode'] = campusCode;
    data['campusDescription'] = campusDescription;
    data['campusDescriptionRaw'] = campusDescriptionRaw;
    data['campusShort'] = campusShort;
    data['classAssociations'] = classAssociations;
    data['component'] = component;
    data['corequisites'] = corequisites;
    data['course'] = course;
    data['courseAttributes'] = courseAttributes;
    data['credits'] = credits;
    data['customData'] = customData;
    data['department'] = department;
    data['description'] = description;
    data['enrollmentStatus'] = enrollmentStatus;
    data['fees'] = fees;
    data['freeFormTopics'] = freeFormTopics;
    data['freeTextbookIndicated'] = freeTextbookIndicated;
    data['lowCostTextbookIndicated'] = lowCostTextbookIndicated;
    data['id'] = id;
    data['instructionMode'] = instructionMode;
    data['location'] = location;
    data['lrnComTitle'] = lrnComTitle;
    data['notes'] = notes;
    data['notesShort'] = notesShort;
    data['partsOfTerm'] = partsOfTerm;
    data['prerequisites'] = prerequisites;
    data['registrationNumber'] = registrationNumber;
    data['registrationType'] = registrationType;
    data['requirementDesignationDescr'] = requirementDesignationDescr;
    data['seatsCapacity'] = seatsCapacity;
    data['seatsFilled'] = seatsFilled;
    data['sectionNumber'] = sectionNumber;
    data['sectionStatus'] = sectionStatus;
    data['subject'] = subject;
    data['subjectId'] = subjectId;
    data['textbook'] = textbook;
    data['title'] = title;
    data['topicTitle'] = topicTitle;
    data['waitlist'] = waitlist;
    data['waitlistOpen'] = waitlistOpen;
    data['waitlistPosition'] = waitlistPosition;
    return data;
  }
}

class AdditionalData {
  AdditionalData();

  AdditionalData.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}

class SectionParameterValues {
  SectionParameterValues({
    required this.academicProgram,
    required this.gradingBasis,
    required this.units,
    required this.classPermissionNumber,
    required this.startDate,
    required this.requirementDesignation,
    required this.instructorId,
    required this.academicCareer,
  });
  late final String academicProgram;
  late final String gradingBasis;
  late final String units;
  late final String classPermissionNumber;
  late final String startDate;
  late final String requirementDesignation;
  late final String instructorId;
  late final String academicCareer;

  SectionParameterValues.fromJson(Map<String, dynamic> json){
    academicProgram = json['academicProgram'];
    gradingBasis = json['gradingBasis'];
    units = json['units'];
    classPermissionNumber = json['classPermissionNumber'];
    startDate = json['startDate'];
    requirementDesignation = json['requirementDesignation'];
    instructorId = json['instructorId'];
    academicCareer = json['academicCareer'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['academicProgram'] = academicProgram;
    data['gradingBasis'] = gradingBasis;
    data['units'] = units;
    data['classPermissionNumber'] = classPermissionNumber;
    data['startDate'] = startDate;
    data['requirementDesignation'] = requirementDesignation;
    data['instructorId'] = instructorId;
    data['academicCareer'] = academicCareer;
    return data;
  }
}

class SectionParameterOptions {
  SectionParameterOptions();

  SectionParameterOptions.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    return data;
  }
}

class EnrollmentRequirements {
  EnrollmentRequirements({
    required this.type,
    required this.description,
  });
  late final String type;
  late final String description;

  EnrollmentRequirements.fromJson(Map<String, dynamic> json){
    type = json['type'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['description'] = description;
    return data;
  }
}

class Instructor {
  Instructor({
    required this.id,
    required this.name,
    required this.email,
    required this.externalId,
    required this.instructorRole,
  });
  late final String id;
  late final String name;
  late final String email;
  late final String externalId;
  late final String instructorRole;

  Instructor.fromJson(Map<String, dynamic> json){
    id = json['id'];
    name = json['name'];
    email = json['email'];
    externalId = json['externalId'];
    instructorRole = json['instructorRole'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['externalId'] = externalId;
    data['instructorRole'] = instructorRole;
    return data;
  }
}

class Meetings {
  Meetings({
    required this.days,
    required this.daysRaw,
    required this.startTime,
    required this.endTime,
    required this.location,
    required this.meetingType,
    required this.startDate,
    required this.endDate,
    required this.mapURL,
    this.meetingTypeDescription,
    this.scheduleTypeCode,
    this.scheduleTypeDescription,
    required this.building,
    required this.buildingDescription,
    required this.buildingCode,
    required this.room,
    required this.firstMonday,
    required this.lastMonday,
  });
  late final String days;
  late final String daysRaw;
  late final int startTime;
  late final int endTime;
  late final String location;
  late final String meetingType;
  late final String startDate;
  late final String endDate;
  late final String mapURL;
  late final Null meetingTypeDescription;
  late final Null scheduleTypeCode;
  late final Null scheduleTypeDescription;
  late final String building;
  late final String buildingDescription;
  late final String buildingCode;
  late final String room;
  late final String firstMonday;
  late final String lastMonday;

  Meetings.fromJson(Map<String, dynamic> json){
    days = json['days'];
    daysRaw = json['daysRaw'];
    startTime = json['startTime'];
    endTime = json['endTime'];
    location = json['location'];
    meetingType = json['meetingType'];
    startDate = json['startDate'];
    endDate = json['endDate'];
    mapURL = json['mapURL'];
    meetingTypeDescription = null;
    scheduleTypeCode = null;
    scheduleTypeDescription = null;
    building = json['building'];
    buildingDescription = json['buildingDescription'];
    buildingCode = json['buildingCode'];
    room = json['room'];
    firstMonday = json['firstMonday'];
    lastMonday = json['lastMonday'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['days'] = days;
    data['daysRaw'] = daysRaw;
    data['startTime'] = startTime;
    data['endTime'] = endTime;
    data['location'] = location;
    data['meetingType'] = meetingType;
    data['startDate'] = startDate;
    data['endDate'] = endDate;
    data['mapURL'] = mapURL;
    data['meetingTypeDescription'] = meetingTypeDescription;
    data['scheduleTypeCode'] = scheduleTypeCode;
    data['scheduleTypeDescription'] = scheduleTypeDescription;
    data['building'] = building;
    data['buildingDescription'] = buildingDescription;
    data['buildingCode'] = buildingCode;
    data['room'] = room;
    data['firstMonday'] = firstMonday;
    data['lastMonday'] = lastMonday;
    return data;
  }
}

class GradingBases {
  GradingBases({
    required this.code,
    this.description,
  });
  late final String code;
  late final Null description;

  GradingBases.fromJson(Map<String, dynamic> json){
    code = json['code'];
    description = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = code;
    data['description'] = description;
    return data;
  }
}

class Courses {
  Courses({
    required this.id,
    required this.subjectShort,
    required this.subjectLong,
    required this.subjectId,
    required this.number,
    this.topic,
    required this.title,
    this.topicTitle,
    required this.description,
    required this.enrollmentRequirements,
    this.notes,
    this.component,
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
    this.addedMessage,
  });
  late final String id;
  late final String subjectShort;
  late final String subjectLong;
  late final String subjectId;
  late final String number;
  late final Null topic;
  late final String title;
  late final Null topicTitle;
  late final String description;
  late final List<dynamic> enrollmentRequirements;
  late final Null notes;
  late final Null component;
  late final String courseAttributes;
  late final String? credits;
  late final String corequisites;
  late final String prerequisites;
  late final String lockedRegistrationBlockId;
  late final bool isRequired;
  late final bool isLocked;
  late final bool isLearningCommunity;
  late final bool hasHonors;
  late final bool hasCorequisites;
  late final bool hasPrerequisites;
  late final bool hasRequisites;
  late final bool hasRestrictions;
  late final bool hasReserveCaps;
  late final bool hasWritingEnhanced;
  late final bool hasOptional;
  late final bool hasSectionNotes;
  late final bool hasFreeTextbook;
  late final bool hasLowCostTextbook;
  late final String courseKey;
  late final List<dynamic> filteredRegBlockIds;
  late final List<dynamic> selectedOptionalSectionIds;
  late final List<dynamic> filterRules;
  late final List<dynamic> flags;
  late final List<dynamic> optionMessages;
  late final Null addedMessage;

  Courses.fromJson(Map<String, dynamic> json){
    id = json['id'];
    subjectShort = json['subjectShort'];
    subjectLong = json['subjectLong'];
    subjectId = json['subjectId'];
    number = json['number'];
    topic = null;
    title = json['title'];
    topicTitle = null;
    description = json['description'] ?? '';
    enrollmentRequirements = List.castFrom<dynamic, dynamic>(json['enrollmentRequirements']);
    notes = null;
    component = null;
    courseAttributes = json['courseAttributes'];
    credits = json['credits'] ?? '';
    corequisites = json['corequisites'];
    prerequisites = json['prerequisites'];
    lockedRegistrationBlockId = json['lockedRegistrationBlockId'];
    isRequired = json['isRequired'];
    isLocked = json['isLocked'];
    isLearningCommunity = json['isLearningCommunity'];
    hasHonors = json['hasHonors'];
    hasCorequisites = json['hasCorequisites'];
    hasPrerequisites = json['hasPrerequisites'];
    hasRequisites = json['hasRequisites'];
    hasRestrictions = json['hasRestrictions'];
    hasReserveCaps = json['hasReserveCaps'];
    hasWritingEnhanced = json['hasWritingEnhanced'];
    hasOptional = json['hasOptional'];
    hasSectionNotes = json['hasSectionNotes'];
    hasFreeTextbook = json['hasFreeTextbook'];
    hasLowCostTextbook = json['hasLowCostTextbook'];
    courseKey = json['courseKey'];
    filteredRegBlockIds = List.castFrom<dynamic, dynamic>(json['filteredRegBlockIds']);
    selectedOptionalSectionIds = List.castFrom<dynamic, dynamic>(json['selectedOptionalSectionIds']);
    filterRules = List.castFrom<dynamic, dynamic>(json['filterRules']);
    flags = List.castFrom<dynamic, dynamic>(json['flags']);
    optionMessages = List.castFrom<dynamic, dynamic>(json['optionMessages']);
    addedMessage = null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['subjectShort'] = subjectShort;
    data['subjectLong'] = subjectLong;
    data['subjectId'] = subjectId;
    data['number'] = number;
    data['topic'] = topic;
    data['title'] = title;
    data['topicTitle'] = topicTitle;
    data['description'] = description;
    data['enrollmentRequirements'] = enrollmentRequirements;
    data['notes'] = notes;
    data['component'] = component;
    data['courseAttributes'] = courseAttributes;
    data['credits'] = credits;
    data['corequisites'] = corequisites;
    data['prerequisites'] = prerequisites;
    data['lockedRegistrationBlockId'] = lockedRegistrationBlockId;
    data['isRequired'] = isRequired;
    data['isLocked'] = isLocked;
    data['isLearningCommunity'] = isLearningCommunity;
    data['hasHonors'] = hasHonors;
    data['hasCorequisites'] = hasCorequisites;
    data['hasPrerequisites'] = hasPrerequisites;
    data['hasRequisites'] = hasRequisites;
    data['hasRestrictions'] = hasRestrictions;
    data['hasReserveCaps'] = hasReserveCaps;
    data['hasWritingEnhanced'] = hasWritingEnhanced;
    data['hasOptional'] = hasOptional;
    data['hasSectionNotes'] = hasSectionNotes;
    data['hasFreeTextbook'] = hasFreeTextbook;
    data['hasLowCostTextbook'] = hasLowCostTextbook;
    data['courseKey'] = courseKey;
    data['filteredRegBlockIds'] = filteredRegBlockIds;
    data['selectedOptionalSectionIds'] = selectedOptionalSectionIds;
    data['filterRules'] = filterRules;
    data['flags'] = flags;
    data['optionMessages'] = optionMessages;
    data['addedMessage'] = addedMessage;
    return data;
  }
}

class AcademicCareers {
  AcademicCareers({
    required this.id,
    required this.title,
    required this.selected,
    required this.code,
    required this.locked,
  });
  late final String id;
  late final String title;
  late final bool selected;
  late final String code;
  late final bool locked;

  AcademicCareers.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    selected = json['selected'];
    code = json['code'];
    locked = json['locked'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['selected'] = selected;
    data['code'] = code;
    data['locked'] = locked;
    return data;
  }
}

class AcademicGroups {
  AcademicGroups({
    required this.id,
    required this.title,
    required this.selected,
    required this.code,
    required this.locked,
  });
  late final String id;
  late final String title;
  late final bool selected;
  late final String code;
  late final bool locked;

  AcademicGroups.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    selected = json['selected'];
    code = json['code'];
    locked = json['locked'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['selected'] = selected;
    data['code'] = code;
    data['locked'] = locked;
    return data;
  }
}

class Campuses {
  Campuses({
    required this.id,
    required this.title,
    required this.selected,
    required this.code,
    required this.locked,
  });
  late final String id;
  late final String title;
  late final bool selected;
  late final String code;
  late final bool locked;

  Campuses.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    selected = json['selected'];
    code = json['code'];
    locked = json['locked'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['selected'] = selected;
    data['code'] = code;
    data['locked'] = locked;
    return data;
  }
}

class InstructionModes {
  InstructionModes({
    required this.id,
    required this.title,
    required this.selected,
    required this.code,
    required this.locked,
  });
  late final String id;
  late final String title;
  late final bool selected;
  late final String code;
  late final bool locked;

  InstructionModes.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    selected = json['selected'];
    code = json['code'];
    locked = json['locked'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['selected'] = selected;
    data['code'] = code;
    data['locked'] = locked;
    return data;
  }
}

class Locations {
  Locations({
    required this.id,
    required this.title,
    required this.selected,
    required this.code,
    required this.locked,
  });
  late final String id;
  late final String title;
  late final bool selected;
  late final String code;
  late final bool locked;

  Locations.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    selected = json['selected'];
    code = json['code'];
    locked = json['locked'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['selected'] = selected;
    data['code'] = code;
    data['locked'] = locked;
    return data;
  }
}

class PartsOfTerm {
  PartsOfTerm({
    required this.id,
    required this.title,
    required this.selected,
    required this.code,
    required this.locked,
  });
  late final String id;
  late final String title;
  late final bool selected;
  late final String code;
  late final bool locked;

  PartsOfTerm.fromJson(Map<String, dynamic> json){
    id = json['id'];
    title = json['title'];
    selected = json['selected'];
    code = json['code'];
    locked = json['locked'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['selected'] = selected;
    data['code'] = code;
    data['locked'] = locked;
    return data;
  }
}

class UserTermContext {
  UserTermContext({
    required this.registrationTimeTickets,
  });
  late final List<dynamic> registrationTimeTickets;

  UserTermContext.fromJson(Map<String, dynamic> json){
    registrationTimeTickets = List.castFrom<dynamic, dynamic>(json['registrationTimeTickets']);
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['registrationTimeTickets'] = registrationTimeTickets;
    return data;
  }
}