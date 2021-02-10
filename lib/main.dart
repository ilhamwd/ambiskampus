import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

main(List<String> args) {
  runApp(Dashboard());
}

class Splash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Center(
          child: Image(
            image: AssetImage("assets/img/fancies/loading.gif"),
            width: 50,
          ),
        ),
      ),
    ));
  }
}

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.dark));

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus.unfocus();
      },
      child: MaterialApp(home: Wrapper()),
    );
  }
}

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: AssetImage("assets/img/fancies/dashboard-header.png"),
                width: double.infinity,
              ),
              Container(
                  transform: Matrix4.translationValues(0, -50, 0),
                  child: Stack(
                    overflow: Overflow.visible,
                    children: [
                      Content(context),
                      Positioned(
                        top: -5,
                        right: 40,
                        child: Container(
                            transform: Matrix4.translationValues(0, 0, -400),
                            child: Image(
                                image: AssetImage(
                                    "assets/img/fancies/dashboard-tail.png"),
                                width: 50)),
                      ),
                    ],
                  ))
            ],
          ),
        ));
  }
}

Widget Content(BuildContext context) {
  Radius containerRadius = Radius.circular(20);

  return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: containerRadius,
            topRight: containerRadius,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(.1),
              blurRadius: 10,
              spreadRadius: 3,
            )
          ]),
      child: Padding(
        padding: EdgeInsets.all(25),
        child: Column(
          children: [
            ATextField(),
            Features(context),
          ],
        ),
      ));
}

class FeatureData {
  var icon;
  var title;
  FeatureData(icon, title) {
    this.icon = icon;
    this.title = title;
  }
}

Widget Features(BuildContext context) {
  double a = MediaQuery.of(context).size.width;
  a += 50;
  return Container(
      margin: EdgeInsets.only(top: 30),
      width: double.infinity,
      child: Column(children: [
        Container(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Feature(
                  first: true,
                  color: Colors.orange,
                  feature: new FeatureData("history.png", "History Tryout")),
              Feature(
                  color: Colors.cyan,
                  feature: new FeatureData("rangkuman.png", "Rangkuman")),
              Feature(
                  color: Colors.green,
                  feature: new FeatureData("bejur.png", "Bedah Jurusan")),
              Feature(feature: new FeatureData("graph.png", "Progress")),
            ],
          ),
        ),
        Section(
            Container(
              width: a,
              transform: Matrix4.translationValues(-25, 0, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(children: [
                  Text(a.toString()),
                  myCustomView(),
                  myCustomView(),
                  myCustomView(),
                  myCustomView(),
                  myCustomView(),
                  myCustomView(),
                  myCustomView(),
                  myCustomView(),
                  myCustomView(),
                  myCustomView(),
                  myCustomView(),
                ]),
              ),
            ),
            "For you"),
      ]));
}

Widget Feature({first: false, last: false, color: Colors.blue, feature}) {
  first = false;
  last = false;
  double x = 10, y = 15;
  return Expanded(
      flex: 1,
      child: Container(
        margin: EdgeInsets.only(left: !first ? 2 : 0, right: !last ? 2 : 0),
        decoration:
            BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(10))),
        child: Padding(
          padding: EdgeInsets.only(top: y, bottom: y, left: x, right: x),
          child: Center(
            child: Column(
              children: [
                FittedBox(
                  child: Image(
                    image: AssetImage("assets/img/features/" + feature.icon),
                    width: 38,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(feature.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Color(0xff666666),
                        fontSize: 13,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
        ),
      ));
}

Widget Section(Widget child, String title) {
  return Container(
      margin: EdgeInsets.only(top: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              title,
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff637982)),
            ),
          ),
          Container(margin: EdgeInsets.only(top: 10), child: child)
        ],
      ));
}

Widget myCustomView() {
  return Container(
    margin: EdgeInsets.only(left: 5, right: 5),
    decoration: BoxDecoration(
        color: Colors.blue, borderRadius: BorderRadius.all(Radius.circular(3))),
    child: Padding(
      padding: EdgeInsets.all(60),
    ),
  );
}

class ATextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(30)),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.05),
                blurRadius: 8,
                spreadRadius: 3,
              )
            ]),
        child: TextField(
          style: TextStyle(
            fontSize: 17,
          ),
          decoration: InputDecoration(
            hintStyle: TextStyle(color: Colors.black.withOpacity(.4)),
            contentPadding:
                EdgeInsets.only(top: 20, bottom: 20, left: 30, right: 30),
            hintText: "Cari sesuatu",
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ));
  }
}
