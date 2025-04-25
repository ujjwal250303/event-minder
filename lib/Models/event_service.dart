import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_minder/models/event_model.dart';

class EventService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<List<Event>> getEvents() async {
    QuerySnapshot snapshot = await _firestore.collection('events').get();
    return snapshot.docs.map((doc) {
      return Event.fromMap(doc.data() as Map<String, dynamic>, doc.id);
    }).toList();
  }

  Future<void> addEvent(Event event) async {
    await _firestore.collection('events').add(event.toMap());
  }

  Future<void> deleteEvent(String eventId) async {
    await _firestore.collection('events').doc(eventId).delete();
  }

  Future<void> joinEvent(String eventId, String userId) async {
    DocumentReference eventRef = _firestore.collection('events').doc(eventId);
    await _firestore.runTransaction((transaction) async {
      DocumentSnapshot snapshot = await transaction.get(eventRef);
      if (snapshot.exists) {
        List<String> participants = (snapshot['participants'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [];
        if (!participants.contains(userId)) {
          participants.add(userId);
          transaction.update(eventRef, {'participants': participants});
        }
      }
    });
  }
}