import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class DroprIndicator extends StatelessWidget {
  final bool isSelected;
  final Function onSelect;
  final bool isSmall;

  const DroprIndicator({
    Key? key,
    this.isSelected = false,
    required this.onSelect,
    this.isSmall = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onSelect();
      },
      child: AnimatedContainer(
        duration: const Duration(
          milliseconds: 600,
        ),
        margin: const EdgeInsets.only(
          left: 4,
        ),
        padding: EdgeInsets.symmetric(
          vertical: applyPaddingX(
            isSmall ? 0.5 : 1,
          ),
          horizontal: isSelected
              ? applyPaddingX(
                  isSmall ? 1.5 : 3,
                )
              : applyPaddingX(
                  isSmall ? 0.5 : 1,
                ),
        ),
        decoration: BoxDecoration(
          color:
              isSelected ? ColorValues.primaryColor : ColorValues.disabledColor,
          borderRadius: BorderRadius.circular(
            circularRadius,
          ),
        ),
      ),
    );
  }
}
