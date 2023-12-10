class SchedulerSubjectModel {
  final String id;
  final String short;
  final String long;
  final String title;

  SchedulerSubjectModel(
      {required this.id,
      required this.short,
      required this.long,
      required this.title});

  factory SchedulerSubjectModel.fromJson(Map<String, dynamic> json) {
    return SchedulerSubjectModel(
      id: json['id'],
      short: json['short'],
      long: json['long'],
      title: json['title'],
    );
  }
}
