import 'package:nufit/pages/authenticator/login_or_register_page.dart';
import 'package:nufit/pages/nav_pages.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          // if user logged in go to HomePage (main) else LoginPage
          if (snapshot.hasData) {
            return const NavPage();
          } else {
            return const LoginOrRegisterPage();
          }
        },
      ),
    );
  }
}
