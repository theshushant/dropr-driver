import 'package:dropr_driver/utils/color_values.dart';
import 'package:flutter/material.dart';

ThemeData get getGlobalTheme {
  return ThemeData(
// primarySwatch: ColorValues.primaryColor,
    primaryColor: ColorValues.primaryColor,
    textTheme: const TextTheme(
      bodyLarge: TextStyle(
        fontSize: 48,
        color: ColorValues.linearEndColor,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(fontSize: 24),
      bodySmall: TextStyle(
        fontSize: 16,
        color: ColorValues.linearEndColor,
        fontWeight: FontWeight.bold,
      ),
      labelSmall: TextStyle(
        color: ColorValues.disabledColor,
        fontSize: 14,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        color: ColorValues.whiteColor,
      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: ColorValues.blackColor,
      ),
      displaySmall: TextStyle(
        fontSize: 12,
        color: ColorValues.linearEndColor,
      ),
      displayMedium: TextStyle(
          fontSize: 18,
          color: ColorValues.linearEndColor,
          fontWeight: FontWeight.w500),
      displayLarge: TextStyle(
        fontSize: 24,
        color: ColorValues.linearEndColor,
      ),
    ),
  );
}
