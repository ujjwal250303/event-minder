import 'package:flutter/material.dart';
import '../services/auth_service.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String errorMessage = "";

  void handleRegister() async {
    String? result = await AuthService().register(
      emailController.text,
      passwordController.text,
    );
    if (result == null) {
      Navigator.pushReplacementNamed(context, '/login');
    } else {
      setState(() => errorMessage = result);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Create Account", style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              Text("Sign up to continue", style: TextStyle(fontSize: 16, color: Colors.grey)),
              SizedBox(height: 40),
              TextField(controller: emailController, decoration: InputDecoration(labelText: "Email", border: OutlineInputBorder(), prefixIcon: Icon(Icons.email))),
              SizedBox(height: 20),
              TextField(controller: passwordController, obscureText: true, decoration: InputDecoration(labelText: "Password", border: OutlineInputBorder(), prefixIcon: Icon(Icons.lock))),
              SizedBox(height: 10),
              if (errorMessage.isNotEmpty) Text(errorMessage, style: TextStyle(color: Colors.red)),
              SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: handleRegister,
                  style: ElevatedButton.styleFrom(padding: EdgeInsets.symmetric(vertical: 15), backgroundColor: Colors.green),
                  child: Text("Register", style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ),
              SizedBox(height: 10),
              Center(
                child: TextButton(
                  onPressed: () => Navigator.pushNamed(context, '/login'),
                  child: Text("Already have an account? Login"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}