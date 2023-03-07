import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/location_item.dart';
import 'package:dropr_driver/helpers/swipeable_button.dart';
import 'package:dropr_driver/presentation/order/order_screen.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class IncomingOrder extends StatefulWidget {
  const IncomingOrder({Key? key}) : super(key: key);
  static String routeName = 'IncomingOrder';

  @override
  State<IncomingOrder> createState() => _IncomingOrderState();
}

class _IncomingOrderState extends State<IncomingOrder> {
  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: CustomAppBar(
          leading: Container(),
          title: Padding(
            padding: EdgeInsets.all(
              applyPaddingX(2),
            ),
            child: Row(
              children: [
                addImageSVG(ImageValues.bell),
                Text(
                  'Order',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
          ),
          trailing: Container(),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: applyPaddingX(1)),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(ImageValues.dummyMap),
                    Positioned(
                        bottom: 0,
                        right: 0,
                        child: Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: applyPaddingX(1)),
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: ColorValues.blackShadeColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Text("30min",
                                style: Theme.of(context).textTheme.titleSmall),
                          ),
                        ))
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Location Details',
                    style: Theme.of(context).textTheme.titleLarge),
                LocationItem(
                  toAddress: 'Nick rendall leardship',
                  fromAddress: 'Perth institute of cA',
                  toAddressDescription:
                      'forest palace R10/y14 wellington st, Australia',
                  fromAddressDescription:
                      '51 James St, Perth WA 6000, Australia',
                ),
                SizedBox(
                  height: 10,
                ),
                Divider(
                  endIndent: 5,
                  thickness: 1.5,
                  indent: 5,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Other Details',
                    style: Theme.of(context).textTheme.titleLarge),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Earning on this order',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('\$112.00',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: ColorValues.blackColor))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Distance (in KM)',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('3.6 ',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: ColorValues.blackColor))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Time taken in delivery',
                        style: Theme.of(context).textTheme.titleMedium),
                    Text('20 mins',
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall!
                            .copyWith(color: ColorValues.blackColor)),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                SwipeableButtonView(
                  buttonText: 'Swipe Right to Confirm ',
                  buttontextstyle: TextStyle(
                      color: ColorValues.disabledColor,
                      fontWeight: FontWeight.w400,
                      fontSize: 20),
                  buttonColor: ColorValues.progressIndicatorColor1,
                  buttonWidget: Container(
                    child: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: ColorValues.appWhiteColor,
                    ),
                  ),
                  activeColor: ColorValues.appWhiteColor,
                  isFinished: isFinished,
                  onWaitingProcess: () {
                    setState(() {
                      isFinished = true;
                    });
                  },
                  onFinish: () async {
                    await Navigator.pushReplacementNamed(
                      context,
                      OrderScreen.routeName,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
