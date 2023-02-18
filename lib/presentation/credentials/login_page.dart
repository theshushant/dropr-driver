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

  LoginPage({Key? key}) : super(key: key);

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
              Container(
                child: Image.asset(
                  'assets/images/LoginImage.png',
                  fit: BoxFit.contain,
                ),
                height: MediaQuery.of(context).size.height * 0.5,
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
                  print("here value "+value.toString());
                  body["phone_number"] = value;
                },
              ),
              StoreObserver(
                builder: (UserStore _store, BuildContext context) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 15,
                      vertical: 15,
                    ),
                    child: CustomRoundedButton(
                      onTap: () async {
                        _formState.currentState?.save();
                        if (_formState.currentState?.validate() ?? false) {
                          print("here body is this "+body.toString());
                          int otp = await _store.login(body);
                          Navigator.pushReplacementNamed(
                            context,
                            OTPVerificationPage.routeName,
                            arguments: ScreenArguments(
                              otp: otp,
                              label: " StringValue.verification",
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
