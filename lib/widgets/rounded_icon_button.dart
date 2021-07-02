import 'package:flutter/material.dart';

import '../utilities/constants.dart';

class RoundedIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTapped;

  RoundedIconButton({required this.icon, required this.onTapped});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      shape: CircleBorder(),
      elevation: 5.0,
      fillColor: kCustomButtonColor,
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      child: Icon(icon),
      onPressed: onTapped,
    );
  }
}
