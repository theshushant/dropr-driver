import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/presentation/landing_page.dart';
import 'package:dropr_driver/presentation/register_contact_information.dart';
import 'package:dropr_driver/presentation/register_current_address.dart';
import 'package:dropr_driver/presentation/register_permanent_address.dart';
import 'package:dropr_driver/presentation/register_upload_image.dart';
import 'package:dropr_driver/presentation/register_user.dart';
import 'package:dropr_driver/presentation/register_vehicle_information.dart';
import 'package:dropr_driver/presentation/splash.dart';
import 'package:dropr_driver/presentation/walk_through_page.dart';
import 'package:dropr_driver/presentation/welcome.dart';
import 'package:dropr_driver/utils/global_theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: getGlobalTheme,
      title: 'Dropr Driver',
      debugShowCheckedModeBanner: false,
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (BuildContext context) => const SplashPage(),
        WelcomePage.routeName: (BuildContext context) => const WelcomePage(),
        HomePage.routeName: (BuildContext context) => const HomePage(),
        WalkThroughPage.routeName: (BuildContext context) =>
            const WalkThroughPage(),
        LandingPage.routeName: (BuildContext context) => const LandingPage(),
        RegisterUser.routeName: (BuildContext context) => const RegisterUser(),
        CurrentAddress.routeName: (BuildContext context) =>
            const CurrentAddress(),
        PermanentAddress.routeName: (BuildContext context) =>
            const PermanentAddress(),
        ContactInformation.routeName: (BuildContext context) =>
            const ContactInformation(),
        VehicleInformation.routeName: (BuildContext context) =>
            const VehicleInformation(),
        UploadImage.routeName: (BuildContext context) => const UploadImage(),
      },
    );
  }
}
