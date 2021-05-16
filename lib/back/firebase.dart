import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:mapas/model/event_model.dart';
import '../location/location.dart';
import '../model/event_model.dart';
import 'package:latlong/latlong.dart';

class Firebase {
  static String _uid = "";
  String get getUid => _uid;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<EventModel> getEventData(String id) async {
    EventModel event = EventModel();

    try {
      final DocumentSnapshot _docSnapshot =
          await _firestore.collection('events').doc(id).get();

      final Map<String, dynamic> dataMap = _docSnapshot.data();

      event.id = id;
      event.title = dataMap['title'].toString();
      event.start = dataMap['start'].toString();
      event.location = dataMap['location'];
      event.address = dataMap['address'].toString();
      event.description = dataMap['description'].toString();
      event.uid = dataMap['uid'].toString();
    } catch (e) {
      print(e);
    }

    return event;
  }

  void deleteEvent(String id) async {
    await _firestore.collection('events').doc(id).update({'isDeleted': true});
  }

  Future<List<EventModel>> getAllEvents() async {
    List<EventModel> events = [];

    try {
      final QuerySnapshot _docSnapshot =
          await _firestore.collection('events').get();

      DocumentSnapshot document;

      for (document in _docSnapshot.docs) {
        final Map<String, dynamic> dataMap = document.data();

        EventModel event = new EventModel();
        event.id = document.id;
        event.title = dataMap['title'].toString();
        event.start = dataMap['start'].toString();
        event.location = dataMap['location'];
        event.address = dataMap['address'].toString();
        event.description = dataMap['description'].toString();
        event.isDeleted = dataMap['isDeleted'];
        event.uid = dataMap['uid'].toString();

        events.add(event);
      }
    } catch (e) {
      print(e);
    }

    return events;
  }

  Future<void> addEvent(String title, String description, String location,
      String start, String address) async {
    LatLng latlng = await MapLocation.determineGeoLocation(location);

    Map<String, Object> event = {
      "title": title,
      "description": description,
      "location": GeoPoint(latlng.latitude, latlng.longitude),
      "start": start,
      "address": address,
      "isDeleted": false,
      "uid": Firebase._uid
    };

    try {
      _firestore.collection('events').add(event);
    } catch (e) {
      print(e);
    }
  }

  Future<bool> signUpUser(String email, String password) async {
    bool success = true;

    try {
      final UserCredential _auth = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);

      _uid = _auth.user.uid;
    } catch (e) {
      print(e);
      success = false;
    }

    return success;
  }

  Future<bool> logInUser(String email, String password) async {
    bool success = false;
    try {
      final UserCredential _auth = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);

      if (_auth.user != null) {
        _uid = _auth.user.uid;
        print(_auth.user.uid);

        if (_uid != null) {
          success = true;
        }
      }
    } catch (e) {
      print(e);
    }

    return success;
  }
}
