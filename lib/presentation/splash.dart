import 'package:dropr_driver/models/user.dart';
import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/presentation/welcome.dart';
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
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((Duration duration) {
      _navigateToScreen();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }

  void _navigateToScreen() async {
    User? user = await preferenceService.getAuthUser();
    Future.delayed(Duration(milliseconds: 400),(){
      _navigateToHomePage();
    });
  }
  Future _navigateToHomePage() async {
    Navigator.pushReplacementNamed(context, HomePage.routeName);
  }

  Future _navigateToWelcomePage() async {
    Navigator.pushReplacementNamed(context, WelcomePage.routeName);
  }
}
