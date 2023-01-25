import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
  static String info1 = 'assets/images/info1.svg';
  static String privacy = 'assets/images/privacy 1.svg';
  static String user = 'assets/images/user.svg';
  static String logout = 'assets/images/logout.svg';
  static String refer = 'assets/images/refer.png';
  static String savedLocation = 'assets/images/retirement-home 1.svg';
  static String locationMarker = 'assets/images/locationMarker.svg';
  static String help = 'assets/images/help.svg';
  static String appDrawerAsset = 'assets/images/Frame 14678.svg';
  static String locationHistory = 'assets/images/location.png';
  static String transactionSuccess = 'assets/images/transaction_success.png';
  static String apple = 'assets/images/apple.svg';
  static String google = 'assets/images/google.svg';
  static String microsoft = 'assets/images/microsoft.svg';
  static String deliveryVan = 'assets/images/DeliveryVan.png';
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
