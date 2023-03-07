import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class DroprOutlineButton extends StatelessWidget {
  final String text;
  const DroprOutlineButton({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: applyPaddingX(1),
          vertical: applyPaddingX(0.5),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: ColorValues.whiteColor,
          boxShadow: const [
            BoxShadow(
              offset: Offset(0, 3),
              blurRadius: 5,
              color: Colors.black26,
            )
          ],
        ),
        child: Text(
          text,
          style: Theme.of(context).textTheme.displaySmall,
        ),
      ),
    );
  }
}
