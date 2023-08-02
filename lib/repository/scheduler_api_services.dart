import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:survival_guide/constants/developer.dart';
import 'package:survival_guide/models/SchedulerAppDataModel.dart';
import 'dart:developer';

import 'package:survival_guide/models/SchedulerCourseModel.dart';
import 'package:survival_guide/models/SchedulerSubjectModel.dart';

class SchedulerApiService {
  final String cookie;
  final String schedulerURL = "https://ensign.collegescheduler.com/api/";
  late final headers;

  SchedulerApiService({required this.cookie}) {
    headers = {'Cookie': '.AspNet.Cookies=$cookie'};
  }

  Future<List<SchedulerSubjectModel>> fetchSubjects() async {
    final response = await http.get(
      Uri.parse('${schedulerURL}terms/2023%20Fall%20Semester/subjects'),
      headers: headers,
    );
    final List<dynamic> parsedJson = jsonDecode(response.body);
    return parsedJson
        .map((subjectJson) => SchedulerSubjectModel.fromJson(subjectJson))
        .toList();
  }

  Future<List<SchedulerCourseModel>> fetchCoursesForSubject(
      String subjectId) async {
    final response = await http.get(
      Uri.parse(
          '${schedulerURL}terms/2023%20Spring%20Semester/subjects/$subjectId/courses'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final List<dynamic> parsedJson = jsonDecode(response.body);
      return parsedJson
          .map((courseJson) => SchedulerCourseModel.fromJson(courseJson))
          .toList();
    } else {
      throw Exception('Failed to load courses');
    }
  }


  Future<SchedulerAppDataModel> fetchAppData() async {
    final response = await http.get(
      Uri.parse('${schedulerURL}app-data/'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);

      final appData = SchedulerAppDataModel.fromJson(parsedJson);
      return appData;
    } else {
      throw Exception('Failed to load term data');
    }
  }


}
