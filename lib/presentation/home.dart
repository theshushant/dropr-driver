import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/presentation/app_drawer.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const String routeName = 'HomePage';
  HomePage({Key? key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      drawer: AppDrawer(
        context: context,
      ),
      appBar: CustomAppBar(
        leading: InkWell(
          onTap: () {
            print('object');
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Padding(
              padding: EdgeInsets.all(
                applyPaddingX(1),
              ),
              child: addSVGIcons(ImageValues.menu)),
        ),
        title: Text(
          'Hey Anshit',
          style: Theme.of(context).textTheme.titleLarge,
        ),
        trailing: InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: EdgeInsets.all(
              applyPaddingX(1),
            ),
            child: addSVGIcons(
              ImageValues.callCenterIcon,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: applyPaddingX(1), vertical: applyPaddingX(2)),
          child: Center(
            child: Column(
              children: [
                Container(
                  height: 250,
                  width: 250,
                  decoration: BoxDecoration(
                    // color: ColorValues.whiteColor,
                    borderRadius: BorderRadius.circular(125),
                    gradient: const LinearGradient(
                      // begin: Alignment.topRight,
                      tileMode: TileMode.mirror,
                      // end: Alignment.bottomLeft,
                      colors: [
                        Color.fromRGBO(140, 140, 140, 0.24),
                        Color.fromRGBO(250, 250, 254, 1),
                        Color.fromRGBO(255, 255, 255, 0.5)
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      height: 180,
                      width: 180,
                      decoration: BoxDecoration(
                        color: ColorValues.blackShadeColor,
                        borderRadius: BorderRadius.circular(130),
                      ),
                      padding: EdgeInsets.all(1),
                      child: Container(
                          height: 150,
                          width: 150,
                          decoration: BoxDecoration(
                            color: ColorValues.blackShadeColor,
                            borderRadius: BorderRadius.circular(150),
                            border: Border.all(color: Colors.white, width: 8),
                          ),
                          child: Center(
                              child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text(
                                "\$120",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Text(
                                "Today's Earning",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 18),
                              ),
                            ],
                          ))),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "Today's Login Duration 00:00",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(applyPaddingX(2)),
                  child: CustomRoundedButton(
                    text: 'Start Shift',
                    onTap: () {},
                  ),
                ),
                Text(
                  'Deliver More to Earn more',
                  style: Theme.of(context).textTheme.labelLarge,
                )
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
