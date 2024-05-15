import 'dart:async';

//import 'package:browncart_user/screens/home_page.dart';
import 'package:browncart_user/screens/wrapper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Simulate a long-running task such as fetching data
    Timer  (Duration(seconds: 3), () {
      // After 3 seconds, navigate to the login page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) =>const Wrapper()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 252, 243, 233),
      body: Center(
        child: Image.asset(
          'img/image1.png', // replace with your image path
          width: 260,
          height: 260,
          //fit: BoxFit.contain,
        ),
      ),
    );
  }
}
