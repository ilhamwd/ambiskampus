import 'package:ambiskampus_flutter/helpers/colors.dart';
import 'package:flutter/material.dart';

Widget TitleText(
    {String text,
    double fontSize: 17,
    FontWeight fontWeight: FontWeight.bold,
    Color color}) {
  return Text(text,
      style: TextStyle(
        color: (color == null) ? DefaultColors.title : color,
        fontSize: fontSize,
        fontWeight: fontWeight,
      ));
}
