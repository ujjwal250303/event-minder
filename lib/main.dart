import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'Services/user_provider.dart';
import 'Screens/splash_screen.dart';
import 'Screens/login_screen.dart';
import 'Screens/register_screen.dart';
import 'Screens/home_screen.dart';
import 'Screens/moderator_screen.dart';
import 'Screens/participant_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Event Minder',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => LoginScreen(),
          '/register': (context) => RegisterScreen(),
          '/home': (context) => HomeScreen(),
          '/moderator': (context) => ModeratorScreen(),
          '/participant': (context) => ParticipantScreen(),
        },
      ),
    );
  }
}