import 'package:flutter/material.dart';
import 'firestore_service.dart';
import 'event.dart';

class HomeScreen extends StatelessWidget {
  final FirestoreService _firestoreService = FirestoreService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              'assets/images/img.png', // Path to your logo
              height: 40,              // Makes the logo 40 pixels tall
              width: 40,               // Makes the logo 40 pixels wide
            ),
            SizedBox(width: 10),       // Adds a little space after the logo
            Text('EventMinder'),       // The app name next to the logo
          ],
        ),
      ),
      body: StreamBuilder<List<Event>>(
        stream: _firestoreService.getEvents(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) return Center(child: CircularProgressIndicator());
          final events = snapshot.data!;
          return ListView.builder(
            itemCount: events.length,
            itemBuilder: (context, index) {
              final event = events[index];
              return ListTile(
                title: Text(event.title),
                subtitle: Text('${event.date.toString()} - ${event.category}'),
              );
            },
          );
        },
      ),
    );
  }
}