import 'package:dropr_driver/presentation/landing_page.dart';
import 'package:dropr_driver/presentation/order/order_screen.dart';
import 'package:dropr_driver/presentation/payments/payment_history.dart';
import 'package:dropr_driver/store/order_store.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppDrawer extends StatelessWidget {
  final BuildContext context;

  const AppDrawer({Key? key, required this.context}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ListTile(
              onTap: () {},
              selectedColor: ColorValues.selectionHighlight,
              leading: addSVGIcons(ImageValues.user),
              subtitle: Text(
                'ID Number : 905750250 ',
                style: Theme
                    .of(context)
                    .textTheme
                    .displaySmall,
              ),
              title: Text(
                'Anshit',
                style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,
              ),
              trailing: const Icon(
                CupertinoIcons.arrowtriangle_right_fill,
                size: 15,
                color: ColorValues.primaryColor,
              ),
            ),
            const Divider(
              color: ColorValues.disabledColor,
            ),
            SwitchListTile(
                title: Text(
                  'Duty Status',
                  style: Theme
                      .of(context)
                      .textTheme
                      .displayMedium,
                ),
                dense: true,
                activeColor: Colors.green,
                onChanged: (value) {},
                value: true),
            const Divider(
              color: ColorValues.disabledColor,
            ),
            ListTile(
              onTap: (){
                Navigator.pushNamed(context, OrderScreen.routeName);
              },
              leading: addSVGIcons(ImageValues.jobHistory),
              title: Text(
                'Job History',
                style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,
              ),
            ),
            ListTile(
              onTap: () => {
              Navigator.pushNamed(context, PaymentHistory.routeName)
            },
              leading: addSVGIcons(ImageValues.paymentHistory),
              title: Text(
                'Payment History',
                style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,
              ),
            ),
            ListTile(
              leading: addSVGIcons(ImageValues.guideInfo),
              title: Text(
                'Guide & Instruction',
                style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,
              ),
            ),
            ListTile(
              leading: addSVGIcons(ImageValues.announce),
              title: Text(
                'Refer A Friend & Earn',
                style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,
              ),
            ),
            const Divider(
              color: ColorValues.disabledColor,
            ),
            ListTile(
              onTap: () async {
                Provider.of<OrderStore>(context,listen: false).reset();
                await Provider.of<UserStore>(context,listen: false).reset();
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacementNamed(context, LandingPage.routeName);
              },
              leading: addSVGIcons(ImageValues.logout),
              title: Text(
                'SignOut',
                style: Theme
                    .of(context)
                    .textTheme
                    .displayMedium,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
