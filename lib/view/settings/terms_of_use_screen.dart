import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:flutter/material.dart';

class TermsOfUseScreen extends StatelessWidget {
  const TermsOfUseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          size: 26,
          title: 'Terms of Use',
          fontWeight: FontWeight.w100,
        ),
        centerTitle: true,
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Terms of Use',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Welcome to Brown Cart User, your personal dress shopping destination! By using Brown Cart User, you agree to comply with the following terms and conditions of use. If you do not agree with these terms, please refrain from using the application.',
              ),
              SizedBox(height: 16),
              Text(
                'Privacy and Data Usage:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                'Brown Cart User does not share users\' private data, including email, address, and order history. We use Firebase to securely store user data. We only use user data for order placement (address) and authentication.',
              ),
              SizedBox(height: 16),
              Text(
                'User Responsibilities:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. You are responsible for ensuring the accuracy of the data you input into Brown Cart User.',
              ),
              Text(
                '2. Ensure the security of your account and promptly report any unauthorized access.',
              ),
              SizedBox(height: 16),
              Text(
                'Data Security:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. Brown Cart User uses industry-standard encryption and security measures to protect your data.',
              ),
              Text(
                '2. In the event of any security concerns or unauthorized access, please contact us immediately.',
              ),
              SizedBox(height: 16),
              Text(
                'Usage Limitations:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. Brown Cart User is intended for personal shopping purposes only.',
              ),
              Text(
                '2. Commercial use or any other unauthorized use is strictly prohibited.',
              ),
              SizedBox(height: 16),
              Text(
                'Application Updates:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. We may release updates to enhance features and security. Ensure your app is always up-to-date.',
              ),
              SizedBox(height: 16),
              Text(
                'Privacy Policy:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. Your privacy is important to us. Please review our Privacy Policy to understand how we handle your data.',
              ),
              SizedBox(height: 16),
              Text(
                'Features:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. Brown Cart User includes features such as a wishlist, cart, search, and profile options.',
              ),
              Text(
                '2. Two payment methods are available: cash on delivery and Razorpay.',
              ),
              SizedBox(height: 16),
              Text(
                'Feedback and Support:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. We welcome your feedback to improve Brown Cart User. Contact our support team for assistance.',
              ),
              SizedBox(height: 16),
              Text(
                'Termination of Service:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. We reserve the right to terminate or suspend the availability of Brown Cart User at our discretion.',
              ),
              SizedBox(height: 16),
              Text(
                'Disclaimer:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. Brown Cart User is provided "as is" without any warranties. We are not liable for any decisions made based on the information provided by the application.',
              ),
              SizedBox(height: 16),
              Text(
                'Terms Updates:',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                '1. We reserve the right to update or modify these terms at any time. Please check this page periodically for changes.',
              ),
              SizedBox(height: 16),
              Text(
                'By using Brown Cart User, you acknowledge that you have read, understood, and agree to these terms. Thank you for choosing Brown Cart User for your shopping needs!',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
