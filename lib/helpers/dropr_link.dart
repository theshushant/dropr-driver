import 'package:dropr_driver/utils/color_values.dart';
import 'package:flutter/material.dart';

class DroprLink extends StatelessWidget {
  final String text;
  final Widget? trailingWidget;
  final Color? color;

  const DroprLink({
    Key? key,
    required this.text,
    this.trailingWidget,
    this.color = ColorValues.primaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 14,
          ),
        ),
        trailingWidget ?? const SizedBox(),
      ],
    );
  }
}
