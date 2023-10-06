import 'package:flutter/material.dart';
import 'package:flutter/services.dart';  // Required for HapticFeedback

void showGestureModal(BuildContext context, Widget view) {
  double yOffset = 0;

  showDialog(
    context: context,
    builder: (context) {
      return StatefulBuilder(
        builder: (context, setState) {
          return GestureDetector(
            onVerticalDragUpdate: (details) {
              setState(() {
                yOffset += details.delta.dy;
              });
            },
            onVerticalDragEnd: (details) {
              if (details.primaryVelocity! > 50) {  // positive value means downward drag
                HapticFeedback.mediumImpact();  // Trigger haptic feedback
                Navigator.pop(context);
              } else {
                setState(() {
                  yOffset = 0;  // Reset the dialog position
                });
              }
            },
            child: Transform.translate(
              offset: Offset(0, yOffset),
              child: Dialog(
                child: view,
              ),
            ),
          );
        },
      );
    },
  );
}
