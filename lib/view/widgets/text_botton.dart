import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';

class TextButtonWidgett extends StatelessWidget {
  const TextButtonWidgett({
    super.key,
    required this.onPressed,
    required this.text,
  });

  final void Function() onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(text,style: orderColorStyle,),
    );
  }
}
