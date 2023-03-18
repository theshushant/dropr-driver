import 'package:camera/camera.dart';
import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_link.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/helpers/outlined_button.dart';
import 'package:dropr_driver/helpers/text_area.dart';
import 'package:dropr_driver/presentation/camera_page.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class PackageDetails extends StatefulWidget {
  const PackageDetails({Key? key}) : super(key: key);
  static const String routeName = 'PackageDetails';

  @override
  State<PackageDetails> createState() => _PackageDetailsState();
}

class _PackageDetailsState extends State<PackageDetails> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: Icon(
            Icons.arrow_back_ios_new,
          ),
          title: Text(
            StringValue.orderId,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          trailing: Icon(Icons.headphones),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(applyPaddingX(1)),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(applyPaddingX(1)),
                  height: 110,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Placeholder(
                        fallbackWidth: 100,
                        fallbackHeight: 100,
                      ),
                      Expanded(
                        child: Padding(
                          padding: EdgeInsets.all(applyPaddingX(1)),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Package Details".toUpperCase(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium!
                                      .copyWith(fontWeight: FontWeight.w500),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.menu_book_rounded),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "Documents | books",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Icon(Icons.card_giftcard_rounded),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      "120 X 120",
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium!
                                          .copyWith(fontSize: 14),
                                    ),
                                  ],
                                ),
                              ]),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text('Delivery Instruction'.toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          )),
                ),
                DroprTextArea(helpText: "Get the package from the main door"),
                SizedBox(
                  height: applyPaddingX(1),
                ),
                Wrap(
                  children: const [
                    DroprOutlineButton(
                      text: "Fragile",
                    ),
                    DroprOutlineButton(text: "Leave Unattended"),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: Text("Pick up Details".toUpperCase(),
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontWeight: FontWeight.w500,
                          )),
                ),
                Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: applyPaddingX(1),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Address",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                SizedBox(
                                  height: applyPaddingX(1),
                                ),
                                HelpText(
                                  text: "Perth Institute of CA".toUpperCase(),
                                  color: ColorValues.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                HelpText(
                                  text: "51 James St, Perth WA 6000, Australia",
                                  color: ColorValues.blackColor,
                                  fontSize: 12,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: applyPaddingX(2),
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Contact",
                                  style: Theme.of(context).textTheme.labelSmall,
                                ),
                                SizedBox(
                                  height: applyPaddingX(1),
                                ),
                                HelpText(
                                  text: "Amit Trevedi",
                                  color: ColorValues.blackColor,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    HelpText(
                                      text: "9718529289",
                                      color: ColorValues.linkTextColor,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    )),
                Padding(
                  padding: EdgeInsets.only(top: applyPaddingX(5)),
                  child: CustomRoundedButton(
                    text: "Confirm Pick Up",
                    onTap: () async {
                      List<CameraDescription> value = await availableCameras();
                      XFile picture = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CameraPage(
                            cameras: value,
                            packageDetails: true,
                          ),
                        ),
                      );
                      print(picture.name);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
