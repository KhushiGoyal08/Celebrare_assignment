import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  const Button(
      {super.key,
      required this.onPressed,
      required this.child,
      required this.color,
      required this.textColor});
  final VoidCallback onPressed;
  final Widget child;
  final Color color;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: color, textStyle: TextStyle(color: textColor)),
        onPressed: onPressed,
        child: child);
  }
}
