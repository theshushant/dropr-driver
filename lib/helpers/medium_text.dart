import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class MediumText extends StatelessWidget {
  final String text;
  final Color? color;
  final TextAlign textAlign;
  final FontWeight? fontWeight;
  final double size;
  const MediumText(
      {Key? key,
      required this.text,
      this.color,
      this.textAlign = TextAlign.start,
      this.fontWeight,
      this.size = customTextSize})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: size,
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }
}
