import 'dart:ffi';

import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  String value;
  Function onTap;

  DefaultButton({this.onTap, this.value});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: this.onTap,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.06),
                offset: Offset(0, 3),
                blurRadius: 5,
                spreadRadius: 1,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(4)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              this.value.toUpperCase(),
              style: TextStyle(
                fontSize: 16,
                color: Colors.blueGrey.withOpacity(.85),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
