import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class DroprOutlineButton extends StatelessWidget {
 final String text;
 const DroprOutlineButton({Key? key,required this.text,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: applyPaddingX(1),
        vertical: applyPaddingX(0.5),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: ColorValues.whiteColor,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: 12),
      ),
    );
  }
}
