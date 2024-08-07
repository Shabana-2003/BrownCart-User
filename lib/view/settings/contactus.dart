import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:flutter/material.dart';

class ContactUsScreen extends StatelessWidget {
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
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'For any questions, concerns, or feedback, feel free to reach out to our support team. We are here to assist you!',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Email:',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Send us an email at:',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            InkWell(
              onTap: () {
                // Implement logic to open the email client with the provided email address
              },
              child: Text(
                'support@browncartuser.com',
                style: TextStyle(
                  color: Colors.blue,
                  decoration: TextDecoration.underline,
                  fontSize: 16,
                ),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'We strive to respond to your inquiries promptly and provide the assistance you need. Thank you for choosing Brown Cart User!',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
