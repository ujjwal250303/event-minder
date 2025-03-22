import 'package:flutter/material.dart';

class FeedbackScreen extends StatefulWidget {
  @override
  _FeedbackScreenState createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  final TextEditingController _controller = TextEditingController();

  String analyzeFeedback(String text) {
    if (text.toLowerCase().contains('great') || text.contains('good')) return 'Positive';
    if (text.toLowerCase().contains('bad') || text.contains('poor')) return 'Negative';
    return 'Neutral';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Feedback')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(labelText: 'Enter your feedback'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String sentiment = analyzeFeedback(_controller.text);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text('Sentiment: $sentiment')),
                );
              },
              child: Text('Submit Feedback'),
            ),
          ],
        ),
      ),
    );
  }
}