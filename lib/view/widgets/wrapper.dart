import 'package:browncart_user/view/auth/login_screen.dart';
import 'package:browncart_user/view/home/home_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: Text("Error"),
              );
            } else {
              if (snapshot.data == null) //user not logedin but signed out
              {
                return const LoginScreen();
              } else {
                return  HomeScreen();
              }
            }
          }),
    );
  }
}
