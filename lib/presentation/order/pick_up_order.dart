import 'dart:async';
import 'dart:developer';

import 'package:dropr_driver/helpers/custom_rounded_button.dart';
import 'package:dropr_driver/helpers/dropr_app_bar.dart';
import 'package:dropr_driver/helpers/dropr_link.dart';
import 'package:dropr_driver/helpers/helper_text.dart';
import 'package:dropr_driver/services/location_service.dart';
import 'package:dropr_driver/utils/asset_image_values.dart';
import 'package:dropr_driver/utils/color_values.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:dropr_driver/utils/string_values.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:url_launcher/url_launcher.dart';

class PickUpOrderScreen extends StatefulWidget {
  static String routeName = 'PickUpOrderScreen';

  const PickUpOrderScreen({Key? key}) : super(key: key);

  @override
  State<PickUpOrderScreen> createState() => _PickUpOrderScreenState();
}

class _PickUpOrderScreenState extends State<PickUpOrderScreen> {
  final Completer<GoogleMapController> _controller = Completer();
  LatLng? sourceLocation;
  static const LatLng destination =
      LatLng(28.542469503925872, 77.2288228007458);
  List<LatLng> polylineCoordinates = [];
  void getPolyPoints() async {
    log('plotting points on map');
    PolylinePoints polylinePoints = PolylinePoints();
    PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
      mapsApiKey, // Your Google Map Key
      PointLatLng(sourceLocation!.latitude, sourceLocation!.longitude),
      PointLatLng(destination.latitude, destination.longitude),
    );
    if (result.points.isNotEmpty) {
      for (var point in result.points) {
        polylineCoordinates.add(
          LatLng(point.latitude, point.longitude),
        );
      }
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    determinePosition().then((location) async {
      setState(() {
        sourceLocation = LatLng(location.latitude, location.longitude);
      });
      getPolyPoints();
      GoogleMapController googleMapController = await _controller.future;
      googleMapController.animateCamera(
        CameraUpdate.newCameraPosition(
          CameraPosition(
            zoom: 13.5,
            target: LatLng(
              location.latitude,
              location.longitude,
            ),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomAppBar(
              leading: InkWell(
                onTap: () => Navigator.pop(context),
                child: Padding(
                  padding: EdgeInsets.all(
                    applyPaddingX(1),
                  ),
                  child: const Icon(
                    Icons.arrow_back,
                  ),
                ),
              ),
              title: Text(
                StringValue.orderId,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              trailing: Container(),
            ),
            Expanded(
              child: sourceLocation == null
                  ? const Center(child: CircularProgressIndicator())
                  : _body,
            ),
          ],
        ),
      ),
    );
  }

  Widget get _body {
    bool reached = false;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Expanded(
          child: GoogleMap(
            initialCameraPosition: CameraPosition(
              target: sourceLocation!,
              zoom: 13.5,
            ),
            polylines: {
              Polyline(
                polylineId: const PolylineId("pickup-route"),
                points: polylineCoordinates,
                color: ColorValues.primaryColor,
                width: 6,
              ),
            },
            markers: {
              Marker(
                markerId: MarkerId("pickup-source"),
                position: sourceLocation!,
              ),
              const Marker(
                markerId: MarkerId("pickup-destination"),
                position: destination,
              ),
            },
          ),
        ),
        SingleChildScrollView(
          child: Stack(children: [
            Column(children: [
              Container(
                  padding: EdgeInsets.all(applyPaddingX(2)),
                  decoration: const BoxDecoration(
                    color: ColorValues.whiteColor,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurRadius: 5.0,
                      ),
                    ],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(5),
                      topRight: Radius.circular(5),
                    ),
                  ),
                  child: Column(children: [
                    Row(
                      children: [
                        Text(StringValue.pickUpLocation,
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall!
                                .copyWith(
                                  color: ColorValues.blackColor,
                                )),
                      ],
                    ),
                    const Divider(
                      color: ColorValues.disabledColor,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                        text:
                                            "51 James St, Perth WA 6000, Australia",
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
                                  GestureDetector(
                                    onTap: () async {
                                      Uri phoneno =
                                          Uri.parse('tel:+919718529289');
                                      if (await launchUrl(phoneno)) {
                                        //dialer opened
                                      } else {
                                        //dailer is not opened
                                      }
                                    },
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.75,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: const [
                                              HelpText(
                                                text: "58899999",
                                                color:
                                                    ColorValues.blackShadeColor,
                                                fontSize: 12,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Divider(),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              CustomRoundedButton(
                                color: ColorValues.primaryColor,
                                isEnabled: true,
                                text: StringValue.reachedToLocation,
                                onTap: () {
                                  setState(() {
                                    reached = !reached;
                                  });
                                  // Navigator.pushNamed(context, FindingRider.routeName)
                                },
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ]))
            ])
          ]),
        )
      ],
    );
  }
}
