import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

class MapScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new FlutterMap(
        options:
            new MapOptions(center: new LatLng(55.710, 21.134), minZoom: 15.0),
        layers: [
          new TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/ignbud/cklc9u6el1gc517ql1rkjf351/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoiaWduYnVkIiwiYSI6ImNrbGM5cHJnMTA1M2Iybm4xcWhwcG12bjkifQ.9ex1T0rK7wArp4b5iqvaDA",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoiaWduYnVkIiwiYSI6ImNrbGM5cmxybDBldHYyd21qejF0cGhpb3AifQ.Z37wABxlvIl73yAXx0qPqg',
                'id': 'mapbox.mapbox-streets-v7'
              }),
        ]);
  }
}
