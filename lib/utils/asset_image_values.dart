import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'dart:ui' as ui;
import 'package:flutter/services.dart' show rootBundle;

class ImageValues {
  static String logo = 'assets/images/logo.png';
  static String landing = 'assets/images/landing.png';
  static String successImage = 'assets/images/okay.png';
  static String deliveryAddress = 'assets/images/Delivery address-pana.svg';
  static String callCenterIcon = 'assets/images/call_center_icon.svg';
  static String jobHistory = 'assets/images/job_history.svg';
  static String paymentHistory = 'assets/images/paymentHistory.svg';
  static String menu = 'assets/images/menu.svg';
  static String guideInfo = 'assets/images/guideInfo.svg';
  static String announce = 'assets/images/announce.svg';
  static String contact = 'assets/images/contact_us.svg';
  static String searchingDuty = 'assets/images/search-location.svg';
  static String privacy = 'assets/images/privacy 1.svg';
  static String user = 'assets/images/user.svg';
  static String logout = 'assets/images/logout.svg';
  static String refer = 'assets/images/refer.png';
  static String bell = 'assets/images/bell.svg';
  static String dummyMap = 'assets/images/dummy-map.png';
  static String help = 'assets/images/help.svg';
  static String appDrawerAsset = 'assets/images/Frame 14678.svg';
  static String locationHistory = 'assets/images/location.png';
  static String transactionSuccess = 'assets/images/transaction_success.png';
  static String apple = 'assets/images/apple.svg';
  static String google = 'assets/images/google.svg';
  static String microsoft = 'assets/images/microsoft.svg';
  static String deliveryVan = 'assets/images/DeliveryVan.png';
  static String phone = 'assets/images/phone.png';
  static String okay = 'assets/images/okay.png';
}

addImageSVG(String path,
    {double? height, double? width, BoxFit fit = BoxFit.contain}) {
  return SvgPicture.asset(
    path,
    semanticsLabel: path,
    height: height,
    width: width,
    fit: fit,
  );
}

addSVGIcons(String path, {double? height = 24, double? width = 24}) {
  return SvgPicture.asset(
    path,
    semanticsLabel: path,
    height: height,
    width: width,
  );
}

Future<Uint8List> getBytesFromAsset(String? path, int? width) async {
  ByteData data = await rootBundle.load(path!);
  ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
      targetWidth: width);
  ui.FrameInfo fi = await codec.getNextFrame();
  return (await fi.image.toByteData(format: ui.ImageByteFormat.png))!
      .buffer
      .asUint8List();
}
