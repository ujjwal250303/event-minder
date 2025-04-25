import 'package:event_minder/Screens/create_event_screen.dart';
import 'package:event_minder/Screens/home_screen.dart';
import 'package:event_minder/Screens/login_screen.dart';
import 'package:event_minder/Screens/moderator_screen.dart';
import 'package:event_minder/Screens/participant_screen.dart';
import 'package:event_minder/Screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:event_minder/Services/user_provider.dart';
import 'package:event_minder/screens/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Supabase initialize with your project details
  await Supabase.initialize(
    url: 'https://aruplmnsjjyohimljzry.supabase.co', // Dashboard se copy karo
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImFydXBsbW5zamp5b2hpbWxqenJ5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NDU1NTM2ODIsImV4cCI6MjA2MTEyOTY4Mn0.vjZhDtfbAiieJF1gOsFle_r4kO8d05CRJI0rpm6uuZg', // Dashboard se copy karo
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserProvider(),
      child: MaterialApp(
        title: 'Event Minder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          textTheme: const TextTheme(
            bodyMedium: TextStyle(color: Colors.white),
            headlineSmall: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        initialRoute: '/splash',
        routes: {
          '/splash': (context) => const SplashScreen(),
          '/login': (context) => const LoginScreen(),
          '/register': (context) => const RegisterScreen(),
          '/home': (context) => const HomeScreen(),
          '/moderator': (context) => const ModeratorScreen(),
          '/participant': (context) => const ParticipantScreen(),
          '/create_event': (context) => const CreateEventScreen(),
        },
      ),
    );
  }
}