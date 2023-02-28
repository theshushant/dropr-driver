import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_text_field.dart';
import 'package:dropr_driver/helpers/store_observer.dart';
import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/credentials/otp_verification_page.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static const String routeName = 'LoginPage';

  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final Map<String, String> body = <String, String>{};

  final _formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formState,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: Column(
            children: [
              Image.asset(
                'assets/images/LoginImage.png',
                fit: BoxFit.contain,
              ),
              DroprTextField(
                keyboardType: TextInputType.number,
                maxLength: 10,
                hintText: StringValue.mobileNumber,
                onValidate: (String? value) {
                  if (value == null || value.isEmpty) {
                    return StringValue.required;
                  }
                },
                onSave: (String value) {
                  body["phone_number"] = value;
                },
              ),
              StoreObserver(
                builder: (UserStore store, BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: CustomRoundedButton(
                      onTap: () async {
                        _formState.currentState?.save();
                        if (_formState.currentState?.validate() ?? false) {
                          int otp = await store.login(body);
                          if (!mounted) return;
                          Navigator.pushReplacementNamed(
                            context,
                            OTPVerificationPage.routeName,
                            arguments: ScreenArguments(
                              otp: otp,
                              label: "StringValue.verification",
                              map: body,
                            ),
                          );
                        }
                      },
                      child: Text(
                        StringValue.login,
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
