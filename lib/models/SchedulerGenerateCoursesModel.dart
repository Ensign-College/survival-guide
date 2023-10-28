class SchedulerGenerateCoursesModel {
  SchedulerGenerateCoursesModel({
    required this.registrationBlocks,
    required this.sections,
    required this.schedules,
    required this.courses,
    required this.currentSections,
    required this.cartSections,
    required this.breaks,
    required this.warnings,
    required this.courseCoReqs,
    required this.padding,
    required this.degreeCourses,
  });
  late final List<RegistrationBlocks> registrationBlocks;
  late final List<Sections> sections;
  late final List<Schedules> schedules;
  late final List<String> courses;
  late final List<CurrentSections> currentSections;
  late final List<dynamic> cartSections;
  late final List<dynamic> breaks;
  late final List<dynamic> warnings;
  late final List<dynamic> courseCoReqs;
  late final int padding;
  late final List<dynamic> degreeCourses;

  SchedulerGenerateCoursesModel.fromJson(Map<String, dynamic> json){
    registrationBlocks = List.from(json['registrationBlocks']).map((e)=>RegistrationBlocks.fromJson(e)).toList();
    sections = List.from(json['sections']).map((e)=>Sections.fromJson(e)).toList();
    schedules = List.from(json['schedules']).map((e)=>Schedules.fromJson(e)).toList();
    courses = List.castFrom<dynamic, String>(json['courses']);
    currentSections = List.from(json['currentSections']).map((e)=>CurrentSections.fromJson(e)).toList();
    cartSections = List.castFrom<dynamic, dynamic>(json['cartSections']);
    breaks = List.castFrom<dynamic, dynamic>(json['breaks']);
    warnings = List.castFrom<dynamic, dynamic>(json['warnings']);
    courseCoReqs = List.castFrom<dynamic, dynamic>(json['courseCoReqs']);
    padding = json['padding'];
    degreeCourses = List.castFrom<dynamic, dynamic>(json['degreeCourses']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['registrationBlocks'] = registrationBlocks.map((e)=>e.toJson()).toList();
    _data['sections'] = sections.map((e)=>e.toJson()).toList();
    _data['schedules'] = schedules.map((e)=>e.toJson()).toList();
    _data['courses'] = courses;
    _data['currentSections'] = currentSections.map((e)=>e.toJson()).toList();
    _data['cartSections'] = cartSections;
    _data['breaks'] = breaks;
    _data['warnings'] = warnings;
    _data['courseCoReqs'] = courseCoReqs;
    _data['padding'] = padding;
    _data['degreeCourses'] = degreeCourses;
    return _data;
  }
}

class RegistrationBlocks {
  RegistrationBlocks({
    required this.id,
    required this.sectionIds,
    required this.optionalSectionIds,
    required this.selected,
    required this.showLock,
    required this.enabled,
    required this.disabledReasons,
    required this.desiredCourseId,
    required this.lcId,
  });
  late final String id;
  late final List<String> sectionIds;
  late final List<dynamic> optionalSectionIds;
  late final bool selected;
  late final bool showLock;
  late final bool enabled;
  late final List<dynamic> disabledReasons;
  late final String desiredCourseId;
  late final String lcId;

  RegistrationBlocks.fromJson(Map<String, dynamic> json){
    id = json['id'];
    sectionIds = List.castFrom<dynamic, String>(json['sectionIds']);
    optionalSectionIds = List.castFrom<dynamic, dynamic>(json['optionalSectionIds']);
    selected = json['selected'];
    showLock = json['showLock'];
    enabled = json['enabled'];
    disabledReasons = List.castFrom<dynamic, dynamic>(json['disabledReasons']);
    desiredCourseId = json['desiredCourseId'];
    lcId = json['lcId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['sectionIds'] = sectionIds;
    _data['optionalSectionIds'] = optionalSectionIds;
    _data['selected'] = selected;
    _data['showLock'] = showLock;
    _data['enabled'] = enabled;
    _data['disabledReasons'] = disabledReasons;
    _data['desiredCourseId'] = desiredCourseId;
    _data['lcId'] = lcId;
    return _data;
  }
}

class Sections {
  Sections({
    required this.approval,
    this.approvalCode,
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
    this.partOfTermBeginDate,
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
    this.linkedSectionRegNumbers,
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
    this.enrollmentStatus,
    required this.fees,
    required this.freeFormTopics,
    required this.freeTextbookIndicated,
    required this.lowCostTextbookIndicated,
    required this.id,
    required this.instructionMode,
    required this.location,
    this.lrnComTitle,
    required this.notes,
    this.notesShort,
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
  late final String approval;
  late final String? approvalCode;
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
  late final String? partOfTermBeginDate;
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
  late final List<String> flags;
  late final Null linkedSectionRegNumbers;
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
  late final String? enrollmentStatus;
  late final String fees;
  late final String freeFormTopics;
  late final String freeTextbookIndicated;
  late final String lowCostTextbookIndicated;
  late final String id;
  late final String instructionMode;
  late final String location;
  late final Null lrnComTitle;
  late final String notes;
  late final String? notesShort;
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

  Sections.fromJson(Map<String, dynamic> json){
    approval = json['approval'];
    approvalCode = null;
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
    partOfTermBeginDate = null;
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
    flags = List.castFrom<dynamic, String>(json['flags']);
    linkedSectionRegNumbers = null;
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
    enrollmentStatus = null;
    fees = json['fees'];
    freeFormTopics = json['freeFormTopics'];
    freeTextbookIndicated = json['freeTextbookIndicated'];
    lowCostTextbookIndicated = json['lowCostTextbookIndicated'];
    id = json['id'];
    instructionMode = json['instructionMode'];
    location = json['location'];
    lrnComTitle = null;
    notes = json['notes'];
    notesShort = null;
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

class RegistrationOptions {
  RegistrationOptions({
    required this.gradingBases,
    required this.showInstructorOptions,
    required this.showPermissionNumberOption,
    required this.showRequirementDesignationOption,
    required this.showStartDateOption,
  });
  late final List<GradingBases> gradingBases;
  late final bool showInstructorOptions;
  late final bool showPermissionNumberOption;
  late final bool showRequirementDesignationOption;
  late final bool showStartDateOption;

  RegistrationOptions.fromJson(Map<String, dynamic> json){
    gradingBases = List.from(json['gradingBases']).map((e)=>GradingBases.fromJson(e)).toList();
    showInstructorOptions = json['showInstructorOptions'];
    showPermissionNumberOption = json['showPermissionNumberOption'];
    showRequirementDesignationOption = json['showRequirementDesignationOption'];
    showStartDateOption = json['showStartDateOption'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gradingBases'] = gradingBases.map((e)=>e.toJson()).toList();
    _data['showInstructorOptions'] = showInstructorOptions;
    _data['showPermissionNumberOption'] = showPermissionNumberOption;
    _data['showRequirementDesignationOption'] = showRequirementDesignationOption;
    _data['showStartDateOption'] = showStartDateOption;
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

class Schedules {
  Schedules({
    required this.id,
    required this.combination,
  });
  late final String id;
  late final List<String> combination;

  Schedules.fromJson(Map<String, dynamic> json){
    id = json['id'];
    combination = List.castFrom<dynamic, String>(json['combination']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['combination'] = combination;
    return _data;
  }
}

class CurrentSections {
  CurrentSections({
    this.approval,
    this.approvalCode,
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
    this.lastWaitListDate,
    this.partOfTermBeginDate,
    this.registrationEnds,
    required this.creditsMax,
    required this.creditsMin,
    required this.openSeats,
    this.topicId,
    this.institutionCode,
    this.institution,
    this.institutionAbbreviation,
    this.sectionAttributes,
    required this.corequisiteSections,
    required this.enrollmentRequirements,
    required this.exams,
    required this.instructor,
    required this.meetings,
    required this.reserveCaps,
    required this.courseRestrictions,
    required this.sectionRestrictions,
    required this.disabledReasons,
    this.flags,
    this.linkedSectionRegNumbers,
    required this.textbooks,
    required this.registrationOptions,
    this.academicCareer,
    this.academicCareerDescr,
    this.academicCareerDescrShort,
    this.academicGroup,
    this.academicGroupDescr,
    this.campus,
    this.campusCode,
    this.campusDescription,
    this.campusDescriptionRaw,
    this.campusShort,
    this.classAssociations,
    this.component,
    this.corequisites,
    required this.course,
    this.courseAttributes,
    this.credits,
    this.customData,
    this.department,
    this.description,
    required this.enrollmentStatus,
    this.fees,
    this.freeFormTopics,
    this.freeTextbookIndicated,
    this.lowCostTextbookIndicated,
    required this.id,
    this.instructionMode,
    this.location,
    this.lrnComTitle,
    this.notes,
    this.notesShort,
    this.partsOfTerm,
    this.prerequisites,
    required this.registrationNumber,
    this.registrationType,
    this.requirementDesignationDescr,
    this.seatsCapacity,
    this.seatsFilled,
    this.sectionNumber,
    this.sectionStatus,
    required this.subject,
    required this.subjectId,
    this.textbook,
    this.title,
    this.topicTitle,
    this.waitlist,
    this.waitlistOpen,
    this.waitlistPosition,
  });
  late final Null approval;
  late final Null approvalCode;
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
  late final Null lastWaitListDate;
  late final Null partOfTermBeginDate;
  late final Null registrationEnds;
  late final double creditsMax;
  late final double creditsMin;
  late final int openSeats;
  late final Null topicId;
  late final Null institutionCode;
  late final Null institution;
  late final Null institutionAbbreviation;
  late final Null sectionAttributes;
  late final List<dynamic> corequisiteSections;
  late final List<dynamic> enrollmentRequirements;
  late final List<dynamic> exams;
  late final List<dynamic> instructor;
  late final List<dynamic> meetings;
  late final List<dynamic> reserveCaps;
  late final List<dynamic> courseRestrictions;
  late final List<dynamic> sectionRestrictions;
  late final List<dynamic> disabledReasons;
  late final Null flags;
  late final Null linkedSectionRegNumbers;
  late final List<dynamic> textbooks;
  late final RegistrationOptions registrationOptions;
  late final Null academicCareer;
  late final Null academicCareerDescr;
  late final Null academicCareerDescrShort;
  late final Null academicGroup;
  late final Null academicGroupDescr;
  late final Null campus;
  late final Null campusCode;
  late final Null campusDescription;
  late final Null campusDescriptionRaw;
  late final Null campusShort;
  late final Null classAssociations;
  late final Null component;
  late final Null corequisites;
  late final String course;
  late final Null courseAttributes;
  late final Null credits;
  late final Null customData;
  late final Null department;
  late final Null description;
  late final String enrollmentStatus;
  late final Null fees;
  late final Null freeFormTopics;
  late final Null freeTextbookIndicated;
  late final Null lowCostTextbookIndicated;
  late final String id;
  late final Null instructionMode;
  late final Null location;
  late final Null lrnComTitle;
  late final Null notes;
  late final Null notesShort;
  late final Null partsOfTerm;
  late final Null prerequisites;
  late final String registrationNumber;
  late final Null registrationType;
  late final Null requirementDesignationDescr;
  late final Null seatsCapacity;
  late final Null seatsFilled;
  late final Null sectionNumber;
  late final Null sectionStatus;
  late final String subject;
  late final String subjectId;
  late final Null textbook;
  late final Null title;
  late final Null topicTitle;
  late final Null waitlist;
  late final Null waitlistOpen;
  late final Null waitlistPosition;

  CurrentSections.fromJson(Map<String, dynamic> json){
    approval = null;
    approvalCode = null;
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
    lastWaitListDate = null;
    partOfTermBeginDate = null;
    registrationEnds = null;
    creditsMax = json['creditsMax'];
    creditsMin = json['creditsMin'];
    openSeats = json['openSeats'];
    topicId = null;
    institutionCode = null;
    institution = null;
    institutionAbbreviation = null;
    sectionAttributes = null;
    corequisiteSections = List.castFrom<dynamic, dynamic>(json['corequisiteSections']);
    enrollmentRequirements = List.castFrom<dynamic, dynamic>(json['enrollmentRequirements']);
    exams = List.castFrom<dynamic, dynamic>(json['exams']);
    instructor = List.castFrom<dynamic, dynamic>(json['instructor']);
    meetings = List.castFrom<dynamic, dynamic>(json['meetings']);
    reserveCaps = List.castFrom<dynamic, dynamic>(json['reserveCaps']);
    courseRestrictions = List.castFrom<dynamic, dynamic>(json['courseRestrictions']);
    sectionRestrictions = List.castFrom<dynamic, dynamic>(json['sectionRestrictions']);
    disabledReasons = List.castFrom<dynamic, dynamic>(json['disabledReasons']);
    flags = null;
    linkedSectionRegNumbers = null;
    textbooks = List.castFrom<dynamic, dynamic>(json['textbooks']);
    registrationOptions = RegistrationOptions.fromJson(json['registrationOptions']);
    academicCareer = null;
    academicCareerDescr = null;
    academicCareerDescrShort = null;
    academicGroup = null;
    academicGroupDescr = null;
    campus = null;
    campusCode = null;
    campusDescription = null;
    campusDescriptionRaw = null;
    campusShort = null;
    classAssociations = null;
    component = null;
    corequisites = null;
    course = json['course'];
    courseAttributes = null;
    credits = null;
    customData = null;
    department = null;
    description = null;
    enrollmentStatus = json['enrollmentStatus'];
    fees = null;
    freeFormTopics = null;
    freeTextbookIndicated = null;
    lowCostTextbookIndicated = null;
    id = json['id'];
    instructionMode = null;
    location = null;
    lrnComTitle = null;
    notes = null;
    notesShort = null;
    partsOfTerm = null;
    prerequisites = null;
    registrationNumber = json['registrationNumber'];
    registrationType = null;
    requirementDesignationDescr = null;
    seatsCapacity = null;
    seatsFilled = null;
    sectionNumber = null;
    sectionStatus = null;
    subject = json['subject'];
    subjectId = json['subjectId'];
    textbook = null;
    title = null;
    topicTitle = null;
    waitlist = null;
    waitlistOpen = null;
    waitlistPosition = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
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
    _data['enrollmentRequirements'] = enrollmentRequirements;
    _data['exams'] = exams;
    _data['instructor'] = instructor;
    _data['meetings'] = meetings;
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