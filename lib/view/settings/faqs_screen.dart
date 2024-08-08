import 'package:browncart_user/view/utils/constants/size/sized_box.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:flutter/material.dart';

class FAQsScreen extends StatelessWidget {
  const FAQsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          size: 26,
          title: "Frequently Asked Questions (FAQs)",
          fontWeight: FontWeight.w100,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildFAQItem(
              'What is Brown Cart User, and how does it work?',
              'Brown Cart User is an e-commerce application focused on ladies\' dresses. It allows you to browse various categories, add items to your cart, and make purchases using different payment options.',
            ),
            _buildFAQItem(
              'Is Brown Cart User free to use?',
              'Yes, Brown Cart User is free to download and use. There are no subscription fees or hidden charges.',
            ),
            _buildFAQItem(
              'How do I add items to my cart?',
              'To add an item to your cart, navigate to the desired dress, select your size and color, and tap the "Add to Cart" button.',
            ),
            _buildFAQItem(
              'Can I edit or delete items in my cart?',
              'Yes, you can edit or delete items in your cart. Navigate to the "Cart" page, where you can adjust quantities or remove items.',
            ),
            _buildFAQItem(
              'How secure is my personal data in Brown Cart User?',
              'Brown Cart User uses industry-standard encryption and security measures to protect your personal data. Your data is stored securely, and access is restricted to ensure confidentiality.',
            ),
            _buildFAQItem(
              'Are there different views to browse products?',
              'Yes, Brown Cart User provides various categories for you to browse dresses. You can also use the search bar to find specific products.',
            ),
            _buildFAQItem(
              'Can I customize my app experience?',
              'Yes, you can customize your app experience on the "Profile" page. Adjust your account information and explore optional settings to tailor the app to your preferences.',
            ),
            _buildFAQItem(
              'How do I contact support if I have issues or feedback?',
              'For any assistance or feedback, you can contact our support team through the app. Visit the "Profile" or "Settings" page for support options.',
            ),
            _buildFAQItem(
              'Is my personal information shared with third parties?',
              'No, Brown Cart User does not share your personal data with third parties. Your data is treated with the utmost privacy and confidentiality.',
            ),
            _buildFAQItem(
              'What happens if I forget my account password?',
              'If you forget your password, you can use the "Forgot Password" option on the login page to reset it. Follow the instructions to regain access to your account.',
            ),
            _buildFAQItem(
              'How often should I update the app?',
              'It\'s recommended to update the app regularly to benefit from the latest features and security enhancements. Check for updates in your device\'s app store.',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        kHeight16,
        Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        kHeight8,
        Text(answer),
      ],
    );
  }
}
