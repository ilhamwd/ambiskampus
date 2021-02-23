import 'package:flutter/material.dart';

class Clickable extends StatefulWidget {
  Widget child;
  Function onTap;
  double radius;

  Clickable({this.child, this.onTap, this.radius: 5.0});

  @override
  _ClickableState createState() => _ClickableState(
        child: child,
        onTap: onTap,
        radius: radius,
      );
}

class _ClickableState extends State<Clickable> {
  bool _down = false;
  Widget child;
  Function onTap;
  double radius;

  _ClickableState({this.child, this.onTap, this.radius});

  switchState() {
    this.setState(() {
      _down = !_down;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(radius);
    return GestureDetector(
        onTap: onTap,
        onTapDown: (TapDownDetails _) {
          this.switchState();
        },
        onTapUp: (TapUpDetails _) {
          this.switchState();
        },
        onTapCancel: () {
          this.switchState();
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
            borderRadius: BorderRadius.all(Radius.circular(radius)),
          ),
          child: child,
        ));
  }
}
