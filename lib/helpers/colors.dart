import 'package:flutter/widgets.dart';

class _Colors {
  bool dark;
  Color title, background, backgroundLight;

  _Colors({bool dark: false}) {
    List<int> lib = [0xff5d7a92, 0xffeeeeee, 0xffffffff];
    List<Color> map = lib.map((int x) {
      return Color(x);
    });

    this
      ..title = map[0]
      ..background = map[1]
      ..backgroundLight = map[2];
  }
}

_Colors DefaultColors = _Colors();
