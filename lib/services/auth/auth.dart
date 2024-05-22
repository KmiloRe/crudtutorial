import 'package:crudtutorial/pages/home_page.dart';
import 'package:crudtutorial/services/auth/login_or_register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'dart:developer';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const CircularProgressIndicator();
          } else if (snapshot.hasData) {
            log('User is logged in');
            return const HomePage();
          } else if (snapshot.hasError) {
            log('Error loging in user');
            return const Text("Error");
          } else {
            log('User logged out');
            return const LoginOrRegister();
          }
        },
      ),
    );
  }
}
