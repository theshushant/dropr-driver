import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:dropr_driver/utils/globals.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

Future<Position> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  log(serviceEnabled.toString());

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
      return Future.error('Location permissions are denied');
    }
  }

  if (permission == LocationPermission.deniedForever) {
    return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
  }
  Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high);
  log(position.toString());
  return position;
}

Future<List<dynamic>?> getAutocompleteAddressGmaps({
  String? params,
}) async {
  log(params!);
  final Dio _dio = Dio();
  try {
    var data = await _dio.get(
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?key=$mapsApiKey&input=$params');
    log(data.toString());
    if (data.statusCode == 200) {
      return data.data['predictions'];
    } else {
      return null;
    }
  } catch (e) {
    rethrow;
  }
}

Future<Placemark> getAddressFromLatLong(LatLng position) async {
  List<Placemark> placemarks =
      await placemarkFromCoordinates(position.latitude, position.longitude);
  Placemark place = placemarks[0];
  return place;
}
