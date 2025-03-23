import 'package:flutter/material.dart';
import 'Screens/splash_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/register_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/moderator_screen.dart';
import 'Screens/participant_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Event Minder',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => SplashScreen(),  // Splash Screen ko first route set kara
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/home': (context) => HomeScreen(),
        '/moderator': (context) => ModeratorScreen(),
        '/participant': (context) => ParticipantScreen(),
      },
    );
  }
}
