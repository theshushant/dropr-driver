import 'package:dropr_driver/helpers/custom_rounded_button.dart';
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
            style: TextStyle(
              fontSize: 18,
            ),
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
                          fontSize: 14,
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
                  height: applyPaddingX(2),
                ),
                Row(
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
                          fontSize: 14,
                        ),
                        SizedBox(
                          width: applyPaddingX(0.5),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Row(
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
                                  size: 14,
                                  color: ColorValues.whiteColor,
                                ),
                              ),
                            ],
                          ),
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
                _extraBody,
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget get _extraBody {
    return Container(
      child: Column(
        children: [
         Container(
           padding: EdgeInsets.symmetric(
             horizontal: applyPaddingX(1),
             vertical: applyPaddingX(0.5),
           ),
           decoration: BoxDecoration(
             borderRadius: BorderRadius.circular(8),
             color: ColorValues.whiteColor,
           ),
           child: Text(
             "Fragile",
             style: TextStyle(
               fontSize: 12
             ),
           ),
         ),
        ],
      ),
    );
  }
}
