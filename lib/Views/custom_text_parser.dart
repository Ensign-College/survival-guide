import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class CustomTextParserWidget extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomTextParserWidget({super.key, required this.text, required this.fontSize});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: RichText(
        text: TextSpan( children: _parseText(text),
          style: TextStyle(fontSize: fontSize),),

      ),
    );
  }

  List<TextSpan> _parseText(String text) {
    final RegExp urlRegex = RegExp(
        r'(https?:\/\/(?:www\.|(?!www))[^\s\.]+\.[^\s]{2,}|www\.[^\s]+\.[^\s]{2,})');
    final RegExp phoneRegex =
        RegExp(r'\+?\d{1,4}?[-.●]?(\d{2,3}[-.●]?){1,2}\d{4}');
   final  RegExp emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
    final RegExp combinedRegex =
        RegExp('(${urlRegex.pattern})|(${phoneRegex.pattern})');

    List<TextSpan> textSpans = [];

    text.splitMapJoin(
      combinedRegex,
      onMatch: (Match match) {
        final matchedText = match.group(0)!;

        if (urlRegex.hasMatch(matchedText)) {
          textSpans.add(
            TextSpan(
              text: matchedText,
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  if (await canLaunchUrl(Uri.parse(matchedText))) {
                    await launchUrl(Uri.parse(matchedText));
                  }
                },
            ),
          );
        } else if (phoneRegex.hasMatch(matchedText)) {
          textSpans.add(
            TextSpan(
              text: matchedText,
              style: const TextStyle(color: Colors.green),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  final url = 'tel:$matchedText';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  }
                },
            ),
          );
        } else if (emailRegex.hasMatch(matchedText)) {
          textSpans.add(
            TextSpan(
              text: matchedText,
              style: const TextStyle(color: Colors.blue),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  final url = 'mailto:$matchedText';
                  if (await canLaunchUrl(Uri.parse(url))) {
                    await launchUrl(Uri.parse(url));
                  }
                },
            ),
          );
        }
        return matchedText;
      },
      onNonMatch: (String nonMatch) {
        textSpans.add(
          TextSpan(text: nonMatch, style: const TextStyle(color: Colors.white)),
        );
        return nonMatch;
      },
    );
    return textSpans;
  }
}
