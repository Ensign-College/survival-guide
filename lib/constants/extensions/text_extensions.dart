import 'package:flutter/material.dart';

extension SurvivalGuideWhiteText on Text {
  Text get survivalGuideWhiteText => Text(
    data!,
    style: style?.copyWith(color: Colors.white) ?? const TextStyle(color: Colors.white),
  );
}