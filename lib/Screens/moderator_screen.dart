import 'package:flutter/material.dart';

class ModeratorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Moderator Panel"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Your Events",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Dummy events, later fetch from database
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.event),
                  title: Text("Event ${index + 1}"),
                  subtitle: Text("Date: 2025-04-0${index + 1}"),
                  trailing: Icon(Icons.arrow_forward_ios),
                  onTap: () {
                    // Navigate to event details
                  },
                );
              },
            ),
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              // Navigate to Event Creation Page
            },
            child: Text("Create New Event"),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
