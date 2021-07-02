import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class IconContent extends StatelessWidget {
  final IconData icon;
  final String title;

  IconContent({required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          title,
          style: kTitleStyle,
        ),
      ],
    );
  }
}
