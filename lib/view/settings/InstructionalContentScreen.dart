import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:flutter/material.dart';

class InstructionalContentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          size: 26,
          title: "Instructional Content",
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
              'Welcome to Brown Cart User: Your Personal Dress Shopping Destination!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Thank you for choosing Brown Cart User for your dress shopping needs. This guide will help you get started with the app and make the most out of its features.',
            ),
            _buildContentItem(
              'Home Page Overview',
              '1. The Home page displays a variety of dress categories for you to explore.\n2. Tap on any category to view the dresses available.',
            ),
            _buildContentItem(
              'Adding Items to Cart',
              '1. To add an item to your cart, navigate to the desired dress and select your size and color.\n2. Tap the "Add to Cart" button to include the item in your shopping cart.',
            ),
            _buildContentItem(
              'Viewing and Managing Cart',
              '1. Access the "Cart" page to view the items you have added.\n2. You can adjust quantities, remove items, or proceed to checkout from this page.',
            ),
            _buildContentItem(
              'Wishlist',
              '1. Tap the heart icon on any dress to add it to your wishlist.\n2. View your wishlist by navigating to the "Wishlist" page.',
            ),
            _buildContentItem(
              'Searching for Products',
              '1. Use the search bar at the top of the Home page to find specific dresses.\n2. Enter keywords related to the dress you are looking for.',
            ),
            _buildContentItem(
              'Profile and Settings',
              '1. Go to the "Profile" page to view and edit your account information.\n2. Adjust your preferences and view order history in the settings.',
            ),
            _buildContentItem(
              'Checkout and Payment Options',
              '1. Proceed to checkout from the "Cart" page.\n2. Choose your preferred payment method: Cash on Delivery or Razorpay.',
            ),
            _buildContentItem(
              'Data Security',
              '1. Your personal data is secure with industry-standard encryption.\n2. We use Firebase Cloud Firestore to store your data safely.',
            ),
            _buildContentItem(
              'Need Help or Have Feedback?',
              '1. If you encounter any issues or have suggestions for improvement, contact our support team through the app.',
            ),
            SizedBox(height: 16),
            Text(
              'Enjoy Shopping with Brown Cart User!\nThank you for using Brown Cart User!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContentItem(String title, String content) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 16),
        Text(
          title,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
        SizedBox(height: 8),
        Text(content),
      ],
    );
  }
}
