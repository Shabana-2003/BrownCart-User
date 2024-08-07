import 'package:browncart_user/view/utils/colors/app_colors.dart';
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
        backgroundColor: backColor, 
        minimumSize:const Size(double.infinity, 60), 
        shape:const RoundedRectangleBorder(
          borderRadius: BorderRadius.zero, 
        ),
      ),
      onPressed: onPressed,
      child: CommonText(size: 20, title: text, color: kWhite),
    );
  }
}
