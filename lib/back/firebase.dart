import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mapas/models/event_model.dart';

class Firebase {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // example method
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
    } catch (e) {
      print(e);
    }

    return event;
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

        events.add(event);
      }
    } catch (e) {
      print(e);
    }

    return events;
  }
}
