import 'package:flutter/material.dart';
import 'package:event_minder/Models/user_details.dart';

class UserProvider with ChangeNotifier {
  UserDetails? _userDetails;

  UserDetails? get userDetails => _userDetails;

  void setUser(UserDetails userDetails) {
    _userDetails = userDetails;
    notifyListeners();
  }

  void clearUser() {
    _userDetails = null;
    notifyListeners();
  }
}