import 'package:divelog/widgets/home_state.dart';
import 'package:divelog/widgets/mail_state.dart';
import 'package:divelog/widgets/profile_state.dart';
import 'package:divelog/widgets/easing_animation.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DiveLog(),
    );
  }
}

class DiveLog extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _DiveLogState();
  }
}

class _DiveLogState extends State<DiveLog> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      floatingActionButton: Hero(
        tag: "hero-fab",
        child: FloatingActionButton.extended(
            onPressed: () {
              _navigateToLogDive();
            },
            elevation: 0,
            icon: Icon(Icons.add),
            label: Text("Log a dive")),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        clipBehavior: Clip.antiAlias,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(icon: Icon(Icons.menu), onPressed: null),
            IconButton(icon: Icon(Icons.search), onPressed: null)
          ],
        ),
      ),
    );
  }

  Future _navigateToLogDive() {
    return Navigator.push(
      context,
      MaterialPageRoute(fullscreenDialog: true, builder: (context) => EasingAnimationWidget()),
    );
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Widget _getBody() {
    switch (_currentIndex) {
      case 0:
        return HomeState(Colors.white);
      case 1:
        return MailState(Colors.red);
      case 2:
        return ProfileState(Colors.blue);
      default:
        return HomeState(Colors.green);
    }
  }
}
