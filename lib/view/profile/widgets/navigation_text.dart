import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class NavigationText extends StatelessWidget {
  final String text;
  final Widget targetPage;

  const NavigationText({
    super.key,
    required this.text,
    required this.targetPage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => targetPage),
            );
          },
          child: Text(
            text,
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
                color: kBlack,
                fontFamily: "Gruppo-Regular"),
          ),
        ),
      ],
    );
  }
}
