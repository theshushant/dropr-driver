import 'dart:io';

import 'package:dropr_driver/services/preference_service.dart';
import 'package:flutter/material.dart';

final PreferenceService preferenceService = PreferenceService.getInstance();

const double globalPadding = 10;
const double helperTextSize = 14;
const double extraTextSize = 12;
const double customTextSize = 16;
const double headingTextSize = 32;
const double circularRadius = 15;
double progressBarHeight = Platform.isAndroid ? 6 : 12;
const double categoryMaxSize = 56;

// const mapsApiKey = 'AIzaSyAklibzD5lgq4YA2l_p6K6jJ8A9MnlIzR0';
EdgeInsets xPadding(double multiple) {
  return EdgeInsets.all(multiple * 8.0);
}

double applyPaddingX(double value) {
  return value * 8;
}

int progressIndicatorValue(int value) {
  return (100 * value * (1 / 7)).round();
}
//
// List<dynamic> packageCatagory = const [
//   {'title': 'Clothes | Accessories ', 'icon': Icon(Icons.checkroom)},
//   {'title': 'Documents | Books ', 'icon': Icon(Icons.library_books)},
//   {'title': 'Electronic Items ', 'icon': Icon(Icons.power)},
//   {'title': 'Food | Flowers', 'icon': Icon(Icons.fastfood)},
//   {'title': 'Sports Equipment', 'icon': Icon(Icons.sports_soccer)},
//   {'title': 'Alchol | Tabacco', 'icon': Icon(Icons.sports_bar)},
//   {'title': 'Other', 'icon': Icon(Icons.inventory)},
// ];