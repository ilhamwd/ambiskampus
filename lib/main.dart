import 'package:ambiskampus_flutter/reusable-components/Clickable.dart';
import 'package:ambiskampus_flutter/reusable-components/DefaultPaddingArea.dart';
import 'package:ambiskampus_flutter/reusable-components/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xffeeeeee)));
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xffeeeeee),
        body: SafeArea(
          child: DefaultPaddingArea(
            child: Column(
              children: [
                DefaultButton(
                  fill: true,
                  onTap: () {},
                  value: "assalamualaikum ",
                ),
                Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(.05),
                          offset: Offset(3, 3),
                          blurRadius: 8.0,
                          spreadRadius: 0,
                        )
                      ],
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    transform: Matrix4.translationValues(0, 10, 0),
                    width: 250,
                    child: Stack(
                      children: [
                        Padding(
                            padding: EdgeInsets.all(20), child: Text("TPS 4")),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Container(
                            width: 70,
                            height: 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.blue.withGreen(180).withAlpha(80),
                            ),
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
