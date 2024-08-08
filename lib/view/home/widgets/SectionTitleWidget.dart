import 'package:flutter/material.dart';

class SectionTitleWidget extends StatelessWidget {
  final String title;

  const SectionTitleWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 26),
        Text(
          title,
          style: const TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.w200,
            color: Color.fromARGB(255, 0, 0, 0),
            fontFamily: "Gruppo-Regular",
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 190,
          height: 1,
          color: Colors.black,
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}
