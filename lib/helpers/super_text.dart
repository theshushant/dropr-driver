import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class SuperText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign textAlign;
  final FontWeight? fontWeight;

  const SuperText({
    Key? key,
    required this.text,
    this.color = ColorValues.primaryColor,
    this.textAlign = TextAlign.start,
    this.fontWeight,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
          fontSize: headingTextSize, color: color, fontWeight: fontWeight),
    );
  }
}
