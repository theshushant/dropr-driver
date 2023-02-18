import 'dart:io';

import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:flutter/material.dart';

class PackageTypeItem extends StatelessWidget {
  const PackageTypeItem({
    Key? key,
    this.suffixWidget,
    required this.title,
    required this.prefixWidget,
    this.checkboxValue = false,
  }) : super(key: key);

  final String title;
  final Widget? suffixWidget;
  final Widget prefixWidget;
  final bool checkboxValue;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        prefixWidget,
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: HelpText(
            text: title,
            color: ColorValues.blackColor,
          ),
        ),
      ],
    );
  }
}
