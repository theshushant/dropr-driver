import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class HelpText extends StatelessWidget {
  final String text;
  final Color color;
  final FontWeight? fontWeight;
  final double? fontSize;

  const HelpText({
    Key? key,
    required this.text,
    this.fontWeight,
    this.color = ColorValues.disabledColor,
    this.fontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        fontSize: fontSize ?? helperTextSize,
        color: color,
        overflow: TextOverflow.ellipsis,
        fontWeight: fontWeight,
      ),
    );
  }
}
