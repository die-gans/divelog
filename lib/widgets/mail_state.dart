import 'package:flutter/material.dart';

class MailState extends StatelessWidget {
  final Color color;
  MailState(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}