import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ImageValues {
  static String logo = 'assets/images/logo.png';
  static String landing = 'assets/images/landing.png';
  static String book = 'assets/images/book.png';
  static String emptyStar = 'assets/images/empty_star.png';
  static String filledStar = 'assets/images/filled_star.png';
  static String walkThroughWelcome = 'assets/images/welcome-walk.png';
  static String walkThroughSecure = 'assets/images/secure-walk.png';
  static String walkThroughDelivery = 'assets/images/delivery-walk.png';
  static String menu = 'assets/images/menu.png';
  static String layer = 'assets/images/Layer 1.png';
  static String info = 'assets/images/info.png';
  static String contact = 'assets/images/contact_us.svg';
  static String info1 = 'assets/images/info1.svg';
  static String privacy = 'assets/images/privacy 1.svg';
  static String user = 'assets/images/user.svg';
  static String logout = 'assets/images/logout.svg';
  static String history = 'assets/images/History.svg';
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
