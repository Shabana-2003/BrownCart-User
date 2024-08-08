import 'package:browncart_user/view/settings/instructional_content_screen.dart';
import 'package:browncart_user/view/settings/privacy_policy_screen.dart';
import 'package:browncart_user/view/settings/terms_of_use_screen.dart';
import 'package:browncart_user/view/settings/contact_us_screen.dart';
import 'package:browncart_user/view/settings/faqs_screen.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/utils/constants/style/text_style.dart';

import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          size: 26,
          title: "Settings",
          fontWeight: FontWeight.w100,
        ),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _buildSettingsItem(
            'Terms of Use',
            'View and agree to the Terms of Use',
            () {
              _navigateToTermsOfUse(context);
            },
          ),
          _buildSettingsItem(
            'Privacy Policy',
            'Read our Privacy Policy',
            () {
              _navigateToPrivacyPolicy(context);
            },
          ),
          _buildSettingsItem(
            'Instructional Content',
            'Learn how to use the app',
            () {
              _navigateToInstructionalContent(context);
            },
          ),
          _buildSettingsItem(
            'Frequently Asked Questions (FAQs)',
            'Get answers to common questions',
            () {
              _navigateToFAQs(context);
            },
          ),
          _buildSettingsItem(
            'Contact Us',
            'Reach out for support or feedback',
            () {
              _navigateToContactUs(context);
            },
          ),
          _buildSettingsItem(
            'Version',
            'Check the app version',
            () {
              _showVersionInfo(context);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(String title, String subtitle, VoidCallback onTap) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.only(left: 5, right: 10),
          title: Text(
            title,
            style: cartStylee,
          ),
          subtitle: Text(subtitle, style: textordertrack),
          onTap: onTap,
        ),
      ],
    );
  }

  void _navigateToTermsOfUse(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => TermsOfUseScreen()));
  }

  void _navigateToPrivacyPolicy(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const PrivacyPolicyScreen()));
  }

  void _navigateToInstructionalContent(BuildContext context) {
    Navigator.push(context,
        MaterialPageRoute(builder: (_) => const InstructionalContentScreen()));
  }

  void _navigateToFAQs(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const FAQsScreen()));
  }

  void _navigateToContactUs(BuildContext context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (_) => const ContactUsScreen()));
  }

  void _showVersionInfo(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Version'),
          content: const Text('1.0.0'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
