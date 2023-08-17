import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:survival_guide/Views/Scheduler/scheduler.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:survival_guide/constants/developer.dart';
import 'package:survival_guide/constants/showDialog.dart';

class SAMLLogin extends StatefulWidget {
  @override
  _SAMLLoginState createState() => _SAMLLoginState();
}

class _SAMLLoginState extends State<SAMLLogin> {
  final String samlRequestUrl =
      "https://ensign.collegescheduler.com/api/terms/2023%20Fall%20Semester/subjects";
  late InAppWebViewController controller;
  String appUrl = "SAML login";

  @override
  void initState() {
    super.initState();
  }

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
          onLoadStart: (InAppWebViewController controller, Uri? url) async {
            printWrapped("On load start: $url");
            if (url != null &&
                url.toString() == 'https://civitaslearning.auth0.com/login/callback?connection=ensign') {
              print("civitas making auth0 callback");
              // JavaScript to extract the value of the __RequestVerificationToken input field
              final jsScript = '''
      document.querySelector('input[name="__RequestVerificationToken"]').value;
    ''';

              // Evaluating JavaScript within the WebView context
              final token = await controller.evaluateJavascript(source: jsScript);

              if (token != null) {
                print("Extracted token: $token");

                // Store the token into SharedPreferences or use it however you need
                SharedPreferences prefs = await SharedPreferences.getInstance();
                await prefs.setString('xcrf-token', token);
              } else {
                print("Token not found.");
              }

            }
          },

          onLoadStop: (InAppWebViewController controller, Uri? url) async {
            setState(() {
              appUrl = url.toString();
              printWrapped("On Load stop: $appUrl");
            });
              if (url != null &&
                url.toString() == 'https://ensign.collegescheduler.com/entry') {
              // Retrieve cookies
              final cookies =
                  await CookieManager.instance().getCookies(url: url);
              final String? setCookieValue = cookies
                  .firstWhere((cookie) => cookie.name == '.AspNet.Cookies')
                  .value;
              final String? setTokenValue = cookies
                  .firstWhere(
                      (cookie) => cookie.name == '__RequestVerificationToken')
                  .value;

              printWrapped("all cookies: $cookies");

              if (setCookieValue != null) {
              print("verification token on login: $setTokenValue");
                if (setCookieValue != null) {
                  // Save the cookie using shared preferences
                  final prefs = await SharedPreferences.getInstance();
                  await prefs.setString('.AspNet.Cookies', setCookieValue);
                  if (setTokenValue != null) {
                    await prefs.setString(
                        '__RequestVerificationToken', setTokenValue!);
                  } else {
                    alert(context, 'Token value is null');
                  }
                }

                Navigator.pop(context);
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => SchedulerTermsList(
                            cookie:
                                setCookieValue))); // Pass the cookie to the new page
              }
            }
          }),
    );
  }
}
