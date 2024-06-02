import 'package:flutter/material.dart';

class CustomBrand extends StatelessWidget {
  const CustomBrand({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:const EdgeInsets.all(30),
      child: Image.asset('img/brandnames.png',),
    );
  }
}
