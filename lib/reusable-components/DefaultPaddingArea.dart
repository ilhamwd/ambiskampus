import 'package:flutter/widgets.dart';

Widget DefaultPaddingArea({Widget child}) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: child,
  );
}
