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
  late final List<dynamic> registrationBlocks;
  late final List<dynamic> sections;
  late final List<dynamic> schedules;
  late final List<String> courses;
  late final List<CurrentSections> currentSections;
  late final List<dynamic> cartSections;
  late final List<dynamic> breaks;
  late final List<Warnings> warnings;
  late final List<dynamic> courseCoReqs;
  late final int padding;
  late final List<dynamic> degreeCourses;

  SchedulerGenerateCoursesModel.fromJson(Map<String, dynamic> json){
    registrationBlocks = List.castFrom<dynamic, dynamic>(json['registrationBlocks']);
    sections = List.castFrom<dynamic, dynamic>(json['sections']);
    schedules = List.castFrom<dynamic, dynamic>(json['schedules']);
    courses = List.castFrom<dynamic, String>(json['courses']);
    currentSections = List.from(json['currentSections']).map((e)=>CurrentSections.fromJson(e)).toList();
    cartSections = List.castFrom<dynamic, dynamic>(json['cartSections']);
    breaks = List.castFrom<dynamic, dynamic>(json['breaks']);
    warnings = List.from(json['warnings']).map((e)=>Warnings.fromJson(e)).toList();
    courseCoReqs = List.castFrom<dynamic, dynamic>(json['courseCoReqs']);
    padding = json['padding'];
    degreeCourses = List.castFrom<dynamic, dynamic>(json['degreeCourses']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['registrationBlocks'] = registrationBlocks;
    _data['sections'] = sections;
    _data['schedules'] = schedules;
    _data['courses'] = courses;
    _data['currentSections'] = currentSections.map((e)=>e.toJson()).toList();
    _data['cartSections'] = cartSections;
    _data['breaks'] = breaks;
    _data['warnings'] = warnings.map((e)=>e.toJson()).toList();
    _data['courseCoReqs'] = courseCoReqs;
    _data['padding'] = padding;
    _data['degreeCourses'] = degreeCourses;
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
  late final int creditsMax;
  late final int creditsMin;
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

class RegistrationOptions {
  RegistrationOptions({
    required this.gradingBases,
    required this.showInstructorOptions,
    required this.showPermissionNumberOption,
    required this.showRequirementDesignationOption,
    required this.showStartDateOption,
  });
  late final List<dynamic> gradingBases;
  late final bool showInstructorOptions;
  late final bool showPermissionNumberOption;
  late final bool showRequirementDesignationOption;
  late final bool showStartDateOption;

  RegistrationOptions.fromJson(Map<String, dynamic> json){
    gradingBases = List.castFrom<dynamic, dynamic>(json['gradingBases']);
    showInstructorOptions = json['showInstructorOptions'];
    showPermissionNumberOption = json['showPermissionNumberOption'];
    showRequirementDesignationOption = json['showRequirementDesignationOption'];
    showStartDateOption = json['showStartDateOption'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['gradingBases'] = gradingBases;
    _data['showInstructorOptions'] = showInstructorOptions;
    _data['showPermissionNumberOption'] = showPermissionNumberOption;
    _data['showRequirementDesignationOption'] = showRequirementDesignationOption;
    _data['showStartDateOption'] = showStartDateOption;
    return _data;
  }
}

class Warnings {
  Warnings({
    required this.type,
    required this.warning,
    this.innerWarnings,
  });
  late final String type;
  late final String warning;
  late final Null innerWarnings;

  Warnings.fromJson(Map<String, dynamic> json){
    type = json['type'];
    warning = json['warning'];
    innerWarnings = null;
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['type'] = type;
    _data['warning'] = warning;
    _data['innerWarnings'] = innerWarnings;
    return _data;
  }
}