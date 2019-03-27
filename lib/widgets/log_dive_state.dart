import 'package:flutter/material.dart';

class LogDive extends StatelessWidget {
  var _height;
  @override
  Widget build(BuildContext context) {
     _height = MediaQuery.of(context).size.height;
     animateHeight();
    return Hero(
      tag: "hero-fab",
      child: AnimatedContainer(
        color: Theme.of(context).accentColor,
        padding: EdgeInsets.only(left: 30.0, right: 30.0, top: _height),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0))),
        ), duration: Duration(seconds: 1),
      ),
    );
  }

  void animateHeight(){
    _height = 100.0;
  }
}
