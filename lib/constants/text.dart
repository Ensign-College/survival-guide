import 'package:flutter/material.dart';
import 'colors.dart';

TextStyle headerTextStyle() {
  return TextStyle(
      color: textColor, fontSize: 20.0, fontWeight: FontWeight.bold);
}

TextStyle survivalGuideCellTextStyle() {
  return TextStyle(
    color: textColor,
    fontSize: 16.0,
    overflow: TextOverflow.ellipsis,
  );
}

String toShortDateString(DateTime dateTime) {
  return "${dateTime.month.toString().padLeft(2, '0')}/${dateTime.day.toString().padLeft(2, '0')}/${dateTime.year.toString()}";
}