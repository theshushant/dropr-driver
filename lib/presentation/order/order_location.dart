import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_link.dart';
import 'package:dropr_driver/helpers/dropr_text_field.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/helpers/outlined_button.dart';
import 'package:dropr_driver/helpers/text_area.dart';
import 'package:dropr_driver/models/order.dart';
import 'package:dropr_driver/presentation/order/order_sub_details.dart';
import 'package:dropr_driver/presentation/order/package_type_details.dart';
import 'package:dropr_driver/presentation/order/pick_up_order.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class OrderLocation extends StatefulWidget {
  const OrderLocation({
    Key? key,
    this.order,
    this.isTypePickUp = true,
  }) : super(key: key);

  final Order? order;
  final bool isTypePickUp;

  @override
  State<OrderLocation> createState() => _OrderLocationState();
}

class _OrderLocationState extends State<OrderLocation> {
  bool showDetails = false;
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
            widget.isTypePickUp
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
              crossAxisAlignment: CrossAxisAlignment.start,
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
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    PickUpOrderScreen.routeName,
                                  );
                                },
                                child: DroprLink(
                                  text: 'Map',
                                  isButtonType: true,
                                  trailingWidget: Icon(
                                    Icons.arrow_forward,
                                    size: 14,
                                    color: ColorValues.whiteColor,
                                  ),
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
                showDetails?Container():divider,
               showDetails? OrderSubDetails():Container(),
                showDetails?divider:Container(),
              ],
            ),
          )
        ],
      ),
    );
  }
  Widget get divider {
    return InkWell(
      onTap: (){
        setState(() {
          showDetails = !showDetails;
        });
      },
      child: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width*0.35
        ),
        child: Divider(
          thickness: 4,
          color: ColorValues.blackColor,
        ),
      ),
    );
  }
}
