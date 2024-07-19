import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:flutter/material.dart';

class CustomBottomProductInfo extends StatelessWidget {
  final String imagePath;
  final String title;
  final String price;

  const CustomBottomProductInfo({
    super.key,
    required this.imagePath,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      child: Column(
        children: [
          Image.asset(imagePath, width: 300, height: 300),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
                color: kBlack,
                fontFamily: "Gruppo-Regular",
              ),
            ),
          ),
          kHeight10,
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
