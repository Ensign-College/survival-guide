class SchedulerCourseModel {
  final String id;
  final String subjectLong;
  final String number;
  final String titleLong;
  final String title;

  SchedulerCourseModel({
    required this.id,
    required this.subjectLong,
    required this.number,
    required this.titleLong,
    required this.title,
  });

  factory SchedulerCourseModel.fromJson(Map<String, dynamic> json) {
    return SchedulerCourseModel(
      id: json['id'],
      subjectLong: json['subjectLong'],
      number: json['number'],
      titleLong: json['titleLong'],
      title: json['title'],
    );
  }
}
