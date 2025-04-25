import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:provider/provider.dart';
import 'package:event_minder/Services/user_provider.dart';
import 'package:event_minder/models/user_details.dart';

class AuthService {
  final SupabaseClient supabase = Supabase.instance.client;

  Future<String?> login(BuildContext context, String email, String password) async {
    try {
      final response = await supabase.auth.signInWithPassword(
        email: email.trim(),
        password: password.trim(),
      );
      if (response.user != null) {
        final user = UserDetails(
          uid: response.user!.id,
          email: response.user!.email!,
          name: response.user!.userMetadata?['name'] ?? 'User',
          role: response.user!.userMetadata?['role'] ?? 'Participant',
        );
        await Provider.of<UserProvider>(context, listen: false).setUser(user);
        return null; // ✅ success
      }
      return "Login failed";
    } catch (e) {
      return "Error: $e";
    }
  }

  Future<String?> register(BuildContext context, String email, String password, String name, String role) async {
    try {
      final response = await supabase.auth.signUp(
        email: email.trim(),
        password: password.trim(),
        data: {'name': name, 'role': role},
      );
      if (response.user != null) {
        final user = UserDetails(
          uid: response.user!.id,
          email: response.user!.email!,
          name: name,
          role: role,
        );
        await Provider.of<UserProvider>(context, listen: false).setUser(user);
        return null; // ✅ success
      }
      return "Registration failed";
    } catch (e) {
      return "Error: $e";
    }
  }

  Future<void> logout(BuildContext context) async {
    try {
      await supabase.auth.signOut();
      await Provider.of<UserProvider>(context, listen: false).setUser(null);
      Navigator.pushReplacementNamed(context, '/login');
    } catch (e) {
      print("Logout Error: $e");
    }
  }
}
