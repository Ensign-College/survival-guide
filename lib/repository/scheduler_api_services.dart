import 'package:http/http.dart' as http;
import 'package:survival_guide/constants/developer.dart';
import 'dart:convert';
import 'package:survival_guide/models/SchedulerAppDataModel.dart';

import 'package:survival_guide/models/SchedulerCourseModel.dart';
import 'package:survival_guide/models/SchedulerGenerateCoursesModel.dart';
import 'package:survival_guide/models/SchedulerRegBlocksModel.dart';
import 'package:survival_guide/models/SchedulerSubjectModel.dart';
import 'package:survival_guide/models/SchedulerTermDataModel.dart' as termdata;

import '../constants/preferences.dart';
import '../models/SchedulerDesiredCoursesModel.dart';

class SchedulerApiService {
  final String cookie;
  final String schedulerURL = 'https://ensign.collegescheduler.com/api/';
  late final headers;

  SchedulerApiService({required this.cookie}) {
    headers = {
      'Content-Type': 'application/json',
      'Cookie': '.AspNet.Cookies=$cookie'
    };
  }

  Future<Map<String, String>> createHeaders(
      String cookie, int bodyLength) async {
    final schedulerToken =
        await getValueFromPreferences('__RequestVerificationToken');
    final xcrfToken = await getValueFromPreferences('xcrf-token');

    return {
      'Accept': 'application/json',
      'Accept-Language': 'en-US,en;q=0.5',
      'Accept-Encoding': 'gzip, deflate, br',
      'Content-Type': 'application/json',
      'X-XSRF-Token': xcrfToken!,
      'X-Requested-With': 'XMLHttpRequest',
      'Sec-Fetch-Dest': 'empty',
      'Sec-Fetch-Mode': 'cors',
      'Sec-Fetch-Site': 'same-origin',
      'Cookie':
          '.AspNet.Cookies=$cookie; __RequestVerificationToken=$schedulerToken',
      'Referer':
          'https://ensign.collegescheduler.com/terms/2023%20Fall%20Semester/courses/add',
      'DNT': '1',
      'Connection': 'keep-alive',
      'Origin': 'https://ensign.collegescheduler.com',
      'Content-Length': bodyLength.toString(),
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

  Future<String> fetchWebSocketToken() async {
    final headers = await createHeaders(cookie, 0);

    final response = await http.get(
      Uri.parse('$schedulerURL/oauth/student/client-credentials/token'),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      final webSocketToken = parsedJson['accessToken'];
      return webSocketToken;
    } else {
      throw Exception('Failed to load term data');
    }
  }

  Future<termdata.SchedulerTermDataModel> fetchTermData(String term) async {
    final response = await http.get(
      Uri.parse('${schedulerURL}term-data/$term'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      final termData = termdata.SchedulerTermDataModel.fromJson(parsedJson);
      return termData;
    } else {
      throw Exception('Failed to load term data');
    }
  }

  Future<SchedulerRegBlocksModel> fetchRegistrationBlocks(String term, String subject, String course) async {
    final response = await http.get(
      Uri.parse('${schedulerURL}terms/$term/subjects/$subject/courses/$course/regblocks'),
      headers: headers,
    );

    final cookie = await getValueFromPreferences('.AspNet.Cookies');
    if (response.statusCode == 200) {
      printWrapped("Response ${response.body}");
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      final registrationBlocks =
      SchedulerRegBlocksModel.fromJson(parsedJson);
      return registrationBlocks;
    } else {
      printWrapped(
          'Reason: ${response.reasonPhrase} isRedirect: ${response.isRedirect} header: ${response.headers}');
      throw Exception(
          'Failed to get registration blocks ${response.statusCode} ${response.reasonPhrase}');
    }
  }

  Future<List<SchedulerDesiredCoursesModel>> fetchDesiredCourse(
      String term) async {
    final response = await http.get(
      Uri.parse('$schedulerURL/terms/$term/desiredcourses'),
      headers: headers,
    );
    if (response.statusCode == 200) {
      final List<dynamic> parsedJsonList = jsonDecode(response.body);
      final desiredCoursesData = parsedJsonList
          .map((json) => SchedulerDesiredCoursesModel.fromJson(json))
          .toList();
      return desiredCoursesData;
    } else {
      throw Exception('Failed to load desired courses');
    }
  }

  Future<void> postDesiredCourse(String number, String subjectId, String term,
      [String? topic]) async {
    final Uri url = Uri.parse('$schedulerURL/terms/$term/desiredcourses');
    final body =
        jsonEncode({'number': number, 'subjectId': subjectId, 'topic': topic});

    final headers = await createHeaders(cookie, body.length);

    // We need all these headers to make the server think we are a browser
    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      print('Response: ${response.body}');
    } else {
      printWrapped(
          'reason: ${response.reasonPhrase} isRedirect: ${response.isRedirect} header: ${response.headers}');
      throw Exception('Failed to post desired course ${response.statusCode}  ');
    }
  }

  Future<String?> deleteDesiredCourse(String term, String courseNumber) async {
    final Uri url =
        Uri.parse('$schedulerURL/terms/$term/desiredcourses/$courseNumber');

    final headers = await createHeaders(cookie, 2);

    final response = await http.delete(url,
        headers: headers, body: '{}'); // Adding empty JSON payload

    if (response.statusCode == 204) {
      return response.body;
    } else {
      printWrapped(
          'reason: ${response.reasonPhrase} isRedirect: ${response.isRedirect} header: ${response.headers}');
      throw Exception('Failed to delete the course ${response.statusCode}');
    }
  }

  Future<SchedulerGenerateCoursesModel> generateScheduler(
      String term,
      List<String> courses,
      List<CurrentSections> currentSections,
      List<dynamic> breaks) async {
    final Uri url = Uri.parse('$schedulerURL/terms/$term/schedules/generate');

    final cookie = await getValueFromPreferences('.AspNet.Cookies');

    final currentSectionsJson = currentSections
        .map((section) => {
              'course': section.course,
              'enrollmentStatus': section.enrollmentStatus,
              'id': section.id,
              'isExternal': section.isExternal,
              'registrationNumber': section.registrationNumber,
              'subject': section.subject,
              'subjectId': section.subjectId,
              'topicId': section.topicId,
            })
        .toList();

    final body = jsonEncode({
      'breaks': breaks,
      'cartSections': [],
      'courses': courses,
      'currentSections': currentSectionsJson,
      // Use the JSON-encodable list here
      'padding': 0,
    });

    final headers = await createHeaders(cookie!, body.length);

    final response = await http.post(url, headers: headers, body: body);

    if (response.statusCode == 200) {
      final Map<String, dynamic> parsedJson = jsonDecode(response.body);
      final generatedScheduleResponse =
          SchedulerGenerateCoursesModel.fromJson(parsedJson);
      return generatedScheduleResponse;
    } else {
      printWrapped(
          'Reason: ${response.reasonPhrase} isRedirect: ${response.isRedirect} header: ${response.headers}');
      throw Exception(
          'Failed to generate schedule ${response.statusCode} ${response.reasonPhrase}');
    }
  }
}
