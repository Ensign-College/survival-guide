import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:survival_guide/constants/colors.dart';

Widget shimmerEffect(double height, {Color? baseColor, double? width}) {
  return Shimmer.fromColors(
    baseColor: baseColor ?? cardBackgroundColor,
    highlightColor: Colors.grey[100]!,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey[300],
      ),
      width: width ?? double.infinity,
      height: height,
      margin: EdgeInsets.symmetric(horizontal: 12),
    ),
  );
}
