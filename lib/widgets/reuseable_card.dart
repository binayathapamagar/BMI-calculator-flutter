import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  final Color cardColor;
  final Widget? child;
  final VoidCallback? onClick;

  ReuseableCard({required this.cardColor, this.child, this.onClick});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.all(15.0),
        decoration: BoxDecoration(
          color: cardColor,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: child,
      ),
    );
  }
}
