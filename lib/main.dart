import 'package:dropr_driver/presentation/credentials/login_page.dart';
import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/presentation/landing_page.dart';
import 'package:dropr_driver/presentation/order/order_screen.dart';
import 'package:dropr_driver/presentation/order/incoming_order.dart';
import 'package:dropr_driver/presentation/order/pick_up_order.dart';
import 'package:dropr_driver/presentation/profile/profile_screen.dart';
import 'package:dropr_driver/presentation/register_user/register_bank_information.dart';
import 'package:dropr_driver/presentation/register_user/register_contact_information.dart';
import 'package:dropr_driver/presentation/register_user/register_current_address.dart';
import 'package:dropr_driver/presentation/register_user/register_permanent_address.dart';
import 'package:dropr_driver/presentation/register_user/register_upload_image.dart';
import 'package:dropr_driver/presentation/register_user/register_user.dart';
import 'package:dropr_driver/presentation/register_user/register_vehicle_information.dart';
import 'package:dropr_driver/presentation/splash.dart';
import 'package:dropr_driver/presentation/success_page.dart';
import 'package:dropr_driver/presentation/training.dart';
import 'package:dropr_driver/presentation/walk_through_page.dart';
import 'package:dropr_driver/presentation/welcome.dart';
import 'package:dropr_driver/routes.dart';
import 'package:dropr_driver/store/order_store.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/global_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'presentation/payments/payment_history.dart';

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
        Provider<OrderStore>.value(
          value: OrderStore(),
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
          HomePage.routeName: (BuildContext context) => const HomePage(),
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
          OrderScreen.routeName: (BuildContext context) => OrderScreen(),
          IncomingOrder.routeName: (BuildContext context) => IncomingOrder(),
          ProfileScreen.routeName: (BuildContext context) => ProfileScreen(),
          PaymentHistory.routeName: (BuildContext context) => PaymentHistory(),
          PickUpOrderScreen.routeName: (BuildContext context) =>
              PickUpOrderScreen(),
        },
        onGenerateRoute: getGeneratedRoutes,
      ),
    );
  }
}
