import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:event_minder/models/event_model.dart';

class EventCard extends StatelessWidget {
  final Event event;
  final VoidCallback? onButtonPressed;
  final String buttonText;
  final VoidCallback? onTap;

  const EventCard({
    required this.event,
    this.onButtonPressed,
    this.buttonText = "",
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                event.name,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                event.description,
                style: TextStyle(fontSize: 16, color: Colors.grey[700]),
              ),
              SizedBox(height: 10),
              Text(
                'Date: ${DateFormat.yMMMd().format(event.date)}',
                style: TextStyle(fontSize: 14),
              ),
              SizedBox(height: 10),
              if (onButtonPressed != null)
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: onButtonPressed,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: buttonText == "Joined" ? Colors.grey : Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      buttonText,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}