import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Language',
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w800,
              color: Color(0xff303030)),
        ),
      ],
    );
  }
}
