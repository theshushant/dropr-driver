import 'package:dropr_driver/helpers/dropr_link.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/models/order.dart';
import 'package:dropr_driver/models/screen_arguments.dart';
import 'package:dropr_driver/presentation/order/order_sub_details.dart';
import 'package:dropr_driver/presentation/order/package_details.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';

class OrderLocation extends StatefulWidget {
  const OrderLocation({
    Key? key,
    required this.order,
    this.isTypePickUp = true,
  }) : super(key: key);

  final Order order;
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
                          text: widget.order.pickupAddress.address,
                          color: ColorValues.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        SizedBox(
                          width: applyPaddingX(0.5),
                        ),
                        HelpText(
                          text: widget.order.dropAddress.address,
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
                          text: widget.order.user.name??" ",
                          color: ColorValues.blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                        ),
                        SizedBox(
                          width: applyPaddingX(0.5),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.75,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              HelpText(
                                text: widget.order.user.phoneNumber??"58899999",
                                color: ColorValues.blackShadeColor,
                                fontSize: 12,
                              ),
                              DroprLink(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    PackageDetails.routeName,
                                    arguments: ScreenArguments(
                                      genericId: widget.order.id
                                    )
                                  );
                                  return;
                                  // Navigator.pushNamed(
                                  //   context,
                                  //   PickUpOrderScreen.routeName,
                                  //   arguments: ScreenArguments(
                                  //     genericId: widget.order.id
                                  //   )
                                  // );
                                },
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
                showDetails ? Container() : divider,
                showDetails ? OrderSubDetails() : Container(),
                showDetails ? divider : Container(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget get divider {
    return GestureDetector(
      onTap: () {
        setState(() {
          showDetails = !showDetails;
        });
      },
      child: Divider(
        height: 5,
        endIndent: MediaQuery.of(context).size.width * 0.35,
        indent: MediaQuery.of(context).size.width * 0.35,
        thickness: 5,
        color: ColorValues.blackColor,
      ),
    );
  }
}
