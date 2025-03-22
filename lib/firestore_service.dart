import 'package:cloud_firestore/cloud_firestore.dart';
import 'event.dart';

class FirestoreService {
  final CollectionReference events = FirebaseFirestore.instance.collection('events');

  Future<void> addEvent(Event event) async {
    await events.add(event.toFirestore());
  }

  Stream<List<Event>> getEvents() {
    return events.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) => Event.fromFirestore(doc.data() as Map<String, dynamic>, doc.id)).toList();
    });
  }
}