import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:survival_guide/constants/developer.dart';
import 'dart:convert';
import 'package:survival_guide/models/SchedulerAppDataModel.dart';

import 'package:survival_guide/models/SchedulerCourseModel.dart';
import 'package:survival_guide/models/SchedulerGenerateCoursesModel.dart';
import 'package:survival_guide/models/SchedulerSubjectModel.dart';
import 'package:survival_guide/models/SchedulerTermDataModel.dart';

import '../constants/preferences.dart';
import '../models/SchedulerDesiredCoursesModel.dart';

class SchedulerApiService {
  final String cookie;
  final String schedulerURL = "https://ensign.collegescheduler.com/api/";
  late final headers;

  SchedulerApiService({required this.cookie}) {
    headers = {
      'Content-Type': 'application/json',
      'Cookie': '.AspNet.Cookies=$cookie'
    };
  }

  Future<List<SchedulerSubjectModel>> fetchSubjects(String term) async {
    final response = await http.get(
      Uri.parse('${schedulerURL}terms/$term/subjects'),
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

  Future<SchedulerTermDataModel> fetchTermData(String term) async {
    final response = await http.get(
      Uri.parse('${schedulerURL}term-data/$term'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      final termData = SchedulerTermDataModel.fromJson(parsedJson);
      return termData;
    } else {
      throw Exception('Failed to load term data');
    }
  }

  Future<List<SchedulerDesiredCoursesModel>> fetchDesiredCourse(String term) async {
    final response = await http.get(
      Uri.parse('$schedulerURL/terms/$term/desiredcourses'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final List<dynamic> parsedJsonList = jsonDecode(response.body);
      final desiredCoursesData = parsedJsonList.map((json) => SchedulerDesiredCoursesModel.fromJson(json)).toList();
      printWrapped('Desired courses: $desiredCoursesData');
      return desiredCoursesData;
    } else {
      throw Exception('Failed to load desired courses');
    }
  }


  Future<void> postDesiredCourse(String number, String subjectId,String term,
      [String? topic]) async {
    final Uri url = Uri.parse(
        '$schedulerURL/terms/$term/desiredcourses');

    final body =  jsonEncode({'number': number, 'subjectId': subjectId, 'topic': topic});
    final schedulerToken = await getValueFromPreferences("__RequestVerificationToken");
    final xcrfToken = await getValueFromPreferences("xcrf-token");

    print('Scheduler token: $schedulerToken');
    debugPrint('Body: $body');

    // We need all these headers to make the server think we are a browser
    final response = await http.post(url,
      headers: {
        'Accept': 'application/json',
        'Accept-Language': 'en-US,en;q=0.5',
        'Accept-Encoding': 'gzip, deflate, br',
        'Content-Type': 'application/json',
        'X-XSRF-Token': xcrfToken!,
        'X-Requested-With': 'XMLHttpRequest',
        'Sec-Fetch-Dest': 'empty',
        'Sec-Fetch-Mode': 'cors',
        'Sec-Fetch-Site': 'same-origin',
        'Cookie': '.AspNet.Cookies=$cookie; __RequestVerificationToken=$schedulerToken',
        'Referer': 'https://ensign.collegescheduler.com/terms/2023%20Fall%20Semester/courses/add',
        'DNT': '1',
        'Connection': 'keep-alive',
        'Origin': 'https://ensign.collegescheduler.com',
        'Content-Length': body.length.toString(),
      },
      body: body);

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
    } else {
      printWrapped('reason: ${response.reasonPhrase} isRedirect: ${response.isRedirect} header: ${response.headers}');
      throw Exception(
          'Failed to post desired course ${response.statusCode}  ');
    }
  }

  Future<void> deleteDesiredCourse(String term, String courseNumber) async {
    debugPrint("term: $term courseNumber: $courseNumber");
    debugPrint("courseNumber: $courseNumber");
    final Uri url = Uri.parse('$schedulerURL/terms/$term/desiredcourses/$courseNumber');
    print("request url: $url");

    final schedulerToken = await getValueFromPreferences('__RequestVerificationToken');
    final xcrfToken = await getValueFromPreferences('xcrf-token');
    final response = await http.delete(url,
        headers: {
          'Accept': 'application/json',
          'Accept-Language': 'en-US,en;q=0.5',
          'Accept-Encoding': 'gzip, deflate, br',
          'X-XSRF-Token': xcrfToken!,
          'X-Requested-With': 'XMLHttpRequest',
          'Sec-Fetch-Dest': 'empty',
          'Sec-Fetch-Mode': 'cors',
          'Sec-Fetch-Site': 'same-origin',
          'Cookie': '.AspNet.Cookies=$cookie; __RequestVerificationToken=$schedulerToken',
          'Referer': 'https://ensign.collegescheduler.com/terms/2023%20Fall%20Semester/courses/add',
          'DNT': '1',
          'Connection': 'keep-alive',
          'Origin': 'https://ensign.collegescheduler.com',
        },
        body: '{}'); // Adding empty JSON payload

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
    } else {
      printWrapped('reason: ${response.reasonPhrase} isRedirect: ${response.isRedirect} header: ${response.headers}');
      throw Exception('Failed to delete the course ${response.statusCode}');
    }
  }

  Future<SchedulerGenerateCoursesModel> generateScheduler(String term,
      List<String> courses, List<Map<String, dynamic>> currentSections, List<dynamic> breaks ) async {
    final Uri url = Uri.parse('$schedulerURL/terms/$term/schedules/generate');

    final data = jsonEncode({
      'breaks': breaks,
      'cartSections': [],
      'courses': courses,
      'currentSections': currentSections,
      'padding': 0,
    });

    final schedulerToken = await getValueFromPreferences("__RequestVerificationToken");
    final xcrfToken = await getValueFromPreferences("xcrf-token");
    final cookie = await getValueFromPreferences(".AspNet.Cookies");

    print('Scheduler token: $schedulerToken');
    debugPrint('Data: $data');

    final response = await http.post(url,
        headers: {
          'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:109.0) Gecko/20100101 Firefox/116.0',
          'Accept': 'application/json',
          'Accept-Language': 'en-US,en;q=0.5',
          'Accept-Encoding': 'gzip, deflate, br',
          'Referer': 'https://ensign.collegescheduler.com/scheduler',
          'Content-Type': 'application/json',
          'X-XSRF-Token': xcrfToken!,
          'X-Requested-With': 'XMLHttpRequest',
          'Origin': 'https://ensign.collegescheduler.com',
          'DNT': '1',
          'Connection': 'keep-alive',
          'Cookie': '.AspNet.Cookies=$cookie; __RequestVerificationToken=$schedulerToken',
          'Sec-Fetch-Dest': 'empty',
          'Sec-Fetch-Mode': 'cors',
          'Sec-Fetch-Site': 'same-origin',
          'TE': 'trailers',
        },
        body: data);

    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      final generatedScheduleResponse = SchedulerGenerateCoursesModel.fromJson(parsedJson);
      print("Generated schedule: ${generatedScheduleResponse.warnings.first.warning}");
      return generatedScheduleResponse;
    } else {
      print('Reason: ${response.reasonPhrase} isRedirect: ${response.isRedirect} header: ${response.headers}');
      throw Exception('Failed to generate schedule ${response.statusCode}');
    }
  }


}
