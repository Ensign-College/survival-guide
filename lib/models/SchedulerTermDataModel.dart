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
    final _data = <String, dynamic>{};
    _data['actions'] = actions;
    _data['additionalData'] = additionalData.toJson();
    _data['sectionParameterValues'] = sectionParameterValues.toJson();
    _data['sectionParameterOptions'] = sectionParameterOptions.toJson();
    _data['approval'] = approval;
    _data['approvalCode'] = approvalCode;
    _data['hasCorequisites'] = hasCorequisites;
    _data['hasFreetextbook'] = hasFreetextbook;
    _data['hasLowCostTextbook'] = hasLowCostTextbook;
    _data['hasPrerequisites'] = hasPrerequisites;
    _data['hasReserveCaps'] = hasReserveCaps;
    _data['hasRestrictions'] = hasRestrictions;
    _data['hasSectionCorequisites'] = hasSectionCorequisites;
    _data['hasSectionNotes'] = hasSectionNotes;
    _data['isExternal'] = isExternal;
    _data['isHonors'] = isHonors;
    _data['isOnline'] = isOnline;
    _data['isWritingEnhanced'] = isWritingEnhanced;
    _data['optional'] = optional;
    _data['registrationClosed'] = registrationClosed;
    _data['lastWaitListDate'] = lastWaitListDate;
    _data['partOfTermBeginDate'] = partOfTermBeginDate;
    _data['registrationEnds'] = registrationEnds;
    _data['creditsMax'] = creditsMax;
    _data['creditsMin'] = creditsMin;
    _data['openSeats'] = openSeats;
    _data['topicId'] = topicId;
    _data['institutionCode'] = institutionCode;
    _data['institution'] = institution;
    _data['institutionAbbreviation'] = institutionAbbreviation;
    _data['sectionAttributes'] = sectionAttributes;
    _data['corequisiteSections'] = corequisiteSections;
    _data['enrollmentRequirements'] = enrollmentRequirements.map((e)=>e.toJson()).toList();
    _data['exams'] = exams;
    _data['instructor'] = instructor.map((e)=>e.toJson()).toList();
    _data['meetings'] = meetings.map((e)=>e.toJson()).toList();
    _data['reserveCaps'] = reserveCaps;
    _data['courseRestrictions'] = courseRestrictions;
    _data['sectionRestrictions'] = sectionRestrictions;
    _data['disabledReasons'] = disabledReasons;
    _data['flags'] = flags;
    _data['linkedSectionRegNumbers'] = linkedSectionRegNumbers;
    _data['textbooks'] = textbooks;
    _data['registrationOptions'] = registrationOptions.toJson();
    _data['academicCareer'] = academicCareer;
    _data['academicCareerDescr'] = academicCareerDescr;
    _data['academicCareerDescrShort'] = academicCareerDescrShort;
    _data['academicGroup'] = academicGroup;
    _data['academicGroupDescr'] = academicGroupDescr;
    _data['campus'] = campus;
    _data['campusCode'] = campusCode;
    _data['campusDescription'] = campusDescription;
    _data['campusDescriptionRaw'] = campusDescriptionRaw;
    _data['campusShort'] = campusShort;
    _data['classAssociations'] = classAssociations;
    _data['component'] = component;
    _data['corequisites'] = corequisites;
    _data['course'] = course;
    _data['courseAttributes'] = courseAttributes;
    _data['credits'] = credits;
    _data['customData'] = customData;
    _data['department'] = department;
    _data['description'] = description;
    _data['enrollmentStatus'] = enrollmentStatus;
    _data['fees'] = fees;
    _data['freeFormTopics'] = freeFormTopics;
    _data['freeTextbookIndicated'] = freeTextbookIndicated;
    _data['lowCostTextbookIndicated'] = lowCostTextbookIndicated;
    _data['id'] = id;
    _data['instructionMode'] = instructionMode;
    _data['location'] = location;
    _data['lrnComTitle'] = lrnComTitle;
    _data['notes'] = notes;
    _data['notesShort'] = notesShort;
    _data['partsOfTerm'] = partsOfTerm;
    _data['prerequisites'] = prerequisites;
    _data['registrationNumber'] = registrationNumber;
    _data['registrationType'] = registrationType;
    _data['requirementDesignationDescr'] = requirementDesignationDescr;
    _data['seatsCapacity'] = seatsCapacity;
    _data['seatsFilled'] = seatsFilled;
    _data['sectionNumber'] = sectionNumber;
    _data['sectionStatus'] = sectionStatus;
    _data['subject'] = subject;
    _data['subjectId'] = subjectId;
    _data['textbook'] = textbook;
    _data['title'] = title;
    _data['topicTitle'] = topicTitle;
    _data['waitlist'] = waitlist;
    _data['waitlistOpen'] = waitlistOpen;
    _data['waitlistPosition'] = waitlistPosition;
    return _data;
  }
}

class AdditionalData {
  AdditionalData();

  AdditionalData.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
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
    final _data = <String, dynamic>{};
    _data['academicProgram'] = academicProgram;
    _data['gradingBasis'] = gradingBasis;
    _data['units'] = units;
    _data['classPermissionNumber'] = classPermissionNumber;
    _data['startDate'] = startDate;
    _data['requirementDesignation'] = requirementDesignation;
    _data['instructorId'] = instructorId;
    _data['academicCareer'] = academicCareer;
    return _data;
  }
}

class SectionParameterOptions {
  SectionParameterOptions();

  SectionParameterOptions.fromJson(Map json);

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    return _data;
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
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['description'] = description;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['name'] = name;
    _data['email'] = email;
    _data['externalId'] = externalId;
    _data['instructorRole'] = instructorRole;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['days'] = days;
    _data['daysRaw'] = daysRaw;
    _data['startTime'] = startTime;
    _data['endTime'] = endTime;
    _data['location'] = location;
    _data['meetingType'] = meetingType;
    _data['startDate'] = startDate;
    _data['endDate'] = endDate;
    _data['mapURL'] = mapURL;
    _data['meetingTypeDescription'] = meetingTypeDescription;
    _data['scheduleTypeCode'] = scheduleTypeCode;
    _data['scheduleTypeDescription'] = scheduleTypeDescription;
    _data['building'] = building;
    _data['buildingDescription'] = buildingDescription;
    _data['buildingCode'] = buildingCode;
    _data['room'] = room;
    _data['firstMonday'] = firstMonday;
    _data['lastMonday'] = lastMonday;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['code'] = code;
    _data['description'] = description;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['subjectShort'] = subjectShort;
    _data['subjectLong'] = subjectLong;
    _data['subjectId'] = subjectId;
    _data['number'] = number;
    _data['topic'] = topic;
    _data['title'] = title;
    _data['topicTitle'] = topicTitle;
    _data['description'] = description;
    _data['enrollmentRequirements'] = enrollmentRequirements;
    _data['notes'] = notes;
    _data['component'] = component;
    _data['courseAttributes'] = courseAttributes;
    _data['credits'] = credits;
    _data['corequisites'] = corequisites;
    _data['prerequisites'] = prerequisites;
    _data['lockedRegistrationBlockId'] = lockedRegistrationBlockId;
    _data['isRequired'] = isRequired;
    _data['isLocked'] = isLocked;
    _data['isLearningCommunity'] = isLearningCommunity;
    _data['hasHonors'] = hasHonors;
    _data['hasCorequisites'] = hasCorequisites;
    _data['hasPrerequisites'] = hasPrerequisites;
    _data['hasRequisites'] = hasRequisites;
    _data['hasRestrictions'] = hasRestrictions;
    _data['hasReserveCaps'] = hasReserveCaps;
    _data['hasWritingEnhanced'] = hasWritingEnhanced;
    _data['hasOptional'] = hasOptional;
    _data['hasSectionNotes'] = hasSectionNotes;
    _data['hasFreeTextbook'] = hasFreeTextbook;
    _data['hasLowCostTextbook'] = hasLowCostTextbook;
    _data['courseKey'] = courseKey;
    _data['filteredRegBlockIds'] = filteredRegBlockIds;
    _data['selectedOptionalSectionIds'] = selectedOptionalSectionIds;
    _data['filterRules'] = filterRules;
    _data['flags'] = flags;
    _data['optionMessages'] = optionMessages;
    _data['addedMessage'] = addedMessage;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['selected'] = selected;
    _data['code'] = code;
    _data['locked'] = locked;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['selected'] = selected;
    _data['code'] = code;
    _data['locked'] = locked;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['selected'] = selected;
    _data['code'] = code;
    _data['locked'] = locked;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['selected'] = selected;
    _data['code'] = code;
    _data['locked'] = locked;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['selected'] = selected;
    _data['code'] = code;
    _data['locked'] = locked;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['title'] = title;
    _data['selected'] = selected;
    _data['code'] = code;
    _data['locked'] = locked;
    return _data;
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
    final _data = <String, dynamic>{};
    _data['registrationTimeTickets'] = registrationTimeTickets;
    return _data;
  }
}