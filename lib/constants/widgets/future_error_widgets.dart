import 'package:flutter/widgets.dart';

import '../colors.dart';

Widget buildErrorWidget(dynamic error) {
  return Center(
    child: Text(
      'Error: $error',
      style: TextStyle(color: textColor, fontSize: 16.0),
    ),
  );
}

Widget buildNoDataWidget() {
  return Center(
    child: Text(
      'No data available.',
      style: TextStyle(color: textColor, fontSize: 16.0),
    ),
  );
}