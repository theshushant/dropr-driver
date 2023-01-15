import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/credentials/otp_verification_page.dart';
import 'package:flutter/material.dart';

Route getGeneratedRoutes(RouteSettings settings) {
  late final Widget target;
  String? route = settings.name;
  ScreenArguments args = settings.arguments as ScreenArguments;
  switch (route) {
    case OTPVerificationPage.routeName:
      target = OTPVerificationPage(
        otp: args.otp!,
        label: args.label!,
         onComplete: args.onComplete,
      );
      break;
  }
  return MaterialPageRoute(builder: (context) => target);
}
