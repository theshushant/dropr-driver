import 'package:dropr_driver/models/employee.dart';
import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/presentation/landing_page.dart';
import 'package:dropr_driver/presentation/register_user/register_bank_information.dart';
import 'package:dropr_driver/presentation/register_user/register_contact_information.dart';
import 'package:dropr_driver/presentation/register_user/register_permanent_address.dart';
import 'package:dropr_driver/presentation/register_user/register_user.dart';
import 'package:dropr_driver/presentation/register_user/register_vehicle_information.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = 'SplashPage';

  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  initState() {
    super.initState();
    _navigateToScreen();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              ImageValues.logo,
            ),
          ),
          gradient: const LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [ColorValues.linearStartColor, ColorValues.linearEndColor],
          ),
        ),
      ),
    );
  }

  void _navigateToScreen() async {
    Employee? user = await preferenceService.getAuthUser();
    if (user != null) {
      if (user.dateOfBirth == null) {
        Navigator.pushReplacementNamed(
          context,
          RegisterUser.routeName,
        );
      } else if (user.permanentAddress == null) {
        Navigator.pushReplacementNamed(
          context,
          PermanentAddress.routeName,
        );
      } else if (user.emergencyContact == null) {
        Navigator.pushReplacementNamed(
          context,
          ContactInformation.routeName,
        );
      } else if (user.vehicleDetails == null) {
        Navigator.pushReplacementNamed(
          context,
          VehicleInformation.routeName,
        );
      } else if (user.bankDetails == null) {
        Navigator.pushReplacementNamed(
          context,
          BankInformation.routeName,
        );
      } else {
        Navigator.pushReplacementNamed(
          context,
          HomePage.routeName,
        );
      }
    } else {
      Navigator.pushReplacementNamed(
        context,
        LandingPage.routeName,
      );
    }
  }
}
