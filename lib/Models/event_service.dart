import '../models/event_model.dart';

class EventService {
  final List<Event> _events = [];

  List<Event> getEvents() {
    return List.unmodifiable(_events); // Prevent direct modification
  }

  void addEvent(Event event) {
    _events.add(event);
  }

  void joinEvent(String eventId, String userId) {
    int index = _events.indexWhere((e) => e.id == eventId);
    if (index != -1) {
      if (!_events[index].participants.contains(userId)) {
        _events[index].participants.add(userId);
      }
    }
  }
}
