import 'package:dropr_driver/utils/color_values.dart';
import 'package:flutter/material.dart';

class DroprLink extends StatelessWidget {
  final String text;
  final Widget? trailingWidget;
  final Color? color;
  final bool isButtonType;

  const DroprLink({
    Key? key,
    required this.text,
    this.trailingWidget,
    this.color = ColorValues.primaryColor,
    this.isButtonType = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        vertical: 4,
        horizontal: 6,
      ),
      decoration: BoxDecoration(
        color: isButtonType ? ColorValues.primaryColor : null,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            text,
            style: TextStyle(
              color: isButtonType ? ColorValues.whiteColor : color,
              fontSize: 14,
            ),
          ),
          trailingWidget ?? const SizedBox(),
        ],
      ),
    );
  }
}
