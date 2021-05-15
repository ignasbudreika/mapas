import 'package:cloud_firestore/cloud_firestore.dart';

class EventModel {
  String id;
  String title;
  String uid;
  String start;
  GeoPoint location;
  String address;
  String description;
  bool isDeleted;

  EventModel(
      {this.id,
      this.title,
      this.start,
      this.location,
      this.description,
      this.uid});

  @override
  String toString() {
    return this.id +
        " " +
        this.title +
        " " +
        this.start +
        " " +
        this.uid +
        " " +
        this.location.latitude.toString() +
        " " +
        this.location.longitude.toString() +
        " " +
        this.description +
        " " +
        this.address +
        " " +
        this.isDeleted.toString();
  }
}
