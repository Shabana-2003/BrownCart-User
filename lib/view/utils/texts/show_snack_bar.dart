import 'package:browncart_user/view/utils/constants/style/text_style.dart';
import 'package:flutter/material.dart';

void showSnackBar(BuildContext context, String text, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text,style: textLoginButtonStyle,),
      backgroundColor: color,
      duration:const Duration(seconds: 1),
    ),
  );
}

