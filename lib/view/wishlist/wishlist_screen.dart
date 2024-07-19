import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/wishlist/widgets/wishlist_product_show.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WishlistScreen extends StatelessWidget {
  WishlistScreen({
    super.key,
  });

  final user = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const CommonText(
          size: 26,
          title: "Whishlist",
          fontWeight: FontWeight.w100,
        ),
        centerTitle: true,
      ),
      body: WhishlistProductShow(),
    );
  }
}
