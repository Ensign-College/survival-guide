import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:survival_guide/constants/colors.dart';

import '../models/SchedulerGenerateCoursesModel.dart';

void alert(BuildContext context, String content) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: Text('Error'),
      content: Text(content),
      backgroundColor: constantCardBackgroundColor,
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text('Close'),
        ),
      ],
    ),
  );
}