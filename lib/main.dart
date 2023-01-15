import 'package:dropr_driver/presentation/credentials/login_page.dart';
import 'package:dropr_driver/presentation/credentials/otp_verification_page.dart';
import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/presentation/landing_page.dart';
import 'package:dropr_driver/presentation/register_bank_information.dart';
import 'package:dropr_driver/presentation/register_contact_information.dart';
import 'package:dropr_driver/presentation/register_current_address.dart';
import 'package:dropr_driver/presentation/register_permanent_address.dart';
import 'package:dropr_driver/presentation/register_upload_image.dart';
import 'package:dropr_driver/presentation/register_user.dart';
import 'package:dropr_driver/presentation/register_vehicle_information.dart';
import 'package:dropr_driver/presentation/splash.dart';
import 'package:dropr_driver/presentation/success_page.dart';
import 'package:dropr_driver/presentation/training.dart';
import 'package:dropr_driver/presentation/walk_through_page.dart';
import 'package:dropr_driver/presentation/welcome.dart';
import 'package:dropr_driver/routes.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<UserStore>.value(
          value: UserStore(),
        ),
      ],
      child: MaterialApp(
        theme: getGlobalTheme,
        title: 'Dropr Driver',
        debugShowCheckedModeBanner: false,
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (BuildContext context) => const SplashPage(),
          WelcomePage.routeName: (BuildContext context) => const WelcomePage(),
          HomePage.routeName: (BuildContext context) => HomePage(),
          WalkThroughPage.routeName: (BuildContext context) =>
              const WalkThroughPage(),
          LandingPage.routeName: (BuildContext context) => const LandingPage(),
          RegisterUser.routeName: (BuildContext context) =>
              const RegisterUser(),
          CurrentAddress.routeName: (BuildContext context) =>
              const CurrentAddress(),
          PermanentAddress.routeName: (BuildContext context) =>
              const PermanentAddress(),
          ContactInformation.routeName: (BuildContext context) =>
              const ContactInformation(),
          VehicleInformation.routeName: (BuildContext context) =>
              const VehicleInformation(),
          UploadImage.routeName: (BuildContext context) => const UploadImage(),
          BankInformation.routeName: (BuildContext context) =>
              const BankInformation(),
          SuccessPage.routeName: (BuildContext context) => const SuccessPage(),
          TrainingPage.routeName: (BuildContext context) =>
              const TrainingPage(),
          LoginPage.routeName: (BuildContext context) => LoginPage(),
        },
        onGenerateRoute: getGeneratedRoutes,
      ),
    );
  }
}
