import 'package:ambiskampus_flutter/reusable-components/Clickable.dart';
import 'package:flutter/material.dart';

Widget DefaultButton({String value, Function onTap, bool fill: false}) {
  return Clickable(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: Text(
        value.toUpperCase(),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 15,
          color: Colors.black.withBlue(100).withGreen(80).withOpacity(.8),
          fontWeight: FontWeight.bold,
        ),
      ),
    ),
  );
}
