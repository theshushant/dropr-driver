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

class RegisterUser extends StatefulWidget {
  const RegisterUser({Key? key}) : super(key: key);
  static String routeName = 'RegisterUser';

  @override
  State<RegisterUser> createState() => _RegisterUserState();
}

class _RegisterUserState extends State<RegisterUser> {
  final _formState = GlobalKey<FormState>();
  final Map<String, dynamic> data = <String, dynamic>{};

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
                    onValidate: (String? value){
                      if(value == null || value.isEmpty){
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      data.addAll({
                        "name": value,
                      });
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.gender,
                    onValidate: (String? value){
                      if(value == null || value.isEmpty){
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      data.addAll({
                        "gender": value,
                      });
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.dateOfBirth,
                    onValidate: (String? value){
                      if(value == null || value.isEmpty){
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      data.addAll({
                        "date_of_birth": value,
                      });
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
                                Navigator.pushNamed(
                                  context,
                                  CurrentAddress.routeName,
                                  arguments: ScreenArguments(
                                    map: data,
                                  ),
                                );
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
