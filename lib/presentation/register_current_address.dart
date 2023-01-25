import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_gradient_progress_bar.dart';
import 'package:dropr_driver/helpers/dropr_text_field.dart';
import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/register_permanent_address.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class CurrentAddress extends StatefulWidget {
  const CurrentAddress({Key? key}) : super(key: key);
  static String routeName = 'CurrentAddress';

  @override
  State<CurrentAddress> createState() => _CurrentAddressState();
}

class _CurrentAddressState extends State<CurrentAddress> {
  final _formState = GlobalKey<FormState>();
  Map<String, dynamic> map = {};

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ScreenArguments args =
          ModalRoute.of(context)!.settings.arguments as ScreenArguments;
     setState((){
       map = args.map ?? <String,dynamic>{};
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
                      percent: progressIndicatorValue(2),
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
                      StringValue.currentAddress,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  DroprTextField(
                    hintText: StringValue.houseFlateNumber,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map["current_address"] = value;
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.buildingName,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map["current_address"] += value;
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.streetArea,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map["current_address"] += value;
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.city,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map["current_address"] += value;
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.pincode,
                    onValidate: (String? value) {
                      if (value == null || (value.isEmpty)) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map["current_address"] += value;
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.landmark,
                    onSave: (String value) {
                      map["current_address"] += value;
                    },
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(applyPaddingX(2)),
                      child: CustomRoundedButton(
                        onTap: () {
                          _formState.currentState?.save();
                          if (_formState.currentState?.validate() ?? false) {
                            print("here current address is this " +
                                map.toString());
                            Navigator.pushNamed(
                                context, PermanentAddress.routeName,
                                arguments: ScreenArguments(
                                  map: map,
                                ));
                          }
                        },
                        text: StringValue.next,
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
