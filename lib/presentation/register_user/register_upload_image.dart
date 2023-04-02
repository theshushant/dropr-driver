import 'dart:io';

import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_gradient_progress_bar.dart';
import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/camera_page.dart';
import 'package:dropr_driver/presentation/register_user/register_bank_information.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:mobx/mobx.dart';
import 'package:provider/provider.dart';

class UploadImage extends StatefulWidget {
  const UploadImage({Key? key}) : super(key: key);
  static String routeName = 'uploadImage';

  @override
  State<UploadImage> createState() => _UploadImageState();
}

class _UploadImageState extends State<UploadImage> {
  final _formState = GlobalKey<FormState>();
  Map<String, dynamic> map = {};

  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      final ScreenArguments? args =
          ModalRoute.of(context)!.settings.arguments as ScreenArguments?;
      setState(() {
        map = args?.map ?? <String, dynamic>{};
      });
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
                    percent: progressIndicatorValue(6),
                    gradient: const LinearGradient(
                      colors: [
                        ColorValues.progressIndicatorColor1,
                        ColorValues.progressIndicatorColor2,
                      ],
                    ),
                    backgroundColor: ColorValues.whiteColor,
                    height: progressBarHeight,
                  ),
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
                                child: warningBottomSheet(
                                  context,
                                  false,
                                  (XFile picture) async {
                                    // String contentType =
                                    //     picture.name.split(".").last;
                                    Map<String, String> data =
                                        await utilityService.getUrl('jpg');
                                    await utilityService.uploadFile(
                                        File(picture.path),
                                        data["signed_url"]!);
                                  },
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
                        ),
                        onTap: () {},
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
                          map["vehicle_details"]
                              ["vehicle_plate_images"] = ['xyz'];
                          map["vehicle_details"]
                              ["registration_certificate_images"] = ['xyz'];
                          map["vehicle_details"]
                              ["driver_license_images"] = ['xyz'];
                          UserStore store =
                              Provider.of<UserStore>(context, listen: false);
                          store.registerYourself(map);
                          when((p0) => !store.isLoading, () {
                            Navigator.pushNamed(
                              context,
                              BankInformation.routeName,
                              arguments: ScreenArguments(map: map),
                            );
                          });
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

Widget warningBottomSheet(
    BuildContext context, bool warning, Function onSelect) {
  return Wrap(
    children: warning
        ? [
            Text(StringValue.warning.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorValues.blackColor,
                    fontWeight: FontWeight.w500)),
            const Divider(
              color: ColorValues.blackColor,
            ),
            RichText(
              text: TextSpan(
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
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
          ]
        : [
            Text(StringValue.uploadImage.toUpperCase(),
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorValues.blackColor,
                    fontWeight: FontWeight.w500)),
            const Divider(
              color: ColorValues.blackColor,
            ),
            Padding(
              padding: EdgeInsets.all(applyPaddingX(1)),
              child: CustomRoundedButton(
                text: StringValue.camera,
                onTap: () async {
                  List<CameraDescription> value = await availableCameras();
                  XFile picture = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => CameraPage(cameras: value),
                    ),
                  );
                  onSelect(picture);
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.all(applyPaddingX(1)),
              child: CustomRoundedButton(
                color: ColorValues.whiteColor,
                border: Border.all(color: ColorValues.primaryColor),
                child: Text(StringValue.selectFromGallery,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: ColorValues.primaryColor,
                        fontWeight: FontWeight.w500)),
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            )
          ],
  );
}
