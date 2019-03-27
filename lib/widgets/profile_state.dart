import 'package:flutter/material.dart';

class ProfileState extends StatelessWidget {
  final Color color;

  ProfileState(this.color);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
    );
  }
}