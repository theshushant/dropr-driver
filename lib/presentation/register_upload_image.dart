import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_gradient_progress_bar.dart';
import 'package:dropr_driver/helpers/dropr_text_field.dart';
import 'package:dropr_driver/presentation/home.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);
  static String routeName = 'uploadImage';

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final _formState = GlobalKey<FormState>();

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
                      percent: progressIndicatorValue(6),
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
                      StringValue.uploadImage,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(applyPaddingX(1)),
                    child: Container(
                      color: ColorValues.boxSelectionBackground,
                      child: ListTile(
                        selectedColor: ColorValues.selectionHighlight,
                        leading: const Icon(Icons.car_crash),
                        title: Text(
                          StringValue.vehicleImage,
                          style: Theme.of(context).textTheme.button,
                        ),
                        onTap: () {
                          showModalBottomSheet(
                            context: context,
                            shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(20),
                              ),
                            ),
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            builder: (context) {
                              return Padding(
                                padding: EdgeInsets.all(applyPaddingX(2)),
                                child: Wrap(
                                  children: [
                                    Text(StringValue.warning.toUpperCase(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                                color: ColorValues.blackColor,
                                                fontWeight: FontWeight.w500)),
                                    const Divider(
                                      color: ColorValues.blackColor,
                                    ),
                                    RichText(
                                      text: TextSpan(
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall!
                                              .copyWith(
                                                  color: ColorValues.blackColor,
                                                  fontWeight: FontWeight.w400),
                                          text: StringValue.warning1,
                                          children: const [
                                            TextSpan(
                                              text: StringValue.warning2,
                                            ),
                                            TextSpan(
                                              text: StringValue.warning3,
                                            ),
                                          ]),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.all(applyPaddingX(1)),
                                      child: CustomRoundedButton(
                                        text: StringValue.okayGotIt,
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                      ),
                                    )
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(applyPaddingX(1)),
                    child: Container(
                      color: ColorValues.boxSelectionBackground,
                      child: ListTile(
                          selectedColor: ColorValues.selectionHighlight,
                          leading: const Icon(Icons.car_crash),
                          title: Text(
                            StringValue.registrationImage,
                            style: Theme.of(context).textTheme.button,
                          )),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(applyPaddingX(1)),
                    child: Container(
                      color: ColorValues.boxSelectionBackground,
                      child: ListTile(
                          selectedColor: ColorValues.selectionHighlight,
                          leading: const Icon(Icons.car_crash),
                          title: Text(
                            StringValue.driverLicenseImage,
                            style: Theme.of(context).textTheme.button,
                          )),
                    ),
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.all(applyPaddingX(2)),
                      child: CustomRoundedButton(
                        text: StringValue.next,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            HomePage.routeName,
                          );
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
