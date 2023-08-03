// class SchedulerTermDataModel {
//   bool? showDegreePlanWarning;
//   bool? showDegreePlanWarningOnConfirm;
//   List<CurrentSections>? currentSections;
//
//   SchedulerTermDataModel(
//       {this.showDegreePlanWarning, this.showDegreePlanWarningOnConfirm, this.currentSections});
//
//   SchedulerTermDataModel.fromJson(Map<String, dynamic> json) {
//     showDegreePlanWarning = json['showDegreePlanWarning'];
//     showDegreePlanWarningOnConfirm = json['showDegreePlanWarningOnConfirm'];
//     if (json['currentSections'] != null) {
//       currentSections = <CurrentSections>[];
//       json['currentSections'].forEach((v) {
//         currentSections!.add(new CurrentSections.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['showDegreePlanWarning'] = this.showDegreePlanWarning;
//     data['showDegreePlanWarningOnConfirm'] =
//         this.showDegreePlanWarningOnConfirm;
//     if (this.currentSections != null) {
//       data['currentSections'] =
//           this.currentSections!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class CurrentSections {
//   List<Null>? actions;
//   AdditionalData? additionalData;
//   SectionParameterValues? sectionParameterValues;
//   AdditionalData? sectionParameterOptions;
//   String? approval;
//   String? approvalCode;
//   bool? hasCorequisites;
//   bool? hasFreetextbook;
//   bool? hasLowCostTextbook;
//   bool? hasPrerequisites;
//   bool? hasReserveCaps;
//   bool? hasRestrictions;
//   bool? hasSectionCorequisites;
//   bool? hasSectionNotes;
//   bool? isExternal;
//   bool? isHonors;
//   bool? isOnline;
//   bool? isWritingEnhanced;
//   bool? optional;
//   bool? registrationClosed;
//   String? lastWaitListDate;
//   String? partOfTermBeginDate;
//   String? registrationEnds;
//   int? creditsMax;
//   int? creditsMin;
//   int? openSeats;
//   Null? topicId;
//   String? institutionCode;
//   Null? institution;
//   Null? institutionAbbreviation;
//   List<Null>? sectionAttributes;
//   List<Null>? corequisiteSections;
//   List<EnrollmentRequirements>? enrollmentRequirements;
//   List<Null>? exams;
//   List<Instructor>? instructor;
//   List<Meetings>? meetings;
//   List<Null>? reserveCaps;
//   List<Null>? courseRestrictions;
//   List<Null>? sectionRestrictions;
//   List<Null>? disabledReasons;
//   List<Null>? flags;
//   List<Null>? linkedSectionRegNumbers;
//   List<Null>? textbooks;
//   RegistrationOptions? registrationOptions;
//   String? academicCareer;
//   String? academicCareerDescr;
//   String? academicCareerDescrShort;
//   String? academicGroup;
//   String? academicGroupDescr;
//   String? campus;
//   String? campusCode;
//   String? campusDescription;
//   String? campusDescriptionRaw;
//   Null? campusShort;
//   String? classAssociations;
//   String? component;
//   String? corequisites;
//   String? course;
//   String? courseAttributes;
//   String? credits;
//   String? customData;
//   String? department;
//   String? description;
//   String? enrollmentStatus;
//   String? fees;
//   String? freeFormTopics;
//   String? freeTextbookIndicated;
//   String? lowCostTextbookIndicated;
//   String? id;
//   String? instructionMode;
//   String? location;
//   Null? lrnComTitle;
//   String? notes;
//   String? notesShort;
//   String? partsOfTerm;
//   String? prerequisites;
//   String? registrationNumber;
//   String? registrationType;
//   String? requirementDesignationDescr;
//   String? seatsCapacity;
//   String? seatsFilled;
//   String? sectionNumber;
//   String? sectionStatus;
//   String? subject;
//   String? subjectId;
//   String? textbook;
//   String? title;
//   String? topicTitle;
//   String? waitlist;
//   String? waitlistOpen;
//   Null? waitlistPosition;
//
//   CurrentSections(
//       {this.actions, this.additionalData, this.sectionParameterValues, this.sectionParameterOptions, this.approval, this.approvalCode, this.hasCorequisites, this.hasFreetextbook, this.hasLowCostTextbook, this.hasPrerequisites, this.hasReserveCaps, this.hasRestrictions, this.hasSectionCorequisites, this.hasSectionNotes, this.isExternal, this.isHonors, this.isOnline, this.isWritingEnhanced, this.optional, this.registrationClosed, this.lastWaitListDate, this.partOfTermBeginDate, this.registrationEnds, this.creditsMax, this.creditsMin, this.openSeats, this.topicId, this.institutionCode, this.institution, this.institutionAbbreviation, this.sectionAttributes, this.corequisiteSections, this.enrollmentRequirements, this.exams, this.instructor, this.meetings, this.reserveCaps, this.courseRestrictions, this.sectionRestrictions, this.disabledReasons, this.flags, this.linkedSectionRegNumbers, this.textbooks, this.registrationOptions, this.academicCareer, this.academicCareerDescr, this.academicCareerDescrShort, this.academicGroup, this.academicGroupDescr, this.campus, this.campusCode, this.campusDescription, this.campusDescriptionRaw, this.campusShort, this.classAssociations, this.component, this.corequisites, this.course, this.courseAttributes, this.credits, this.customData, this.department, this.description, this.enrollmentStatus, this.fees, this.freeFormTopics, this.freeTextbookIndicated, this.lowCostTextbookIndicated, this.id, this.instructionMode, this.location, this.lrnComTitle, this.notes, this.notesShort, this.partsOfTerm, this.prerequisites, this.registrationNumber, this.registrationType, this.requirementDesignationDescr, this.seatsCapacity, this.seatsFilled, this.sectionNumber, this.sectionStatus, this.subject, this.subjectId, this.textbook, this.title, this.topicTitle, this.waitlist, this.waitlistOpen, this.waitlistPosition});
//
//   CurrentSections.fromJson(Map<String, dynamic> json) {
//     if (json['actions'] != null) {
//       actions = <Null>[];
//       json['actions'].forEach((v) {
//         actions!.add(new Null.fromJson(v));
//       });
//     }
//     additionalData =
//     json['additionalData'] != null ? new AdditionalData.fromJson(
//         json['additionalData']) : null;
//     sectionParameterValues =
//     json['sectionParameterValues'] != null ? new SectionParameterValues
//         .fromJson(json['sectionParameterValues']) : null;
//     sectionParameterOptions =
//     json['sectionParameterOptions'] != null ? new AdditionalData.fromJson(
//         json['sectionParameterOptions']) : null;
//     approval = json['approval'];
//     approvalCode = json['approvalCode'];
//     hasCorequisites = json['hasCorequisites'];
//     hasFreetextbook = json['hasFreetextbook'];
//     hasLowCostTextbook = json['hasLowCostTextbook'];
//     hasPrerequisites = json['hasPrerequisites'];
//     hasReserveCaps = json['hasReserveCaps'];
//     hasRestrictions = json['hasRestrictions'];
//     hasSectionCorequisites = json['hasSectionCorequisites'];
//     hasSectionNotes = json['hasSectionNotes'];
//     isExternal = json['isExternal'];
//     isHonors = json['isHonors'];
//     isOnline = json['isOnline'];
//     isWritingEnhanced = json['isWritingEnhanced'];
//     optional = json['optional'];
//     registrationClosed = json['registrationClosed'];
//     lastWaitListDate = json['lastWaitListDate'];
//     partOfTermBeginDate = json['partOfTermBeginDate'];
//     registrationEnds = json['registrationEnds'];
//     creditsMax = json['creditsMax'];
//     creditsMin = json['creditsMin'];
//     openSeats = json['openSeats'];
//     topicId = json['topicId'];
//     institutionCode = json['institutionCode'];
//     institution = json['institution'];
//     institutionAbbreviation = json['institutionAbbreviation'];
//     if (json['sectionAttributes'] != null) {
//       sectionAttributes = <Null>[];
//       json['sectionAttributes'].forEach((v) {
//         sectionAttributes!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['corequisiteSections'] != null) {
//       corequisiteSections = <Null>[];
//       json['corequisiteSections'].forEach((v) {
//         corequisiteSections!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['enrollmentRequirements'] != null) {
//       enrollmentRequirements = <EnrollmentRequirements>[];
//       json['enrollmentRequirements'].forEach((v) {
//         enrollmentRequirements!.add(new EnrollmentRequirements.fromJson(v));
//       });
//     }
//     if (json['exams'] != null) {
//       exams = <Null>[];
//       json['exams'].forEach((v) {
//         exams!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['instructor'] != null) {
//       instructor = <Instructor>[];
//       json['instructor'].forEach((v) {
//         instructor!.add(new Instructor.fromJson(v));
//       });
//     }
//     if (json['meetings'] != null) {
//       meetings = <Meetings>[];
//       json['meetings'].forEach((v) {
//         meetings!.add(new Meetings.fromJson(v));
//       });
//     }
//     if (json['reserveCaps'] != null) {
//       reserveCaps = <Null>[];
//       json['reserveCaps'].forEach((v) {
//         reserveCaps!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['courseRestrictions'] != null) {
//       courseRestrictions = <Null>[];
//       json['courseRestrictions'].forEach((v) {
//         courseRestrictions!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['sectionRestrictions'] != null) {
//       sectionRestrictions = <Null>[];
//       json['sectionRestrictions'].forEach((v) {
//         sectionRestrictions!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['disabledReasons'] != null) {
//       disabledReasons = <Null>[];
//       json['disabledReasons'].forEach((v) {
//         disabledReasons!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['flags'] != null) {
//       flags = <Null>[];
//       json['flags'].forEach((v) {
//         flags!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['linkedSectionRegNumbers'] != null) {
//       linkedSectionRegNumbers = <Null>[];
//       json['linkedSectionRegNumbers'].forEach((v) {
//         linkedSectionRegNumbers!.add(new Null.fromJson(v));
//       });
//     }
//     if (json['textbooks'] != null) {
//       textbooks = <Null>[];
//       json['textbooks'].forEach((v) {
//         textbooks!.add(new Null.fromJson(v));
//       });
//     }
//     registrationOptions =
//     json['registrationOptions'] != null ? new RegistrationOptions.fromJson(
//         json['registrationOptions']) : null;
//     academicCareer = json['academicCareer'];
//     academicCareerDescr = json['academicCareerDescr'];
//     academicCareerDescrShort = json['academicCareerDescrShort'];
//     academicGroup = json['academicGroup'];
//     academicGroupDescr = json['academicGroupDescr'];
//     campus = json['campus'];
//     campusCode = json['campusCode'];
//     campusDescription = json['campusDescription'];
//     campusDescriptionRaw = json['campusDescriptionRaw'];
//     campusShort = json['campusShort'];
//     classAssociations = json['classAssociations'];
//     component = json['component'];
//     corequisites = json['corequisites'];
//     course = json['course'];
//     courseAttributes = json['courseAttributes'];
//     credits = json['credits'];
//     customData = json['customData'];
//     department = json['department'];
//     description = json['description'];
//     enrollmentStatus = json['enrollmentStatus'];
//     fees = json['fees'];
//     freeFormTopics = json['freeFormTopics'];
//     freeTextbookIndicated = json['freeTextbookIndicated'];
//     lowCostTextbookIndicated = json['lowCostTextbookIndicated'];
//     id = json['id'];
//     instructionMode = json['instructionMode'];
//     location = json['location'];
//     lrnComTitle = json['lrnComTitle'];
//     notes = json['notes'];
//     notesShort = json['notesShort'];
//     partsOfTerm = json['partsOfTerm'];
//     prerequisites = json['prerequisites'];
//     registrationNumber = json['registrationNumber'];
//     registrationType = json['registrationType'];
//     requirementDesignationDescr = json['requirementDesignationDescr'];
//     seatsCapacity = json['seatsCapacity'];
//     seatsFilled = json['seatsFilled'];
//     sectionNumber = json['sectionNumber'];
//     sectionStatus = json['sectionStatus'];
//     subject = json['subject'];
//     subjectId = json['subjectId'];
//     textbook = json['textbook'];
//     title = json['title'];
//     topicTitle = json['topicTitle'];
//     waitlist = json['waitlist'];
//     waitlistOpen = json['waitlistOpen'];
//     waitlistPosition = json['waitlistPosition'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     if (this.actions != null) {
//       data['actions'] = this.actions!.map((v) => v.toJson()).toList();
//     }
//     if (this.additionalData != null) {
//       data['additionalData'] = this.additionalData!.toJson();
//     }
//     if (this.sectionParameterValues != null) {
//       data['sectionParameterValues'] = this.sectionParameterValues!.toJson();
//     }
//     if (this.sectionParameterOptions != null) {
//       data['sectionParameterOptions'] = this.sectionParameterOptions!.toJson();
//     }
//     data['approval'] = this.approval;
//     data['approvalCode'] = this.approvalCode;
//     data['hasCorequisites'] = this.hasCorequisites;
//     data['hasFreetextbook'] = this.hasFreetextbook;
//     data['hasLowCostTextbook'] = this.hasLowCostTextbook;
//     data['hasPrerequisites'] = this.hasPrerequisites;
//     data['hasReserveCaps'] = this.hasReserveCaps;
//     data['hasRestrictions'] = this.hasRestrictions;
//     data['hasSectionCorequisites'] = this.hasSectionCorequisites;
//     data['hasSectionNotes'] = this.hasSectionNotes;
//     data['isExternal'] = this.isExternal;
//     data['isHonors'] = this.isHonors;
//     data['isOnline'] = this.isOnline;
//     data['isWritingEnhanced'] = this.isWritingEnhanced;
//     data['optional'] = this.optional;
//     data['registrationClosed'] = this.registrationClosed;
//     data['lastWaitListDate'] = this.lastWaitListDate;
//     data['partOfTermBeginDate'] = this.partOfTermBeginDate;
//     data['registrationEnds'] = this.registrationEnds;
//     data['creditsMax'] = this.creditsMax;
//     data['creditsMin'] = this.creditsMin;
//     data['openSeats'] = this.openSeats;
//     data['topicId'] = this.topicId;
//     data['institutionCode'] = this.institutionCode;
//     data['institution'] = this.institution;
//     data['institutionAbbreviation'] = this.institutionAbbreviation;
//     if (this.sectionAttributes != null) {
//       data['sectionAttributes'] =
//           this.sectionAttributes!.map((v) => v.toJson()).toList();
//     }
//     if (this.corequisiteSections != null) {
//       data['corequisiteSections'] =
//           this.corequisiteSections!.map((v) => v.toJson()).toList();
//     }
//     if (this.enrollmentRequirements != null) {
//       data['enrollmentRequirements'] =
//           this.enrollmentRequirements!.map((v) => v.toJson()).toList();
//     }
//     if (this.exams != null) {
//       data['exams'] = this.exams!.map((v) => v.toJson()).toList();
//     }
//     if (this.instructor != null) {
//       data['instructor'] = this.instructor!.map((v) => v.toJson()).toList();
//     }
//     if (this.meetings != null) {
//       data['meetings'] = this.meetings!.map((v) => v.toJson()).toList();
//     }
//     if (this.reserveCaps != null) {
//       data['reserveCaps'] = this.reserveCaps!.map((v) => v.toJson()).toList();
//     }
//     if (this.courseRestrictions != null) {
//       data['courseRestrictions'] =
//           this.courseRestrictions!.map((v) => v.toJson()).toList();
//     }
//     if (this.sectionRestrictions != null) {
//       data['sectionRestrictions'] =
//           this.sectionRestrictions!.map((v) => v.toJson()).toList();
//     }
//     if (this.disabledReasons != null) {
//       data['disabledReasons'] =
//           this.disabledReasons!.map((v) => v.toJson()).toList();
//     }
//     if (this.flags != null) {
//       data['flags'] = this.flags!.map((v) => v.toJson()).toList();
//     }
//     if (this.linkedSectionRegNumbers != null) {
//       data['linkedSectionRegNumbers'] =
//           this.linkedSectionRegNumbers!.map((v) => v.toJson()).toList();
//     }
//     if (this.textbooks != null) {
//       data['textbooks'] = this.textbooks!.map((v) => v.toJson()).toList();
//     }
//     if (this.registrationOptions != null) {
//       data['registrationOptions'] = this.registrationOptions!.toJson();
//     }
//     data['academicCareer'] = this.academicCareer;
//     data['academicCareerDescr'] = this.academicCareerDescr;
//     data['academicCareerDescrShort'] = this.academicCareerDescrShort;
//     data['academicGroup'] = this.academicGroup;
//     data['academicGroupDescr'] = this.academicGroupDescr;
//     data['campus'] = this.campus;
//     data['campusCode'] = this.campusCode;
//     data['campusDescription'] = this.campusDescription;
//     data['campusDescriptionRaw'] = this.campusDescriptionRaw;
//     data['campusShort'] = this.campusShort;
//     data['classAssociations'] = this.classAssociations;
//     data['component'] = this.component;
//     data['corequisites'] = this.corequisites;
//     data['course'] = this.course;
//     data['courseAttributes'] = this.courseAttributes;
//     data['credits'] = this.credits;
//     data['customData'] = this.customData;
//     data['department'] = this.department;
//     data['description'] = this.description;
//     data['enrollmentStatus'] = this.enrollmentStatus;
//     data['fees'] = this.fees;
//     data['freeFormTopics'] = this.freeFormTopics;
//     data['freeTextbookIndicated'] = this.freeTextbookIndicated;
//     data['lowCostTextbookIndicated'] = this.lowCostTextbookIndicated;
//     data['id'] = this.id;
//     data['instructionMode'] = this.instructionMode;
//     data['location'] = this.location;
//     data['lrnComTitle'] = this.lrnComTitle;
//     data['notes'] = this.notes;
//     data['notesShort'] = this.notesShort;
//     data['partsOfTerm'] = this.partsOfTerm;
//     data['prerequisites'] = this.prerequisites;
//     data['registrationNumber'] = this.registrationNumber;
//     data['registrationType'] = this.registrationType;
//     data['requirementDesignationDescr'] = this.requirementDesignationDescr;
//     data['seatsCapacity'] = this.seatsCapacity;
//     data['seatsFilled'] = this.seatsFilled;
//     data['sectionNumber'] = this.sectionNumber;
//     data['sectionStatus'] = this.sectionStatus;
//     data['subject'] = this.subject;
//     data['subjectId'] = this.subjectId;
//     data['textbook'] = this.textbook;
//     data['title'] = this.title;
//     data['topicTitle'] = this.topicTitle;
//     data['waitlist'] = this.waitlist;
//     data['waitlistOpen'] = this.waitlistOpen;
//     data['waitlistPosition'] = this.waitlistPosition;
//     return data;
//   }
// }
//
// class AdditionalData {
//
//
//   AdditionalData
//
//   (
//
//   {
// });
//
// AdditionalData.fromJson
// (
// Map<String, dynamic> json) {
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// return data;
// }
// }
//
// class SectionParameterValues {
// String? academicProgram;
// String? gradingBasis;
// String? units;
// String? classPermissionNumber;
// String? startDate;
// String? requirementDesignation;
// String? instructorId;
// String? academicCareer;
//
// SectionParameterValues({this.academicProgram, this.gradingBasis, this.units, this.classPermissionNumber, this.startDate, this.requirementDesignation, this.instructorId, this.academicCareer});
//
// SectionParameterValues.fromJson(Map<String, dynamic> json) {
// academicProgram = json['academicProgram'];
// gradingBasis = json['gradingBasis'];
// units = json['units'];
// classPermissionNumber = json['classPermissionNumber'];
// startDate = json['startDate'];
// requirementDesignation = json['requirementDesignation'];
// instructorId = json['instructorId'];
// academicCareer = json['academicCareer'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['academicProgram'] = this.academicProgram;
// data['gradingBasis'] = this.gradingBasis;
// data['units'] = this.units;
// data['classPermissionNumber'] = this.classPermissionNumber;
// data['startDate'] = this.startDate;
// data['requirementDesignation'] = this.requirementDesignation;
// data['instructorId'] = this.instructorId;
// data['academicCareer'] = this.academicCareer;
// return data;
// }
// }
//
// class EnrollmentRequirements {
// String? type;
// String? description;
//
// EnrollmentRequirements({this.type, this.description});
//
// EnrollmentRequirements.fromJson(Map<String, dynamic> json) {
// type = json['type'];
// description = json['description'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['type'] = this.type;
// data['description'] = this.description;
// return data;
// }
// }
//
// class Instructor {
// String? id;
// String? name;
// String? email;
// String? externalId;
// String? instructorRole;
//
// Instructor({this.id, this.name, this.email, this.externalId, this.instructorRole});
//
// Instructor.fromJson(Map<String, dynamic> json) {
// id = json['id'];
// name = json['name'];
// email = json['email'];
// externalId = json['externalId'];
// instructorRole = json['instructorRole'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['id'] = this.id;
// data['name'] = this.name;
// data['email'] = this.email;
// data['externalId'] = this.externalId;
// data['instructorRole'] = this.instructorRole;
// return data;
// }
// }
//
// class Meetings {
// String? days;
// String? daysRaw;
// int? startTime;
// int? endTime;
// String? location;
// String? meetingType;
// String? startDate;
// String? endDate;
// String? mapURL;
// Null? meetingTypeDescription;
// Null? scheduleTypeCode;
// Null? scheduleTypeDescription;
// String? building;
// String? buildingDescription;
// String? buildingCode;
// String? room;
// String? firstMonday;
// String? lastMonday;
//
// Meetings({this.days, this.daysRaw, this.startTime, this.endTime, this.location, this.meetingType, this.startDate, this.endDate, this.mapURL, this.meetingTypeDescription, this.scheduleTypeCode, this.scheduleTypeDescription, this.building, this.buildingDescription, this.buildingCode, this.room, this.firstMonday, this.lastMonday});
//
// Meetings.fromJson(Map<String, dynamic> json) {
// days = json['days'];
// daysRaw = json['daysRaw'];
// startTime = json['startTime'];
// endTime = json['endTime'];
// location = json['location'];
// meetingType = json['meetingType'];
// startDate = json['startDate'];
// endDate = json['endDate'];
// mapURL = json['mapURL'];
// meetingTypeDescription = json['meetingTypeDescription'];
// scheduleTypeCode = json['scheduleTypeCode'];
// scheduleTypeDescription = json['scheduleTypeDescription'];
// building = json['building'];
// buildingDescription = json['buildingDescription'];
// buildingCode = json['buildingCode'];
// room = json['room'];
// firstMonday = json['firstMonday'];
// lastMonday = json['lastMonday'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['days'] = this.days;
// data['daysRaw'] = this.daysRaw;
// data['startTime'] = this.startTime;
// data['endTime'] = this.endTime;
// data['location'] = this.location;
// data['meetingType'] = this.meetingType;
// data['startDate'] = this.startDate;
// data['endDate'] = this.endDate;
// data['mapURL'] = this.mapURL;
// data['meetingTypeDescription'] = this.meetingTypeDescription;
// data['scheduleTypeCode'] = this.scheduleTypeCode;
// data['scheduleTypeDescription'] = this.scheduleTypeDescription;
// data['building'] = this.building;
// data['buildingDescription'] = this.buildingDescription;
// data['buildingCode'] = this.buildingCode;
// data['room'] = this.room;
// data['firstMonday'] = this.firstMonday;
// data['lastMonday'] = this.lastMonday;
// return data;
// }
// }
//
// class RegistrationOptions {
// List<GradingBases>? gradingBases;
// bool? showInstructorOptions;
// bool? showPermissionNumberOption;
// bool? showRequirementDesignationOption;
// bool? showStartDateOption;
//
// RegistrationOptions({this.gradingBases, this.showInstructorOptions, this.showPermissionNumberOption, this.showRequirementDesignationOption, this.showStartDateOption});
//
// RegistrationOptions.fromJson(Map<String, dynamic> json) {
// if (json['gradingBases'] != null) {
// gradingBases = <GradingBases>[];
// json['gradingBases'].forEach((v) { gradingBases!.add(new GradingBases.fromJson(v)); });
// }
// showInstructorOptions = json['showInstructorOptions'];
// showPermissionNumberOption = json['showPermissionNumberOption'];
// showRequirementDesignationOption = json['showRequirementDesignationOption'];
// showStartDateOption = json['showStartDateOption'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// if (this.gradingBases != null) {
// data['gradingBases'] = this.gradingBases!.map((v) => v.toJson()).toList();
// }
// data['showInstructorOptions'] = this.showInstructorOptions;
// data['showPermissionNumberOption'] = this.showPermissionNumberOption;
// data['showRequirementDesignationOption'] = this.showRequirementDesignationOption;
// data['showStartDateOption'] = this.showStartDateOption;
// return data;
// }
// }
//
// class GradingBases {
// String? code;
// Null? description;
//
// GradingBases({this.code, this.description});
//
// GradingBases.fromJson(Map<String, dynamic> json) {
// code = json['code'];
// description = json['description'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// data['code'] = this.code;
// data['description'] = this.description;
// return data;
// }
// }
//
// class CurrentSections {
// List<Null>? actions;
// AdditionalData? additionalData;
// SectionParameterValues? sectionParameterValues;
// AdditionalData? sectionParameterOptions;
// String? approval;
// String? approvalCode;
// bool? hasCorequisites;
// bool? hasFreetextbook;
// bool? hasLowCostTextbook;
// bool? hasPrerequisites;
// bool? hasReserveCaps;
// bool? hasRestrictions;
// bool? hasSectionCorequisites;
// bool? hasSectionNotes;
// bool? isExternal;
// bool? isHonors;
// bool? isOnline;
// bool? isWritingEnhanced;
// bool? optional;
// bool? registrationClosed;
// String? lastWaitListDate;
// String? partOfTermBeginDate;
// String? registrationEnds;
// int? creditsMax;
// int? creditsMin;
// int? openSeats;
// Null? topicId;
// String? institutionCode;
// Null? institution;
// Null? institutionAbbreviation;
// List<Null>? sectionAttributes;
// List<Null>? corequisiteSections;
// List<EnrollmentRequirements>? enrollmentRequirements;
// List<Null>? exams;
// List<Instructor>? instructor;
// List<Meetings>? meetings;
// List<Null>? reserveCaps;
// List<Null>? courseRestrictions;
// List<Null>? sectionRestrictions;
// List<Null>? disabledReasons;
// List<Null>? flags;
// List<Null>? linkedSectionRegNumbers;
// List<Null>? textbooks;
// RegistrationOptions? registrationOptions;
// String? academicCareer;
// String? academicCareerDescr;
// String? academicCareerDescrShort;
// String? academicGroup;
// String? academicGroupDescr;
// String? campus;
// String? campusCode;
// String? campusDescription;
// String? campusDescriptionRaw;
// Null? campusShort;
// String? classAssociations;
// String? component;
// String? corequisites;
// String? course;
// String? courseAttributes;
// String? credits;
// String? customData;
// String? department;
// String? description;
// String? enrollmentStatus;
// String? fees;
// String? freeFormTopics;
// String? freeTextbookIndicated;
// String? lowCostTextbookIndicated;
// String? id;
// String? instructionMode;
// String? location;
// Null? lrnComTitle;
// String? notes;
// String? notesShort;
// String? partsOfTerm;
// String? prerequisites;
// String? registrationNumber;
// String? registrationType;
// String? requirementDesignationDescr;
// String? seatsCapacity;
// String? seatsFilled;
// String? sectionNumber;
// String? sectionStatus;
// String? subject;
// String? subjectId;
// String? textbook;
// String? title;
// String? topicTitle;
// String? waitlist;
// String? waitlistOpen;
// Null? waitlistPosition;
//
// CurrentSections({this.actions, this.additionalData, this.sectionParameterValues, this.sectionParameterOptions, this.approval, this.approvalCode, this.hasCorequisites, this.hasFreetextbook, this.hasLowCostTextbook, this.hasPrerequisites, this.hasReserveCaps, this.hasRestrictions, this.hasSectionCorequisites, this.hasSectionNotes, this.isExternal, this.isHonors, this.isOnline, this.isWritingEnhanced, this.optional, this.registrationClosed, this.lastWaitListDate, this.partOfTermBeginDate, this.registrationEnds, this.creditsMax, this.creditsMin, this.openSeats, this.topicId, this.institutionCode, this.institution, this.institutionAbbreviation, this.sectionAttributes, this.corequisiteSections, this.enrollmentRequirements, this.exams, this.instructor, this.meetings, this.reserveCaps, this.courseRestrictions, this.sectionRestrictions, this.disabledReasons, this.flags, this.linkedSectionRegNumbers, this.textbooks, this.registrationOptions, this.academicCareer, this.academicCareerDescr, this.academicCareerDescrShort, this.academicGroup, this.academicGroupDescr, this.campus, this.campusCode, this.campusDescription, this.campusDescriptionRaw, this.campusShort, this.classAssociations, this.component, this.corequisites, this.course, this.courseAttributes, this.credits, this.customData, this.department, this.description, this.enrollmentStatus, this.fees, this.freeFormTopics, this.freeTextbookIndicated, this.lowCostTextbookIndicated, this.id, this.instructionMode, this.location, this.lrnComTitle, this.notes, this.notesShort, this.partsOfTerm, this.prerequisites, this.registrationNumber, this.registrationType, this.requirementDesignationDescr, this.seatsCapacity, this.seatsFilled, this.sectionNumber, this.sectionStatus, this.subject, this.subjectId, this.textbook, this.title, this.topicTitle, this.waitlist, this.waitlistOpen, this.waitlistPosition});
//
// CurrentSections.fromJson(Map<String, dynamic> json) {
// if (json['actions'] != null) {
// actions = <Null>[];
// json['actions'].forEach((v) { actions!.add(new Null.fromJson(v)); });
// }
// additionalData = json['additionalData'] != null ? new AdditionalData.fromJson(json['additionalData']) : null;
// sectionParameterValues = json['sectionParameterValues'] != null ? new SectionParameterValues.fromJson(json['sectionParameterValues']) : null;
// sectionParameterOptions = json['sectionParameterOptions'] != null ? new AdditionalData.fromJson(json['sectionParameterOptions']) : null;
// approval = json['approval'];
// approvalCode = json['approvalCode'];
// hasCorequisites = json['hasCorequisites'];
// hasFreetextbook = json['hasFreetextbook'];
// hasLowCostTextbook = json['hasLowCostTextbook'];
// hasPrerequisites = json['hasPrerequisites'];
// hasReserveCaps = json['hasReserveCaps'];
// hasRestrictions = json['hasRestrictions'];
// hasSectionCorequisites = json['hasSectionCorequisites'];
// hasSectionNotes = json['hasSectionNotes'];
// isExternal = json['isExternal'];
// isHonors = json['isHonors'];
// isOnline = json['isOnline'];
// isWritingEnhanced = json['isWritingEnhanced'];
// optional = json['optional'];
// registrationClosed = json['registrationClosed'];
// lastWaitListDate = json['lastWaitListDate'];
// partOfTermBeginDate = json['partOfTermBeginDate'];
// registrationEnds = json['registrationEnds'];
// creditsMax = json['creditsMax'];
// creditsMin = json['creditsMin'];
// openSeats = json['openSeats'];
// topicId = json['topicId'];
// institutionCode = json['institutionCode'];
// institution = json['institution'];
// institutionAbbreviation = json['institutionAbbreviation'];
// if (json['sectionAttributes'] != null) {
// sectionAttributes = <Null>[];
// json['sectionAttributes'].forEach((v) { sectionAttributes!.add(new Null.fromJson(v)); });
// }
// if (json['corequisiteSections'] != null) {
// corequisiteSections = <Null>[];
// json['corequisiteSections'].forEach((v) { corequisiteSections!.add(new Null.fromJson(v)); });
// }
// if (json['enrollmentRequirements'] != null) {
// enrollmentRequirements = <EnrollmentRequirements>[];
// json['enrollmentRequirements'].forEach((v) { enrollmentRequirements!.add(new EnrollmentRequirements.fromJson(v)); });
// }
// if (json['exams'] != null) {
// exams = <Null>[];
// json['exams'].forEach((v) { exams!.add(new Null.fromJson(v)); });
// }
// if (json['instructor'] != null) {
// instructor = <Instructor>[];
// json['instructor'].forEach((v) { instructor!.add(new Instructor.fromJson(v)); });
// }
// if (json['meetings'] != null) {
// meetings = <Meetings>[];
// json['meetings'].forEach((v) { meetings!.add(new Meetings.fromJson(v)); });
// }
// if (json['reserveCaps'] != null) {
// reserveCaps = <Null>[];
// json['reserveCaps'].forEach((v) { reserveCaps!.add(new Null.fromJson(v)); });
// }
// if (json['courseRestrictions'] != null) {
// courseRestrictions = <Null>[];
// json['courseRestrictions'].forEach((v) { courseRestrictions!.add(new Null.fromJson(v)); });
// }
// if (json['sectionRestrictions'] != null) {
// sectionRestrictions = <Null>[];
// json['sectionRestrictions'].forEach((v) { sectionRestrictions!.add(new Null.fromJson(v)); });
// }
// if (json['disabledReasons'] != null) {
// disabledReasons = <Null>[];
// json['disabledReasons'].forEach((v) { disabledReasons!.add(new Null.fromJson(v)); });
// }
// if (json['flags'] != null) {
// flags = <Null>[];
// json['flags'].forEach((v) { flags!.add(new Null.fromJson(v)); });
// }
// if (json['linkedSectionRegNumbers'] != null) {
// linkedSectionRegNumbers = <Null>[];
// json['linkedSectionRegNumbers'].forEach((v) { linkedSectionRegNumbers!.add(new Null.fromJson(v)); });
// }
// if (json['textbooks'] != null) {
// textbooks = <Null>[];
// json['textbooks'].forEach((v) { textbooks!.add(new Null.fromJson(v)); });
// }
// registrationOptions = json['registrationOptions'] != null ? new RegistrationOptions.fromJson(json['registrationOptions']) : null;
// academicCareer = json['academicCareer'];
// academicCareerDescr = json['academicCareerDescr'];
// academicCareerDescrShort = json['academicCareerDescrShort'];
// academicGroup = json['academicGroup'];
// academicGroupDescr = json['academicGroupDescr'];
// campus = json['campus'];
// campusCode = json['campusCode'];
// campusDescription = json['campusDescription'];
// campusDescriptionRaw = json['campusDescriptionRaw'];
// campusShort = json['campusShort'];
// classAssociations = json['classAssociations'];
// component = json['component'];
// corequisites = json['corequisites'];
// course = json['course'];
// courseAttributes = json['courseAttributes'];
// credits = json['credits'];
// customData = json['customData'];
// department = json['department'];
// description = json['description'];
// enrollmentStatus = json['enrollmentStatus'];
// fees = json['fees'];
// freeFormTopics = json['freeFormTopics'];
// freeTextbookIndicated = json['freeTextbookIndicated'];
// lowCostTextbookIndicated = json['lowCostTextbookIndicated'];
// id = json['id'];
// instructionMode = json['instructionMode'];
// location = json['location'];
// lrnComTitle = json['lrnComTitle'];
// notes = json['notes'];
// notesShort = json['notesShort'];
// partsOfTerm = json['partsOfTerm'];
// prerequisites = json['prerequisites'];
// registrationNumber = json['registrationNumber'];
// registrationType = json['registrationType'];
// requirementDesignationDescr = json['requirementDesignationDescr'];
// seatsCapacity = json['seatsCapacity'];
// seatsFilled = json['seatsFilled'];
// sectionNumber = json['sectionNumber'];
// sectionStatus = json['sectionStatus'];
// subject = json['subject'];
// subjectId = json['subjectId'];
// textbook = json['textbook'];
// title = json['title'];
// topicTitle = json['topicTitle'];
// waitlist = json['waitlist'];
// waitlistOpen = json['waitlistOpen'];
// waitlistPosition = json['waitlistPosition'];
// }
//
// Map<String, dynamic> toJson() {
// final Map<String, dynamic> data = new Map<String, dynamic>();
// if (this.actions != null) {
// data['actions'] = this.actions!.map((v) => v.toJson()).toList();
// }
// if (this.additionalData != null) {
// data['additionalData'] = this.additionalData!.toJson();
// }
// if (this.sectionParameterValues != null) {
// data['sectionParameterValues'] = this.sectionParameterValues!.toJson();
// }
// if (this.sectionParameterOptions != null) {
// data['sectionParameterOptions'] = this.sectionParameterOptions!.toJson();
// }
// data['approval'] = this.approval;
// data['approvalCode'] = this.approvalCode;
// data['hasCorequisites'] = this.hasCorequisites;
// data['hasFreetextbook'] = this.hasFreetextbook;
// data['hasLowCostTextbook'] = this.hasLowCostTextbook;
// data['hasPrerequisites'] = this.hasPrerequisites;
// data['hasReserveCaps'] = this.hasReserveCaps;
// data['hasRestrictions'] = this.hasRestrictions;
// data['hasSectionCorequisites'] = this.hasSectionCorequisites;
// data['hasSectionNotes'] = this.hasSectionNotes;
// data['isExternal'] = this.isExternal;
// data['isHonors'] = this.isHonors;
// data['isOnline'] = this.isOnline;
// data['isWritingEnhanced'] = this.isWritingEnhanced;
// data['optional'] = this.optional;
// data['registrationClosed'] = this.registrationClosed;
// data['lastWaitListDate'] = this.lastWaitListDate;
// data['partOfTermBeginDate'] = this.partOfTermBeginDate;
// data['registrationEnds'] = this.registrationEnds;
// data['creditsMax'] = this.creditsMax;
// data['creditsMin'] = this.creditsMin;
// data['openSeats'] = this.openSeats;
// data['topicId'] = this.topicId;
// data['institutionCode'] = this.institutionCode;
// data['institution'] = this.institution;
// data['institutionAbbreviation'] = this.institutionAbbreviation;
// if (this.sectionAttributes != null) {
// data['sectionAttributes'] = this.sectionAttributes!.map((v) => v.toJson()).toList();
// }
// if (this.corequisiteSections != null) {
// data['corequisiteSections'] = this.corequisiteSections!.map((v) => v.toJson()).toList();
// }
// if (this.enrollmentRequirements != null) {
// data['enrollmentRequirements'] = this.enrollmentRequirements!.map((v) => v.toJson()).toList();
// }
// if (this.exams != null) {
// data['exams'] = this.exams!.map((v) => v.toJson()).toList();
// }
// if (this.instructor != null) {
// data['instructor'] = this.instructor!.map((v) => v.toJson()).toList();
// }
// if (this.meetings != null) {
// data['meetings'] = this.meetings!.map((v) => v.toJson()).toList();
// }
// if (this.reserveCaps != null) {
// data['reserveCaps'] = this.reserveCaps!.map((v) => v.toJson()).toList();
// }
// if (this.courseRestrictions != null) {
// data['courseRestrictions'] = this.courseRestrictions!.map((v) => v.toJson()).toList();
// }
// if (this.sectionRestrictions != null) {
// data['sectionRestrictions'] = this.sectionRestrictions!.map((v) => v.toJson()).toList();
// }
// if (this.disabledReasons != null) {
// data['disabledReasons'] = this.disabledReasons!.map((v) => v.toJson()).toList();
// }
// if (this.flags != null) {
// data['flags'] = this.flags!.map((v) => v.toJson()).toList();
// }
// if (this.linkedSectionRegNumbers != null) {
// data['linkedSectionRegNumbers'] = this.linkedSectionRegNumbers!.map((v) => v.toJson()).toList();
// }
// if (this.textbooks != null) {
// data['textbooks'] = this.textbooks!.map((v) => v.toJson()).toList();
// }
// if (this.registrationOptions != null) {
// data['registrationOptions'] = this.registrationOptions!.toJson();
// }
// data['academicCareer'] = this.academicCareer;
// data['academicCareerDescr'] = this.academicCareerDescr;
// data['academicCareerDescrShort'] = this.academicCareerDescrShort;
// data['academicGroup'] = this.academicGroup;
// data['academicGroupDescr'] = this.academicGroupDescr;
// data['campus'] = this.campus;
// data['campusCode'] = this.campusCode;
// data['campusDescription'] = this.campusDescription;
// data['campusDescriptionRaw'] = this.campusDescriptionRaw;
// data['campusShort'] = this.campusShort;
// data['classAssociations'] = this.classAssociations;
// data['component'] = this.component;
// data['corequisites'] = this.corequisites;
// data['course'] = this.course;
// data['courseAttributes'] = this.courseAttributes;
// data['credits'] = this.credits;
// data['customData'] = this.customData;
// data['department'] = this.department;
// data['description'] = this.description;
// data['enrollmentStatus'] = this.enrollmentStatus;
// data['fees'] = this.fees;
// data['freeFormTopics'] = this.freeFormTopics;
// data['freeTextbookIndicated'] = this.freeTextbookIndicated;
// data['lowCostTextbookIndicated'] = this.lowCostTextbookIndicated;
// data['id'] = this.id;
// data['instructionMode'] = this.instructionMode;
// data['location'] = this.location;
// data['lrnComTitle'] = this.lrnComTitle;
// data['notes'] = this.notes;
// data['notesShort'] = this.notesShort;
// data['partsOfTerm'] = this.partsOfTerm;
// data['prerequisites'] = this.prerequisites;
// data['registrationNumber'] = this.registrationNumber;
// data['registrationType'] = this.registrationType;
// data['requirementDesignationDescr'] = this.requirementDesignationDescr;
// data['seatsCapacity'] = this.seatsCapacity;
// data['seatsFilled'] = this.seatsFilled;
// data['sectionNumber'] = this.sectionNumber;
// data['sectionStatus'] = this.sectionStatus;
// data['subject'] = this.subject;
// data['subjectId'] = this.subjectId;
// data['textbook'] = this.textbook;
// data['title'] = this.title;
// data['topicTitle'] = this.topicTitle;
// data['waitlist'] = this.waitlist;
// data['waitlistOpen'] = this.waitlistOpen;
// data['waitlistPosition'] = this.waitlistPosition;
// return data;
// }
// }
