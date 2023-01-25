import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_gradient_progress_bar.dart';
import 'package:dropr_driver/helpers/dropr_text_field.dart';
import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/register_vehicle_information.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class ContactInformation extends StatefulWidget {
  const ContactInformation({Key? key}) : super(key: key);
  static String routeName = 'ContactInformation';

  @override
  State<ContactInformation> createState() => _ContactInformationState();
}

class _ContactInformationState extends State<ContactInformation> {
  final _formState = GlobalKey<FormState>();

  Map<String, dynamic> map = {};
  Map<String, String> map1 = <String,String>{};

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ScreenArguments args =
          ModalRoute.of(context)!.settings.arguments as ScreenArguments;
      setState(() {
        map = args.map ?? <String, dynamic>{};
      });
      print("here data is this " + map.toString());
    });
  }

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
                      percent: progressIndicatorValue(4),
                      gradient: const LinearGradient(
                        colors: [
                          ColorValues.progressIndicatorColor1,
                          ColorValues.progressIndicatorColor2,
                        ],
                      ),
                      backgroundColor: ColorValues.whiteColor,
                      height: progressBarHeight),
                  Padding(
                    padding: EdgeInsets.all(applyPaddingX(2)),
                    child: Text(
                      StringValue.contactInformation,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  DroprTextField(
                    hintText: StringValue.email,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map1["email"] = value;
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.emergencyContactPersonName,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map1["name"] = value;
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.emergancyContact,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map1["phone_number"] = value;
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.relationshipWithEmergancyContact,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map1["relationship"] = value;
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(applyPaddingX(2)),
                      child: CustomRoundedButton(
                        text: StringValue.next,
                        onTap: () {
                          _formState.currentState?.save();
                          if (_formState.currentState?.validate() ?? false) {
                            map.addAll({
                              "emergency_contact":map1
                            });
                            Navigator.pushNamed(
                              context,
                              VehicleInformation.routeName,
                              arguments: ScreenArguments(
                                map: map,
                              ),
                            );
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
