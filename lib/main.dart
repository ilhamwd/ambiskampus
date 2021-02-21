import 'package:ambiskampus_flutter/reusable-components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

 void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.orange, statusBarBrightness: Brightness.dark));
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.orange,
        body: Center(
          child: DefaultButton(
            fill: true,
            onTap: () {},
            value: "ASU",
          ),
        ),
      ),
    );
  }
}
