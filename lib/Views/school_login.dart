import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survival_guide/Views/Scheduler/scheduler.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:survival_guide/constants/developer.dart';
import 'package:survival_guide/constants/widgets/showDialog.dart';

import '../constants/constant_strings.dart';

class SAMLLogin extends StatefulWidget {
  const SAMLLogin({super.key});

  @override
  SAMLLoginState createState() => SAMLLoginState();
}

class SAMLLoginState extends State<SAMLLogin> {
  final String samlRequestUrl = 'https://ensign.collegescheduler.com/api/terms/2023%20Fall%20Semester/subjects';
  late InAppWebViewController controller;
  String appUrl = 'SAML login';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(appUrl),
        backgroundColor: appBackgroundColor,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(samlRequestUrl)),
        onWebViewCreated: (InAppWebViewController webViewController) {
          controller = webViewController;
        },
        onLoadStop: (InAppWebViewController controller, Uri? url) async {
          setState(() => appUrl = url.toString());
          printWrapped('On Load stop: $appUrl');

          if (url?.toString() == 'https://ensign.collegescheduler.com/entry') {
            await _processEntryUrl(controller, url!, context);
          }
        },
      ),
    );
  }

  void _showAlert() {
    alert(alertErrorHeader,'Token value is null');
  }

  void _navigateToScheduler(String setCookieValue) {
    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => SchedulerTermsList(cookie: setCookieValue)));
  }

  Future<void> _processEntryUrl(InAppWebViewController controller, Uri url, BuildContext context) async {
    final htmlContent = await controller.getHtml();
    final RegExp regExp = RegExp(r'input name="__RequestVerificationToken".*?value="(.*?)"');
    final match = regExp.firstMatch(htmlContent!);

    String? xcrfToken = match?.group(1);
    if (xcrfToken != null) {
      debugPrint('Extracted xcrfToken: $xcrfToken');
      SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('xcrf-token', xcrfToken);
    } else {
      debugPrint('Token not found!');
    }

    final cookies = await CookieManager.instance().getCookies(url: url);
    final setCookieValue = cookies.firstWhere((cookie) => cookie.name == '.AspNet.Cookies').value;
    final setTokenValue = cookies.firstWhere((cookie) => cookie.name == '__RequestVerificationToken').value;

    if (setCookieValue != null) {
      debugPrint('verification token on login: $setTokenValue');
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('.AspNet.Cookies', setCookieValue);

      if (setTokenValue != null) {
        await prefs.setString('__RequestVerificationToken', setTokenValue);
      } else {
        _showAlert();
      }
      _navigateToScheduler(setCookieValue);
    }
  }
}
