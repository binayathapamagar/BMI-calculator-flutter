import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class ContainerCalculateButton extends StatelessWidget {
  final String title;
  final VoidCallback onPressed;

  ContainerCalculateButton({required this.title, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: kBottomContainerHeight,
        width: double.infinity,
        color: kBottomContainerColor,
        margin: EdgeInsets.only(
          top: 10.0,
        ),
        child: Center(
          child: Text(
            title,
            style: kBottomContainerTextStyle,
          ),
        ),
      ),
    );
  }
}
