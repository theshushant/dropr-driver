import 'dart:developer';

import 'package:dropr_driver/presentation/profile/profile_screen.dart';
import 'package:dropr_driver/presentation/landing_page.dart';
import 'package:dropr_driver/presentation/order/order_screen.dart';
import 'package:dropr_driver/presentation/payments/payment_history.dart';
import 'package:dropr_driver/store/order_store.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dropr_driver/helpers/store_observer.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class AppDrawer extends StatelessWidget {
  final BuildContext context;

  const AppDrawer({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Expanded(
            child: ListView(
              children: [
                GestureDetector(
                  onTap: () => Navigator.pushNamed(
                    context,
                    ProfileScreen.routeName,
                  ),
                  child: Container(
                    margin: EdgeInsets.all(applyPaddingX(1)),
                    padding: EdgeInsets.all(applyPaddingX(1)),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                        color: ColorValues.blackShadeColor,
                        borderRadius: BorderRadius.circular(5)),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          StoreObserver(
                            builder: (UserStore store, BuildContext context) {
                              return Text(
                                '${store.user?.name}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      fontSize: 18,
                                    ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          StoreObserver(
                              builder: (UserStore store, BuildContext context) {
                            return Text(
                              'ID Number : ${store.user?.id}',
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500),
                            );
                          }),
                          SizedBox(
                            height: 20,
                          ),
                          StoreObserver(
                              builder: (UserStore store, BuildContext context) {
                            return Row(
                              children: [
                                Text(
                                  'Rating :',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500),
                                ),
                                RatingBar.builder(
                                  initialRating: 3,
                                  minRating: 1,
                                  direction: Axis.horizontal,
                                  ignoreGestures: true,
                                  allowHalfRating: true,
                                  itemSize: 17,
                                  itemCount: 5,
                                  itemBuilder: (context, _) => Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 15,
                                  ),
                                  onRatingUpdate: (rating) {},
                                ),
                              ],
                            );
                          }),
                        ]),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: applyPaddingX(2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Duty Status',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: ColorValues.blackColor,
                                fontWeight: FontWeight.w600),
                      ),
                      CupertinoSwitch(
                          activeColor: ColorValues.successColor,
                          thumbColor: ColorValues.whiteColor,
                          trackColor: Colors.black12,
                          value: true,
                          onChanged: (value) {}),
                    ],
                  ),
                ),
                const Divider(
                  color: ColorValues.disabledColor,
                ),
                ListTile(
                  onTap: () {
                    Navigator.pushNamed(context, OrderScreen.routeName);
                  },
                  leading: addSVGIcons(ImageValues.jobHistory),
                  title: Text(
                    'Job History',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                ListTile(
                  onTap: () =>
                      {Navigator.pushNamed(context, PaymentHistory.routeName)},
                  leading: addSVGIcons(ImageValues.paymentHistory),
                  title: Text(
                    'Payment History',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                ListTile(
                  leading: addSVGIcons(ImageValues.guideInfo),
                  title: Text(
                    'Guide & Instruction',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
                ListTile(
                  leading: addSVGIcons(ImageValues.announce),
                  title: Text(
                    'Refer A Friend & Earn',
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: FractionalOffset.bottomCenter,
            child: ListTile(
              onTap: () async {
                Provider.of<OrderStore>(context, listen: false).reset();
                await Provider.of<UserStore>(context, listen: false).reset();
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacementNamed(context, LandingPage.routeName);
              },
              leading: addSVGIcons(ImageValues.logout),
              title: Text(
                'SignOut',
                style: Theme.of(context).textTheme.displayMedium,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
