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
      event.end = dataMap['end'].toString();
      event.location = dataMap['location'].toString();
      event.description = dataMap['description'].toString();
    } catch (e) {
      print(e);
    }

    return event;
  }
}
