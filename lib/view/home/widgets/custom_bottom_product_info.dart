import 'package:flutter/material.dart';

class CustomBottomProductInfo extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  const CustomBottomProductInfo({
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      
      child: Column(
        children: [
          Image.asset(imagePath, width: 300, height: 300),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: Color.fromARGB(255, 0, 0, 0),
                fontFamily: "Gruppo-Regular",
              ),
            ),
          ),
          const SizedBox(height: 9),
          Text(
            price,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Color.fromARGB(255, 127, 67, 34),
              fontFamily: "Gruppo-Regular",
            ),
          ),
        ],
      ),
    );
  }
}