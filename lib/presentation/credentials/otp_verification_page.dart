import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_link.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/presentation/register_user/register_bank_information.dart';
import 'package:dropr_driver/presentation/register_user/register_contact_information.dart';
import 'package:dropr_driver/presentation/register_user/register_permanent_address.dart';
import 'package:dropr_driver/presentation/register_user/register_user.dart';
import 'package:dropr_driver/presentation/register_user/register_vehicle_information.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';

class OTPVerificationPage extends StatelessWidget {
  static const String routeName = 'OTPVerificationPage';
  final int otp;
  final String label;
  final Map<String, dynamic>? map;

  const OTPVerificationPage({
    Key? key,
    required this.otp,
    required this.label,
    this.map,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.all(
                    applyPaddingX(1),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              title: Text(
                StringValue.verification,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Container(),
            ),
            _body(context),
          ],
        ),
      ),
    );
  }

  Widget _body(BuildContext context) {
    return Expanded(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(
              vertical: 15,
            ),
            child: Column(
              children: [
                const HelpText(
                  text: StringValue.verificationDescription,
                ),
                const SizedBox(
                  height: globalPadding,
                ),
                HelpText(
                  text: "+91 ${map!['phone_number']}",
                ),
              ],
            ),
          ),
          SizedBox(
            height: applyPaddingX(4),
          ),
          _scrollLabelArea(context),
        ],
      ),
    );
  }

  Widget _scrollLabelArea(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Pinput(
            length: otp.toString().length,
            onCompleted: (String? value) async {
              UserStore store = Provider.of<UserStore>(context, listen: false);
              if (value != null) {
                Map<String, String> body = {
                  "otp": value,
                  "phone_number": map!['phone_number'],
                };
                store.loginComplete(body);

                when((p0) => store.user != null, () {
                  if (store.user?.dateOfBirth == null) {
                    Navigator.pushReplacementNamed(
                      context,
                      RegisterUser.routeName,
                    );
                  } else if (store.user?.permanentAddress == null) {
                    Navigator.pushReplacementNamed(
                      context,
                      PermanentAddress.routeName,
                    );
                  } else if (store.user?.emergencyContact == null) {
                    Navigator.pushReplacementNamed(
                      context,
                      ContactInformation.routeName,
                    );
                  } else if (store.user?.vehicleDetails == null) {
                    Navigator.pushReplacementNamed(
                      context,
                      VehicleInformation.routeName,
                    );
                  } else if (store.user?.bankDetails == null) {
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
                });
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomRoundedButton(
              text: StringValue.verify,
            ),
          ),
        ],
      ),
    );
  }
}
