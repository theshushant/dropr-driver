import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/credentials/otp_verification_page.dart';
import 'package:dropr_driver/presentation/order/order_screen.dart';
import 'package:flutter/material.dart';

import 'presentation/register_user/register_review.dart';

Route getGeneratedRoutes(RouteSettings settings) {
  late final Widget target;
  String? route = settings.name;
  ScreenArguments args = settings.arguments as ScreenArguments;
  switch (route) {
    case OTPVerificationPage.routeName:
      target = OTPVerificationPage(
        otp: args.otp!,
        label: args.label!,
        map: args.map!,
      );
      break;

     case OrderScreen.routeName:
      target = OrderScreen(
       id: args.genericId!,
      );
      break;
    case RegisterReview.routeName:
      target = RegisterReview(
        data: args.map!,
      );
  }
  return MaterialPageRoute(builder: (context) => target);
}
