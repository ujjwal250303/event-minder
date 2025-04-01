import 'package:event_minder/Models/user_details.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'user_provider.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<String?> register(BuildContext context, String email, String password, String name) async {
    try {
      print("🔍 Starting register for email: $email");
      UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        print("❌ UserCredential.user is null");
        return "User registration failed!";
      }

      Map<String, dynamic> userDetails = {
        "uid": userCredential.user!.uid,
        "email": email,
        "name": name,
      };

      print("🔍 Saving user data to Firestore for UID: ${userCredential.user!.uid}");
      await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .set(userDetails);

      print("🔍 Setting user in UserProvider: $name");
      Provider.of<UserProvider>(context, listen: false).setUser(UserDetails.fromJson(userDetails));

      print("✅ User Registered: $name");
      return null;
    } catch (e) {
      print("❌ Error in Register: $e");
      return e.toString();
    }
  }

  Future<String?> login(BuildContext context, String email, String password) async {
    try {
      print("🔍 Starting login for email: $email");
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      if (userCredential.user == null) {
        print("❌ UserCredential.user is null");
        return "Login failed! User not found.";
      }

      print("🔍 Fetching Firestore data for UID: ${userCredential.user!.uid}");
      DocumentSnapshot<Map<String, dynamic>> userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(userCredential.user!.uid)
          .get();

      if (!userDoc.exists) {
        print("❌ User document does not exist in Firestore");
        return "User document does not exist in Firestore!";
      }

      var userData = userDoc.data();
      print("🔥 Firestore Data Type: ${userData.runtimeType}");
      print("🔥 Firestore Data: $userData");

      if (userData == null) {
        print("❌ User data is null in Firestore");
        return "User data is null in Firestore!";
      }

      if (userData is! Map<String, dynamic>) {
        if (userData is List) {
          print("🔥 Firestore Data is a List with length: ${(userData as List).length}");
          print("🔥 First item in List: ${(userData as List).isNotEmpty ? (userData as List)[0] : 'Empty List'}");
          return "Invalid user data format in Firestore! Expected a Map, got a List.";
        }
        print("❌ Invalid user data format: ${userData.runtimeType}");
        return "Invalid user data format in Firestore! Expected a Map, got ${userData.runtimeType}";
      }

      print("🔍 Converting userData to UserDetails");
      UserDetails userDetails = UserDetails.fromJson(userData);
      print("🔍 Setting user in UserProvider: ${userDetails.name}");
      Provider.of<UserProvider>(context, listen: false).setUser(userDetails);

      print("✅ User Logged In: ${userDetails.name}");
      return null;
    } catch (e) {
      print("❌ Error in Login: $e");
      return e.toString();
    }
  }

  Future<void> logout(BuildContext context) async {
    await _auth.signOut();
    Provider.of<UserProvider>(context, listen: false).clearUser();
    print("✅ User Logged Out");
  }

  User? get currentUser => _auth.currentUser;
}