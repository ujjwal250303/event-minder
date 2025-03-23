import 'package:flutter/material.dart';

class ModeratorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Moderator")),
      body: Center(
        child: Text("Moderator Dashboard - Create & Manage Events"),
      ),
    );
  }
}
