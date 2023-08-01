import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:http/http.dart' as http;
import 'package:survival_guide/Views/Scheduler/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SAMLLogin extends StatefulWidget {
  @override
  _SAMLLoginState createState() => _SAMLLoginState();
}

class _SAMLLoginState extends State<SAMLLogin> {
  final String samlRequestUrl =
      "https://ensign.collegescheduler.com/api/terms/2023%20Fall%20Semester/subjects";
  late InAppWebViewController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("SAML Login")),
      body: InAppWebView(
          initialUrlRequest: URLRequest(url: Uri.parse(samlRequestUrl)),
          onWebViewCreated: (InAppWebViewController webViewController) {
            controller = webViewController;
          },
          onLoadStop: (InAppWebViewController controller, Uri? url) async {
            if (url != null &&
                url.toString() == 'https://ensign.collegescheduler.com/entry') {
              // Retrieve cookies
              final cookies =
                  await CookieManager.instance().getCookies(url: url);
              final String? setCookieValue = cookies
                  .firstWhere((cookie) => cookie.name == '.AspNet.Cookies')
                  .value;

              if (setCookieValue != null) {
                print("Set-Cookie value: $setCookieValue");

                // Save the cookie using shared preferences
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString('.AspNet.Cookies', setCookieValue);

                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SchedulerListPage(
                            cookie:
                                setCookieValue))); // Pass the cookie to the new page
              }
            }
          }),
    );
  }
}
