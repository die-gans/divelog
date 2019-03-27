import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class EasingAnimationWidget extends StatefulWidget {
  @override
  EasingAnimationWidgetState createState() => EasingAnimationWidgetState();
}

class EasingAnimationWidgetState extends State<EasingAnimationWidget>
    with TickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;

  @override
  Widget build(BuildContext context) {
    final screenDimens = MediaQuery.of(context).size;
    final double height = screenDimens.height;
    final double width = screenDimens.width;
    _controller.forward();

    return WillPopScope(
      onWillPop: _onWillPop,
      child: Hero(
        tag: "hero-fab",
        child: AnimatedBuilder(
            animation: _controller,
            builder: (BuildContext context, Widget child) {
              return Scaffold(
                  backgroundColor: Theme.of(context).accentColor,
                  body: Transform(
                    transform: Matrix4.translationValues(
                        0.0, -_animation.value * height + (height * 0.05), 0.0),
                    child: new Center(
                        child: Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0),
                              topRight: Radius.circular(10.0))),
                      width: width * 0.9,
                      height: height * 0.9,
                      child: Container(
                          padding: EdgeInsets.all(20),
                          child: Column(children: getFormItems())),
                    )),
                  ));
            }),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 700));

    _animation = Tween(begin: -1.0, end: 0.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeOutQuint,
    ))
      ..addStatusListener(handler);
  }

  Future<bool> _onWillPop() {
    return showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                title: Text('Are you sure?'),
                content: Text('Unsaved data will be lost.'),
                actions: <Widget>[
                  new FlatButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: new Text('No'),
                  ),
                  new FlatButton(
                    onPressed: () =>
                        {Navigator.of(context).pop(false), closeLogger()},
                    child: new Text('Yes'),
                  ),
                ],
              ),
        ) ??
        false;
  }

  void clearForm(status) {}

  void closeLogger() {
    _animation.removeStatusListener(handler);
    _controller.reset();
    _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    ))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          Navigator.pop(context);
        }
      });
    _controller.forward();
  }

  void handler(status) {
    if (status == AnimationStatus.completed) {
//      _animation.removeStatusListener(handler);
//      _controller.reset();
//      _animation = Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
//        parent: _controller,
//        curve: Curves.fastOutSlowIn,
//      ))
//        ..addStatusListener((status) {
//          if (status == AnimationStatus.completed) {
//            Navigator.pop(context);
//          }
//        });
//      _controller.forward();
    }
  }

  List<Widget> getFormItems() {
    return <Widget>[
      Row(
        children: <Widget>[
          Expanded(
              child: TextField(
            onChanged: (text) => {},
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'Dive Buddy'),
            autofocus: false,
          )),
          Expanded(
              child: TextField(
            onChanged: (text) => {},
            decoration: InputDecoration(
                filled: true,
                fillColor: Colors.grey[300],
                hintText: 'Dive location'),
            autofocus: false,
          ))
        ],
      ),
      TextField(
        onChanged: (text) => {},
        decoration: InputDecoration(
            filled: true, fillColor: Colors.grey[300], hintText: 'Dive Buddy'),
        autofocus: false,
      ),
      TextField(
        onChanged: (text) => {},
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.grey[300],
            hintText: 'Dive location'),
        autofocus: false,
      )
    ];
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
