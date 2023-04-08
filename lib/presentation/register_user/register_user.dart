import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_gradient_progress_bar.dart';
import 'package:dropr_driver/helpers/dropr_text_field.dart';
import 'package:dropr_driver/helpers/store_observer.dart';
import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/register_user/register_current_address.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);
  static String routeName = 'RegisterUser';

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formState = GlobalKey<FormState>();
  final Map<String, dynamic> data = <String, dynamic>{};
  String? dateOfBirth;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
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
            StringValue.registerYourself,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          trailing: Container(),
        ),
        body: SingleChildScrollView(
          child: Form(
            key: _formState,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: applyPaddingX(1)),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GradientProgressBar(
                      percent: progressIndicatorValue(1),
                      gradient: const LinearGradient(
                        colors: [
                          ColorValues.progressIndicatorColor1,
                          ColorValues.progressIndicatorColor2,
                        ],
                      ),
                      backgroundColor: ColorValues.whiteColor,
                      height: progressBarHeight),
                  const CircleAvatar(
                    radius: avatarCircleRadius,
                    backgroundColor: ColorValues.transparent,
                    child: Icon(Icons.account_circle,
                        size: avatarCircleRadius * 2),
                  ),
                  const Text(StringValue.addPicture),
                  DroprTextField(
                    hintText: StringValue.fullName,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      data.addAll({
                        "name": value,
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(
                      vertical: applyPaddingX(1),
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: applyPaddingX(1),
                    ),
                    child: DropdownButtonFormField(
                      validator: (String? value) {
                        if (value == null || value.isEmpty) {
                          return StringValue.required;
                        }
                      },
                      hint: Text(
                        StringValue.gender,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      items: const <DropdownMenuItem<String>>[
                        DropdownMenuItem<String>(
                          value: 'MALE',
                          child: Text('Male'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'FEMALE',
                          child: Text('Female'),
                        ),
                      ],
                      onChanged: (String? s) {
                        data.addAll({
                          "gender": s,
                        });
                      },
                    ),
                  ),
                  DroprTextField(
                    controller: TextEditingController(text:dateOfBirth),
                    isEnabled: false,
                    onClick: () async {
                      DateTime? dateTime = await showDatePicker(
                        context: context,
                        initialDate: DateTime(2016),
                        firstDate: DateTime(1950),
                        lastDate: DateTime.now(),
                      );
                      setState(() {
                        dateOfBirth = dateTime.toString().split(' ').first.replaceAll('-', '/');
                        data.addAll({
                          "date_of_birth": dateTime.toString(),
                        });
                      });
                    },
                    hintText: StringValue.dateOfBirth,
                    // value: data.containsKey('date_of_birth')
                    //     ? data['date_of_birth']
                    //     : null,
                    onValidate: (String? value) {
                      if (value == null || value.trim().isEmpty) {
                        return StringValue.required;
                      }
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(applyPaddingX(2)),
                      child: StoreObserver(
                        builder: (UserStore store, BuildContext context) {
                          return CustomRoundedButton(
                            isLoading: store.isLoading,
                            onTap: () async {
                              _formState.currentState?.save();
                              if (_formState.currentState?.validate() ??
                                  false) {
                                store.registerYourself(data);
                                when((p0) => !store.isLoading, () {
                                  Navigator.pushNamed(
                                    context,
                                    CurrentAddress.routeName,
                                    arguments: ScreenArguments(
                                      map: data,
                                    ),
                                  );
                                });
                              }
                            },
                            text: StringValue.next,
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
