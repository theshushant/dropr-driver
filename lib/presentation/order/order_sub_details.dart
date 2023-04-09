import 'package:dropr_driver/helpers/outlined_button.dart';
import 'package:dropr_driver/helpers/text_area.dart';
import 'package:dropr_driver/presentation/order/package_type_details.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class OrderSubDetails extends StatelessWidget {
  const OrderSubDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Divider(),
        Row(
          children: [
            Flexible(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: ColorValues.blackColor,
                ),
                child: Image.asset(
                  ImageValues.landing,
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            SizedBox(
              width: applyPaddingX(1),
            ),
            Flexible(
              flex: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Package Details",
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: applyPaddingX(1.5),
                  ),
                  PackageTypeItem(
                      title: packageCatagory.first["title"],
                      prefixWidget: packageCatagory.first['icon']),
                  SizedBox(
                    height: applyPaddingX(0.5),
                  ),
                  PackageTypeItem(
                      title: packageCatagory.last["title"],
                      prefixWidget: packageCatagory.last['icon'])
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: applyPaddingX(1),
        ),
        DroprTextArea(
          helpText: "Get the package from the main door",
        ),
        SizedBox(
          height: applyPaddingX(1),
        ),
        Wrap(
          children: const [
            DroprOutlineButton(text: "Fragile"),
            DroprOutlineButton(text: "Leave Unattended"),
          ],
        ),
      ],
    );
  }
}
