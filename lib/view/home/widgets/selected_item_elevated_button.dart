////
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:flutter/material.dart';


class SelectedItemElevatedButtonWidget extends StatelessWidget {
 const SelectedItemElevatedButtonWidget({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backColor,
  });

  final String text;
  final void Function() onPressed;
  final Color backColor;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: const Color.fromARGB(255, 80, 52, 41),
        fixedSize:const Size(200, 30),
      ),
      onPressed: onPressed,
      child: CommonText(size: 25, title:text)
    );
  }
}
