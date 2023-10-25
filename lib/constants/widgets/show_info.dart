import 'package:flutter/material.dart';
import 'package:survival_guide/constants/DateTime.dart';
import 'package:survival_guide/constants/extensions/text_extensions.dart';

import '../colors.dart';
import '../format_time.dart';

void showInfo(BuildContext context, Widget view) {
  showDialog(
    context: context,
    builder: (context) {

      return AlertDialog(
        backgroundColor: appBackgroundColor, // Set the background color
        content: SingleChildScrollView(
          child: view
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close').survivalGuideWhiteText,
          ),
        ],
      );
    },
  );
}