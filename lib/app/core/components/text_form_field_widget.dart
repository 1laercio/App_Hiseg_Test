import 'package:flutter/material.dart';

class TextForm extends StatelessWidget {
  const TextForm(
      {super.key,
      required this.controller,
      this.color,
      required this.height,
      required this.width,
      this.style});

  final TextEditingController? controller;
  final Color? color;
  final double height;
  final double width;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          shape: BoxShape.rectangle,
        ),
        alignment: const AlignmentDirectional(-0.0, 0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextFormField(
            controller: controller,
            textAlign: TextAlign.center,
            style: style,
            decoration: const InputDecoration(
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
