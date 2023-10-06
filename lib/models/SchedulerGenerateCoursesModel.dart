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
    final data = <String, dynamic>{};
    data['registrationBlocks'] = registrationBlocks;
    data['sections'] = sections;
    data['schedules'] = schedules;
    data['courses'] = courses;
    data['currentSections'] = currentSections.map((e)=>e.toJson()).toList();
    data['cartSections'] = cartSections;
    data['breaks'] = breaks;
    data['warnings'] = warnings.map((e)=>e.toJson()).toList();
    data['courseCoReqs'] = courseCoReqs;
    data['padding'] = padding;
    data['degreeCourses'] = degreeCourses;
    return data;
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
    topicId = json['topicId'];
    institutionCode = json['institutionCode'];
    institution = json['institution'];
    institutionAbbreviation = json['institutionAbbreviation'];
    sectionAttributes = json['sectionAttributes'];
    corequisiteSections = List.castFrom<dynamic, dynamic>(json['corequisiteSections']);
    enrollmentRequirements = List.castFrom<dynamic, dynamic>(json['enrollmentRequirements']);
    exams = List.castFrom<dynamic, dynamic>(json['exams']);
    instructor = List.castFrom<dynamic, dynamic>(json['instructor']);
    meetings = List.castFrom<dynamic, dynamic>(json['meetings']);
    reserveCaps = List.castFrom<dynamic, dynamic>(json['reserveCaps']);
    courseRestrictions = List.castFrom<dynamic, dynamic>(json['courseRestrictions']);
    sectionRestrictions = List.castFrom<dynamic, dynamic>(json['sectionRestrictions']);
    disabledReasons = List.castFrom<dynamic, dynamic>(json['disabledReasons']);
    flags = json['flags'];
    linkedSectionRegNumbers = json['linkedSectionRegNumbers'];
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
    campusShort = json['campusShort'];
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
    lrnComTitle = json['lrnComTitle'];
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
    waitlistPosition = json['waitlistPosition'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
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
    data['enrollmentRequirements'] = enrollmentRequirements;
    data['exams'] = exams;
    data['instructor'] = instructor;
    data['meetings'] = meetings;
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
    final data = <String, dynamic>{};
    data['gradingBases'] = gradingBases;
    data['showInstructorOptions'] = showInstructorOptions;
    data['showPermissionNumberOption'] = showPermissionNumberOption;
    data['showRequirementDesignationOption'] = showRequirementDesignationOption;
    data['showStartDateOption'] = showStartDateOption;
    return data;
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
    final data = <String, dynamic>{};
    data['type'] = type;
    data['warning'] = warning;
    data['innerWarnings'] = innerWarnings;
    return data;
  }
}