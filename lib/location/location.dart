import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import 'package:latlong/latlong.dart';

class MapLocation {
  static Future<LatLng> determineCenterPosition(String city) async {
    var _currentLatLng;

    await Geocoder.local.findAddressesFromQuery(city).then((value) =>
        _currentLatLng = new LatLng(value.first.coordinates.latitude,
            value.first.coordinates.longitude));

    return await _currentLatLng;
  }
}
