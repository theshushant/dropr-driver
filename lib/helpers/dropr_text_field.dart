import 'dart:io';

import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DroprTextField extends StatelessWidget {
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final TextInputType? keyboardType;
  final String hintText;
  final Function? onSave;
  final Function? onValidate;
  final Function? onChange;
  final int? maxLength;
  final int? maxLines;
  final String? value;
  final TextEditingController? controller;
  final bool showBorder;
  final Color? prefixIconColor;
  final bool isEnabled;
  final VoidCallback? onClick;

  const DroprTextField({
    Key? key,
    this.prefixIcon,
    this.keyboardType,
    this.suffixIcon,
    required this.hintText,
    this.onSave,
    this.value,
    this.onValidate,
    this.maxLength,
    this.controller,
    this.showBorder = false,
    this.maxLines,
    this.onChange,
    this.prefixIconColor,
    this.isEnabled = true,
    this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onClick,
      child: Container(
        margin: EdgeInsets.symmetric(
          vertical: applyPaddingX(1),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: applyPaddingX(1),
        ),
        child: !Platform.isIOS
            ? CupertinoTextField(
                maxLength: maxLength,
                maxLines: maxLines,
                prefix: Padding(
                  padding: xPadding(1),
                  child: prefixIcon,
                ),
                suffix: suffixIcon,
                placeholder: hintText,
                decoration:
                    const BoxDecoration(color: ColorValues.textFieldFillColor),
                onChanged: (String? value) {
                  if (onChange != null) {
                    onChange!(value);
                  }
                },
                onSubmitted: (String? value) {
                  if (value != null && onSave != null) {
                    onSave!(value);
                  }
                },
                keyboardType: keyboardType,
                controller: controller,
              )
            : TextFormField(
                enabled: isEnabled,
                maxLength: maxLength,
                maxLines: maxLines,
                initialValue: value,
                validator: (String? value) {
                  if (onValidate != null) {
                    return onValidate!(value);
                  }
                  return null;
                },
                onSaved: (String? value) {
                  if (value != null && onSave != null) {
                    onSave!(value);
                  }
                },
                onChanged: (String? value) {
                  if (onChange != null) {
                    onChange!(value);
                  }
                },
                keyboardType: keyboardType,
                controller: controller,
                decoration: InputDecoration(
                  border: showBorder ? const OutlineInputBorder() : null,
                  prefixIcon: prefixIcon,
                  suffixIcon: suffixIcon,
                  hintText: hintText,
                  fillColor: ColorValues.disabledColor,
                  prefixIconColor: prefixIconColor,
                  counterText: '',
                  hintStyle: Theme.of(context).textTheme.labelSmall,
                  errorStyle: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                  ),
                ),
              ),
      ),
    );
  }
}
