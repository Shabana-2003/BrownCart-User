import 'package:flutter/material.dart';
import 'package:browncart_user/view/products/products_screen.dart';

class BannerWidget extends StatelessWidget {
  final String imagePath;

  const BannerWidget({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const ProductScreen(),
          ),
        );
      },
      child: Image.asset(imagePath),
    );
  }
}
