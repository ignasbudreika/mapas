import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_map/plugin_api.dart';
import 'package:mapas/back/firebase.dart';
import 'package:mapas/location/location.dart';
import 'package:latlong/latlong.dart';
import 'package:mapas/models/event_model.dart';

class MapScreen extends StatefulWidget {
  EventModel centerEvent;

  MapScreen({this.centerEvent});
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  List<Marker> markers = [];
  LatLng _centerLocationVariable;
  bool parsedEvents = false;

  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    if (widget.centerEvent == null) {
      getAllEvents();
      getCenterPosition();
    } else {
      setCenterPosition();
    }
  }

  void getCenterPosition() async {
    MapLocation.determineGeoLocation("Klaipeda").then((value) {
      setState(() {
        _centerLocationVariable = value;
      });
    });
  }

  void setCenterPosition() async {
    await getAllEvents();
    setState(() {
      _centerLocationVariable = LatLng(widget.centerEvent.location.latitude,
          widget.centerEvent.location.longitude);
      showEventData(widget.centerEvent);
    });
  }

  Future<void> getAllEvents() async {
    Firebase firebase = new Firebase();
    var allEvents = await firebase.getAllEvents();

    initializeMarkers(allEvents);
  }

  void initializeMarkers(List<EventModel> allEvents) {
    for (EventModel event in allEvents) {
      if (!event.isDeleted) {
        Marker eventMarker = marker(event);
        markers.add(eventMarker);
      }
    }
    parsedEvents = true;

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: _centerLocationVariable == null || !parsedEvents
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
            markers: markers,
          )
        ]);
  }

  Marker marker(EventModel event) {
    return Marker(
      point: LatLng(event.location.latitude, event.location.longitude),
      builder: (ctx) => GestureDetector(
        onTap: () {
          showEventData(event);
        },
        child: Container(
          child: Icon(
            Icons.place,
            color: Colors.white,
            size: 35.0,
          ),
        ),
      ),
    );
  }

  Future<void> showEventData(EventModel event) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 100,
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Title: ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      event.title,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Start date: ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      event.start,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Description: ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      event.description,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      "Address: ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                    Text(
                      event.address,
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
