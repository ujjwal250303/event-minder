import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_minder/Models/user_details.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:event_minder/Services/auth_service.dart';
import 'package:event_minder/Services/user_provider.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final AuthService _authService = AuthService();

  @override
  void initState() {
    super.initState();
    _navigate();
  }

  void _navigate() async {
    await Future.delayed(Duration(seconds: 3));
    if (mounted) {
      User? user = _authService.currentUser;
      if (user != null) {
        print("🔍 User is logged in, UID: ${user.uid}");
        // Try to fetch user data and update UserProvider
        DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .get();

        if (userDoc.exists && userDoc.data() != null) {
          var userData = userDoc.data();
          print("🔥 Firestore Data Type: ${userData.runtimeType}");
          print("🔥 Firestore Data: $userData");

          if (userData is Map<String, dynamic>) {
            var userDetails = UserDetails.fromJson(userData);
            Provider.of<UserProvider>(context, listen: false).setUser(userDetails);
            print("✅ UserProvider updated, navigating to HomeScreen");
            Navigator.pushReplacementNamed(context, '/home');
          } else {
            print("❌ Invalid user data format in SplashScreen, navigating to LoginScreen");
            Navigator.pushReplacementNamed(context, '/login');
          }
        } else {
          print("❌ User document not found in Firestore, navigating to LoginScreen");
          Navigator.pushReplacementNamed(context, '/login');
        }
      } else {
        print("🔍 No user logged in, navigating to LoginScreen");
        Navigator.pushReplacementNamed(context, '/login');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Lottie.asset('assets/animations/Animation1.json', height: 200),
            SizedBox(height: 20),
            Text(
              "Event Minder",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
            ),
          ],
        ),
      ),
    );
  }
}