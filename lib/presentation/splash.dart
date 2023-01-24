import 'package:dropr_driver/models/user.dart';
import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/presentation/landing_page.dart';
import 'package:dropr_driver/presentation/welcome.dart';
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
    User? user = await preferenceService.getAuthUser();
    Future.delayed(const Duration(milliseconds: 400), () {
      _navigateToHomePage();
    });
  }

  Future _navigateToHomePage() async {
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  Future _navigateToWelcomePage() async {
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }
}
