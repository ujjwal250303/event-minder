class Event {
  final String id;
  final String name;
  final String description;
  final String organizerId;
  final List<String> participants;
  final DateTime date;
  final DateTime createdAt;

  Event({
    required this.id,
    required this.name,
    required this.description,
    required this.organizerId,
    required this.participants,
    required this.date,
    required this.createdAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'description': description,
      'organizerId': organizerId,
      'participants': participants,
      'date': date.toIso8601String(),
      'createdAt': createdAt.toIso8601String(),
    };
  }

  factory Event.fromMap(Map<String, dynamic> map, String id) {
    return Event(
      id: id,
      name: map['name'] as String? ?? '',
      description: map['description'] as String? ?? '',
      organizerId: map['organizerId'] as String? ?? '',
      participants: (map['participants'] as List<dynamic>?)?.map((e) => e as String).toList() ?? [],
      date: DateTime.parse(map['date'] as String),
      createdAt: DateTime.parse(map['createdAt'] as String),
    );
  }
}