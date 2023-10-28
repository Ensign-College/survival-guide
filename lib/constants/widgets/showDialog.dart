import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:survival_guide/constants/colors.dart';
import 'package:survival_guide/constants/developer.dart';

import '../../models/SchedulerGenerateCoursesModel.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void alert(String header, String content) {
  printWrapped("content: $content");
  showDialog(
    context: navigatorKey.currentContext!,
    builder: (context) => AlertDialog(
      title: Text(header),
      content: Text(content),
      backgroundColor: constantCardBackgroundColor,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Close'),
        ),
      ],
    ),
  );
}
