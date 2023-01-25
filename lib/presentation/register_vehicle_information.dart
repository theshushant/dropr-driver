import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_gradient_progress_bar.dart';
import 'package:dropr_driver/helpers/dropr_text_field.dart';
import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/register_upload_image.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class VehicleInformation extends StatefulWidget {
  const VehicleInformation({Key? key}) : super(key: key);
  static String routeName = 'VehicleInformation';

  @override
  State<VehicleInformation> createState() => _VehicleInformationState();
}

class _VehicleInformationState extends State<VehicleInformation> {
  final _formState = GlobalKey<FormState>();
  Map<String, dynamic> map = {};
  Map<String, dynamic> map1 = <String,dynamic>{};

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ScreenArguments args =
      ModalRoute
          .of(context)!
          .settings
          .arguments as ScreenArguments;
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
            style: Theme
                .of(context)
                .textTheme
                .titleLarge,
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
                      percent: progressIndicatorValue(5),
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
                      StringValue.vehicleInformation,
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleLarge,
                    ),
                  ),
                  DroprTextField(
                    hintText: StringValue.vehicleInformation,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map1["vehicle_plate_number"] = value;
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.registration,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map1["registration_certificate_number"] =
                          value;
                    },
                  ),
                  DroprTextField(
                    hintText: StringValue.driverLicense,
                    onValidate: (String? value) {
                      if (value == null || value.isEmpty) {
                        return StringValue.required;
                      }
                    },
                    onSave: (String value) {
                      map1["driver_license_number"] = value;
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
                              "vehicle_details":map1
                            });
                            Navigator.pushNamed(
                              context,
                              UploadImage.routeName,
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
