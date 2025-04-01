import 'package:flutter/material.dart';

class ParticipantScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Join an Event"),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: [
          SizedBox(height: 20),
          Text(
            "Available Events",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 5, // Dummy events for now
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.event_available),
                  title: Text("Event ${index + 1}"),
                  subtitle: Text("Date: 2025-04-0${index + 1}"),
                  trailing: ElevatedButton(
                    onPressed: () {
                      // Join Event Logic
                    },
                    child: Text("Join"),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
