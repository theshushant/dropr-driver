import 'package:camera/camera.dart';
import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/presentation/camera_page.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';
import 'dart:io';

class OrderImages extends StatefulWidget {
  const OrderImages({Key? key}) : super(key: key);
  static const String routeName = 'OrderImages';

  @override
  State<OrderImages> createState() => _OrderImagesState();
}

class _OrderImagesState extends State<OrderImages> {
  XFile? selfie;
  XFile? productImage;

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
                GestureDetector(
                  onLongPress: () async {
                    if (selfie != null) {
                      await showDialog(
                          context: context,
                          builder: (_) =>
                              imageDialog('Selfie', selfie!.path, context));
                    }
                  },
                  onTap: () async {
                    List<CameraDescription> value = await availableCameras();
                    // ignore: use_build_context_synchronously
                    XFile picture = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CameraPage(
                          cameras: value,
                          packageDetails: true,
                        ),
                      ),
                    );
                    setState(() {
                      selfie = picture;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(applyPaddingX(1)),
                    margin: EdgeInsets.all(applyPaddingX(1)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorValues.boxColor,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 8,
                          color: Colors.black12,
                        )
                      ],
                    ),
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            selfie == null
                                ? Icon(
                                    Icons.error_outline,
                                    color: ColorValues.warningColor,
                                  )
                                : Icon(
                                    Icons.task_alt_sharp,
                                    color: ColorValues.successColor,
                                  ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Take Your Selfie',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.w500))
                          ],
                        ),
                        Row(
                          children: [
                            selfie != null
                                ? Image.file(
                                    File(selfie!.path),
                                  )
                                : Container(),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(Icons.edit_note_outlined, color: Colors.blue)
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onLongPress: () async {
                    if (productImage != null) {
                      await showDialog(
                          context: context,
                          builder: (_) => imageDialog(
                              'productImage', productImage!.path, context));
                    }
                  },
                  onTap: () async {
                    List<CameraDescription> value = await availableCameras();
                    // ignore: use_build_context_synchronously
                    XFile picture = await Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => CameraPage(
                          cameras: value,
                          packageDetails: true,
                        ),
                      ),
                    );
                    setState(() {
                      productImage = picture;
                    });
                  },
                  child: Container(
                    padding: EdgeInsets.all(applyPaddingX(1)),
                    margin: EdgeInsets.all(applyPaddingX(1)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: ColorValues.boxColor,
                      boxShadow: const [
                        BoxShadow(
                          offset: Offset(0, 1),
                          blurRadius: 8,
                          color: Colors.black12,
                        )
                      ],
                    ),
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            productImage == null
                                ? Icon(
                                    Icons.error_outline,
                                    color: ColorValues.warningColor,
                                  )
                                : Icon(
                                    Icons.task_alt_sharp,
                                    color: ColorValues.successColor,
                                  ),
                            SizedBox(
                              width: 5,
                            ),
                            Text('Take a Product Image',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleMedium!
                                    .copyWith(fontWeight: FontWeight.w500))
                          ],
                        ),
                        Row(
                          children: [
                            productImage != null
                                ? Image.file(
                                    File(productImage!.path),
                                  )
                                : Container(),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.edit_note_outlined,
                              color: Colors.blue,
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: applyPaddingX(5)),
                  child: CustomRoundedButton(
                    text: "Confirm Pick Up",
                    onTap: () {},
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

Widget imageDialog(text, path, context) {
  return Dialog(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Image.file(
          File(path),
          fit: BoxFit.cover,
        ),
      ],
    ),
  );
}
