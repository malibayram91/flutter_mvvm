import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTextView extends StatelessWidget {
  const MyTextView(this.label, this.color, this.fontSize, {Key? key})
      : super(key: key);

  final String label;
  final Color color;
  final double fontSize;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(color: color, fontSize: fontSize),
    );
  }
}
