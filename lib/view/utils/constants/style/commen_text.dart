import 'package:flutter/material.dart';

class CommonText extends StatelessWidget {
  final double size;
  final String title;
  final Color color;
  final FontWeight fontWeight;
  final String fontFamily;

  const CommonText({
    super.key,
    required this.size,
    required this.title,
    this.color = Colors.black,
    this.fontWeight = FontWeight.normal,
    this.fontFamily = "Gruppo-Regular",
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: TextStyle(
        fontSize: size,
        fontWeight: fontWeight,
        color: color,
        fontFamily: fontFamily,
      ),
    );
  }
}
