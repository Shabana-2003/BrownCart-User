import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:flutter/material.dart';

class CircleAvatarWidget extends StatelessWidget {
  const CircleAvatarWidget({
    super.key,
    required this.radius,
    required this.image,
  });

  final double radius;
  final ImageProvider image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      decoration: BoxDecoration(
          border: Border.all(width: 0.2),
          borderRadius: BorderRadius.circular(
            radius,
          )),
      child: CircleAvatar(
        backgroundColor: kWhite,
        radius: radius,
        backgroundImage: image,
      ),
    );
  }
}
