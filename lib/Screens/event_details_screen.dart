import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:event_minder/Services/user_provider.dart';

class EventDetailsScreen extends StatelessWidget {
  const EventDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context).user; // Correct way to get user
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.blueAccent, Colors.purpleAccent],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.1),
                borderRadius: BorderRadius.circular(20),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 10, offset: Offset(0, 5)),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text(
                    "Event Details",
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                  const SizedBox(height: 20),
                  if (user?.role == 'Moderator') // Fixed: user?.role instead of role
                    CustomButton(text: "Mark Attendance", onPressed: _markAttendance),
                  if (user?.role == 'Participant') // Fixed: user?.role instead of role
                    SizedBox(
                      width: double.infinity,
                      child: CustomButton(
                        text: "Mark Attendance",
                        onPressed: _markAttendance,
                        isLoading: false,
                      ),
                    ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(top: 20),
                    child: Text("errorMessage: null"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _markAttendance() {
    // Placeholder function
    print("Attendance marked!");
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
        backgroundColor: Colors.blueAccent.withOpacity(0.8),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: isLoading
          ? const CircularProgressIndicator(color: Colors.white)
          : Text(text, style: const TextStyle(fontSize: 18, color: Colors.white)),
    );
  }
}