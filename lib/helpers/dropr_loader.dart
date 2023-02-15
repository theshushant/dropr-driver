import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget loader() {
  return Platform.isAndroid
      ? const CupertinoActivityIndicator()
      : const CircularProgressIndicator();
}
