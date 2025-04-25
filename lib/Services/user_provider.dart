import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:event_minder/models/user_details.dart';
import 'dart:convert';

class UserProvider with ChangeNotifier {
  UserDetails? _user;

  UserDetails? get user => _user;

  UserProvider() {
    _loadUser();
  }

  Future<void> _loadUser() async {
    print("🔄 [UserProvider] Loading user from SharedPreferences");
    final prefs = await SharedPreferences.getInstance();
    final userData = prefs.getString('user');
    if (userData != null) {
      _user = UserDetails.fromJson(jsonDecode(userData));
      print("✅ [UserProvider] User loaded: ${_user?.email}");
      notifyListeners();
    } else {
      print("❌ [UserProvider] No user found in SharedPreferences");
    }
  }

  Future<void> setUser(UserDetails? user) async {
    print("💾 [UserProvider] Saving user to SharedPreferences: ${user?.email}");
    _user = user;
    final prefs = await SharedPreferences.getInstance();
    if (user != null) {
      await prefs.setString('user', jsonEncode(user.toJson()));
      print("✅ [UserProvider] User saved successfully");
    } else {
      await prefs.remove('user');
      print("🗑️ [UserProvider] User removed from SharedPreferences");
    }
    notifyListeners();
  }
}