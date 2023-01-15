import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_link.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/helpers/super_text.dart';
import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/presentation/register_user.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class OTPVerificationPage extends StatelessWidget {
  static const String routeName = 'OTPVerificationPage';
  final int otp;
  final String label;
  final Function? onComplete;

  const OTPVerificationPage({
    Key? key,
    required this.otp,
    required this.label,
    this.onComplete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SafeArea(
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
                  text: label,
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
              if (value != null && onComplete != null) {
                onComplete!(value, context);
              }
              if (value != null) {
                int sentOtp = int.parse(value);
                if (sentOtp == otp) {
                  Navigator.pushReplacementNamed(
                    context,
                    HomePage.routeName,
                  );
                }
              }
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          const DroprLink(
            text: "StringValue.resend",
          ),
        ],
      ),
    );
  }
}
