import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:abdullah/screens/home_screen.dart'; // استيراد HomeScreen
import 'package:abdullah/screens/login_screen.dart'; // استيراد LoginScreen
import 'package:abdullah/screens/email_verification_screen.dart'; // استيراد EmailVerificationScreen

class AuthWrapper extends StatelessWidget {
  const AuthWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else if (snapshot.hasData) {
          final User? user = snapshot.data;
          if (user != null && !user.emailVerified) {
            return const EmailVerificationScreen();
          }
          return const HomeScreen();
        } else {
          return const LoginScreen();
        }
      },
    );
  }
}

