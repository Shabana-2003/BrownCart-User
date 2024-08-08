import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:flutter/material.dart';

class PrivacyPolicyScreen extends StatelessWidget {
  const PrivacyPolicyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          size: 26,
          title: 'Privacy Policy',
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
              'Privacy Policy',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            kHeight8,
            const Text(
              'Last Updated: July 29, 2024',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
            kHeight16,
            const Text(
              'Welcome to Brown Cart User, your personal dress shopping destination! This Privacy Policy outlines how Brown Cart User collects, uses, and protects your personal information. By using Brown Cart User, you agree to the terms outlined in this policy.',
            ),
            kHeight16,
            _buildPrivacyPolicyItem(
              'Information We Collect',
              'User Data: Brown Cart User collects and stores user data you input into the application, including email, address, and order history for order placement and authentication purposes.',
            ),
            _buildPrivacyPolicyItem(
              'How We Use Your Information',
              'Internal Use: We use your data to provide personalized shopping experiences and facilitate order placement within the application.',
            ),
            _buildPrivacyPolicyItem(
              'Data Security',
              'Encryption: Brown Cart User employs industry-standard encryption and security measures to protect your data from unauthorized access. Data is stored securely in Firebase Cloud Firestore.',
            ),
            _buildPrivacyPolicyItem(
              'Data Sharing',
              'Third Parties: Brown Cart User does not share your personal data with third parties.',
            ),
            _buildPrivacyPolicyItem(
              'Application Updates',
              'Updates: Periodic updates may be released to enhance features and security. Ensure your app is always up-to-date.',
            ),
            _buildPrivacyPolicyItem(
              'Privacy Policy Changes',
              'Updates: We reserve the right to update or modify this privacy policy at any time. Check this page periodically for changes.',
            ),
            _buildPrivacyPolicyItem(
              'User Responsibilities',
              'Data Accuracy: Users are responsible for the accuracy and security of their data within the application.',
            ),
            _buildPrivacyPolicyItem(
              'Contact Us',
              'Support: For any questions or concerns regarding this Privacy Policy, contact our support team.',
            ),
            _buildPrivacyPolicyItem(
              'Disclaimer',
              'No Guarantees: Brown Cart User is provided "as is" without any guarantees. We are not liable for any decisions made based on the information provided by the application.',
            ),
            kHeight16,
            const Text(
              'By using Brown Cart User, you acknowledge that you have read, understood, and agree to this Privacy Policy.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPrivacyPolicyItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight16,
        Text(
          title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        kHeight8,
        Text(content),
      ],
    );
  }
}
