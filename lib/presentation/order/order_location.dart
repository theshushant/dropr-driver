import 'package:dropr_driver/helpers/dropr_link.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/models/order.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class OrderLocation extends StatelessWidget {
  const OrderLocation({
    Key? key,
    this.order,
    this.isTypePickUp = true,
  }) : super(key: key);

  final Order? order;
  final bool isTypePickUp;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: applyPaddingX(1),
        vertical: applyPaddingX(1),
      ),
      margin: EdgeInsets.symmetric(
        vertical: applyPaddingX(1),
        horizontal: applyPaddingX(2),
      ),
      decoration: BoxDecoration(
        color: ColorValues.appWhiteColor,
        borderRadius: BorderRadius.circular(
          12,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            isTypePickUp
                ? StringValue.pickUpLocation
                : StringValue.dropOffLocation,
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: applyPaddingX(1),
              vertical: applyPaddingX(1),
            ),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      ImageValues.locationHistory,
                      height: 20,
                    ),
                    SizedBox(
                      width: applyPaddingX(1),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        HelpText(
                          text: "Perth Institute of CA",
                          color: ColorValues.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 16,
                        ),
                        SizedBox(
                          width: applyPaddingX(0.5),
                        ),
                        HelpText(
                          text: "51 James St, Perth WA 6000, Australia",
                          color: ColorValues.blackShadeColor,
                          fontSize: 12,
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: applyPaddingX(1),
                ),
                Center(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        ImageValues.phone,
                        height: 20,
                      ),
                      SizedBox(
                        width: applyPaddingX(1),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          HelpText(
                            text: "Amit Trevedi",
                            color: ColorValues.blackColor,
                            fontWeight: FontWeight.w500,
                            fontSize: 16,
                          ),
                          SizedBox(
                            width: applyPaddingX(0.5),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HelpText(
                                text: "58899999",
                                color: ColorValues.blackShadeColor,
                                fontSize: 12,
                              ),
                              DroprLink(
                                text: 'Map',
                                isButtonType: true,
                                trailingWidget: Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                  color: ColorValues.whiteColor,
                                ),
                              ),
                            ],
                          ),
                          // Align(
                          //   alignment: Alignment.center,
                          //   child: Text("Csmcks"),
                          // ),
                          Divider(),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
