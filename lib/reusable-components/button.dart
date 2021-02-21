import 'package:flutter/material.dart';

class DefaultButton extends StatefulWidget {
  String value;
  Function onTap;
  bool fill;

  DefaultButton({this.onTap, this.value, this.fill: false});

  @override
  _DefaultButton createState() =>
      _DefaultButton(onTap: onTap, value: value, fill: fill);
}

class _DefaultButton extends State {
  String value;
  Function onTap;
  bool _down = false, fill;
  Duration defaultDuration = Duration(milliseconds: 300);

  _DefaultButton({this.onTap, this.value, this.fill});

  cancel() {
    this.setState(() {
      _down = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTapDown: (TapDownDetails details) {
          this.setState(() {
            _down = true;
          });
        },
        onTapCancel: cancel,
        onTapUp: (TapUpDetails details) {
          cancel();
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 100),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.1),
                offset: !_down ? Offset(3, 3) : Offset(1, 1),
                blurRadius: !_down ? 8.0 : 1.0,
                spreadRadius: 0,
              )
            ],
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Text(
              value.toUpperCase(),
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15,
                color: Colors.blueGrey.withOpacity(.85),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ));
  }
}
