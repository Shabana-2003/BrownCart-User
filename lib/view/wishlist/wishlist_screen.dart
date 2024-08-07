// import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
// import 'package:browncart_user/view/wishlist/widgets/wishlist_product_show.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';

// class WishlistScreen extends StatelessWidget {
//   WishlistScreen({
//     super.key,
//   });

//   final user = FirebaseAuth.instance.currentUser?.email;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const CommonText(
//           size: 26,
//           title: "Whishlist",
//           fontWeight: FontWeight.w100,
//         ),
//         centerTitle: true,
//       ),
//       body: WhishlistProductShow(),
//     );
//   }
// }
import 'package:browncart_user/controller/whishlist_bloc/whishlist_bloc.dart';
import 'package:browncart_user/controller/whishlist_bloc/whishlist_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:browncart_user/view/utils/constants/style/commen_text.dart';
import 'package:browncart_user/view/wishlist/widgets/wishlist_product_show.dart';
import 'package:firebase_auth/firebase_auth.dart';


class WishlistScreen extends StatelessWidget {
  WishlistScreen({super.key});

  final user = FirebaseAuth.instance.currentUser?.email;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => WishlistBloc(user!)..add(LoadWishlist()),
      child: Scaffold(
        appBar: AppBar(
          title: const CommonText(
            size: 26,
            title: "Whishlist",
            fontWeight: FontWeight.w100,
          ),
          centerTitle: true,
        ),
        body:const WhishlistProductShow(),
      ),
    );
  }
}
