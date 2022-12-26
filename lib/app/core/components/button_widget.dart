import 'package:flutter/material.dart';

class ButtonWidegt extends StatelessWidget {
  const ButtonWidegt({
    super.key,
    required this.title,
    this.color,
    required this.background,
    required this.height,
    required this.width,
    this.onPressed,
    this.style,
  });

  final String title;
  final Color? color;
  final Color? background;
  final double height;
  final double width;
  final void Function()? onPressed;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20,right: 20,left: 20),
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          minimumSize: Size(width, height),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          backgroundColor: background,
          elevation: 15,
        ),
        child: Text(
          title,
          style: style,
        ),
      ),
    );
  }
}
