import 'package:flutter/material.dart';
import 'package:survival_guide/constants/text.dart';
import 'package:survival_guide/models/SchedulerDesiredCoursesModel.dart';

Widget buildDismissibleCell({
  required BuildContext context,
  required String title,
  required Function onDeleteCallback,
  required SchedulerDesiredCoursesModel course,
}) {
  return Dismissible(
    key: UniqueKey(), // Ensure each item has a unique key
    direction: DismissDirection.endToStart, // Only allow swiping from right to left
    onDismissed: (direction) async {
      try {
        await onDeleteCallback();
        // Optionally: Refresh your data or remove the course from your data list to reflect the change in the UI.
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text('Error during operation.'),
        ));
      }
    },
    background: Container(
      color: Colors.red, // Background color when swiping
      child: Align(
        alignment: Alignment.centerRight,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            const Icon(Icons.delete, color: Colors.white),
            Text(
              ' $title',
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
      ),
    ),
    child: Text(course.courseKey, style: cellTextStyle()), // Assuming you have this function globally accessible
  );
}
