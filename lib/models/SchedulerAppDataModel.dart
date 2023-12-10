class SchedulerAppDataModel {
  final bool? currentScheduleRefetchRequired;
  final bool? isAdvisor;
  final String? updateAt;
  final List<dynamic>? academicPrograms;
  final List<dynamic>? breaks;
  final List<CourseStatuses>? courseStatuses;
  final List<dynamic>? messages;
  final List<Terms>? terms;
  final int? adminUserId;
  final int? registrationTimeout;
  final int? sendToCartTimeout;
  final int? studentAppUserId;
  final int? studentUserId;
  final int? validateCartTimeout;
  // final Settings? settings;
  final String? externalId;
  final String? selectedCareer;
  final String? selectedTermId;
  final String? studentName;
  final String? userId;
  // final UserContext? userContext;
  // final UserSettings? userSettings;

  SchedulerAppDataModel({
    this.currentScheduleRefetchRequired,
    this.isAdvisor,
    this.updateAt,
    this.academicPrograms,
    this.breaks,
    this.courseStatuses,
    this.messages,
    this.terms,
    this.adminUserId,
    this.registrationTimeout,
    this.sendToCartTimeout,
    this.studentAppUserId,
    this.studentUserId,
    this.validateCartTimeout,
    // this.settings,
    this.externalId,
    this.selectedCareer,
    this.selectedTermId,
    this.studentName,
    this.userId,
    // this.userContext,
    // this.userSettings,
  });

  SchedulerAppDataModel.fromJson(Map<String, dynamic> json)
      : currentScheduleRefetchRequired = json['currentScheduleRefetchRequired'] as bool?,
        isAdvisor = json['isAdvisor'] as bool?,
        updateAt = json['updateAt'] as String?,
        academicPrograms = json['academicPrograms'] as List?,
        breaks = json['breaks'] as List?,
        courseStatuses = (json['courseStatuses'] as List?)?.map((dynamic e) => CourseStatuses.fromJson(e as Map<String,dynamic>)).toList(),
        messages = json['messages'] as List?,
        terms = (json['terms'] as List?)?.map((dynamic e) => Terms.fromJson(e as Map<String,dynamic>)).toList(),
        adminUserId = json['adminUserId'] as int?,
        registrationTimeout = json['registrationTimeout'] as int?,
        sendToCartTimeout = json['sendToCartTimeout'] as int?,
        studentAppUserId = json['studentAppUserId'] as int?,
        studentUserId = json['studentUserId'] as int?,
        validateCartTimeout = json['validateCartTimeout'] as int?,
  // settings = (json['settings'] as Map<String,dynamic>?) != null ? Settings.fromJson(json['settings'] as Map<String,dynamic>) : null,
        externalId = json['externalId'] as String?,
        selectedCareer = json['selectedCareer'] as String?,
        selectedTermId = json['selectedTermId'] as String?,
        studentName = json['studentName'] as String?,
        userId = json['userId'] as String?;
  // userContext = (json['userContext'] as Map<String,dynamic>?) != null ? UserContext.fromJson(json['userContext'] as Map<String,dynamic>) : null,
  // userSettings = (json['userSettings'] as Map<String,dynamic>?) != null ? UserSettings.fromJson(json['userSettings'] as Map<String,dynamic>) : null;

  Map<String, dynamic> toJson() => {
    'currentScheduleRefetchRequired' : currentScheduleRefetchRequired,
    'isAdvisor' : isAdvisor,
    'updateAt' : updateAt,
    'academicPrograms' : academicPrograms,
    'breaks' : breaks,
    'courseStatuses' : courseStatuses?.map((e) => e.toJson()).toList(),
    'messages' : messages,
    'terms' : terms?.map((e) => e.toJson()).toList(),
    'adminUserId' : adminUserId,
    'registrationTimeout' : registrationTimeout,
    'sendToCartTimeout' : sendToCartTimeout,
    'studentAppUserId' : studentAppUserId,
    'studentUserId' : studentUserId,
    'validateCartTimeout' : validateCartTimeout,
    // 'settings' : settings?.toJson(),
    'externalId' : externalId,
    'selectedCareer' : selectedCareer,
    'selectedTermId' : selectedTermId,
    'studentName' : studentName,
    'userId' : userId,
    // 'userContext' : userContext?.toJson(),
    // 'userSettings' : userSettings?.toJson()
  };
}
class CourseStatuses {

  final String? id;
  final String? title;
  final bool? selected;
  final String? code;
  final bool? locked;

  CourseStatuses({
    this.id,
    this.title,
    this.selected,
    this.code,
    this.locked,
  });

  CourseStatuses.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        selected = json['selected'] as bool?,
        code = json['code'] as String?,
        locked = json['locked'] as bool?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'selected' : selected,
    'code' : code,
    'locked' : locked
  };
}
//
class Terms {
  final bool? altPinRequired;
  final List<dynamic>? studentCareers;
  final String? id;
  final String? title;
  final String? code;

  Terms({
    this.altPinRequired,
    this.studentCareers,
    this.id,
    this.title,
    this.code,
  });

  Terms.fromJson(Map<String, dynamic> json)
      : altPinRequired = json['altPinRequired'] as bool?,
        studentCareers = json['studentCareers'] as List?,
        id = json['id'] as String?,
        title = json['title'] as String?,
        code = json['code'] as String?;

  Map<String, dynamic> toJson() => {
    'altPinRequired' : altPinRequired,
    'studentCareers' : studentCareers,
    'id' : id,
    'title' : title,
    'code' : code
  };
}

// class Settings {
//   final AcademicPlanningSettings? academicPlanningSettings;
//   final ActionItemSettings? actionItemSettings;
//   final AdminSetting? adminSetting;
//   final Text? text;
//   final BreakSettings? breakSettings;
//   final BulkSettings? bulkSettings;
//   final CartSettings? cartSettings;
//   final CourseSettings? courseSettings;
//   final CourseSearchSettings? courseSearchSettings;
//   final DegreeMapSettings? degreeMapSettings;
//   final EmailSettings? emailSettings;
//   final FilterSettings? filterSettings;
//   final HomeSettings? homeSettings;
//   final HelpSettings? helpSettings;
//   final RegistrationSettings? registrationSettings;
//   final ScheduleSettings? scheduleSettings;
//   final SectionSettings? sectionSettings;
//   final SecuritySettings? securitySettings;
//   final SisSettings? sisSettings;
//   final SectionFieldText? sectionFieldText;
//   final StyleSettings? styleSettings;
//   final CourseDemandSettings? courseDemandSettings;
//   final List<CartSectionFieldSettings>? cartSectionFieldSettings;
//   final List<EditCartSectionFieldSettings>? editCartSectionFieldSettings;
//   final List<CourseSectionFieldSettings>? courseSectionFieldSettings;
//   final List<CurrentSectionFieldSettings>? currentSectionFieldSettings;
//   final List<EditCurrentSectionFieldSettings>? editCurrentSectionFieldSettings;
//   final List<LearningCommunitySectionFieldSettings>? learningCommunitySectionFieldSettings;
//   final List<ModalSectionFieldSettings>? modalSectionFieldSettings;
//   final List<ScheduleSectionFieldSettings>? scheduleSectionFieldSettings;
//   final List<CourseAddOptions>? courseAddOptions;
//   final List<String>? homeFilters;
//   final List<String>? entryFilters;
//   final List<SwapFieldSettings>? swapFieldSettings;
//
//   Settings({
//     this.academicPlanningSettings,
//     this.actionItemSettings,
//     this.adminSetting,
//     this.text,
//     this.breakSettings,
//     this.bulkSettings,
//     this.cartSettings,
//     this.courseSettings,
//     this.courseSearchSettings,
//     this.degreeMapSettings,
//     this.emailSettings,
//     this.filterSettings,
//     this.homeSettings,
//     this.helpSettings,
//     this.registrationSettings,
//     this.scheduleSettings,
//     this.sectionSettings,
//     this.securitySettings,
//     this.sisSettings,
//     this.sectionFieldText,
//     this.styleSettings,
//     this.courseDemandSettings,
//     this.cartSectionFieldSettings,
//     this.editCartSectionFieldSettings,
//     this.courseSectionFieldSettings,
//     this.currentSectionFieldSettings,
//     this.editCurrentSectionFieldSettings,
//     this.learningCommunitySectionFieldSettings,
//     this.modalSectionFieldSettings,
//     this.scheduleSectionFieldSettings,
//     this.courseAddOptions,
//     this.homeFilters,
//     this.entryFilters,
//     this.swapFieldSettings,
//   });
//
//   Settings.fromJson(Map<String, dynamic> json)
//       : academicPlanningSettings = (json['academicPlanningSettings'] as Map<String,dynamic>?) != null ? AcademicPlanningSettings.fromJson(json['academicPlanningSettings'] as Map<String,dynamic>) : null,
//         actionItemSettings = (json['actionItemSettings'] as Map<String,dynamic>?) != null ? ActionItemSettings.fromJson(json['actionItemSettings'] as Map<String,dynamic>) : null,
//         adminSetting = (json['adminSetting'] as Map<String,dynamic>?) != null ? AdminSetting.fromJson(json['adminSetting'] as Map<String,dynamic>) : null,
//         text = (json['text'] as Map<String,dynamic>?) != null ? Text.fromJson(json['text'] as Map<String,dynamic>) : null,
//         breakSettings = (json['breakSettings'] as Map<String,dynamic>?) != null ? BreakSettings.fromJson(json['breakSettings'] as Map<String,dynamic>) : null,
//         bulkSettings = (json['bulkSettings'] as Map<String,dynamic>?) != null ? BulkSettings.fromJson(json['bulkSettings'] as Map<String,dynamic>) : null,
//         cartSettings = (json['cartSettings'] as Map<String,dynamic>?) != null ? CartSettings.fromJson(json['cartSettings'] as Map<String,dynamic>) : null,
//         courseSettings = (json['courseSettings'] as Map<String,dynamic>?) != null ? CourseSettings.fromJson(json['courseSettings'] as Map<String,dynamic>) : null,
//         courseSearchSettings = (json['courseSearchSettings'] as Map<String,dynamic>?) != null ? CourseSearchSettings.fromJson(json['courseSearchSettings'] as Map<String,dynamic>) : null,
//         degreeMapSettings = (json['degreeMapSettings'] as Map<String,dynamic>?) != null ? DegreeMapSettings.fromJson(json['degreeMapSettings'] as Map<String,dynamic>) : null,
//         emailSettings = (json['emailSettings'] as Map<String,dynamic>?) != null ? EmailSettings.fromJson(json['emailSettings'] as Map<String,dynamic>) : null,
//         filterSettings = (json['filterSettings'] as Map<String,dynamic>?) != null ? FilterSettings.fromJson(json['filterSettings'] as Map<String,dynamic>) : null,
//         homeSettings = (json['homeSettings'] as Map<String,dynamic>?) != null ? HomeSettings.fromJson(json['homeSettings'] as Map<String,dynamic>) : null,
//         helpSettings = (json['helpSettings'] as Map<String,dynamic>?) != null ? HelpSettings.fromJson(json['helpSettings'] as Map<String,dynamic>) : null,
//         registrationSettings = (json['registrationSettings'] as Map<String,dynamic>?) != null ? RegistrationSettings.fromJson(json['registrationSettings'] as Map<String,dynamic>) : null,
//         scheduleSettings = (json['scheduleSettings'] as Map<String,dynamic>?) != null ? ScheduleSettings.fromJson(json['scheduleSettings'] as Map<String,dynamic>) : null,
//         sectionSettings = (json['sectionSettings'] as Map<String,dynamic>?) != null ? SectionSettings.fromJson(json['sectionSettings'] as Map<String,dynamic>) : null,
//         securitySettings = (json['securitySettings'] as Map<String,dynamic>?) != null ? SecuritySettings.fromJson(json['securitySettings'] as Map<String,dynamic>) : null,
//         sisSettings = (json['sisSettings'] as Map<String,dynamic>?) != null ? SisSettings.fromJson(json['sisSettings'] as Map<String,dynamic>) : null,
//         sectionFieldText = (json['sectionFieldText'] as Map<String,dynamic>?) != null ? SectionFieldText.fromJson(json['sectionFieldText'] as Map<String,dynamic>) : null,
//         styleSettings = (json['styleSettings'] as Map<String,dynamic>?) != null ? StyleSettings.fromJson(json['styleSettings'] as Map<String,dynamic>) : null,
//         courseDemandSettings = (json['courseDemandSettings'] as Map<String,dynamic>?) != null ? CourseDemandSettings.fromJson(json['courseDemandSettings'] as Map<String,dynamic>) : null,
//         cartSectionFieldSettings = (json['cartSectionFieldSettings'] as List?)?.map((dynamic e) => CartSectionFieldSettings.fromJson(e as Map<String,dynamic>)).toList(),
//         editCartSectionFieldSettings = (json['editCartSectionFieldSettings'] as List?)?.map((dynamic e) => EditCartSectionFieldSettings.fromJson(e as Map<String,dynamic>)).toList(),
//         courseSectionFieldSettings = (json['courseSectionFieldSettings'] as List?)?.map((dynamic e) => CourseSectionFieldSettings.fromJson(e as Map<String,dynamic>)).toList(),
//         currentSectionFieldSettings = (json['currentSectionFieldSettings'] as List?)?.map((dynamic e) => CurrentSectionFieldSettings.fromJson(e as Map<String,dynamic>)).toList(),
//         editCurrentSectionFieldSettings = (json['editCurrentSectionFieldSettings'] as List?)?.map((dynamic e) => EditCurrentSectionFieldSettings.fromJson(e as Map<String,dynamic>)).toList(),
//         learningCommunitySectionFieldSettings = (json['learningCommunitySectionFieldSettings'] as List?)?.map((dynamic e) => LearningCommunitySectionFieldSettings.fromJson(e as Map<String,dynamic>)).toList(),
//         modalSectionFieldSettings = (json['modalSectionFieldSettings'] as List?)?.map((dynamic e) => ModalSectionFieldSettings.fromJson(e as Map<String,dynamic>)).toList(),
//         scheduleSectionFieldSettings = (json['scheduleSectionFieldSettings'] as List?)?.map((dynamic e) => ScheduleSectionFieldSettings.fromJson(e as Map<String,dynamic>)).toList(),
//         courseAddOptions = (json['courseAddOptions'] as List?)?.map((dynamic e) => CourseAddOptions.fromJson(e as Map<String,dynamic>)).toList(),
//         homeFilters = (json['homeFilters'] as List?)?.map((dynamic e) => e as String).toList(),
//         entryFilters = (json['entryFilters'] as List?)?.map((dynamic e) => e as String).toList(),
//         swapFieldSettings = (json['swapFieldSettings'] as List?)?.map((dynamic e) => SwapFieldSettings.fromJson(e as Map<String,dynamic>)).toList();
//
//   Map<String, dynamic> toJson() => {
//     'academicPlanningSettings' : academicPlanningSettings?.toJson(),
//     'actionItemSettings' : actionItemSettings?.toJson(),
//     'adminSetting' : adminSetting?.toJson(),
//     'text' : text?.toJson(),
//     'breakSettings' : breakSettings?.toJson(),
//     'bulkSettings' : bulkSettings?.toJson(),
//     'cartSettings' : cartSettings?.toJson(),
//     'courseSettings' : courseSettings?.toJson(),
//     'courseSearchSettings' : courseSearchSettings?.toJson(),
//     'degreeMapSettings' : degreeMapSettings?.toJson(),
//     'emailSettings' : emailSettings?.toJson(),
//     'filterSettings' : filterSettings?.toJson(),
//     'homeSettings' : homeSettings?.toJson(),
//     'helpSettings' : helpSettings?.toJson(),
//     'registrationSettings' : registrationSettings?.toJson(),
//     'scheduleSettings' : scheduleSettings?.toJson(),
//     'sectionSettings' : sectionSettings?.toJson(),
//     'securitySettings' : securitySettings?.toJson(),
//     'sisSettings' : sisSettings?.toJson(),
//     'sectionFieldText' : sectionFieldText?.toJson(),
//     'styleSettings' : styleSettings?.toJson(),
//     'courseDemandSettings' : courseDemandSettings?.toJson(),
//     'cartSectionFieldSettings' : cartSectionFieldSettings?.map((e) => e.toJson()).toList(),
//     'editCartSectionFieldSettings' : editCartSectionFieldSettings?.map((e) => e.toJson()).toList(),
//     'courseSectionFieldSettings' : courseSectionFieldSettings?.map((e) => e.toJson()).toList(),
//     'currentSectionFieldSettings' : currentSectionFieldSettings?.map((e) => e.toJson()).toList(),
//     'editCurrentSectionFieldSettings' : editCurrentSectionFieldSettings?.map((e) => e.toJson()).toList(),
//     'learningCommunitySectionFieldSettings' : learningCommunitySectionFieldSettings?.map((e) => e.toJson()).toList(),
//     'modalSectionFieldSettings' : modalSectionFieldSettings?.map((e) => e.toJson()).toList(),
//     'scheduleSectionFieldSettings' : scheduleSectionFieldSettings?.map((e) => e.toJson()).toList(),
//     'courseAddOptions' : courseAddOptions?.map((e) => e.toJson()).toList(),
//     'homeFilters' : homeFilters,
//     'entryFilters' : entryFilters,
//     'swapFieldSettings' : swapFieldSettings?.map((e) => e.toJson()).toList()
//   };
// }

// class AcademicPlanningSettings {
//   final String? academicStructureEffectiveDatingOption;
//   final bool? enableAcademicPlanning;
//   final bool? enableAcademicPlanningConfiguration;
//   final bool? enableAdvisingLink;
//   final int? auditRefreshNudgeInterval;
//   final bool? disableDynamicEffectiveDating;
//   final bool? disableElevio;
//   final bool? disableElevioForStudents;
//   final bool? disableStudentLogin;
//   final String? effectiveDatingOption;
//   final bool? enableLmsCoursesView;
//   final bool? enableRequirementsTab;
//   final String? advisingUrl;
//   final List<dynamic>? excludedTerms;
//   final String? externalDegreeAuditUrl;
//   final bool? includeSchedulePrint;
//   final bool? includeScheduleCourse;
//   final bool? lockPlanBoardToHomeCampus;
//   final List<NewPlanTermFilters>? newPlanTermFilters;
//   final List<dynamic>? notUsedRequirementGroups;
//   final List<dynamic>? notUsedRequirements;
//   final int? pastTermYears;
//   final String? planDisclaimer;
//   final String? planningHelpLinkText;
//   final String? planningHelpLinkUrl;
//   final String? planningHelpVideosText;
//   final String? planningHelpVideosUrl;
//   final bool? requireTemplatePlanItems;
//   final String? studentHelpLinkText;
//   final String? studentHelpLinkUrl;
//   final String? courseDisplayFormat;
//   final List<String>? courseHistoryProgressSummaryOptions;
//   final String? templateCoursesEffectiveDatingOption;
//   final String? degreeRequirementsPanelConfiguration;
//   final List<TemplateDetailOptions>? templateDetailOptions;
//   final List<TermOptions>? termOptions;
//   final List<TermTypeIdentifiers>? termTypeIdentifiers;
//   final String? termTypeIdentifierMode;
//
//   AcademicPlanningSettings({
//     this.academicStructureEffectiveDatingOption,
//     this.enableAcademicPlanning,
//     this.enableAcademicPlanningConfiguration,
//     this.enableAdvisingLink,
//     this.auditRefreshNudgeInterval,
//     this.disableDynamicEffectiveDating,
//     this.disableElevio,
//     this.disableElevioForStudents,
//     this.disableStudentLogin,
//     this.effectiveDatingOption,
//     this.enableLmsCoursesView,
//     this.enableRequirementsTab,
//     this.advisingUrl,
//     this.excludedTerms,
//     this.externalDegreeAuditUrl,
//     this.includeSchedulePrint,
//     this.includeScheduleCourse,
//     this.lockPlanBoardToHomeCampus,
//     this.newPlanTermFilters,
//     this.notUsedRequirementGroups,
//     this.notUsedRequirements,
//     this.pastTermYears,
//     this.planDisclaimer,
//     this.planningHelpLinkText,
//     this.planningHelpLinkUrl,
//     this.planningHelpVideosText,
//     this.planningHelpVideosUrl,
//     this.requireTemplatePlanItems,
//     this.studentHelpLinkText,
//     this.studentHelpLinkUrl,
//     this.courseDisplayFormat,
//     this.courseHistoryProgressSummaryOptions,
//     this.templateCoursesEffectiveDatingOption,
//     this.degreeRequirementsPanelConfiguration,
//     this.templateDetailOptions,
//     this.termOptions,
//     this.termTypeIdentifiers,
//     this.termTypeIdentifierMode,
//   });
//
//   AcademicPlanningSettings.fromJson(Map<String, dynamic> json)
//       : academicStructureEffectiveDatingOption = json['academicStructureEffectiveDatingOption'] as String?,
//         enableAcademicPlanning = json['enableAcademicPlanning'] as bool?,
//         enableAcademicPlanningConfiguration = json['enableAcademicPlanningConfiguration'] as bool?,
//         enableAdvisingLink = json['enableAdvisingLink'] as bool?,
//         auditRefreshNudgeInterval = json['auditRefreshNudgeInterval'] as int?,
//         disableDynamicEffectiveDating = json['disableDynamicEffectiveDating'] as bool?,
//         disableElevio = json['disableElevio'] as bool?,
//         disableElevioForStudents = json['disableElevioForStudents'] as bool?,
//         disableStudentLogin = json['disableStudentLogin'] as bool?,
//         effectiveDatingOption = json['effectiveDatingOption'] as String?,
//         enableLmsCoursesView = json['enableLmsCoursesView'] as bool?,
//         enableRequirementsTab = json['enableRequirementsTab'] as bool?,
//         advisingUrl = json['advisingUrl'] as String?,
//         excludedTerms = json['excludedTerms'] as List?,
//         externalDegreeAuditUrl = json['externalDegreeAuditUrl'] as String?,
//         includeSchedulePrint = json['includeSchedulePrint'] as bool?,
//         includeScheduleCourse = json['includeScheduleCourse'] as bool?,
//         lockPlanBoardToHomeCampus = json['lockPlanBoardToHomeCampus'] as bool?,
//         newPlanTermFilters = (json['newPlanTermFilters'] as List?)?.map((dynamic e) => NewPlanTermFilters.fromJson(e as Map<String,dynamic>)).toList(),
//         notUsedRequirementGroups = json['notUsedRequirementGroups'] as List?,
//         notUsedRequirements = json['notUsedRequirements'] as List?,
//         pastTermYears = json['pastTermYears'] as int?,
//         planDisclaimer = json['planDisclaimer'] as String?,
//         planningHelpLinkText = json['planningHelpLinkText'] as String?,
//         planningHelpLinkUrl = json['planningHelpLinkUrl'] as String?,
//         planningHelpVideosText = json['planningHelpVideosText'] as String?,
//         planningHelpVideosUrl = json['planningHelpVideosUrl'] as String?,
//         requireTemplatePlanItems = json['requireTemplatePlanItems'] as bool?,
//         studentHelpLinkText = json['studentHelpLinkText'] as String?,
//         studentHelpLinkUrl = json['studentHelpLinkUrl'] as String?,
//         courseDisplayFormat = json['courseDisplayFormat'] as String?,
//         courseHistoryProgressSummaryOptions = (json['courseHistoryProgressSummaryOptions'] as List?)?.map((dynamic e) => e as String).toList(),
//         templateCoursesEffectiveDatingOption = json['templateCoursesEffectiveDatingOption'] as String?,
//         degreeRequirementsPanelConfiguration = json['degreeRequirementsPanelConfiguration'] as String?,
//         templateDetailOptions = (json['templateDetailOptions'] as List?)?.map((dynamic e) => TemplateDetailOptions.fromJson(e as Map<String,dynamic>)).toList(),
//         termOptions = (json['termOptions'] as List?)?.map((dynamic e) => TermOptions.fromJson(e as Map<String,dynamic>)).toList(),
//         termTypeIdentifiers = (json['termTypeIdentifiers'] as List?)?.map((dynamic e) => TermTypeIdentifiers.fromJson(e as Map<String,dynamic>)).toList(),
//         termTypeIdentifierMode = json['termTypeIdentifierMode'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'academicStructureEffectiveDatingOption' : academicStructureEffectiveDatingOption,
//     'enableAcademicPlanning' : enableAcademicPlanning,
//     'enableAcademicPlanningConfiguration' : enableAcademicPlanningConfiguration,
//     'enableAdvisingLink' : enableAdvisingLink,
//     'auditRefreshNudgeInterval' : auditRefreshNudgeInterval,
//     'disableDynamicEffectiveDating' : disableDynamicEffectiveDating,
//     'disableElevio' : disableElevio,
//     'disableElevioForStudents' : disableElevioForStudents,
//     'disableStudentLogin' : disableStudentLogin,
//     'effectiveDatingOption' : effectiveDatingOption,
//     'enableLmsCoursesView' : enableLmsCoursesView,
//     'enableRequirementsTab' : enableRequirementsTab,
//     'advisingUrl' : advisingUrl,
//     'excludedTerms' : excludedTerms,
//     'externalDegreeAuditUrl' : externalDegreeAuditUrl,
//     'includeSchedulePrint' : includeSchedulePrint,
//     'includeScheduleCourse' : includeScheduleCourse,
//     'lockPlanBoardToHomeCampus' : lockPlanBoardToHomeCampus,
//     'newPlanTermFilters' : newPlanTermFilters?.map((e) => e.toJson()).toList(),
//     'notUsedRequirementGroups' : notUsedRequirementGroups,
//     'notUsedRequirements' : notUsedRequirements,
//     'pastTermYears' : pastTermYears,
//     'planDisclaimer' : planDisclaimer,
//     'planningHelpLinkText' : planningHelpLinkText,
//     'planningHelpLinkUrl' : planningHelpLinkUrl,
//     'planningHelpVideosText' : planningHelpVideosText,
//     'planningHelpVideosUrl' : planningHelpVideosUrl,
//     'requireTemplatePlanItems' : requireTemplatePlanItems,
//     'studentHelpLinkText' : studentHelpLinkText,
//     'studentHelpLinkUrl' : studentHelpLinkUrl,
//     'courseDisplayFormat' : courseDisplayFormat,
//     'courseHistoryProgressSummaryOptions' : courseHistoryProgressSummaryOptions,
//     'templateCoursesEffectiveDatingOption' : templateCoursesEffectiveDatingOption,
//     'degreeRequirementsPanelConfiguration' : degreeRequirementsPanelConfiguration,
//     'templateDetailOptions' : templateDetailOptions?.map((e) => e.toJson()).toList(),
//     'termOptions' : termOptions?.map((e) => e.toJson()).toList(),
//     'termTypeIdentifiers' : termTypeIdentifiers?.map((e) => e.toJson()).toList(),
//     'termTypeIdentifierMode' : termTypeIdentifierMode
//   };
// }
//
// class NewPlanTermFilters {
//   final String? label;
//   final String? termType;
//
//   NewPlanTermFilters({
//     this.label,
//     this.termType,
//   });
//
//   NewPlanTermFilters.fromJson(Map<String, dynamic> json)
//       : label = json['label'] as String?,
//         termType = json['termType'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'label' : label,
//     'termType' : termType
//   };
// }
//
// class TemplateDetailOptions {
//   final String? key;
//   final String? table;
//   final String? title;
//
//   TemplateDetailOptions({
//     this.key,
//     this.table,
//     this.title,
//   });
//
//   TemplateDetailOptions.fromJson(Map<String, dynamic> json)
//       : key = json['key'] as String?,
//         table = json['table'] as String?,
//         title = json['title'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'key' : key,
//     'table' : table,
//     'title' : title
//   };
// }
//
// class TermOptions {
//   final String? type;
//   final String? value;
//
//   TermOptions({
//     this.type,
//     this.value,
//   });
//
//   TermOptions.fromJson(Map<String, dynamic> json)
//       : type = json['type'] as String?,
//         value = json['value'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'type' : type,
//     'value' : value
//   };
// }
//
// class TermTypeIdentifiers {
//   final String? termType;
//   final String? identifier;
//
//   TermTypeIdentifiers({
//     this.termType,
//     this.identifier,
//   });
//
//   TermTypeIdentifiers.fromJson(Map<String, dynamic> json)
//       : termType = json['termType'] as String?,
//         identifier = json['identifier'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'termType' : termType,
//     'identifier' : identifier
//   };
// }
//
// class ActionItemSettings {
//   final List<ActionItems>? actionItems;
//   final bool? hasDropActionItems;
//   final bool? hasHomeLoadActionItems;
//   final bool? hasRegistrationActionItems;
//   final bool? hasRegistrationEditActionItems;
//   final bool? hasSendToCartActionItems;
//   final bool? hasSwapActionItems;
//
//   ActionItemSettings({
//     this.actionItems,
//     this.hasDropActionItems,
//     this.hasHomeLoadActionItems,
//     this.hasRegistrationActionItems,
//     this.hasRegistrationEditActionItems,
//     this.hasSendToCartActionItems,
//     this.hasSwapActionItems,
//   });
//
//   ActionItemSettings.fromJson(Map<String, dynamic> json)
//       : actionItems = (json['actionItems'] as List?)?.map((dynamic e) => ActionItems.fromJson(e as Map<String,dynamic>)).toList(),
//         hasDropActionItems = json['hasDropActionItems'] as bool?,
//         hasHomeLoadActionItems = json['hasHomeLoadActionItems'] as bool?,
//         hasRegistrationActionItems = json['hasRegistrationActionItems'] as bool?,
//         hasRegistrationEditActionItems = json['hasRegistrationEditActionItems'] as bool?,
//         hasSendToCartActionItems = json['hasSendToCartActionItems'] as bool?,
//         hasSwapActionItems = json['hasSwapActionItems'] as bool?;
//
//   Map<String, dynamic> toJson() => {
//     'actionItems' : actionItems?.map((e) => e.toJson()).toList(),
//     'hasDropActionItems' : hasDropActionItems,
//     'hasHomeLoadActionItems' : hasHomeLoadActionItems,
//     'hasRegistrationActionItems' : hasRegistrationActionItems,
//     'hasRegistrationEditActionItems' : hasRegistrationEditActionItems,
//     'hasSendToCartActionItems' : hasSendToCartActionItems,
//     'hasSwapActionItems' : hasSwapActionItems
//   };
// }
//
// class ActionItems {
//   final String? contentType;
//   final String? outputType;
//   final List<Triggers>? triggers;
//   final List<dynamic>? conditions;
//   final String? confirmLabel;
//   final String? content;
//   final bool? openExternalUrlInNewWindow;
//   final String? id;
//   final String? outputValue;
//   final String? title;
//
//   ActionItems({
//     this.contentType,
//     this.outputType,
//     this.triggers,
//     this.conditions,
//     this.confirmLabel,
//     this.content,
//     this.openExternalUrlInNewWindow,
//     this.id,
//     this.outputValue,
//     this.title,
//   });
//
//   ActionItems.fromJson(Map<String, dynamic> json)
//       : contentType = json['contentType'] as String?,
//         outputType = json['outputType'] as String?,
//         triggers = (json['triggers'] as List?)?.map((dynamic e) => Triggers.fromJson(e as Map<String,dynamic>)).toList(),
//         conditions = json['conditions'] as List?,
//         confirmLabel = json['confirmLabel'] as String?,
//         content = json['content'] as String?,
//         openExternalUrlInNewWindow = json['openExternalUrlInNewWindow'] as bool?,
//         id = json['id'] as String?,
//         outputValue = json['outputValue'] as String?,
//         title = json['title'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'contentType' : contentType,
//     'outputType' : outputType,
//     'triggers' : triggers?.map((e) => e.toJson()).toList(),
//     'conditions' : conditions,
//     'confirmLabel' : confirmLabel,
//     'content' : content,
//     'openExternalUrlInNewWindow' : openExternalUrlInNewWindow,
//     'id' : id,
//     'outputValue' : outputValue,
//     'title' : title
//   };
// }
//
// class Triggers {
//   final String? type;
//   final bool? skippable;
//
//   Triggers({
//     this.type,
//     this.skippable,
//   });
//
//   Triggers.fromJson(Map<String, dynamic> json)
//       : type = json['type'] as String?,
//         skippable = json['skippable'] as bool?;
//
//   Map<String, dynamic> toJson() => {
//     'type' : type,
//     'skippable' : skippable
//   };
// }
//
// class AdminSetting {
//   final List<String>? features;
//   final bool? eoHideRegistrationNumber;
//   final bool? eoShowFillOverCapacity;
//   final bool? eoShowSeatsOpen;
//
//   AdminSetting({
//     this.features,
//     this.eoHideRegistrationNumber,
//     this.eoShowFillOverCapacity,
//     this.eoShowSeatsOpen,
//   });
//
//   AdminSetting.fromJson(Map<String, dynamic> json)
//       : features = (json['features'] as List?)?.map((dynamic e) => e as String).toList(),
//         eoHideRegistrationNumber = json['eoHideRegistrationNumber'] as bool?,
//         eoShowFillOverCapacity = json['eoShowFillOverCapacity'] as bool?,
//         eoShowSeatsOpen = json['eoShowSeatsOpen'] as bool?;
//
//   Map<String, dynamic> toJson() => {
//     'features' : features,
//     'eoHideRegistrationNumber' : eoHideRegistrationNumber,
//     'eoShowFillOverCapacity' : eoShowFillOverCapacity,
//     'eoShowSeatsOpen' : eoShowSeatsOpen
//   };
// }
//
// class Text {
//   final String? academicCareer;
//   final String? academicCareerPlural;
//   final String? academicGroup;
//   final String? academicGroupPlural;
//   final String? academicGroupDescr;
//   final String? academicProgram;
//   final String? actionItem;
//   final String? actionItemPlural;
//   final String? additionalAttribute;
//   final String? campus;
//   final String? campusPlural;
//   final String? courseAttribute;
//   final String? courseAttributeValue;
//   final String? course;
//   final String? courseInfoTooltip;
//   final String? courseNumber;
//   final String? coursePlural;
//   final String? courseStatus;
//   final String? currentSchedule;
//   final String? degreePlanLabel;
//   final String? degreePlanTermLabel;
//   final String? degreeworksPlanLabel;
//   final String? degreeworksPlanTermLabel;
//   final String? editCurrentScheduleButtonLabel;
//   final String? enroll;
//   final String? enrollment;
//   final String? favorites;
//   final String? favoritesPlural;
//   final String? freeTextbook;
//   final String? freeTextbookInstructions;
//   final String? gradingBasis;
//   final String? instructionMode;
//   final String? instructionModePlural;
//   final String? instructor;
//   final String? instructorPlural;
//   final String? institution;
//   final String? institutionAbbreviation;
//   final String? learningCommunity;
//   final String? learningCommunityPlural;
//   final String? learningCommunityProgram;
//   final String? location;
//   final String? locationPlural;
//   final String? meetingTba;
//   final String? myPlannerTermLabel;
//   final String? nonTopicSectionPluralLabel;
//   final String? partsOfTerm;
//   final String? partsOfTermPlural;
//   final String? permissionNumber;
//   final String? plannerTitle;
//   final String? portalTitle;
//   final String? register;
//   final String? registered;
//   final String? registrationNumberAbbr;
//   final String? requiredCourses;
//   final String? requirementDesignation;
//   final String? reserveCaps;
//   final String? schedule;
//   final String? schedulePlural;
//   final String? sectionPlural;
//   final String? session;
//   final String? sessionPlural;
//   final String? startDate;
//   final String? studentCareer;
//   final String? studyPath;
//   final String? subject;
//   final String? term;
//   final String? termPlural;
//   final String? topics;
//   final String? textbook;
//   final String? universityTitle;
//   final String? mondayAbbr;
//   final String? tuesdayAbbr;
//   final String? wednesdayAbbr;
//   final String? thursdayAbbr;
//   final String? fridayAbbr;
//   final String? saturdayAbbr;
//   final String? sundayAbbr;
//   final String? viewInBookstore;
//
//   Text({
//     this.academicCareer,
//     this.academicCareerPlural,
//     this.academicGroup,
//     this.academicGroupPlural,
//     this.academicGroupDescr,
//     this.academicProgram,
//     this.actionItem,
//     this.actionItemPlural,
//     this.additionalAttribute,
//     this.campus,
//     this.campusPlural,
//     this.courseAttribute,
//     this.courseAttributeValue,
//     this.course,
//     this.courseInfoTooltip,
//     this.courseNumber,
//     this.coursePlural,
//     this.courseStatus,
//     this.currentSchedule,
//     this.degreePlanLabel,
//     this.degreePlanTermLabel,
//     this.degreeworksPlanLabel,
//     this.degreeworksPlanTermLabel,
//     this.editCurrentScheduleButtonLabel,
//     this.enroll,
//     this.enrollment,
//     this.favorites,
//     this.favoritesPlural,
//     this.freeTextbook,
//     this.freeTextbookInstructions,
//     this.gradingBasis,
//     this.instructionMode,
//     this.instructionModePlural,
//     this.instructor,
//     this.instructorPlural,
//     this.institution,
//     this.institutionAbbreviation,
//     this.learningCommunity,
//     this.learningCommunityPlural,
//     this.learningCommunityProgram,
//     this.location,
//     this.locationPlural,
//     this.meetingTba,
//     this.myPlannerTermLabel,
//     this.nonTopicSectionPluralLabel,
//     this.partsOfTerm,
//     this.partsOfTermPlural,
//     this.permissionNumber,
//     this.plannerTitle,
//     this.portalTitle,
//     this.register,
//     this.registered,
//     this.registrationNumberAbbr,
//     this.requiredCourses,
//     this.requirementDesignation,
//     this.reserveCaps,
//     this.schedule,
//     this.schedulePlural,
//     this.sectionPlural,
//     this.session,
//     this.sessionPlural,
//     this.startDate,
//     this.studentCareer,
//     this.studyPath,
//     this.subject,
//     this.term,
//     this.termPlural,
//     this.topics,
//     this.textbook,
//     this.universityTitle,
//     this.mondayAbbr,
//     this.tuesdayAbbr,
//     this.wednesdayAbbr,
//     this.thursdayAbbr,
//     this.fridayAbbr,
//     this.saturdayAbbr,
//     this.sundayAbbr,
//     this.viewInBookstore,
//   });
//
//   Text.fromJson(Map<String, dynamic> json)
//       : academicCareer = json['academicCareer'] as String?,
//         academicCareerPlural = json['academicCareerPlural'] as String?,
//         academicGroup = json['academicGroup'] as String?,
//         academicGroupPlural = json['academicGroupPlural'] as String?,
//         academicGroupDescr = json['academicGroupDescr'] as String?,
//         academicProgram = json['academicProgram'] as String?,
//         actionItem = json['actionItem'] as String?,
//         actionItemPlural = json['actionItemPlural'] as String?,
//         additionalAttribute = json['additionalAttribute'] as String?,
//         campus = json['campus'] as String?,
//         campusPlural = json['campusPlural'] as String?,
//         courseAttribute = json['courseAttribute'] as String?,
//         courseAttributeValue = json['courseAttributeValue'] as String?,
//         course = json['course'] as String?,
//         courseInfoTooltip = json['courseInfoTooltip'] as String?,
//         courseNumber = json['courseNumber'] as String?,
//         coursePlural = json['coursePlural'] as String?,
//         courseStatus = json['courseStatus'] as String?,
//         currentSchedule = json['currentSchedule'] as String?,
//         degreePlanLabel = json['degreePlanLabel'] as String?,
//         degreePlanTermLabel = json['degreePlanTermLabel'] as String?,
//         degreeworksPlanLabel = json['degreeworksPlanLabel'] as String?,
//         degreeworksPlanTermLabel = json['degreeworksPlanTermLabel'] as String?,
//         editCurrentScheduleButtonLabel = json['editCurrentScheduleButtonLabel'] as String?,
//         enroll = json['enroll'] as String?,
//         enrollment = json['enrollment'] as String?,
//         favorites = json['favorites'] as String?,
//         favoritesPlural = json['favoritesPlural'] as String?,
//         freeTextbook = json['freeTextbook'] as String?,
//         freeTextbookInstructions = json['freeTextbookInstructions'] as String?,
//         gradingBasis = json['gradingBasis'] as String?,
//         instructionMode = json['instructionMode'] as String?,
//         instructionModePlural = json['instructionModePlural'] as String?,
//         instructor = json['instructor'] as String?,
//         instructorPlural = json['instructorPlural'] as String?,
//         institution = json['institution'] as String?,
//         institutionAbbreviation = json['institutionAbbreviation'] as String?,
//         learningCommunity = json['learningCommunity'] as String?,
//         learningCommunityPlural = json['learningCommunityPlural'] as String?,
//         learningCommunityProgram = json['learningCommunityProgram'] as String?,
//         location = json['location'] as String?,
//         locationPlural = json['locationPlural'] as String?,
//         meetingTba = json['meetingTba'] as String?,
//         myPlannerTermLabel = json['myPlannerTermLabel'] as String?,
//         nonTopicSectionPluralLabel = json['nonTopicSectionPluralLabel'] as String?,
//         partsOfTerm = json['partsOfTerm'] as String?,
//         partsOfTermPlural = json['partsOfTermPlural'] as String?,
//         permissionNumber = json['permissionNumber'] as String?,
//         plannerTitle = json['plannerTitle'] as String?,
//         portalTitle = json['portalTitle'] as String?,
//         register = json['register'] as String?,
//         registered = json['registered'] as String?,
//         registrationNumberAbbr = json['registrationNumberAbbr'] as String?,
//         requiredCourses = json['requiredCourses'] as String?,
//         requirementDesignation = json['requirementDesignation'] as String?,
//         reserveCaps = json['reserveCaps'] as String?,
//         schedule = json['schedule'] as String?,
//         schedulePlural = json['schedulePlural'] as String?,
//         sectionPlural = json['sectionPlural'] as String?,
//         session = json['session'] as String?,
//         sessionPlural = json['sessionPlural'] as String?,
//         startDate = json['startDate'] as String?,
//         studentCareer = json['studentCareer'] as String?,
//         studyPath = json['studyPath'] as String?,
//         subject = json['subject'] as String?,
//         term = json['term'] as String?,
//         termPlural = json['termPlural'] as String?,
//         topics = json['topics'] as String?,
//         textbook = json['textbook'] as String?,
//         universityTitle = json['universityTitle'] as String?,
//         mondayAbbr = json['mondayAbbr'] as String?,
//         tuesdayAbbr = json['tuesdayAbbr'] as String?,
//         wednesdayAbbr = json['wednesdayAbbr'] as String?,
//         thursdayAbbr = json['thursdayAbbr'] as String?,
//         fridayAbbr = json['fridayAbbr'] as String?,
//         saturdayAbbr = json['saturdayAbbr'] as String?,
//         sundayAbbr = json['sundayAbbr'] as String?,
//         viewInBookstore = json['viewInBookstore'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'academicCareer' : academicCareer,
//     'academicCareerPlural' : academicCareerPlural,
//     'academicGroup' : academicGroup,
//     'academicGroupPlural' : academicGroupPlural,
//     'academicGroupDescr' : academicGroupDescr,
//     'academicProgram' : academicProgram,
//     'actionItem' : actionItem,
//     'actionItemPlural' : actionItemPlural,
//     'additionalAttribute' : additionalAttribute,
//     'campus' : campus,
//     'campusPlural' : campusPlural,
//     'courseAttribute' : courseAttribute,
//     'courseAttributeValue' : courseAttributeValue,
//     'course' : course,
//     'courseInfoTooltip' : courseInfoTooltip,
//     'courseNumber' : courseNumber,
//     'coursePlural' : coursePlural,
//     'courseStatus' : courseStatus,
//     'currentSchedule' : currentSchedule,
//     'degreePlanLabel' : degreePlanLabel,
//     'degreePlanTermLabel' : degreePlanTermLabel,
//     'degreeworksPlanLabel' : degreeworksPlanLabel,
//     'degreeworksPlanTermLabel' : degreeworksPlanTermLabel,
//     'editCurrentScheduleButtonLabel' : editCurrentScheduleButtonLabel,
//     'enroll' : enroll,
//     'enrollment' : enrollment,
//     'favorites' : favorites,
//     'favoritesPlural' : favoritesPlural,
//     'freeTextbook' : freeTextbook,
//     'freeTextbookInstructions' : freeTextbookInstructions,
//     'gradingBasis' : gradingBasis,
//     'instructionMode' : instructionMode,
//     'instructionModePlural' : instructionModePlural,
//     'instructor' : instructor,
//     'instructorPlural' : instructorPlural,
//     'institution' : institution,
//     'institutionAbbreviation' : institutionAbbreviation,
//     'learningCommunity' : learningCommunity,
//     'learningCommunityPlural' : learningCommunityPlural,
//     'learningCommunityProgram' : learningCommunityProgram,
//     'location' : location,
//     'locationPlural' : locationPlural,
//     'meetingTba' : meetingTba,
//     'myPlannerTermLabel' : myPlannerTermLabel,
//     'nonTopicSectionPluralLabel' : nonTopicSectionPluralLabel,
//     'partsOfTerm' : partsOfTerm,
//     'partsOfTermPlural' : partsOfTermPlural,
//     'permissionNumber' : permissionNumber,
//     'plannerTitle' : plannerTitle,
//     'portalTitle' : portalTitle,
//     'register' : register,
//     'registered' : registered,
//     'registrationNumberAbbr' : registrationNumberAbbr,
//     'requiredCourses' : requiredCourses,
//     'requirementDesignation' : requirementDesignation,
//     'reserveCaps' : reserveCaps,
//     'schedule' : schedule,
//     'schedulePlural' : schedulePlural,
//     'sectionPlural' : sectionPlural,
//     'session' : session,
//     'sessionPlural' : sessionPlural,
//     'startDate' : startDate,
//     'studentCareer' : studentCareer,
//     'studyPath' : studyPath,
//     'subject' : subject,
//     'term' : term,
//     'termPlural' : termPlural,
//     'topics' : topics,
//     'textbook' : textbook,
//     'universityTitle' : universityTitle,
//     'mondayAbbr' : mondayAbbr,
//     'tuesdayAbbr' : tuesdayAbbr,
//     'wednesdayAbbr' : wednesdayAbbr,
//     'thursdayAbbr' : thursdayAbbr,
//     'fridayAbbr' : fridayAbbr,
//     'saturdayAbbr' : saturdayAbbr,
//     'sundayAbbr' : sundayAbbr,
//     'viewInBookstore' : viewInBookstore
//   };
// }
//
// class BreakSettings {
//   final bool? allowAllWeekdays;
//   final bool? allowWeekends;
//   final String? breakDescription;
//   final String? breakInstructions;
//   final int? startHour;
//   final int? startMinute;
//   final String? startMeridiem;
//   final int? endHour;
//   final int? endMinute;
//   final String? endMeridiem;
//
//   BreakSettings({
//     this.allowAllWeekdays,
//     this.allowWeekends,
//     this.breakDescription,
//     this.breakInstructions,
//     this.startHour,
//     this.startMinute,
//     this.startMeridiem,
//     this.endHour,
//     this.endMinute,
//     this.endMeridiem,
//   });
//
//   BreakSettings.fromJson(Map<String, dynamic> json)
//       : allowAllWeekdays = json['allowAllWeekdays'] as bool?,
//         allowWeekends = json['allowWeekends'] as bool?,
//         breakDescription = json['breakDescription'] as String?,
//         breakInstructions = json['breakInstructions'] as String?,
//         startHour = json['startHour'] as int?,
//         startMinute = json['startMinute'] as int?,
//         startMeridiem = json['startMeridiem'] as String?,
//         endHour = json['endHour'] as int?,
//         endMinute = json['endMinute'] as int?,
//         endMeridiem = json['endMeridiem'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'allowAllWeekdays' : allowAllWeekdays,
//     'allowWeekends' : allowWeekends,
//     'breakDescription' : breakDescription,
//     'breakInstructions' : breakInstructions,
//     'startHour' : startHour,
//     'startMinute' : startMinute,
//     'startMeridiem' : startMeridiem,
//     'endHour' : endHour,
//     'endMinute' : endMinute,
//     'endMeridiem' : endMeridiem
//   };
// }
//
// class BulkSettings {
//   final bool? showCreditRanges;
//
//   BulkSettings({
//     this.showCreditRanges,
//   });
//
//   BulkSettings.fromJson(Map<String, dynamic> json)
//       : showCreditRanges = json['showCreditRanges'] as bool?;
//
//   Map<String, dynamic> toJson() => {
//     'showCreditRanges' : showCreditRanges
//   };
// }
//
// class CartSettings {
//   final String? actionItemMode;
//   final bool? advancedRegistrationInstructions;
//   final bool? enableDirectSendToCart;
//   final bool? hasSessionActionsItems;
//   final bool? pinEnabled;
//   final bool? redirectAfterSendToCart;
//   final bool? showCareerSelection;
//   final bool? showMobileCartImage;
//   final bool? showRegistrationInputs;
//   final bool? showSendToCart;
//   final bool? showSuccessCloseButton;
//   final bool? showValidateCart;
//   final bool? showWaitListModal;
//   final bool? useStudentSelectedCareer;
//   final int? registrationCreditStep;
//   final int? maxPinLength;
//   final List<ActionItemTriggers>? actionItemTriggers;
//   final List<String>? registrationInputs;
//   final List<String>? errorMessages;
//   final List<String>? successInstructions;
//   final String? actionUrl;
//   final String? cartConfirmPrompt;
//   final String? cartEntryCancelText;
//   final String? cartEntryContinueText;
//   final String? cartLabel;
//   final String? cartMessage;
//   final String? cartSelectionWarning;
//   final String? currentScheduleSelectionWarning;
//   final String? enrollmentRequestLabel;
//   final String? pinHeadline;
//   final String? pinHelpPrompt;
//   final String? quickEnrollLabel;
//   final String? registrationInstrLabel;
//   final String? registrationInstructions;
//   final String? registrationProcessingLabel;
//   final String? returnToSisText;
//   final String? sectionResultsFormat;
//   final String? sendToCartAdvisorRedirectUrl;
//   final String? stagedCartLabel;
//   final String? successAlertMessage;
//   final String? unselectedCurrentSchedulePrompt;
//   final String? validateCartErrorTitle;
//   final String? validateCartSuccessDisclaimer;
//   final String? validateCartSuccessTitle;
//   final String? validateCartText;
//   final String? waitListActionCode;
//   final String? registrationUnavailableTitle;
//   final String? registrationUnavailableBody;
//   final List<dynamic>? disableRegistrationOptions;
//
//   CartSettings({
//     this.actionItemMode,
//     this.advancedRegistrationInstructions,
//     this.enableDirectSendToCart,
//     this.hasSessionActionsItems,
//     this.pinEnabled,
//     this.redirectAfterSendToCart,
//     this.showCareerSelection,
//     this.showMobileCartImage,
//     this.showRegistrationInputs,
//     this.showSendToCart,
//     this.showSuccessCloseButton,
//     this.showValidateCart,
//     this.showWaitListModal,
//     this.useStudentSelectedCareer,
//     this.registrationCreditStep,
//     this.maxPinLength,
//     this.actionItemTriggers,
//     this.registrationInputs,
//     this.errorMessages,
//     this.successInstructions,
//     this.actionUrl,
//     this.cartConfirmPrompt,
//     this.cartEntryCancelText,
//     this.cartEntryContinueText,
//     this.cartLabel,
//     this.cartMessage,
//     this.cartSelectionWarning,
//     this.currentScheduleSelectionWarning,
//     this.enrollmentRequestLabel,
//     this.pinHeadline,
//     this.pinHelpPrompt,
//     this.quickEnrollLabel,
//     this.registrationInstrLabel,
//     this.registrationInstructions,
//     this.registrationProcessingLabel,
//     this.returnToSisText,
//     this.sectionResultsFormat,
//     this.sendToCartAdvisorRedirectUrl,
//     this.stagedCartLabel,
//     this.successAlertMessage,
//     this.unselectedCurrentSchedulePrompt,
//     this.validateCartErrorTitle,
//     this.validateCartSuccessDisclaimer,
//     this.validateCartSuccessTitle,
//     this.validateCartText,
//     this.waitListActionCode,
//     this.registrationUnavailableTitle,
//     this.registrationUnavailableBody,
//     this.disableRegistrationOptions,
//   });
//
//   CartSettings.fromJson(Map<String, dynamic> json)
//       : actionItemMode = json['actionItemMode'] as String?,
//         advancedRegistrationInstructions = json['advancedRegistrationInstructions'] as bool?,
//         enableDirectSendToCart = json['enableDirectSendToCart'] as bool?,
//         hasSessionActionsItems = json['hasSessionActionsItems'] as bool?,
//         pinEnabled = json['pinEnabled'] as bool?,
//         redirectAfterSendToCart = json['redirectAfterSendToCart'] as bool?,
//         showCareerSelection = json['showCareerSelection'] as bool?,
//         showMobileCartImage = json['showMobileCartImage'] as bool?,
//         showRegistrationInputs = json['showRegistrationInputs'] as bool?,
//         showSendToCart = json['showSendToCart'] as bool?,
//         showSuccessCloseButton = json['showSuccessCloseButton'] as bool?,
//         showValidateCart = json['showValidateCart'] as bool?,
//         showWaitListModal = json['showWaitListModal'] as bool?,
//         useStudentSelectedCareer = json['useStudentSelectedCareer'] as bool?,
//         registrationCreditStep = json['registrationCreditStep'] as int?,
//         maxPinLength = json['maxPinLength'] as int?,
//         actionItemTriggers = (json['actionItemTriggers'] as List?)?.map((dynamic e) => ActionItemTriggers.fromJson(e as Map<String,dynamic>)).toList(),
//         registrationInputs = (json['registrationInputs'] as List?)?.map((dynamic e) => e as String).toList(),
//         errorMessages = (json['errorMessages'] as List?)?.map((dynamic e) => e as String).toList(),
//         successInstructions = (json['successInstructions'] as List?)?.map((dynamic e) => e as String).toList(),
//         actionUrl = json['actionUrl'] as String?,
//         cartConfirmPrompt = json['cartConfirmPrompt'] as String?,
//         cartEntryCancelText = json['cartEntryCancelText'] as String?,
//         cartEntryContinueText = json['cartEntryContinueText'] as String?,
//         cartLabel = json['cartLabel'] as String?,
//         cartMessage = json['cartMessage'] as String?,
//         cartSelectionWarning = json['cartSelectionWarning'] as String?,
//         currentScheduleSelectionWarning = json['currentScheduleSelectionWarning'] as String?,
//         enrollmentRequestLabel = json['enrollmentRequestLabel'] as String?,
//         pinHeadline = json['pinHeadline'] as String?,
//         pinHelpPrompt = json['pinHelpPrompt'] as String?,
//         quickEnrollLabel = json['quickEnrollLabel'] as String?,
//         registrationInstrLabel = json['registrationInstrLabel'] as String?,
//         registrationInstructions = json['registrationInstructions'] as String?,
//         registrationProcessingLabel = json['registrationProcessingLabel'] as String?,
//         returnToSisText = json['returnToSisText'] as String?,
//         sectionResultsFormat = json['sectionResultsFormat'] as String?,
//         sendToCartAdvisorRedirectUrl = json['sendToCartAdvisorRedirectUrl'] as String?,
//         stagedCartLabel = json['stagedCartLabel'] as String?,
//         successAlertMessage = json['successAlertMessage'] as String?,
//         unselectedCurrentSchedulePrompt = json['unselectedCurrentSchedulePrompt'] as String?,
//         validateCartErrorTitle = json['validateCartErrorTitle'] as String?,
//         validateCartSuccessDisclaimer = json['validateCartSuccessDisclaimer'] as String?,
//         validateCartSuccessTitle = json['validateCartSuccessTitle'] as String?,
//         validateCartText = json['validateCartText'] as String?,
//         waitListActionCode = json['waitListActionCode'] as String?,
//         registrationUnavailableTitle = json['registrationUnavailableTitle'] as String?,
//         registrationUnavailableBody = json['registrationUnavailableBody'] as String?,
//         disableRegistrationOptions = json['disableRegistrationOptions'] as List?;
//
//   Map<String, dynamic> toJson() => {
//     'actionItemMode' : actionItemMode,
//     'advancedRegistrationInstructions' : advancedRegistrationInstructions,
//     'enableDirectSendToCart' : enableDirectSendToCart,
//     'hasSessionActionsItems' : hasSessionActionsItems,
//     'pinEnabled' : pinEnabled,
//     'redirectAfterSendToCart' : redirectAfterSendToCart,
//     'showCareerSelection' : showCareerSelection,
//     'showMobileCartImage' : showMobileCartImage,
//     'showRegistrationInputs' : showRegistrationInputs,
//     'showSendToCart' : showSendToCart,
//     'showSuccessCloseButton' : showSuccessCloseButton,
//     'showValidateCart' : showValidateCart,
//     'showWaitListModal' : showWaitListModal,
//     'useStudentSelectedCareer' : useStudentSelectedCareer,
//     'registrationCreditStep' : registrationCreditStep,
//     'maxPinLength' : maxPinLength,
//     'actionItemTriggers' : actionItemTriggers?.map((e) => e.toJson()).toList(),
//     'registrationInputs' : registrationInputs,
//     'errorMessages' : errorMessages,
//     'successInstructions' : successInstructions,
//     'actionUrl' : actionUrl,
//     'cartConfirmPrompt' : cartConfirmPrompt,
//     'cartEntryCancelText' : cartEntryCancelText,
//     'cartEntryContinueText' : cartEntryContinueText,
//     'cartLabel' : cartLabel,
//     'cartMessage' : cartMessage,
//     'cartSelectionWarning' : cartSelectionWarning,
//     'currentScheduleSelectionWarning' : currentScheduleSelectionWarning,
//     'enrollmentRequestLabel' : enrollmentRequestLabel,
//     'pinHeadline' : pinHeadline,
//     'pinHelpPrompt' : pinHelpPrompt,
//     'quickEnrollLabel' : quickEnrollLabel,
//     'registrationInstrLabel' : registrationInstrLabel,
//     'registrationInstructions' : registrationInstructions,
//     'registrationProcessingLabel' : registrationProcessingLabel,
//     'returnToSisText' : returnToSisText,
//     'sectionResultsFormat' : sectionResultsFormat,
//     'sendToCartAdvisorRedirectUrl' : sendToCartAdvisorRedirectUrl,
//     'stagedCartLabel' : stagedCartLabel,
//     'successAlertMessage' : successAlertMessage,
//     'unselectedCurrentSchedulePrompt' : unselectedCurrentSchedulePrompt,
//     'validateCartErrorTitle' : validateCartErrorTitle,
//     'validateCartSuccessDisclaimer' : validateCartSuccessDisclaimer,
//     'validateCartSuccessTitle' : validateCartSuccessTitle,
//     'validateCartText' : validateCartText,
//     'waitListActionCode' : waitListActionCode,
//     'registrationUnavailableTitle' : registrationUnavailableTitle,
//     'registrationUnavailableBody' : registrationUnavailableBody,
//     'disableRegistrationOptions' : disableRegistrationOptions
//   };
// }
//
// class ActionItemTriggers {
//   final String? key;
//   final bool? skippable;
//
//   ActionItemTriggers({
//     this.key,
//     this.skippable,
//   });
//
//   ActionItemTriggers.fromJson(Map<String, dynamic> json)
//       : key = json['key'] as String?,
//         skippable = json['skippable'] as bool?;
//
//   Map<String, dynamic> toJson() => {
//     'key' : key,
//     'skippable' : skippable
//   };
// }
//
// class CourseSettings {
//   final String? additionalAttributeFormat;
//   final String? attributeMode;
//   final bool? alwaysShowDesiredCourseTabs;
//   final bool? attributeSearchDefaultAllSubjects;
//   final bool? attrUseSchedulePrint;
//   final bool? attrUseShowInClassSearchAttr;
//   final bool? attrUseShowInClassSearchValue;
//   final bool? autoImportDegreePlan;
//   final bool? autoImportAndSyncDegreePlan;
//   final List<String>? autoImportDegreePlanSources;
//   final bool? allowCurrentScheduleSelection;
//   final bool? disableCourseDeletion;
//   final bool? displayCustomDescription;
//   final bool? displayFreeTextbookIcon;
//   final bool? displayLowCostTextbookIcon;
//   final bool? enableFilterRules;
//   final bool? hideDisabledTab;
//   final bool? lockDegreeWorksByTerm;
//   final bool? showAddAllBySubject;
//   final bool? showDegreePlanAddNudge;
//   final String? degreePlanNameMacro;
//   final bool? showEditCoursesLink;
//   final bool? showInformation;
//   final bool? showLearningCommunityCalendar;
//   final bool? topicsEnabled;
//   final String? catalogOption;
//   final Text? text;
//   final String? learningCommunityMode;
//   final List<String>? advancedFilterOptions;
//   final List<dynamic>? courseFields;
//   final List<String>? desiredCourseFields;
//   final List<Flags>? flags;
//   final List<dynamic>? autoImportDegreePlanStudentAttributes;
//   final List<dynamic>? onlyShowDegreePlanStudentAttributeCodes;
//   final List<dynamic>? additionalAttributes;
//   final String? addBackLabel;
//   final String? addCourseLabel;
//   final String? allOptionsDisabledText;
//   final String? attributeValueFormat;
//   final String? courseInfoHeaderFormat;
//   final String? degreePlanNudgeFormat;
//   final String? degreePlanWarning;
//   final String? degreeWorksLabel;
//   final String? degreeWorksWarning;
//   final String? descrUnavailableText;
//   final String? disabledLabel;
//   final String? emptyInstructions;
//   final String? enabledLabel;
//   final String? lockHoverText;
//   final String? optionsInstructions;
//   final String? optionsLabel;
//   final String? reserveCapacitySeatFormat;
//   final String? reserveCapacitySeatsDescriptionFormat;
//   final String? reserveCapacityWaitlistSeatFormat;
//   final String? reserveCapacityWaitlistSeatsDescriptionFormat;
//
//   CourseSettings({
//     this.additionalAttributeFormat,
//     this.attributeMode,
//     this.alwaysShowDesiredCourseTabs,
//     this.attributeSearchDefaultAllSubjects,
//     this.attrUseSchedulePrint,
//     this.attrUseShowInClassSearchAttr,
//     this.attrUseShowInClassSearchValue,
//     this.autoImportDegreePlan,
//     this.autoImportAndSyncDegreePlan,
//     this.autoImportDegreePlanSources,
//     this.allowCurrentScheduleSelection,
//     this.disableCourseDeletion,
//     this.displayCustomDescription,
//     this.displayFreeTextbookIcon,
//     this.displayLowCostTextbookIcon,
//     this.enableFilterRules,
//     this.hideDisabledTab,
//     this.lockDegreeWorksByTerm,
//     this.showAddAllBySubject,
//     this.showDegreePlanAddNudge,
//     this.degreePlanNameMacro,
//     this.showEditCoursesLink,
//     this.showInformation,
//     this.showLearningCommunityCalendar,
//     this.topicsEnabled,
//     this.catalogOption,
//     this.text,
//     this.learningCommunityMode,
//     this.advancedFilterOptions,
//     this.courseFields,
//     this.desiredCourseFields,
//     this.flags,
//     this.autoImportDegreePlanStudentAttributes,
//     this.onlyShowDegreePlanStudentAttributeCodes,
//     this.additionalAttributes,
//     this.addBackLabel,
//     this.addCourseLabel,
//     this.allOptionsDisabledText,
//     this.attributeValueFormat,
//     this.courseInfoHeaderFormat,
//     this.degreePlanNudgeFormat,
//     this.degreePlanWarning,
//     this.degreeWorksLabel,
//     this.degreeWorksWarning,
//     this.descrUnavailableText,
//     this.disabledLabel,
//     this.emptyInstructions,
//     this.enabledLabel,
//     this.lockHoverText,
//     this.optionsInstructions,
//     this.optionsLabel,
//     this.reserveCapacitySeatFormat,
//     this.reserveCapacitySeatsDescriptionFormat,
//     this.reserveCapacityWaitlistSeatFormat,
//     this.reserveCapacityWaitlistSeatsDescriptionFormat,
//   });
//
//   CourseSettings.fromJson(Map<String, dynamic> json)
//       : additionalAttributeFormat = json['additionalAttributeFormat'] as String?,
//         attributeMode = json['attributeMode'] as String?,
//         alwaysShowDesiredCourseTabs = json['alwaysShowDesiredCourseTabs'] as bool?,
//         attributeSearchDefaultAllSubjects = json['attributeSearchDefaultAllSubjects'] as bool?,
//         attrUseSchedulePrint = json['attrUseSchedulePrint'] as bool?,
//         attrUseShowInClassSearchAttr = json['attrUseShowInClassSearchAttr'] as bool?,
//         attrUseShowInClassSearchValue = json['attrUseShowInClassSearchValue'] as bool?,
//         autoImportDegreePlan = json['autoImportDegreePlan'] as bool?,
//         autoImportAndSyncDegreePlan = json['autoImportAndSyncDegreePlan'] as bool?,
//         autoImportDegreePlanSources = (json['autoImportDegreePlanSources'] as List?)?.map((dynamic e) => e as String).toList(),
//         allowCurrentScheduleSelection = json['allowCurrentScheduleSelection'] as bool?,
//         disableCourseDeletion = json['disableCourseDeletion'] as bool?,
//         displayCustomDescription = json['displayCustomDescription'] as bool?,
//         displayFreeTextbookIcon = json['displayFreeTextbookIcon'] as bool?,
//         displayLowCostTextbookIcon = json['displayLowCostTextbookIcon'] as bool?,
//         enableFilterRules = json['enableFilterRules'] as bool?,
//         hideDisabledTab = json['hideDisabledTab'] as bool?,
//         lockDegreeWorksByTerm = json['lockDegreeWorksByTerm'] as bool?,
//         showAddAllBySubject = json['showAddAllBySubject'] as bool?,
//         showDegreePlanAddNudge = json['showDegreePlanAddNudge'] as bool?,
//         degreePlanNameMacro = json['degreePlanNameMacro'] as String?,
//         showEditCoursesLink = json['showEditCoursesLink'] as bool?,
//         showInformation = json['showInformation'] as bool?,
//         showLearningCommunityCalendar = json['showLearningCommunityCalendar'] as bool?,
//         topicsEnabled = json['topicsEnabled'] as bool?,
//         catalogOption = json['catalogOption'] as String?,
//         text = (json['text'] as Map<String,dynamic>?) != null ? Text.fromJson(json['text'] as Map<String,dynamic>) : null,
//         learningCommunityMode = json['learningCommunityMode'] as String?,
//         advancedFilterOptions = (json['advancedFilterOptions'] as List?)?.map((dynamic e) => e as String).toList(),
//         courseFields = json['courseFields'] as List?,
//         desiredCourseFields = (json['desiredCourseFields'] as List?)?.map((dynamic e) => e as String).toList(),
//         flags = (json['flags'] as List?)?.map((dynamic e) => Flags.fromJson(e as Map<String,dynamic>)).toList(),
//         autoImportDegreePlanStudentAttributes = json['autoImportDegreePlanStudentAttributes'] as List?,
//         onlyShowDegreePlanStudentAttributeCodes = json['onlyShowDegreePlanStudentAttributeCodes'] as List?,
//         additionalAttributes = json['additionalAttributes'] as List?,
//         addBackLabel = json['addBackLabel'] as String?,
//         addCourseLabel = json['addCourseLabel'] as String?,
//         allOptionsDisabledText = json['allOptionsDisabledText'] as String?,
//         attributeValueFormat = json['attributeValueFormat'] as String?,
//         courseInfoHeaderFormat = json['courseInfoHeaderFormat'] as String?,
//         degreePlanNudgeFormat = json['degreePlanNudgeFormat'] as String?,
//         degreePlanWarning = json['degreePlanWarning'] as String?,
//         degreeWorksLabel = json['degreeWorksLabel'] as String?,
//         degreeWorksWarning = json['degreeWorksWarning'] as String?,
//         descrUnavailableText = json['descrUnavailableText'] as String?,
//         disabledLabel = json['disabledLabel'] as String?,
//         emptyInstructions = json['emptyInstructions'] as String?,
//         enabledLabel = json['enabledLabel'] as String?,
//         lockHoverText = json['lockHoverText'] as String?,
//         optionsInstructions = json['optionsInstructions'] as String?,
//         optionsLabel = json['optionsLabel'] as String?,
//         reserveCapacitySeatFormat = json['reserveCapacitySeatFormat'] as String?,
//         reserveCapacitySeatsDescriptionFormat = json['reserveCapacitySeatsDescriptionFormat'] as String?,
//         reserveCapacityWaitlistSeatFormat = json['reserveCapacityWaitlistSeatFormat'] as String?,
//         reserveCapacityWaitlistSeatsDescriptionFormat = json['reserveCapacityWaitlistSeatsDescriptionFormat'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'additionalAttributeFormat' : additionalAttributeFormat,
//     'attributeMode' : attributeMode,
//     'alwaysShowDesiredCourseTabs' : alwaysShowDesiredCourseTabs,
//     'attributeSearchDefaultAllSubjects' : attributeSearchDefaultAllSubjects,
//     'attrUseSchedulePrint' : attrUseSchedulePrint,
//     'attrUseShowInClassSearchAttr' : attrUseShowInClassSearchAttr,
//     'attrUseShowInClassSearchValue' : attrUseShowInClassSearchValue,
//     'autoImportDegreePlan' : autoImportDegreePlan,
//     'autoImportAndSyncDegreePlan' : autoImportAndSyncDegreePlan,
//     'autoImportDegreePlanSources' : autoImportDegreePlanSources,
//     'allowCurrentScheduleSelection' : allowCurrentScheduleSelection,
//     'disableCourseDeletion' : disableCourseDeletion,
//     'displayCustomDescription' : displayCustomDescription,
//     'displayFreeTextbookIcon' : displayFreeTextbookIcon,
//     'displayLowCostTextbookIcon' : displayLowCostTextbookIcon,
//     'enableFilterRules' : enableFilterRules,
//     'hideDisabledTab' : hideDisabledTab,
//     'lockDegreeWorksByTerm' : lockDegreeWorksByTerm,
//     'showAddAllBySubject' : showAddAllBySubject,
//     'showDegreePlanAddNudge' : showDegreePlanAddNudge,
//     'degreePlanNameMacro' : degreePlanNameMacro,
//     'showEditCoursesLink' : showEditCoursesLink,
//     'showInformation' : showInformation,
//     'showLearningCommunityCalendar' : showLearningCommunityCalendar,
//     'topicsEnabled' : topicsEnabled,
//     'catalogOption' : catalogOption,
//     'text' : text?.toJson(),
//     'learningCommunityMode' : learningCommunityMode,
//     'advancedFilterOptions' : advancedFilterOptions,
//     'courseFields' : courseFields,
//     'desiredCourseFields' : desiredCourseFields,
//     'flags' : flags?.map((e) => e.toJson()).toList(),
//     'autoImportDegreePlanStudentAttributes' : autoImportDegreePlanStudentAttributes,
//     'onlyShowDegreePlanStudentAttributeCodes' : onlyShowDegreePlanStudentAttributeCodes,
//     'additionalAttributes' : additionalAttributes,
//     'addBackLabel' : addBackLabel,
//     'addCourseLabel' : addCourseLabel,
//     'allOptionsDisabledText' : allOptionsDisabledText,
//     'attributeValueFormat' : attributeValueFormat,
//     'courseInfoHeaderFormat' : courseInfoHeaderFormat,
//     'degreePlanNudgeFormat' : degreePlanNudgeFormat,
//     'degreePlanWarning' : degreePlanWarning,
//     'degreeWorksLabel' : degreeWorksLabel,
//     'degreeWorksWarning' : degreeWorksWarning,
//     'descrUnavailableText' : descrUnavailableText,
//     'disabledLabel' : disabledLabel,
//     'emptyInstructions' : emptyInstructions,
//     'enabledLabel' : enabledLabel,
//     'lockHoverText' : lockHoverText,
//     'optionsInstructions' : optionsInstructions,
//     'optionsLabel' : optionsLabel,
//     'reserveCapacitySeatFormat' : reserveCapacitySeatFormat,
//     'reserveCapacitySeatsDescriptionFormat' : reserveCapacitySeatsDescriptionFormat,
//     'reserveCapacityWaitlistSeatFormat' : reserveCapacityWaitlistSeatFormat,
//     'reserveCapacityWaitlistSeatsDescriptionFormat' : reserveCapacityWaitlistSeatsDescriptionFormat
//   };
// }
//
// class SchedulerText {
//   final String? title;
//   final String? description;
//   final String? notes;
//
//   SchedulerText({
//     this.title,
//     this.description,
//     this.notes,
//   });
//
//   SchedulerText.fromJson(Map<String, dynamic> json)
//       : title = json['title'] as String?,
//         description = json['description'] as String?,
//         notes = json['notes'] as String?;
//
//   Map<String, dynamic> toJson() => {
//     'title' : title,
//     'description' : description,
//     'notes' : notes
//   };
// }
//
// class Flags {
//   final String? key;
//   final String? text;
//   final String? sectionText;
//   final String? tooltip;
//   final String? sectionTooltip;
//   final bool? showOnSection;
//   final bool? hideOnCourse;
//
//   Flags({
//     this.key,
//     this.text,
//     this.sectionText,
//     this.tooltip,
//     this.sectionTooltip,
//     this.showOnSection,
//     this.hideOnCourse,
//   });
//
//   Flags.fromJson(Map<String, dynamic> json)
//       : key = json['key'] as String?,
//         text = json['text'] as String?,
//         sectionText = json['sectionText'] as String?,
//         tooltip = json['tooltip'] as String?,
//         sectionTooltip = json['sectionTooltip'] as String?,
//         showOnSection = json['showOnSection'] as bool?,
//         hideOnCourse = json['hideOnCourse'] as bool?;
//
//   Map<String, dynamic> toJson() => {
//     'key' : key,
//     'text' : text,
//     'sectionText' : sectionText,
//     'tooltip' : tooltip,
//     'sectionTooltip' : sectionTooltip,
//     'showOnSection' : showOnSection,
//     'hideOnCourse' : hideOnCourse
//   };
// }
//
// class CourseSearchSettings {
//   final List<String>? courseFields;
//   final List<dynamic>? footerEntries;
//   final int? dropDownOptionsLimit;
//   final List<dynamic>? headerLinks;
//   final String? plannerLinkText;
//   final String? searchPlaceholder;
//   final List<String>? sectionFields;
//   final List<String>? courseSearchFilters;
//
//   CourseSearchSettings({
//     this.courseFields,
//     this.footerEntries,
//     this.dropDownOptionsLimit,
//     this.headerLinks,
//     this.plannerLinkText,
//     this.searchPlaceholder,
//     this.sectionFields,
//     this.courseSearchFilters,
//   });
//
//   CourseSearchSettings.fromJson(Map<String, dynamic> json)
//       : courseFields = (json['courseFields'] as List?)?.map((dynamic e) => e as String).toList(),
//         footerEntries = json['footerEntries'] as List?,
//         dropDownOptionsLimit = json['dropDownOptionsLimit'] as int?,
//         headerLinks = json['headerLinks'] as List?,
//         plannerLinkText = json['plannerLinkText'] as String?,
//         searchPlaceholder = json['searchPlaceholder'] as String?,
//         sectionFields = (json['sectionFields'] as List?)?.map((dynamic e) => e as String).toList(),
//         courseSearchFilters = (json['courseSearchFilters'] as List?)?.map((dynamic e) => e as String).toList();
//
//   Map<String, dynamic> toJson() => {
//     'courseFields' : courseFields,
//     'footerEntries' : footerEntries,
//     'dropDownOptionsLimit' : dropDownOptionsLimit,
//     'headerLinks' : headerLinks,
//     'plannerLinkText' : plannerLinkText,
//     'searchPlaceholder' : searchPlaceholder,
//     'sectionFields' : sectionFields,
//     'courseSearchFilters' : courseSearchFilters
//   };
// }
//
// class DegreeMapSettings {
//
//
//   DegreeMapSettings({
//
// });
//
// DegreeMapSettings.fromJson(Map<String, dynamic> json);
// Map<String, dynamic> toJson() => {
//
// };
// }
//
// class EmailSettings {
// final bool? showFromEmail;
// final bool? requireFromEmail;
// final bool? showFromName;
// final bool? requireFromName;
// final bool? showStudentId;
// final bool? autoIncludeStudentId;
// final String? defaultFromEmail;
// final bool? useGridConfiguration;
//
// EmailSettings({
// this.showFromEmail,
// this.requireFromEmail,
// this.showFromName,
// this.requireFromName,
// this.showStudentId,
// this.autoIncludeStudentId,
// this.defaultFromEmail,
// this.useGridConfiguration,
// });
//
// EmailSettings.fromJson(Map<String, dynamic> json)
//     : showFromEmail = json['showFromEmail'] as bool?,
// requireFromEmail = json['requireFromEmail'] as bool?,
// showFromName = json['showFromName'] as bool?,
// requireFromName = json['requireFromName'] as bool?,
// showStudentId = json['showStudentId'] as bool?,
// autoIncludeStudentId = json['autoIncludeStudentId'] as bool?,
// defaultFromEmail = json['defaultFromEmail'] as String?,
// useGridConfiguration = json['useGridConfiguration'] as bool?;
//
// Map<String, dynamic> toJson() => {
// 'showFromEmail' : showFromEmail,
// 'requireFromEmail' : requireFromEmail,
// 'showFromName' : showFromName,
// 'requireFromName' : requireFromName,
// 'showStudentId' : showStudentId,
// 'autoIncludeStudentId' : autoIncludeStudentId,
// 'defaultFromEmail' : defaultFromEmail,
// 'useGridConfiguration' : useGridConfiguration
// };
// }
//
// class FilterSettings {
// final bool? skipShoppingCart;
// final String? partOfTermDisplayFormat;
// final List<dynamic>? items;
// final List<dynamic>? data;
// final List<dynamic>? bulkRules;
// final bool? lockHomeCampus;
// final bool? filterTermsByEnrollDate;
// final String? noTermsAvailableMessage;
// final List<dynamic>? deselectedLoginFilters;
// final List<dynamic>? selectedLoginFilters;
// final bool? showCampusDistance;
// final List<dynamic>? campusCoordinates;
// final String? campusSelectionPrefixes;
//
// FilterSettings({
// this.skipShoppingCart,
// this.partOfTermDisplayFormat,
// this.items,
// this.data,
// this.bulkRules,
// this.lockHomeCampus,
// this.filterTermsByEnrollDate,
// this.noTermsAvailableMessage,
// this.deselectedLoginFilters,
// this.selectedLoginFilters,
// this.showCampusDistance,
// this.campusCoordinates,
// this.campusSelectionPrefixes,
// });
//
// FilterSettings.fromJson(Map<String, dynamic> json)
//     : skipShoppingCart = json['skipShoppingCart'] as bool?,
// partOfTermDisplayFormat = json['partOfTermDisplayFormat'] as String?,
// items = json['items'] as List?,
// data = json['data'] as List?,
// bulkRules = json['bulkRules'] as List?,
// lockHomeCampus = json['lockHomeCampus'] as bool?,
// filterTermsByEnrollDate = json['filterTermsByEnrollDate'] as bool?,
// noTermsAvailableMessage = json['noTermsAvailableMessage'] as String?,
// deselectedLoginFilters = json['deselectedLoginFilters'] as List?,
// selectedLoginFilters = json['selectedLoginFilters'] as List?,
// showCampusDistance = json['showCampusDistance'] as bool?,
// campusCoordinates = json['campusCoordinates'] as List?,
// campusSelectionPrefixes = json['campusSelectionPrefixes'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'skipShoppingCart' : skipShoppingCart,
// 'partOfTermDisplayFormat' : partOfTermDisplayFormat,
// 'items' : items,
// 'data' : data,
// 'bulkRules' : bulkRules,
// 'lockHomeCampus' : lockHomeCampus,
// 'filterTermsByEnrollDate' : filterTermsByEnrollDate,
// 'noTermsAvailableMessage' : noTermsAvailableMessage,
// 'deselectedLoginFilters' : deselectedLoginFilters,
// 'selectedLoginFilters' : selectedLoginFilters,
// 'showCampusDistance' : showCampusDistance,
// 'campusCoordinates' : campusCoordinates,
// 'campusSelectionPrefixes' : campusSelectionPrefixes
// };
// }
//
// class HomeSettings {
// final bool? closeOnSignOut;
// final bool? hidePortalSignIn;
// final bool? showDesktopTips;
// final bool? showMobileTips;
// final bool? showStudentName;
// final bool? showUserId;
// final bool? showAdminStudentId;
// final bool? showUnifiedHeader;
// final bool? skipSignOutScreen;
// final List<String>? registrationWarnings;
// final List<Tips>? tips;
// final String? customLinkText;
// final String? customLinkUrl;
// final String? genericHtmlToInclude;
// final String? helpText;
// final String? regHoldNotEligibleWarningText;
// final String? signoutText;
// final String? studentHoldsWarningText;
// final String? studentNameLabel;
// final String? studentStatusNotEligibleWarningText;
// final String? userIdLabel;
//
// HomeSettings({
// this.closeOnSignOut,
// this.hidePortalSignIn,
// this.showDesktopTips,
// this.showMobileTips,
// this.showStudentName,
// this.showUserId,
// this.showAdminStudentId,
// this.showUnifiedHeader,
// this.skipSignOutScreen,
// this.registrationWarnings,
// this.tips,
// this.customLinkText,
// this.customLinkUrl,
// this.genericHtmlToInclude,
// this.helpText,
// this.regHoldNotEligibleWarningText,
// this.signoutText,
// this.studentHoldsWarningText,
// this.studentNameLabel,
// this.studentStatusNotEligibleWarningText,
// this.userIdLabel,
// });
//
// HomeSettings.fromJson(Map<String, dynamic> json)
//     : closeOnSignOut = json['closeOnSignOut'] as bool?,
// hidePortalSignIn = json['hidePortalSignIn'] as bool?,
// showDesktopTips = json['showDesktopTips'] as bool?,
// showMobileTips = json['showMobileTips'] as bool?,
// showStudentName = json['showStudentName'] as bool?,
// showUserId = json['showUserId'] as bool?,
// showAdminStudentId = json['showAdminStudentId'] as bool?,
// showUnifiedHeader = json['showUnifiedHeader'] as bool?,
// skipSignOutScreen = json['skipSignOutScreen'] as bool?,
// registrationWarnings = (json['registrationWarnings'] as List?)?.map((dynamic e) => e as String).toList(),
// tips = (json['tips'] as List?)?.map((dynamic e) => Tips.fromJson(e as Map<String,dynamic>)).toList(),
// customLinkText = json['customLinkText'] as String?,
// customLinkUrl = json['customLinkUrl'] as String?,
// genericHtmlToInclude = json['genericHtmlToInclude'] as String?,
// helpText = json['helpText'] as String?,
// regHoldNotEligibleWarningText = json['regHoldNotEligibleWarningText'] as String?,
// signoutText = json['signoutText'] as String?,
// studentHoldsWarningText = json['studentHoldsWarningText'] as String?,
// studentNameLabel = json['studentNameLabel'] as String?,
// studentStatusNotEligibleWarningText = json['studentStatusNotEligibleWarningText'] as String?,
// userIdLabel = json['userIdLabel'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'closeOnSignOut' : closeOnSignOut,
// 'hidePortalSignIn' : hidePortalSignIn,
// 'showDesktopTips' : showDesktopTips,
// 'showMobileTips' : showMobileTips,
// 'showStudentName' : showStudentName,
// 'showUserId' : showUserId,
// 'showAdminStudentId' : showAdminStudentId,
// 'showUnifiedHeader' : showUnifiedHeader,
// 'skipSignOutScreen' : skipSignOutScreen,
// 'registrationWarnings' : registrationWarnings,
// 'tips' : tips?.map((e) => e.toJson()).toList(),
// 'customLinkText' : customLinkText,
// 'customLinkUrl' : customLinkUrl,
// 'genericHtmlToInclude' : genericHtmlToInclude,
// 'helpText' : helpText,
// 'regHoldNotEligibleWarningText' : regHoldNotEligibleWarningText,
// 'signoutText' : signoutText,
// 'studentHoldsWarningText' : studentHoldsWarningText,
// 'studentNameLabel' : studentNameLabel,
// 'studentStatusNotEligibleWarningText' : studentStatusNotEligibleWarningText,
// 'userIdLabel' : userIdLabel
// };
// }
//
// class Tips {
// final String? tip;
// final bool? hideOnMobile;
//
// Tips({
// this.tip,
// this.hideOnMobile,
// });
//
// Tips.fromJson(Map<String, dynamic> json)
//     : tip = json['tip'] as String?,
// hideOnMobile = json['hideOnMobile'] as bool?;
//
// Map<String, dynamic> toJson() => {
// 'tip' : tip,
// 'hideOnMobile' : hideOnMobile
// };
// }
//
// class HelpSettings {
//
//
// HelpSettings({
//
// });
//
// HelpSettings.fromJson(Map<String, dynamic> json)
//     : ;
//
// Map<String, dynamic> toJson() => {
//
// };
// }
//
// class RegistrationSettings {
// final String? authCodeDescriptionText;
// final String? authCodeEntryText;
// final String? defaultGradingBasis;
// final bool? displayRegistrationTimeTickets;
// final bool? displayAuthCodeRequests;
// final bool? sendRegistrationOnChangeEmail;
// final bool? sendRegistrationOnChangeWaitlistEmail;
// final bool? forceWaitlistPrompt;
// final String? reRegistrationDefaultAction;
// final bool? registerByCrnEnabled;
// final String? registerByCrnInstructions;
// final bool? swapEnabled;
// final bool? swapExcludeWaitListItemsFromPickList;
// final List<String>? swapFilterOptions;
// final String? swapLabel;
// final String? swapMessage;
// final String? swappedLabel;
// final String? swappingLabel;
// final bool? swapUseRegistrationQueue;
// final List<dynamic>? courseOverrideOptions;
// final List<dynamic>? registrationErrorMessagesToInclude;
// final List<dynamic>? registrationErrorMessagesToTranslate;
// final List<String>? registrationErrorMessagesToHideAuthCodeRequest;
//
// RegistrationSettings({
// this.authCodeDescriptionText,
// this.authCodeEntryText,
// this.defaultGradingBasis,
// this.displayRegistrationTimeTickets,
// this.displayAuthCodeRequests,
// this.sendRegistrationOnChangeEmail,
// this.sendRegistrationOnChangeWaitlistEmail,
// this.forceWaitlistPrompt,
// this.reRegistrationDefaultAction,
// this.registerByCrnEnabled,
// this.registerByCrnInstructions,
// this.swapEnabled,
// this.swapExcludeWaitListItemsFromPickList,
// this.swapFilterOptions,
// this.swapLabel,
// this.swapMessage,
// this.swappedLabel,
// this.swappingLabel,
// this.swapUseRegistrationQueue,
// this.courseOverrideOptions,
// this.registrationErrorMessagesToInclude,
// this.registrationErrorMessagesToTranslate,
// this.registrationErrorMessagesToHideAuthCodeRequest,
// });
//
// RegistrationSettings.fromJson(Map<String, dynamic> json)
//     : authCodeDescriptionText = json['authCodeDescriptionText'] as String?,
// authCodeEntryText = json['authCodeEntryText'] as String?,
// defaultGradingBasis = json['defaultGradingBasis'] as String?,
// displayRegistrationTimeTickets = json['displayRegistrationTimeTickets'] as bool?,
// displayAuthCodeRequests = json['displayAuthCodeRequests'] as bool?,
// sendRegistrationOnChangeEmail = json['sendRegistrationOnChangeEmail'] as bool?,
// sendRegistrationOnChangeWaitlistEmail = json['sendRegistrationOnChangeWaitlistEmail'] as bool?,
// forceWaitlistPrompt = json['forceWaitlistPrompt'] as bool?,
// reRegistrationDefaultAction = json['reRegistrationDefaultAction'] as String?,
// registerByCrnEnabled = json['registerByCrnEnabled'] as bool?,
// registerByCrnInstructions = json['registerByCrnInstructions'] as String?,
// swapEnabled = json['swapEnabled'] as bool?,
// swapExcludeWaitListItemsFromPickList = json['swapExcludeWaitListItemsFromPickList'] as bool?,
// swapFilterOptions = (json['swapFilterOptions'] as List?)?.map((dynamic e) => e as String).toList(),
// swapLabel = json['swapLabel'] as String?,
// swapMessage = json['swapMessage'] as String?,
// swappedLabel = json['swappedLabel'] as String?,
// swappingLabel = json['swappingLabel'] as String?,
// swapUseRegistrationQueue = json['swapUseRegistrationQueue'] as bool?,
// courseOverrideOptions = json['courseOverrideOptions'] as List?,
// registrationErrorMessagesToInclude = json['registrationErrorMessagesToInclude'] as List?,
// registrationErrorMessagesToTranslate = json['registrationErrorMessagesToTranslate'] as List?,
// registrationErrorMessagesToHideAuthCodeRequest = (json['registrationErrorMessagesToHideAuthCodeRequest'] as List?)?.map((dynamic e) => e as String).toList();
//
// Map<String, dynamic> toJson() => {
// 'authCodeDescriptionText' : authCodeDescriptionText,
// 'authCodeEntryText' : authCodeEntryText,
// 'defaultGradingBasis' : defaultGradingBasis,
// 'displayRegistrationTimeTickets' : displayRegistrationTimeTickets,
// 'displayAuthCodeRequests' : displayAuthCodeRequests,
// 'sendRegistrationOnChangeEmail' : sendRegistrationOnChangeEmail,
// 'sendRegistrationOnChangeWaitlistEmail' : sendRegistrationOnChangeWaitlistEmail,
// 'forceWaitlistPrompt' : forceWaitlistPrompt,
// 'reRegistrationDefaultAction' : reRegistrationDefaultAction,
// 'registerByCrnEnabled' : registerByCrnEnabled,
// 'registerByCrnInstructions' : registerByCrnInstructions,
// 'swapEnabled' : swapEnabled,
// 'swapExcludeWaitListItemsFromPickList' : swapExcludeWaitListItemsFromPickList,
// 'swapFilterOptions' : swapFilterOptions,
// 'swapLabel' : swapLabel,
// 'swapMessage' : swapMessage,
// 'swappedLabel' : swappedLabel,
// 'swappingLabel' : swappingLabel,
// 'swapUseRegistrationQueue' : swapUseRegistrationQueue,
// 'courseOverrideOptions' : courseOverrideOptions,
// 'registrationErrorMessagesToInclude' : registrationErrorMessagesToInclude,
// 'registrationErrorMessagesToTranslate' : registrationErrorMessagesToTranslate,
// 'registrationErrorMessagesToHideAuthCodeRequest' : registrationErrorMessagesToHideAuthCodeRequest
// };
// }
//
// class ScheduleSettings {
// final String? timelineDisplayOption;
// final bool? showPlaceholderInstructor;
// final bool? collapseMeetings;
// final String? placeholderInstructor;
// final String? chipTitleFormat;
// final String? chipTitleFormatMacros;
// final int? defaultWeek;
// final int? maxCredits;
// final int? minCredits;
// final String? optionalGenerationMessage;
// final String? currentScheduleMessage;
// final String? resultFormat;
// final String? resultLinkText;
// final bool? autoOpenOptions;
// final bool? hideRestoreOptions;
// final bool? showPaddingOption;
// final bool? showPrint;
// final bool? showPrintForm;
// final String? printFormPosition;
// final bool? showShuffle;
// final bool? alwaysShowComparePanel;
// final bool? showTotalCredits;
// final bool? showTotalCreditsLabel;
// final String? totalCreditsLabel;
// final List<String>? warnings;
// final bool? showCreditsToReach;
// final int? creditsToReach;
// final bool? showIncludedCorequisitesWarning;
// final String? includedCorequisitesWarning;
// final String? potentialScheduleWarning;
// final String? maxCreditsWarning;
// final String? minCreditsWarning;
// final String? missingSectionIDsWarning;
// final String? multipleCampusesWarning;
// final bool? multipleCampusesWarningExcludesOnline;
// final List<dynamic>? multipleCampusesWarningExcluded;
// final String? multipleLocationsWarning;
// final bool? multipleLocationsWarningExcludesOnline;
// final List<dynamic>? multipleLocationsWarningExcluded;
// final String? multiplePartsOfTermWarning;
// final String? registrationWindowClosedWarning;
// final bool? onlyERegistrationTypeInCreditCalculation;
// final bool? showCartImage;
// final bool? useCreditRaw;
// final String? alternateRegistrationInstructions;
// final bool? disableConflictDetection;
// final List<dynamic>? customWarnings;
// final List<dynamic>? customUserSettings;
// final bool? showFavorites;
// final bool? startShuffled;
// final bool? showCalendarBeforeSchedule;
// final String? customPrintForm;
// final bool? allowSharedMinute;
// final DegreePlanWarnings? degreePlanWarnings;
// final bool? useChipTitleFormatMacros;
// final int? excessiveSchedulesLimit;
// final String? excessiveSchedulesTip;
// final int? schedulesPerPage;
// final int? maxScheduleGenerationWaitTime;
// final int? maxSchedulesGenerated;
// final bool? hideInstructorOnChip;
//
// ScheduleSettings({
// this.timelineDisplayOption,
// this.showPlaceholderInstructor,
// this.collapseMeetings,
// this.placeholderInstructor,
// this.chipTitleFormat,
// this.chipTitleFormatMacros,
// this.defaultWeek,
// this.maxCredits,
// this.minCredits,
// this.optionalGenerationMessage,
// this.currentScheduleMessage,
// this.resultFormat,
// this.resultLinkText,
// this.autoOpenOptions,
// this.hideRestoreOptions,
// this.showPaddingOption,
// this.showPrint,
// this.showPrintForm,
// this.printFormPosition,
// this.showShuffle,
// this.alwaysShowComparePanel,
// this.showTotalCredits,
// this.showTotalCreditsLabel,
// this.totalCreditsLabel,
// this.warnings,
// this.showCreditsToReach,
// this.creditsToReach,
// this.showIncludedCorequisitesWarning,
// this.includedCorequisitesWarning,
// this.potentialScheduleWarning,
// this.maxCreditsWarning,
// this.minCreditsWarning,
// this.missingSectionIDsWarning,
// this.multipleCampusesWarning,
// this.multipleCampusesWarningExcludesOnline,
// this.multipleCampusesWarningExcluded,
// this.multipleLocationsWarning,
// this.multipleLocationsWarningExcludesOnline,
// this.multipleLocationsWarningExcluded,
// this.multiplePartsOfTermWarning,
// this.registrationWindowClosedWarning,
// this.onlyERegistrationTypeInCreditCalculation,
// this.showCartImage,
// this.useCreditRaw,
// this.alternateRegistrationInstructions,
// this.disableConflictDetection,
// this.customWarnings,
// this.customUserSettings,
// this.showFavorites,
// this.startShuffled,
// this.showCalendarBeforeSchedule,
// this.customPrintForm,
// this.allowSharedMinute,
// this.degreePlanWarnings,
// this.useChipTitleFormatMacros,
// this.excessiveSchedulesLimit,
// this.excessiveSchedulesTip,
// this.schedulesPerPage,
// this.maxScheduleGenerationWaitTime,
// this.maxSchedulesGenerated,
// this.hideInstructorOnChip,
// });
//
// ScheduleSettings.fromJson(Map<String, dynamic> json)
//     : timelineDisplayOption = json['timelineDisplayOption'] as String?,
// showPlaceholderInstructor = json['showPlaceholderInstructor'] as bool?,
// collapseMeetings = json['collapseMeetings'] as bool?,
// placeholderInstructor = json['placeholderInstructor'] as String?,
// chipTitleFormat = json['chipTitleFormat'] as String?,
// chipTitleFormatMacros = json['chipTitleFormatMacros'] as String?,
// defaultWeek = json['defaultWeek'] as int?,
// maxCredits = json['maxCredits'] as int?,
// minCredits = json['minCredits'] as int?,
// optionalGenerationMessage = json['optionalGenerationMessage'] as String?,
// currentScheduleMessage = json['currentScheduleMessage'] as String?,
// resultFormat = json['resultFormat'] as String?,
// resultLinkText = json['resultLinkText'] as String?,
// autoOpenOptions = json['autoOpenOptions'] as bool?,
// hideRestoreOptions = json['hideRestoreOptions'] as bool?,
// showPaddingOption = json['showPaddingOption'] as bool?,
// showPrint = json['showPrint'] as bool?,
// showPrintForm = json['showPrintForm'] as bool?,
// printFormPosition = json['printFormPosition'] as String?,
// showShuffle = json['showShuffle'] as bool?,
// alwaysShowComparePanel = json['alwaysShowComparePanel'] as bool?,
// showTotalCredits = json['showTotalCredits'] as bool?,
// showTotalCreditsLabel = json['showTotalCreditsLabel'] as bool?,
// totalCreditsLabel = json['totalCreditsLabel'] as String?,
// warnings = (json['warnings'] as List?)?.map((dynamic e) => e as String).toList(),
// showCreditsToReach = json['showCreditsToReach'] as bool?,
// creditsToReach = json['creditsToReach'] as int?,
// showIncludedCorequisitesWarning = json['showIncludedCorequisitesWarning'] as bool?,
// includedCorequisitesWarning = json['includedCorequisitesWarning'] as String?,
// potentialScheduleWarning = json['potentialScheduleWarning'] as String?,
// maxCreditsWarning = json['maxCreditsWarning'] as String?,
// minCreditsWarning = json['minCreditsWarning'] as String?,
// missingSectionIDsWarning = json['missingSectionIDsWarning'] as String?,
// multipleCampusesWarning = json['multipleCampusesWarning'] as String?,
// multipleCampusesWarningExcludesOnline = json['multipleCampusesWarningExcludesOnline'] as bool?,
// multipleCampusesWarningExcluded = json['multipleCampusesWarningExcluded'] as List?,
// multipleLocationsWarning = json['multipleLocationsWarning'] as String?,
// multipleLocationsWarningExcludesOnline = json['multipleLocationsWarningExcludesOnline'] as bool?,
// multipleLocationsWarningExcluded = json['multipleLocationsWarningExcluded'] as List?,
// multiplePartsOfTermWarning = json['multiplePartsOfTermWarning'] as String?,
// registrationWindowClosedWarning = json['registrationWindowClosedWarning'] as String?,
// onlyERegistrationTypeInCreditCalculation = json['onlyERegistrationTypeInCreditCalculation'] as bool?,
// showCartImage = json['showCartImage'] as bool?,
// useCreditRaw = json['useCreditRaw'] as bool?,
// alternateRegistrationInstructions = json['alternateRegistrationInstructions'] as String?,
// disableConflictDetection = json['disableConflictDetection'] as bool?,
// customWarnings = json['customWarnings'] as List?,
// customUserSettings = json['customUserSettings'] as List?,
// showFavorites = json['showFavorites'] as bool?,
// startShuffled = json['startShuffled'] as bool?,
// showCalendarBeforeSchedule = json['showCalendarBeforeSchedule'] as bool?,
// customPrintForm = json['customPrintForm'] as String?,
// allowSharedMinute = json['allowSharedMinute'] as bool?,
// degreePlanWarnings = (json['degreePlanWarnings'] as Map<String,dynamic>?) != null ? DegreePlanWarnings.fromJson(json['degreePlanWarnings'] as Map<String,dynamic>) : null,
// useChipTitleFormatMacros = json['useChipTitleFormatMacros'] as bool?,
// excessiveSchedulesLimit = json['excessiveSchedulesLimit'] as int?,
// excessiveSchedulesTip = json['excessiveSchedulesTip'] as String?,
// schedulesPerPage = json['schedulesPerPage'] as int?,
// maxScheduleGenerationWaitTime = json['maxScheduleGenerationWaitTime'] as int?,
// maxSchedulesGenerated = json['maxSchedulesGenerated'] as int?,
// hideInstructorOnChip = json['hideInstructorOnChip'] as bool?;
//
// Map<String, dynamic> toJson() => {
// 'timelineDisplayOption' : timelineDisplayOption,
// 'showPlaceholderInstructor' : showPlaceholderInstructor,
// 'collapseMeetings' : collapseMeetings,
// 'placeholderInstructor' : placeholderInstructor,
// 'chipTitleFormat' : chipTitleFormat,
// 'chipTitleFormatMacros' : chipTitleFormatMacros,
// 'defaultWeek' : defaultWeek,
// 'maxCredits' : maxCredits,
// 'minCredits' : minCredits,
// 'optionalGenerationMessage' : optionalGenerationMessage,
// 'currentScheduleMessage' : currentScheduleMessage,
// 'resultFormat' : resultFormat,
// 'resultLinkText' : resultLinkText,
// 'autoOpenOptions' : autoOpenOptions,
// 'hideRestoreOptions' : hideRestoreOptions,
// 'showPaddingOption' : showPaddingOption,
// 'showPrint' : showPrint,
// 'showPrintForm' : showPrintForm,
// 'printFormPosition' : printFormPosition,
// 'showShuffle' : showShuffle,
// 'alwaysShowComparePanel' : alwaysShowComparePanel,
// 'showTotalCredits' : showTotalCredits,
// 'showTotalCreditsLabel' : showTotalCreditsLabel,
// 'totalCreditsLabel' : totalCreditsLabel,
// 'warnings' : warnings,
// 'showCreditsToReach' : showCreditsToReach,
// 'creditsToReach' : creditsToReach,
// 'showIncludedCorequisitesWarning' : showIncludedCorequisitesWarning,
// 'includedCorequisitesWarning' : includedCorequisitesWarning,
// 'potentialScheduleWarning' : potentialScheduleWarning,
// 'maxCreditsWarning' : maxCreditsWarning,
// 'minCreditsWarning' : minCreditsWarning,
// 'missingSectionIDsWarning' : missingSectionIDsWarning,
// 'multipleCampusesWarning' : multipleCampusesWarning,
// 'multipleCampusesWarningExcludesOnline' : multipleCampusesWarningExcludesOnline,
// 'multipleCampusesWarningExcluded' : multipleCampusesWarningExcluded,
// 'multipleLocationsWarning' : multipleLocationsWarning,
// 'multipleLocationsWarningExcludesOnline' : multipleLocationsWarningExcludesOnline,
// 'multipleLocationsWarningExcluded' : multipleLocationsWarningExcluded,
// 'multiplePartsOfTermWarning' : multiplePartsOfTermWarning,
// 'registrationWindowClosedWarning' : registrationWindowClosedWarning,
// 'onlyERegistrationTypeInCreditCalculation' : onlyERegistrationTypeInCreditCalculation,
// 'showCartImage' : showCartImage,
// 'useCreditRaw' : useCreditRaw,
// 'alternateRegistrationInstructions' : alternateRegistrationInstructions,
// 'disableConflictDetection' : disableConflictDetection,
// 'customWarnings' : customWarnings,
// 'customUserSettings' : customUserSettings,
// 'showFavorites' : showFavorites,
// 'startShuffled' : startShuffled,
// 'showCalendarBeforeSchedule' : showCalendarBeforeSchedule,
// 'customPrintForm' : customPrintForm,
// 'allowSharedMinute' : allowSharedMinute,
// 'degreePlanWarnings' : degreePlanWarnings?.toJson(),
// 'useChipTitleFormatMacros' : useChipTitleFormatMacros,
// 'excessiveSchedulesLimit' : excessiveSchedulesLimit,
// 'excessiveSchedulesTip' : excessiveSchedulesTip,
// 'schedulesPerPage' : schedulesPerPage,
// 'maxScheduleGenerationWaitTime' : maxScheduleGenerationWaitTime,
// 'maxSchedulesGenerated' : maxSchedulesGenerated,
// 'hideInstructorOnChip' : hideInstructorOnChip
// };
// }
//
// class DegreePlanWarnings {
// final String? warningMessage;
//
// DegreePlanWarnings({
// this.warningMessage,
// });
//
// DegreePlanWarnings.fromJson(Map<String, dynamic> json)
//     : warningMessage = json['warningMessage'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'warningMessage' : warningMessage
// };
// }
//
// class SectionSettings {
// final List<String>? enrollmentRequirementOptions;
// final bool? hideEmptyReserveCaps;
// final bool? useSubjectFormatOnOptions;
// final bool? hideUnrestrictedConsentRequirement;
// final bool? hideUnrestrictedDropConsentRequirement;
// final String? locationFormat;
// final String? subjectFormat;
// final String? noInstructorValue;
// final String? mapURL;
// final bool? showMap;
// final bool? disableShowMore;
// final bool? showInstructorEmail;
// final bool? useLocationFormatInMeeting;
// final bool? showDatesInMeetingsColumn;
// final bool? hideSectionsWithWaitlist;
// final bool? showCanceledOrClosedWithNoSeats;
// final bool? hideSectionsWithWaitlistGTOpenSeats;
// final bool? displayTba;
// final SectionBookSettings? sectionBookSettings;
// final String? textbook;
// final String? creditsFormat;
// final String? restrictionFormatMacros;
// final bool? externalSectionRestrictions;
// final String? approvalMacro;
//
// SectionSettings({
// this.enrollmentRequirementOptions,
// this.hideEmptyReserveCaps,
// this.useSubjectFormatOnOptions,
// this.hideUnrestrictedConsentRequirement,
// this.hideUnrestrictedDropConsentRequirement,
// this.locationFormat,
// this.subjectFormat,
// this.noInstructorValue,
// this.mapURL,
// this.showMap,
// this.disableShowMore,
// this.showInstructorEmail,
// this.useLocationFormatInMeeting,
// this.showDatesInMeetingsColumn,
// this.hideSectionsWithWaitlist,
// this.showCanceledOrClosedWithNoSeats,
// this.hideSectionsWithWaitlistGTOpenSeats,
// this.displayTba,
// this.sectionBookSettings,
// this.textbook,
// this.creditsFormat,
// this.restrictionFormatMacros,
// this.externalSectionRestrictions,
// this.approvalMacro,
// });
//
// SectionSettings.fromJson(Map<String, dynamic> json)
//     : enrollmentRequirementOptions = (json['enrollmentRequirementOptions'] as List?)?.map((dynamic e) => e as String).toList(),
// hideEmptyReserveCaps = json['hideEmptyReserveCaps'] as bool?,
// useSubjectFormatOnOptions = json['useSubjectFormatOnOptions'] as bool?,
// hideUnrestrictedConsentRequirement = json['hideUnrestrictedConsentRequirement'] as bool?,
// hideUnrestrictedDropConsentRequirement = json['hideUnrestrictedDropConsentRequirement'] as bool?,
// locationFormat = json['locationFormat'] as String?,
// subjectFormat = json['subjectFormat'] as String?,
// noInstructorValue = json['noInstructorValue'] as String?,
// mapURL = json['mapURL'] as String?,
// showMap = json['showMap'] as bool?,
// disableShowMore = json['disableShowMore'] as bool?,
// showInstructorEmail = json['showInstructorEmail'] as bool?,
// useLocationFormatInMeeting = json['useLocationFormatInMeeting'] as bool?,
// showDatesInMeetingsColumn = json['showDatesInMeetingsColumn'] as bool?,
// hideSectionsWithWaitlist = json['hideSectionsWithWaitlist'] as bool?,
// showCanceledOrClosedWithNoSeats = json['showCanceledOrClosedWithNoSeats'] as bool?,
// hideSectionsWithWaitlistGTOpenSeats = json['hideSectionsWithWaitlistGTOpenSeats'] as bool?,
// displayTba = json['displayTba'] as bool?,
// sectionBookSettings = (json['sectionBookSettings'] as Map<String,dynamic>?) != null ? SectionBookSettings.fromJson(json['sectionBookSettings'] as Map<String,dynamic>) : null,
// textbook = json['textbook'] as String?,
// creditsFormat = json['creditsFormat'] as String?,
// restrictionFormatMacros = json['restrictionFormatMacros'] as String?,
// externalSectionRestrictions = json['externalSectionRestrictions'] as bool?,
// approvalMacro = json['approvalMacro'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'enrollmentRequirementOptions' : enrollmentRequirementOptions,
// 'hideEmptyReserveCaps' : hideEmptyReserveCaps,
// 'useSubjectFormatOnOptions' : useSubjectFormatOnOptions,
// 'hideUnrestrictedConsentRequirement' : hideUnrestrictedConsentRequirement,
// 'hideUnrestrictedDropConsentRequirement' : hideUnrestrictedDropConsentRequirement,
// 'locationFormat' : locationFormat,
// 'subjectFormat' : subjectFormat,
// 'noInstructorValue' : noInstructorValue,
// 'mapURL' : mapURL,
// 'showMap' : showMap,
// 'disableShowMore' : disableShowMore,
// 'showInstructorEmail' : showInstructorEmail,
// 'useLocationFormatInMeeting' : useLocationFormatInMeeting,
// 'showDatesInMeetingsColumn' : showDatesInMeetingsColumn,
// 'hideSectionsWithWaitlist' : hideSectionsWithWaitlist,
// 'showCanceledOrClosedWithNoSeats' : showCanceledOrClosedWithNoSeats,
// 'hideSectionsWithWaitlistGTOpenSeats' : hideSectionsWithWaitlistGTOpenSeats,
// 'displayTba' : displayTba,
// 'sectionBookSettings' : sectionBookSettings?.toJson(),
// 'textbook' : textbook,
// 'creditsFormat' : creditsFormat,
// 'restrictionFormatMacros' : restrictionFormatMacros,
// 'externalSectionRestrictions' : externalSectionRestrictions,
// 'approvalMacro' : approvalMacro
// };
// }
//
// class SectionBookSettings {
// final bool? showBooks;
// final bool? showBookPrices;
// final Mapping? mapping;
//
// SectionBookSettings({
// this.showBooks,
// this.showBookPrices,
// this.mapping,
// });
//
// SectionBookSettings.fromJson(Map<String, dynamic> json)
//     : showBooks = json['showBooks'] as bool?,
// showBookPrices = json['showBookPrices'] as bool?,
// mapping = (json['mapping'] as Map<String,dynamic>?) != null ? Mapping.fromJson(json['mapping'] as Map<String,dynamic>) : null;
//
// Map<String, dynamic> toJson() => {
// 'showBooks' : showBooks,
// 'showBookPrices' : showBookPrices,
// 'mapping' : mapping?.toJson()
// };
// }
//
// class Mapping {
// final List<dynamic>? mappingRules;
//
// Mapping({
// this.mappingRules,
// });
//
// Mapping.fromJson(Map<String, dynamic> json)
//     : mappingRules = json['mappingRules'] as List?;
//
// Map<String, dynamic> toJson() => {
// 'mappingRules' : mappingRules
// };
// }
//
// class SecuritySettings {
// final int? passwordMinimumLength;
// final int? passwordMinimumNumeric;
// final int? passwordMinimumLowercase;
// final int? passwordMinimumUppercase;
// final int? passwordMinimumSpecialCharacters;
//
// SecuritySettings({
// this.passwordMinimumLength,
// this.passwordMinimumNumeric,
// this.passwordMinimumLowercase,
// this.passwordMinimumUppercase,
// this.passwordMinimumSpecialCharacters,
// });
//
// SecuritySettings.fromJson(Map<String, dynamic> json)
//     : passwordMinimumLength = json['passwordMinimumLength'] as int?,
// passwordMinimumNumeric = json['passwordMinimumNumeric'] as int?,
// passwordMinimumLowercase = json['passwordMinimumLowercase'] as int?,
// passwordMinimumUppercase = json['passwordMinimumUppercase'] as int?,
// passwordMinimumSpecialCharacters = json['passwordMinimumSpecialCharacters'] as int?;
//
// Map<String, dynamic> toJson() => {
// 'passwordMinimumLength' : passwordMinimumLength,
// 'passwordMinimumNumeric' : passwordMinimumNumeric,
// 'passwordMinimumLowercase' : passwordMinimumLowercase,
// 'passwordMinimumUppercase' : passwordMinimumUppercase,
// 'passwordMinimumSpecialCharacters' : passwordMinimumSpecialCharacters
// };
// }
//
// class SisSettings {
// final String? logOutUrl;
// final bool? lockTermBySignOnPacket;
// final bool? sendDemandData;
// final bool? useParentTermAsTerm;
// final String? sisType;
// final String? sisTimeZone;
// final bool? liveRegistration;
// final bool? sendToCartViaBridge;
// final bool? multiInstitutionEnabled;
// final String? multiInstitutionFilterType;
// final String? externalSectionWarningTemplate;
// final bool? showErrorWhenAllInstitutionsAreFiltered;
// final String? allInstitutionsAreFilteredErrorMessage;
// final bool? showReserveCapSelectorForSampleLogin;
// final bool? useBannerOrds;
//
// SisSettings({
// this.logOutUrl,
// this.lockTermBySignOnPacket,
// this.sendDemandData,
// this.useParentTermAsTerm,
// this.sisType,
// this.sisTimeZone,
// this.liveRegistration,
// this.sendToCartViaBridge,
// this.multiInstitutionEnabled,
// this.multiInstitutionFilterType,
// this.externalSectionWarningTemplate,
// this.showErrorWhenAllInstitutionsAreFiltered,
// this.allInstitutionsAreFilteredErrorMessage,
// this.showReserveCapSelectorForSampleLogin,
// this.useBannerOrds,
// });
//
// SisSettings.fromJson(Map<String, dynamic> json)
//     : logOutUrl = json['logOutUrl'] as String?,
// lockTermBySignOnPacket = json['lockTermBySignOnPacket'] as bool?,
// sendDemandData = json['sendDemandData'] as bool?,
// useParentTermAsTerm = json['useParentTermAsTerm'] as bool?,
// sisType = json['sisType'] as String?,
// sisTimeZone = json['sisTimeZone'] as String?,
// liveRegistration = json['liveRegistration'] as bool?,
// sendToCartViaBridge = json['sendToCartViaBridge'] as bool?,
// multiInstitutionEnabled = json['multiInstitutionEnabled'] as bool?,
// multiInstitutionFilterType = json['multiInstitutionFilterType'] as String?,
// externalSectionWarningTemplate = json['externalSectionWarningTemplate'] as String?,
// showErrorWhenAllInstitutionsAreFiltered = json['showErrorWhenAllInstitutionsAreFiltered'] as bool?,
// allInstitutionsAreFilteredErrorMessage = json['allInstitutionsAreFilteredErrorMessage'] as String?,
// showReserveCapSelectorForSampleLogin = json['showReserveCapSelectorForSampleLogin'] as bool?,
// useBannerOrds = json['useBannerOrds'] as bool?;
//
// Map<String, dynamic> toJson() => {
// 'logOutUrl' : logOutUrl,
// 'lockTermBySignOnPacket' : lockTermBySignOnPacket,
// 'sendDemandData' : sendDemandData,
// 'useParentTermAsTerm' : useParentTermAsTerm,
// 'sisType' : sisType,
// 'sisTimeZone' : sisTimeZone,
// 'liveRegistration' : liveRegistration,
// 'sendToCartViaBridge' : sendToCartViaBridge,
// 'multiInstitutionEnabled' : multiInstitutionEnabled,
// 'multiInstitutionFilterType' : multiInstitutionFilterType,
// 'externalSectionWarningTemplate' : externalSectionWarningTemplate,
// 'showErrorWhenAllInstitutionsAreFiltered' : showErrorWhenAllInstitutionsAreFiltered,
// 'allInstitutionsAreFilteredErrorMessage' : allInstitutionsAreFilteredErrorMessage,
// 'showReserveCapSelectorForSampleLogin' : showReserveCapSelectorForSampleLogin,
// 'useBannerOrds' : useBannerOrds
// };
// }
//
// class SectionFieldText {
// final String? approval;
// final String? academicCareerDescrShort;
// final String? academicGroup;
// final String? academicGroupDescr;
// final String? campus;
// final String? campusShort;
// final String? campusDescriptionRaw;
// final String? component;
// final String? corequisites;
// final String? corequisitesPlural;
// final String? course;
// final String? courseAttributes;
// final String? credit;
// final String? credits;
// final String? customData;
// final String? dates;
// final String? days;
// final String? department;
// final String? description;
// final String? disabledReasons;
// final String? enrollmentStatus;
// final String? enrollmentRequirementAssoc;
// final String? enrollmentRequirementConsent;
// final String? enrollmentRequirementDropConsent;
// final String? enrollmentRequirementOffer;
// final String? externalBooks;
// final String? fees;
// final String? freeFormTopics;
// final String? freeTextbookIndicated;
// final String? lowCostTextbookIndicated;
// final String? instructionMode;
// final String? instructor;
// final String? instructorPlural;
// final String? institution;
// final String? institutionAbbreviation;
// final String? meetings;
// final String? notesShort;
// final String? notes;
// final String? openSeats;
// final String? partsOfTerm;
// final String? location;
// final String? prerequisites;
// final String? registrationNumber;
// final String? registrationNumberPlural;
// final String? requirementDesignationDescr;
// final String? classAssociations;
// final String? reserveCaps;
// final String? rooms;
// final String? sectionAttributes;
// final String? sectionAttributesPlural;
// final String? sectionNumber;
// final String? sectionStatus;
// final String? subject;
// final String? textbook;
// final String? textbookUrlLabel;
// final String? times;
// final String? title;
// final String? topicTitle;
// final String? waitlist;
// final String? waitlistOpen;
// final String? waitlistPosition;
// final String? seatsCapacity;
// final String? seatsFilled;
// final String? courseRestrictions;
// final String? sectionRestrictions;
//
// SectionFieldText({
// this.approval,
// this.academicCareerDescrShort,
// this.academicGroup,
// this.academicGroupDescr,
// this.campus,
// this.campusShort,
// this.campusDescriptionRaw,
// this.component,
// this.corequisites,
// this.corequisitesPlural,
// this.course,
// this.courseAttributes,
// this.credit,
// this.credits,
// this.customData,
// this.dates,
// this.days,
// this.department,
// this.description,
// this.disabledReasons,
// this.enrollmentStatus,
// this.enrollmentRequirementAssoc,
// this.enrollmentRequirementConsent,
// this.enrollmentRequirementDropConsent,
// this.enrollmentRequirementOffer,
// this.externalBooks,
// this.fees,
// this.freeFormTopics,
// this.freeTextbookIndicated,
// this.lowCostTextbookIndicated,
// this.instructionMode,
// this.instructor,
// this.instructorPlural,
// this.institution,
// this.institutionAbbreviation,
// this.meetings,
// this.notesShort,
// this.notes,
// this.openSeats,
// this.partsOfTerm,
// this.location,
// this.prerequisites,
// this.registrationNumber,
// this.registrationNumberPlural,
// this.requirementDesignationDescr,
// this.classAssociations,
// this.reserveCaps,
// this.rooms,
// this.sectionAttributes,
// this.sectionAttributesPlural,
// this.sectionNumber,
// this.sectionStatus,
// this.subject,
// this.textbook,
// this.textbookUrlLabel,
// this.times,
// this.title,
// this.topicTitle,
// this.waitlist,
// this.waitlistOpen,
// this.waitlistPosition,
// this.seatsCapacity,
// this.seatsFilled,
// this.courseRestrictions,
// this.sectionRestrictions,
// });
//
// SectionFieldText.fromJson(Map<String, dynamic> json)
//     : approval = json['approval'] as String?,
// academicCareerDescrShort = json['academicCareerDescrShort'] as String?,
// academicGroup = json['academicGroup'] as String?,
// academicGroupDescr = json['academicGroupDescr'] as String?,
// campus = json['campus'] as String?,
// campusShort = json['campusShort'] as String?,
// campusDescriptionRaw = json['campusDescriptionRaw'] as String?,
// component = json['component'] as String?,
// corequisites = json['corequisites'] as String?,
// corequisitesPlural = json['corequisitesPlural'] as String?,
// course = json['course'] as String?,
// courseAttributes = json['courseAttributes'] as String?,
// credit = json['credit'] as String?,
// credits = json['credits'] as String?,
// customData = json['customData'] as String?,
// dates = json['dates'] as String?,
// days = json['days'] as String?,
// department = json['department'] as String?,
// description = json['description'] as String?,
// disabledReasons = json['disabledReasons'] as String?,
// enrollmentStatus = json['enrollmentStatus'] as String?,
// enrollmentRequirementAssoc = json['enrollmentRequirementAssoc'] as String?,
// enrollmentRequirementConsent = json['enrollmentRequirementConsent'] as String?,
// enrollmentRequirementDropConsent = json['enrollmentRequirementDropConsent'] as String?,
// enrollmentRequirementOffer = json['enrollmentRequirementOffer'] as String?,
// externalBooks = json['externalBooks'] as String?,
// fees = json['fees'] as String?,
// freeFormTopics = json['freeFormTopics'] as String?,
// freeTextbookIndicated = json['freeTextbookIndicated'] as String?,
// lowCostTextbookIndicated = json['lowCostTextbookIndicated'] as String?,
// instructionMode = json['instructionMode'] as String?,
// instructor = json['instructor'] as String?,
// instructorPlural = json['instructorPlural'] as String?,
// institution = json['institution'] as String?,
// institutionAbbreviation = json['institutionAbbreviation'] as String?,
// meetings = json['meetings'] as String?,
// notesShort = json['notesShort'] as String?,
// notes = json['notes'] as String?,
// openSeats = json['openSeats'] as String?,
// partsOfTerm = json['partsOfTerm'] as String?,
// location = json['location'] as String?,
// prerequisites = json['prerequisites'] as String?,
// registrationNumber = json['registrationNumber'] as String?,
// registrationNumberPlural = json['registrationNumberPlural'] as String?,
// requirementDesignationDescr = json['requirementDesignationDescr'] as String?,
// classAssociations = json['classAssociations'] as String?,
// reserveCaps = json['reserveCaps'] as String?,
// rooms = json['rooms'] as String?,
// sectionAttributes = json['sectionAttributes'] as String?,
// sectionAttributesPlural = json['sectionAttributesPlural'] as String?,
// sectionNumber = json['sectionNumber'] as String?,
// sectionStatus = json['sectionStatus'] as String?,
// subject = json['subject'] as String?,
// textbook = json['textbook'] as String?,
// textbookUrlLabel = json['textbookUrlLabel'] as String?,
// times = json['times'] as String?,
// title = json['title'] as String?,
// topicTitle = json['topicTitle'] as String?,
// waitlist = json['waitlist'] as String?,
// waitlistOpen = json['waitlistOpen'] as String?,
// waitlistPosition = json['waitlistPosition'] as String?,
// seatsCapacity = json['seatsCapacity'] as String?,
// seatsFilled = json['seatsFilled'] as String?,
// courseRestrictions = json['courseRestrictions'] as String?,
// sectionRestrictions = json['sectionRestrictions'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'approval' : approval,
// 'academicCareerDescrShort' : academicCareerDescrShort,
// 'academicGroup' : academicGroup,
// 'academicGroupDescr' : academicGroupDescr,
// 'campus' : campus,
// 'campusShort' : campusShort,
// 'campusDescriptionRaw' : campusDescriptionRaw,
// 'component' : component,
// 'corequisites' : corequisites,
// 'corequisitesPlural' : corequisitesPlural,
// 'course' : course,
// 'courseAttributes' : courseAttributes,
// 'credit' : credit,
// 'credits' : credits,
// 'customData' : customData,
// 'dates' : dates,
// 'days' : days,
// 'department' : department,
// 'description' : description,
// 'disabledReasons' : disabledReasons,
// 'enrollmentStatus' : enrollmentStatus,
// 'enrollmentRequirementAssoc' : enrollmentRequirementAssoc,
// 'enrollmentRequirementConsent' : enrollmentRequirementConsent,
// 'enrollmentRequirementDropConsent' : enrollmentRequirementDropConsent,
// 'enrollmentRequirementOffer' : enrollmentRequirementOffer,
// 'externalBooks' : externalBooks,
// 'fees' : fees,
// 'freeFormTopics' : freeFormTopics,
// 'freeTextbookIndicated' : freeTextbookIndicated,
// 'lowCostTextbookIndicated' : lowCostTextbookIndicated,
// 'instructionMode' : instructionMode,
// 'instructor' : instructor,
// 'instructorPlural' : instructorPlural,
// 'institution' : institution,
// 'institutionAbbreviation' : institutionAbbreviation,
// 'meetings' : meetings,
// 'notesShort' : notesShort,
// 'notes' : notes,
// 'openSeats' : openSeats,
// 'partsOfTerm' : partsOfTerm,
// 'location' : location,
// 'prerequisites' : prerequisites,
// 'registrationNumber' : registrationNumber,
// 'registrationNumberPlural' : registrationNumberPlural,
// 'requirementDesignationDescr' : requirementDesignationDescr,
// 'classAssociations' : classAssociations,
// 'reserveCaps' : reserveCaps,
// 'rooms' : rooms,
// 'sectionAttributes' : sectionAttributes,
// 'sectionAttributesPlural' : sectionAttributesPlural,
// 'sectionNumber' : sectionNumber,
// 'sectionStatus' : sectionStatus,
// 'subject' : subject,
// 'textbook' : textbook,
// 'textbookUrlLabel' : textbookUrlLabel,
// 'times' : times,
// 'title' : title,
// 'topicTitle' : topicTitle,
// 'waitlist' : waitlist,
// 'waitlistOpen' : waitlistOpen,
// 'waitlistPosition' : waitlistPosition,
// 'seatsCapacity' : seatsCapacity,
// 'seatsFilled' : seatsFilled,
// 'courseRestrictions' : courseRestrictions,
// 'sectionRestrictions' : sectionRestrictions
// };
// }
//
// class StyleSettings {
// final List<dynamic>? customFlagStyles;
// final String? cartInstructionsUrl;
// final String? logoFileName;
// final String? navbarColor;
// final String? primaryColor;
// final String? secondaryColor;
// final bool? useNewUi;
//
// StyleSettings({
// this.customFlagStyles,
// this.cartInstructionsUrl,
// this.logoFileName,
// this.navbarColor,
// this.primaryColor,
// this.secondaryColor,
// this.useNewUi,
// });
//
// StyleSettings.fromJson(Map<String, dynamic> json)
//     : customFlagStyles = json['customFlagStyles'] as List?,
// cartInstructionsUrl = json['cartInstructionsUrl'] as String?,
// logoFileName = json['logoFileName'] as String?,
// navbarColor = json['navbarColor'] as String?,
// primaryColor = json['primaryColor'] as String?,
// secondaryColor = json['secondaryColor'] as String?,
// useNewUi = json['useNewUi'] as bool?;
//
// Map<String, dynamic> toJson() => {
// 'customFlagStyles' : customFlagStyles,
// 'cartInstructionsUrl' : cartInstructionsUrl,
// 'logoFileName' : logoFileName,
// 'navbarColor' : navbarColor,
// 'primaryColor' : primaryColor,
// 'secondaryColor' : secondaryColor,
// 'useNewUi' : useNewUi
// };
// }
//
// class CourseDemandSettings {
// final bool? enableSendingCourseDemandDeltaInstead;
// final int? maxDeltaRowsToSend;
// final int? maxCharactersAllowedInDelta;
// final bool? skipNonIntegerIdsInDemandData;
//
// CourseDemandSettings({
// this.enableSendingCourseDemandDeltaInstead,
// this.maxDeltaRowsToSend,
// this.maxCharactersAllowedInDelta,
// this.skipNonIntegerIdsInDemandData,
// });
//
// CourseDemandSettings.fromJson(Map<String, dynamic> json)
//     : enableSendingCourseDemandDeltaInstead = json['enableSendingCourseDemandDeltaInstead'] as bool?,
// maxDeltaRowsToSend = json['maxDeltaRowsToSend'] as int?,
// maxCharactersAllowedInDelta = json['maxCharactersAllowedInDelta'] as int?,
// skipNonIntegerIdsInDemandData = json['skipNonIntegerIdsInDemandData'] as bool?;
//
// Map<String, dynamic> toJson() => {
// 'enableSendingCourseDemandDeltaInstead' : enableSendingCourseDemandDeltaInstead,
// 'maxDeltaRowsToSend' : maxDeltaRowsToSend,
// 'maxCharactersAllowedInDelta' : maxCharactersAllowedInDelta,
// 'skipNonIntegerIdsInDemandData' : skipNonIntegerIdsInDemandData
// };
// }
//
// class CartSectionFieldSettings {
// final String? detailAlign;
// final bool? hideNoteBelowLabel;
// final bool? highlight;
// final bool? noteBelow;
// final bool? persistColumn;
// final bool? showColumn;
// final bool? hideDetail;
// final String? key;
//
// CartSectionFieldSettings({
// this.detailAlign,
// this.hideNoteBelowLabel,
// this.highlight,
// this.noteBelow,
// this.persistColumn,
// this.showColumn,
// this.hideDetail,
// this.key,
// });
//
// CartSectionFieldSettings.fromJson(Map<String, dynamic> json)
//     : detailAlign = json['detailAlign'] as String?,
// hideNoteBelowLabel = json['hideNoteBelowLabel'] as bool?,
// highlight = json['highlight'] as bool?,
// noteBelow = json['noteBelow'] as bool?,
// persistColumn = json['persistColumn'] as bool?,
// showColumn = json['showColumn'] as bool?,
// hideDetail = json['hideDetail'] as bool?,
// key = json['key'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'detailAlign' : detailAlign,
// 'hideNoteBelowLabel' : hideNoteBelowLabel,
// 'highlight' : highlight,
// 'noteBelow' : noteBelow,
// 'persistColumn' : persistColumn,
// 'showColumn' : showColumn,
// 'hideDetail' : hideDetail,
// 'key' : key
// };
// }
//
// class EditCartSectionFieldSettings {
// final String? detailAlign;
// final bool? hideNoteBelowLabel;
// final bool? highlight;
// final bool? noteBelow;
// final bool? persistColumn;
// final bool? showColumn;
// final bool? hideDetail;
// final String? key;
//
// EditCartSectionFieldSettings({
// this.detailAlign,
// this.hideNoteBelowLabel,
// this.highlight,
// this.noteBelow,
// this.persistColumn,
// this.showColumn,
// this.hideDetail,
// this.key,
// });
//
// EditCartSectionFieldSettings.fromJson(Map<String, dynamic> json)
//     : detailAlign = json['detailAlign'] as String?,
// hideNoteBelowLabel = json['hideNoteBelowLabel'] as bool?,
// highlight = json['highlight'] as bool?,
// noteBelow = json['noteBelow'] as bool?,
// persistColumn = json['persistColumn'] as bool?,
// showColumn = json['showColumn'] as bool?,
// hideDetail = json['hideDetail'] as bool?,
// key = json['key'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'detailAlign' : detailAlign,
// 'hideNoteBelowLabel' : hideNoteBelowLabel,
// 'highlight' : highlight,
// 'noteBelow' : noteBelow,
// 'persistColumn' : persistColumn,
// 'showColumn' : showColumn,
// 'hideDetail' : hideDetail,
// 'key' : key
// };
// }
//
// class CourseSectionFieldSettings {
// final String? detailAlign;
// final bool? hideNoteBelowLabel;
// final bool? highlight;
// final bool? noteBelow;
// final bool? persistColumn;
// final bool? showColumn;
// final bool? hideDetail;
// final String? key;
//
// CourseSectionFieldSettings({
// this.detailAlign,
// this.hideNoteBelowLabel,
// this.highlight,
// this.noteBelow,
// this.persistColumn,
// this.showColumn,
// this.hideDetail,
// this.key,
// });
//
// CourseSectionFieldSettings.fromJson(Map<String, dynamic> json)
//     : detailAlign = json['detailAlign'] as String?,
// hideNoteBelowLabel = json['hideNoteBelowLabel'] as bool?,
// highlight = json['highlight'] as bool?,
// noteBelow = json['noteBelow'] as bool?,
// persistColumn = json['persistColumn'] as bool?,
// showColumn = json['showColumn'] as bool?,
// hideDetail = json['hideDetail'] as bool?,
// key = json['key'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'detailAlign' : detailAlign,
// 'hideNoteBelowLabel' : hideNoteBelowLabel,
// 'highlight' : highlight,
// 'noteBelow' : noteBelow,
// 'persistColumn' : persistColumn,
// 'showColumn' : showColumn,
// 'hideDetail' : hideDetail,
// 'key' : key
// };
// }
//
// class CurrentSectionFieldSettings {
// final String? detailAlign;
// final bool? hideNoteBelowLabel;
// final bool? highlight;
// final bool? noteBelow;
// final bool? persistColumn;
// final bool? showColumn;
// final bool? hideDetail;
// final String? key;
//
// CurrentSectionFieldSettings({
// this.detailAlign,
// this.hideNoteBelowLabel,
// this.highlight,
// this.noteBelow,
// this.persistColumn,
// this.showColumn,
// this.hideDetail,
// this.key,
// });
//
// CurrentSectionFieldSettings.fromJson(Map<String, dynamic> json)
//     : detailAlign = json['detailAlign'] as String?,
// hideNoteBelowLabel = json['hideNoteBelowLabel'] as bool?,
// highlight = json['highlight'] as bool?,
// noteBelow = json['noteBelow'] as bool?,
// persistColumn = json['persistColumn'] as bool?,
// showColumn = json['showColumn'] as bool?,
// hideDetail = json['hideDetail'] as bool?,
// key = json['key'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'detailAlign' : detailAlign,
// 'hideNoteBelowLabel' : hideNoteBelowLabel,
// 'highlight' : highlight,
// 'noteBelow' : noteBelow,
// 'persistColumn' : persistColumn,
// 'showColumn' : showColumn,
// 'hideDetail' : hideDetail,
// 'key' : key
// };
// }
//
// class EditCurrentSectionFieldSettings {
// final String? detailAlign;
// final bool? hideNoteBelowLabel;
// final bool? highlight;
// final bool? noteBelow;
// final bool? persistColumn;
// final bool? showColumn;
// final bool? hideDetail;
// final String? key;
//
// EditCurrentSectionFieldSettings({
// this.detailAlign,
// this.hideNoteBelowLabel,
// this.highlight,
// this.noteBelow,
// this.persistColumn,
// this.showColumn,
// this.hideDetail,
// this.key,
// });
//
// EditCurrentSectionFieldSettings.fromJson(Map<String, dynamic> json)
//     : detailAlign = json['detailAlign'] as String?,
// hideNoteBelowLabel = json['hideNoteBelowLabel'] as bool?,
// highlight = json['highlight'] as bool?,
// noteBelow = json['noteBelow'] as bool?,
// persistColumn = json['persistColumn'] as bool?,
// showColumn = json['showColumn'] as bool?,
// hideDetail = json['hideDetail'] as bool?,
// key = json['key'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'detailAlign' : detailAlign,
// 'hideNoteBelowLabel' : hideNoteBelowLabel,
// 'highlight' : highlight,
// 'noteBelow' : noteBelow,
// 'persistColumn' : persistColumn,
// 'showColumn' : showColumn,
// 'hideDetail' : hideDetail,
// 'key' : key
// };
// }
//
// class LearningCommunitySectionFieldSettings {
// final String? detailAlign;
// final bool? hideNoteBelowLabel;
// final bool? highlight;
// final bool? noteBelow;
// final bool? persistColumn;
// final bool? showColumn;
// final bool? hideDetail;
// final String? key;
//
// LearningCommunitySectionFieldSettings({
// this.detailAlign,
// this.hideNoteBelowLabel,
// this.highlight,
// this.noteBelow,
// this.persistColumn,
// this.showColumn,
// this.hideDetail,
// this.key,
// });
//
// LearningCommunitySectionFieldSettings.fromJson(Map<String, dynamic> json)
//     : detailAlign = json['detailAlign'] as String?,
// hideNoteBelowLabel = json['hideNoteBelowLabel'] as bool?,
// highlight = json['highlight'] as bool?,
// noteBelow = json['noteBelow'] as bool?,
// persistColumn = json['persistColumn'] as bool?,
// showColumn = json['showColumn'] as bool?,
// hideDetail = json['hideDetail'] as bool?,
// key = json['key'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'detailAlign' : detailAlign,
// 'hideNoteBelowLabel' : hideNoteBelowLabel,
// 'highlight' : highlight,
// 'noteBelow' : noteBelow,
// 'persistColumn' : persistColumn,
// 'showColumn' : showColumn,
// 'hideDetail' : hideDetail,
// 'key' : key
// };
// }
//
// class ModalSectionFieldSettings {
// final String? detailAlign;
// final bool? hideNoteBelowLabel;
// final bool? highlight;
// final bool? noteBelow;
// final bool? persistColumn;
// final bool? showColumn;
// final bool? hideDetail;
// final String? key;
//
// ModalSectionFieldSettings({
// this.detailAlign,
// this.hideNoteBelowLabel,
// this.highlight,
// this.noteBelow,
// this.persistColumn,
// this.showColumn,
// this.hideDetail,
// this.key,
// });
//
// ModalSectionFieldSettings.fromJson(Map<String, dynamic> json)
//     : detailAlign = json['detailAlign'] as String?,
// hideNoteBelowLabel = json['hideNoteBelowLabel'] as bool?,
// highlight = json['highlight'] as bool?,
// noteBelow = json['noteBelow'] as bool?,
// persistColumn = json['persistColumn'] as bool?,
// showColumn = json['showColumn'] as bool?,
// hideDetail = json['hideDetail'] as bool?,
// key = json['key'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'detailAlign' : detailAlign,
// 'hideNoteBelowLabel' : hideNoteBelowLabel,
// 'highlight' : highlight,
// 'noteBelow' : noteBelow,
// 'persistColumn' : persistColumn,
// 'showColumn' : showColumn,
// 'hideDetail' : hideDetail,
// 'key' : key
// };
// }
//
// class ScheduleSectionFieldSettings {
// final String? detailAlign;
// final bool? hideNoteBelowLabel;
// final bool? highlight;
// final bool? noteBelow;
// final bool? persistColumn;
// final bool? showColumn;
// final bool? hideDetail;
// final String? key;
//
// ScheduleSectionFieldSettings({
// this.detailAlign,
// this.hideNoteBelowLabel,
// this.highlight,
// this.noteBelow,
// this.persistColumn,
// this.showColumn,
// this.hideDetail,
// this.key,
// });
//
// ScheduleSectionFieldSettings.fromJson(Map<String, dynamic> json)
//     : detailAlign = json['detailAlign'] as String?,
// hideNoteBelowLabel = json['hideNoteBelowLabel'] as bool?,
// highlight = json['highlight'] as bool?,
// noteBelow = json['noteBelow'] as bool?,
// persistColumn = json['persistColumn'] as bool?,
// showColumn = json['showColumn'] as bool?,
// hideDetail = json['hideDetail'] as bool?,
// key = json['key'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'detailAlign' : detailAlign,
// 'hideNoteBelowLabel' : hideNoteBelowLabel,
// 'highlight' : highlight,
// 'noteBelow' : noteBelow,
// 'persistColumn' : persistColumn,
// 'showColumn' : showColumn,
// 'hideDetail' : hideDetail,
// 'key' : key
// };
// }
//
// class CourseAddOptions {
// final String? id;
// final String? title;
// final bool? primary;
// final String? viewId;
// final List<dynamic>? links;
// final bool? showInDegreePlanner;
//
// CourseAddOptions({
// this.id,
// this.title,
// this.primary,
// this.viewId,
// this.links,
// this.showInDegreePlanner,
// });
//
// CourseAddOptions.fromJson(Map<String, dynamic> json)
//     : id = json['id'] as String?,
// title = json['title'] as String?,
// primary = json['primary'] as bool?,
// viewId = json['viewId'] as String?,
// links = json['links'] as List?,
// showInDegreePlanner = json['showInDegreePlanner'] as bool?;
//
// Map<String, dynamic> toJson() => {
// 'id' : id,
// 'title' : title,
// 'primary' : primary,
// 'viewId' : viewId,
// 'links' : links,
// 'showInDegreePlanner' : showInDegreePlanner
// };
// }
//
// class SwapFieldSettings {
// final String? detailAlign;
// final bool? hideNoteBelowLabel;
// final bool? highlight;
// final bool? noteBelow;
// final bool? persistColumn;
// final bool? showColumn;
// final bool? hideDetail;
// final String? key;
//
// SwapFieldSettings({
// this.detailAlign,
// this.hideNoteBelowLabel,
// this.highlight,
// this.noteBelow,
// this.persistColumn,
// this.showColumn,
// this.hideDetail,
// this.key,
// });
//
// SwapFieldSettings.fromJson(Map<String, dynamic> json)
//     : detailAlign = json['detailAlign'] as String?,
// hideNoteBelowLabel = json['hideNoteBelowLabel'] as bool?,
// highlight = json['highlight'] as bool?,
// noteBelow = json['noteBelow'] as bool?,
// persistColumn = json['persistColumn'] as bool?,
// showColumn = json['showColumn'] as bool?,
// hideDetail = json['hideDetail'] as bool?,
// key = json['key'] as String?;
//
// Map<String, dynamic> toJson() => {
// 'detailAlign' : detailAlign,
// 'hideNoteBelowLabel' : hideNoteBelowLabel,
// 'highlight' : highlight,
// 'noteBelow' : noteBelow,
// 'persistColumn' : persistColumn,
// 'showColumn' : showColumn,
// 'hideDetail' : hideDetail,
// 'key' : key
// };
// }
//
// class UserContext {
// final bool? allowCourseDemandRawData;
// final bool? allowDiagnostics;
// final bool? allowManageUsers;
// final bool? allowPreloadStudentCourses;
// final bool? allowRegistration;
// final bool? allowRegistrationWorkSheet;
// final bool? allowSendToCart;
// final bool? allowSendToEmail;
// final bool? allowSendToEnrollmentRequest;
// final bool? allowSendToStagedCart;
// final bool? allowSendToQuickEnroll;
// final bool? allowStudentUsageRawData;
// final bool? allowStudentUsageReports;
// final bool? allowSwap;
// final bool? allowWorksheet;
// final bool? isAdmin;
// final bool? isAdvisorNoAction;
// final bool? isCivitasUser;
// final bool? isGuest;
// final bool? isSelf;
// final int? registrationWorkSheetIdCount;
// final bool? showRegistrationInstructions;
// final int? studentAppUserId;
//
// UserContext({
// this.allowCourseDemandRawData,
// this.allowDiagnostics,
// this.allowManageUsers,
// this.allowPreloadStudentCourses,
// this.allowRegistration,
// this.allowRegistrationWorkSheet,
// this.allowSendToCart,
// this.allowSendToEmail,
// this.allowSendToEnrollmentRequest,
// this.allowSendToStagedCart,
// this.allowSendToQuickEnroll,
// this.allowStudentUsageRawData,
// this.allowStudentUsageReports,
// this.allowSwap,
// this.allowWorksheet,
// this.isAdmin,
// this.isAdvisorNoAction,
// this.isCivitasUser,
// this.isGuest,
// this.isSelf,
// this.registrationWorkSheetIdCount,
// this.showRegistrationInstructions,
// this.studentAppUserId,
// });
//
// UserContext.fromJson(Map<String, dynamic> json)
//     : allowCourseDemandRawData = json['allowCourseDemandRawData'] as bool?,
// allowDiagnostics = json['allowDiagnostics'] as bool?,
// allowManageUsers = json['allowManageUsers'] as bool?,
// allowPreloadStudentCourses = json['allowPreloadStudentCourses'] as bool?,
// allowRegistration = json['allowRegistration'] as bool?,
// allowRegistrationWorkSheet = json['allowRegistrationWorkSheet'] as bool?,
// allowSendToCart = json['allowSendToCart'] as bool?,
// allowSendToEmail = json['allowSendToEmail'] as bool?,
// allowSendToEnrollmentRequest = json['allowSendToEnrollmentRequest'] as bool?,
// allowSendToStagedCart = json['allowSendToStagedCart'] as bool?,
// allowSendToQuickEnroll = json['allowSendToQuickEnroll'] as bool?,
// allowStudentUsageRawData = json['allowStudentUsageRawData'] as bool?,
// allowStudentUsageReports = json['allowStudentUsageReports'] as bool?,
// allowSwap = json['allowSwap'] as bool?,
// allowWorksheet = json['allowWorksheet'] as bool?,
// isAdmin = json['isAdmin'] as bool?,
// isAdvisorNoAction = json['isAdvisorNoAction'] as bool?,
// isCivitasUser = json['isCivitasUser'] as bool?,
// isGuest = json['isGuest'] as bool?,
// isSelf = json['isSelf'] as bool?,
// registrationWorkSheetIdCount = json['registrationWorkSheetIdCount'] as int?,
// showRegistrationInstructions = json['showRegistrationInstructions'] as bool?,
// studentAppUserId = json['studentAppUserId'] as int?;
//
// Map<String, dynamic> toJson() => {
// 'allowCourseDemandRawData' : allowCourseDemandRawData,
// 'allowDiagnostics' : allowDiagnostics,
// 'allowManageUsers' : allowManageUsers,
// 'allowPreloadStudentCourses' : allowPreloadStudentCourses,
// 'allowRegistration' : allowRegistration,
// 'allowRegistrationWorkSheet' : allowRegistrationWorkSheet,
// 'allowSendToCart' : allowSendToCart,
// 'allowSendToEmail' : allowSendToEmail,
// 'allowSendToEnrollmentRequest' : allowSendToEnrollmentRequest,
// 'allowSendToStagedCart' : allowSendToStagedCart,
// 'allowSendToQuickEnroll' : allowSendToQuickEnroll,
// 'allowStudentUsageRawData' : allowStudentUsageRawData,
// 'allowStudentUsageReports' : allowStudentUsageReports,
// 'allowSwap' : allowSwap,
// 'allowWorksheet' : allowWorksheet,
// 'isAdmin' : isAdmin,
// 'isAdvisorNoAction' : isAdvisorNoAction,
// 'isCivitasUser' : isCivitasUser,
// 'isGuest' : isGuest,
// 'isSelf' : isSelf,
// 'registrationWorkSheetIdCount' : registrationWorkSheetIdCount,
// 'showRegistrationInstructions' : showRegistrationInstructions,
// 'studentAppUserId' : studentAppUserId
// };
// }
//
// class UserSettings {
// final int? padding;
// final CustomSettings? customSettings;
//
// UserSettings({
// this.padding,
// this.customSettings,
// });
//
// UserSettings.fromJson(Map<String, dynamic> json)
//     : padding = json['padding'] as int?,
// customSettings = (json['customSettings'] as Map<String,dynamic>?) != null ? CustomSettings.fromJson(json['customSettings'] as Map<String,dynamic>) : null;
//
// Map<String, dynamic> toJson() => {
// 'padding' : padding,
// 'customSettings' : customSettings?.toJson()
// };
// }
//
// class CustomSettings {
//
//
// CustomSettings({
//
// });
//
// CustomSettings.fromJson(Map<String, dynamic> json)
//     : ;
//
// Map<String, dynamic> toJson() => {
//
// };
// }