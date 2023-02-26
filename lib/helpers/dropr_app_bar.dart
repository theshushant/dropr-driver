import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final double height;
  final Widget? leading;
  final Widget title;
  final Widget? trailing;

  const CustomAppBar({
    this.height = kToolbarHeight,
    required this.leading,
    required this.title,
    required this.trailing,
  });

  @override
  Size get preferredSize => Size.fromHeight(height);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorValues.whiteColor,
        boxShadow: [
          BoxShadow(
            offset: Offset(0, 1),
            blurRadius: 8,
            color: Colors.black12,
          )
        ],
      ),
      padding: EdgeInsets.symmetric(
        horizontal: applyPaddingX(1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          leading ?? const SizedBox(),
          title,
          InkWell(
            onTap: () {},
            child: trailing,
          ),
        ],
      ),
    );
  }
}
