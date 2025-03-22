class Event {
  final String id;
  final String title;
  final DateTime date;
  final String category;

  Event({required this.id, required this.title, required this.date, required this.category});

  factory Event.fromFirestore(Map<String, dynamic> data, String id) {
    return Event(
      id: id,
      title: data['title'] ?? '',
      date: DateTime.parse(data['date']),
      category: data['category'] ?? '',
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'title': title,
      'date': date.toIso8601String(),
      'category': category,
    };
  }
}