import 'dart:io';

import 'package:dropr_driver/helpers/dropr_loader.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class CustomRoundedButton extends StatelessWidget {
  final Widget? child;
  final String? text;
  final Color color;
  final double radius;
  final double iosradius;
  final Function? onTap;
  final bool isLoading;
  final bool isEnabled;
  final Border? border;

  const CustomRoundedButton(
      {Key? key,
      this.child,
      this.border,
      this.color = ColorValues.primaryColor,
      this.radius = 20,
      this.iosradius = 8,
      this.onTap,
      this.text,
      this.isLoading = false,
      this.isEnabled = true})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isEnabled && onTap != null) {
          onTap!();
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: globalPadding,
          vertical: globalPadding,
        ),
        decoration: BoxDecoration(
          color: isEnabled ? color : ColorValues.disabledColor,
          border: border,
          borderRadius: BorderRadius.circular(
            Platform.isIOS ? iosradius : radius,
          ),
        ),
        alignment: Alignment.center,
        child: isLoading
            ? loader()
            : text != null
                ? Text(
                    text!,
                    style: Theme.of(context).textTheme.titleSmall,
                  )
                : child,
      ),
    );
  }
}
