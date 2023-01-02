import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/presentation/splash.dart';
import 'package:dropr_driver/presentation/welcome.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dropr Driver',
      initialRoute: SplashPage.routeName,
      routes: {
        SplashPage.routeName: (BuildContext context) => const SplashPage(),
        WelcomePage.routeName: (BuildContext context) => const WelcomePage(),
        HomePage.routeName: (BuildContext context) => const HomePage(),
      },
    );
  }
}
