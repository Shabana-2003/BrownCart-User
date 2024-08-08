import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          size: 26,
          title: "Contact Us",
          fontWeight: FontWeight.w100,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'For any questions, concerns, or feedback, feel free to reach out to our support team. We are here to assist you!',
              style: TextStyle(fontSize: 16),
            ),
            kHeight16,
            const Text(
              'Email:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            kHeight8,
            const Text(
              'Send us an email at:',
              style: TextStyle(fontSize: 16),
            ),
            kHeight8,
            InkWell(
              onTap: () {},
              child: Text(
                'support@browncartuser.com',
                style: TextStyle(
                  color: kBlue,
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
            kHeight16,
            const Text(
              'We strive to respond to your inquiries promptly and provide the assistance you need. Thank you for choosing Brown Cart User!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
