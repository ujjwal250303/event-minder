class Event {
  String id;
  String name;
  String description;
  String organizerId;
  List<String> participants;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.organizerId,
    this.participants = const [],
  });
}
