import 'dart:async';

import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/store_observer.dart';
import 'package:dropr_driver/presentation/app_drawer.dart';
import 'package:dropr_driver/presentation/order/incoming_order.dart';
import 'package:dropr_driver/store/user_store.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'HomePage';

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  bool _startDuty = false;
  Timer? timer;
  int _start = 30;
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      key: _scaffoldKey,
      drawer: AppDrawer(
        context: context,
      ),
      appBar: CustomAppBar(
        leading: InkWell(
          onTap: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          child: Padding(
              padding: EdgeInsets.all(
                applyPaddingX(1),
              ),
              child: addSVGIcons(ImageValues.menu)),
        ),
        title: StoreObserver(
          builder: (UserStore store, BuildContext context) {
            return Text(
              'Hey ${store.user?.name}',
              style: Theme.of(context).textTheme.titleLarge,
            );
          },
        ),
        trailing: InkWell(
          onTap: () {
            Navigator.pushNamed(
              context,
              IncomingOrder.routeName,
            );
          },
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
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: SfRadialGauge(axes: <RadialAxis>[
                    RadialAxis(
                      canScaleToFit: true,
                      minimum: 0,
                      maximum: 10,
                      showLabels: false,
                      showTicks: false,
                      startAngle: 145,
                      endAngle: 145,
                      axisLineStyle: const AxisLineStyle(
                        thickness: 1,
                        color: ColorValues.blackShadeColor,
                        thicknessUnit: GaugeSizeUnit.factor,
                      ),
                      annotations: const <GaugeAnnotation>[
                        GaugeAnnotation(
                          positionFactor: 0.5,
                          angle: 90,
                          widget: Text(
                            "\$120\nToday's Earning",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                overflow: TextOverflow.ellipsis,
                                fontSize: 18),
                          ),
                        )
                      ],
                      pointers: const <GaugePointer>[
                        RangePointer(
                          value: 7,
                          width: 0.1,
                          color: Colors.white,
                          enableAnimation: true,
                          animationType: AnimationType.slowMiddle,
                          pointerOffset: 0.1,
                          cornerStyle: CornerStyle.bothCurve,
                          sizeUnit: GaugeSizeUnit.factor,
                        )
                      ],
                    )
                  ]),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(applyPaddingX(1)),
                  child: Text(
                    "Today's Login Duration 07:00 hr",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(applyPaddingX(2)),
                  child: CustomRoundedButton(
                    text: _startDuty ? 'End Duty' : 'Start Shift',
                    onTap: () {
                      setState(() {
                        _startDuty = !_startDuty;
                      });
                      startTimer();
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (BuildContext context) {
                          return Container(
                              decoration: BoxDecoration(
                                  color: ColorValues.whiteColor,
                                  boxShadow: const [
                                    BoxShadow(
                                      offset: Offset(0, 1),
                                      blurRadius: 8,
                                      color: Colors.black12,
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(10)),
                              height: 100,
                              child: Center(
                                child: ListTile(
                                  onTap: () {
                                    Navigator.pushNamed(
                                      context,
                                      IncomingOrder.routeName,
                                    );
                                  },
                                  leading: Container(
                                    alignment: Alignment.center,
                                    width: 60,
                                    padding: EdgeInsets.all(applyPaddingX(0.5)),
                                    color: ColorValues.blackShadeColor,
                                    child: Text("${_start} Sec",
                                        maxLines: 2,
                                        textAlign: TextAlign.center,
                                        style: Theme.of(context)
                                            .textTheme
                                            .titleLarge!
                                            .copyWith(
                                              color: ColorValues.whiteColor,
                                            )),
                                  ),
                                  title: RichText(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 4,
                                      text: TextSpan(
                                          text:
                                              'You have got an order notification\n',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                          children: [
                                            TextSpan(
                                              text:
                                                  'See the order detail by clicking here',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .labelMedium,
                                            ),
                                          ])),
                                  trailing:
                                      Icon(Icons.arrow_forward_ios_rounded),
                                ),
                              ));
                        },
                      );
                      // Navigator.pushNamed(
                      //   context,
                      //   PaymentHistory.routeName,
                      // );
                    },
                  ),
                ),
                Text(
                  'Deliver More to Earn more',
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Text(
                        'Features',
                        style: Theme.of(context).textTheme.titleLarge,
                      )
                    ],
                  ),
                ),
                StoreObserver(
                  builder: (UserStore store, BuildContext context) {
                    return Container(
                      height: 200,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: const [
                            ColorValues.deliverPartnerInfoBoxGradient1,
                            ColorValues.deliverPartnerInfoBoxGradient2,
                          ],
                        ),
                        color: ColorValues.blackColor,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                maxRadius: 40,
                                backgroundImage:
                                    AssetImage(ImageValues.successImage),
                              ),
                              Text(
                                store.user?.name ?? "Anshit",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(
                                      color: ColorValues.whiteColor,
                                    ),
                              ),
                              Text(
                                store.user?.role ?? 'Delivery Partner',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: ColorValues.whiteColor,
                                    ),
                              )
                            ],
                          ),
                          VerticalDivider(
                            color: ColorValues.blackColor,
                            indent: 20,
                            endIndent: 20,
                            thickness: 1,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'ID NO   :${store.user?.id}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: ColorValues.whiteColor,
                                    ),
                              ),
                              Text(
                                'DOB     :${store.user?.dateOfBirth}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: ColorValues.whiteColor,
                                    ),
                              ),
                              Text(
                                'Phone  :${store.user?.phoneNumber}',
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: ColorValues.whiteColor,
                                    ),
                              ),
                              Text(
                                'E-mail  :${store.user?.email}',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context)
                                    .textTheme
                                    .labelMedium!
                                    .copyWith(
                                      color: ColorValues.whiteColor,
                                    ),
                              )
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: applyPaddingX(4)),
                  child: GridView.count(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    crossAxisCount: 2,
                    crossAxisSpacing: 30,
                    mainAxisSpacing: 20,
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(applyPaddingX(1)),
                          decoration: BoxDecoration(
                              color: ColorValues.whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 8,
                                  color: Colors.black12,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: addImageSVG(ImageValues.guideInfo),
                              ),
                              Text(
                                '\$24',
                                style: Theme.of(context).textTheme.titleLarge,
                              ),
                              Text(
                                'Total Earning',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall!
                                    .copyWith(
                                      color: ColorValues.blackColor,
                                      fontWeight: FontWeight.w400,
                                    ),
                              )
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(applyPaddingX(1)),
                          decoration: BoxDecoration(
                              color: ColorValues.whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 8,
                                  color: Colors.black12,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: addImageSVG(ImageValues.callCenterIcon),
                              ),
                              Text('5',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              Text('Today\'s Order',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        child: Container(
                          padding: EdgeInsets.all(applyPaddingX(1)),
                          decoration: BoxDecoration(
                              color: ColorValues.whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 8,
                                  color: Colors.black12,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: addImageSVG(ImageValues.jobHistory),
                              ),
                              Text('00:00',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              Text('Weekly Login Time',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          padding: EdgeInsets.all(applyPaddingX(1)),
                          decoration: BoxDecoration(
                              color: ColorValues.whiteColor,
                              boxShadow: const [
                                BoxShadow(
                                  offset: Offset(0, 1),
                                  blurRadius: 8,
                                  color: Colors.black12,
                                )
                              ],
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                child: addImageSVG(ImageValues.guideInfo),
                              ),
                              Text('\$12984',
                                  style:
                                      Theme.of(context).textTheme.titleLarge),
                              Text('Weekly Earning',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleSmall!
                                      .copyWith(
                                          color: ColorValues.blackColor,
                                          fontWeight: FontWeight.w400))
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Image.asset(ImageValues.refer),
                // addImageSVG(ImageValues.refer)
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
