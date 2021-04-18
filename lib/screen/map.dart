import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:mapas/location/location.dart';
import 'package:latlong/latlong.dart';

class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  initState() {
    super.initState();
    getCenterPosition();
  }

  LatLng _centerLocationVariable;

  Future<void> getCenterPosition() async {
    MapLocation.determineCenterPosition("Klaipeda").then((value) {
      setState(() {
        _centerLocationVariable = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _centerLocationVariable == null
            ? Center(
                child: CircularProgressIndicator(),
              )
            : buildMap());
  }

  Widget buildMap() {
    return FlutterMap(
        options: MapOptions(
          center: _centerLocationVariable,
          minZoom: 12.0,
          zoom: 15.0,
        ),
        nonRotatedLayers: [
          TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/ignbud/cklc9u6el1gc517ql1rkjf351/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaWduYnVkIiwiYSI6ImNrbGM5cHJnMTA1M2Iybm4xcWhwcG12bjkifQ.9ex1T0rK7wArp4b5iqvaDA",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoiaWduYnVkIiwiYSI6ImNrbGM5cmxybDBldHYyd21qejF0cGhpb3AifQ.Z37wABxlvIl73yAXx0qPqg',
                'id': 'mapbox.mapbox-streets-v7'
              }),
          MarkerLayerOptions(
            markers: [
              Marker(
                width: 50.0,
                height: 50.0,
                point: _centerLocationVariable,
                builder: (ctx) => Container(
                    child: Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                  size: 50.0,
                )),
              ),
            ],
          )
        ]);
  }
}
