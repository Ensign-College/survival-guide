import 'package:flutter/material.dart';
import 'colors.dart';

TextStyle headerTextStyle() {
  return TextStyle(
      color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold);
}

TextStyle cellTextStyle() {
  return TextStyle(
    color: textColor,
    fontSize: 16.0,
    overflow: TextOverflow.ellipsis,
  );
}
