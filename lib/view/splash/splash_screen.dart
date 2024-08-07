import 'dart:async';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/widgets/wrapper.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const Wrapper()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kLightBrown,
      body: Center(
        child: Image.asset(
          'img/icon.png',
          width: 260,
          height: 260,
        ),
      ),
    );
  }
}
