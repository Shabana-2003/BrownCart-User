// //result product card
// import 'package:browncart_user/main.dart';
// import 'package:browncart_user/model/product_model.dart';
// import 'package:browncart_user/model/wishlist_model.dart';
// import 'package:browncart_user/view/home/selected_item_screen.dart';
// import 'package:browncart_user/view/utils/colors/app_colors.dart';
// import 'package:browncart_user/view/utils/texts/show_snack_bar.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:shimmer/shimmer.dart';
// import '../../utils/constants/size/sized_box.dart';

// class ContainerWidget extends StatelessWidget {
//   ContainerWidget({
//     super.key,
//     required this.product,
//   });

//   final Product product;
//   final user = FirebaseAuth.instance.currentUser!.email;

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         Navigator.of(context).push(
//           MaterialPageRoute(
//             builder: (context) => SelectedItemScreen(product: product),
//           ),
//         );
//       },
//       child: Container(
//         height: 300,
//         width: 180,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(5),
//           border: Border.all(
//             color: Colors.brown,
//             width: 0.1,
//           ),
//         ),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             ClipRRect(
//               borderRadius:const BorderRadius.vertical(top: Radius.circular(5)),
//               child: Stack(
//                 children: [
//                   Image.network(
//                     product.images[0],
//                     height: 300,
//                     width: double.infinity,
//                     fit: BoxFit.cover,
//                   ),
//                   Positioned(
//                     right: 10,
//                     top: 10,
//                     child: StreamBuilder(
//                       stream: WishList.getWishlist(user!),
//                       builder: (context, snapshot) {
//                         if (snapshot.hasError) {
//                           return const Center(
//                             child: Text('Something went wrong'),
//                           );
//                         } else if (snapshot.hasData) {
//                           final wishlist = snapshot.data;
//                           return GestureDetector(
//                             onTap: () async {
//                               if (wishlist
//                                   .where((element) =>
//                                       element.productName == product.productName)
//                                   .isEmpty) {
//                                 await WishList.addToWishlist(user!, product);
//                                 showSnackBar(
//                                   // ignore: use_build_context_synchronously
//                                   context,
//                                   'Product added to wishlist',
//                                   const Color.fromARGB(255, 87, 45, 15),
//                                 );
//                               } else {
//                                 await WishList.deleteFromWishlist(user!, product);
//                                 showSnackBar(
//                                   // ignore: use_build_context_synchronously
//                                   context,
//                                   'Product Removed from wishlist',
//                                   const Color.fromARGB(255, 87, 45, 15),
//                                 );
//                               }
//                               navigatorKey.currentState!
//                                   .popUntil((route) => route.isFirst);
//                             },
//                             child: wishlist!
//                                     .where((element) =>
//                                         element.productName == product.productName)
//                                     .isEmpty
//                                 ? Icon(
//                                     Icons.favorite_border,
//                                     color: kBlack,
//                                   )
//                                 : Icon(
//                                     Icons.favorite,
//                                     color: kRed,
//                                   ),
//                           );
//                         }
//                       else {
//   return Center(
//     child: Shimmer.fromColors(
//       baseColor: Colors.grey[300]!,
//       highlightColor: Colors.grey[100]!,
//       child:const Icon(
//        Icons.favorite,
//         color: Colors.white,
//       ),
//     ),
//   );
// }

// ignore_for_file: use_build_context_synchronously

//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             kHeight10,
//             Padding(
//               padding: const EdgeInsets.only(left: 10),
//               child: Text(
//                 product.productName,
//                 maxLines: 1,
//                 style: const TextStyle(
//                   fontSize: 13,
//                   fontWeight: FontWeight.w600,
//                   fontFamily: "Gruppo-Regular",
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 10),
//                   child: Text(
//                     '₹ ${product.price}',
//                     textAlign: TextAlign.start,
//                     style:const TextStyle(
//                       fontSize: 13,
//                       fontWeight: FontWeight.w600,
//                       color: Color.fromARGB(255, 88, 58, 23),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
// result product card
import 'package:browncart_user/main.dart';
import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/model/wishlist_model.dart';
import 'package:browncart_user/view/home/selected_item_screen.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/texts/show_snack_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import '../../utils/constants/size/sized_box.dart';

class ContainerWidget extends StatelessWidget {
  ContainerWidget({
    super.key,
    required this.product,
  });

  final Product product;
  final user = FirebaseAuth.instance.currentUser!.email;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => SelectedItemScreen(product: product),
          ),
        );
      },
      child: Container(
        height: 300,
        width: 180,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.brown,
            width: 0.1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(top: Radius.circular(5)),
              child: Stack(
                children: [
                  Image.network(
                    product.images[0],
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                    loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        height: 300,
                        width: double.infinity,
                        color: Colors.grey[200],
                        child: Center(
                          child: Image.asset(
                            'img/placeholder.png', 
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    },
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: StreamBuilder(
                      stream: WishList.getWishlist(user!),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Center(
                            child: Text('Something went wrong'),
                          );
                        } else if (snapshot.hasData) {
                          final wishlist = snapshot.data;
                          return GestureDetector(
                            onTap: () async {
                              if (wishlist
                                  .where((element) =>
                                      element.productName == product.productName)
                                  .isEmpty) {
                                await WishList.addToWishlist(user!, product);
                                showSnackBar(
                                  context,
                                  'Product added to wishlist',
                                  const Color.fromARGB(255, 87, 45, 15),
                                );
                              } else {
                                await WishList.deleteFromWishlist(user!, product);
                                showSnackBar(
                                  context,
                                  'Product Removed from wishlist',
                                  const Color.fromARGB(255, 87, 45, 15),
                                );
                              }
                              navigatorKey.currentState!
                                  .popUntil((route) => route.isFirst);
                            },
                            child: wishlist!
                                    .where((element) =>
                                        element.productName == product.productName)
                                    .isEmpty
                                ? Icon(
                                    Icons.favorite_border,
                                    color: kBlack,
                                  )
                                : Icon(
                                    Icons.favorite,
                                    color: kRed,
                                  ),
                          );
                        } else {
                          return Center(
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey[300]!,
                              highlightColor: Colors.grey[100]!,
                              child: const Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
            kHeight10,
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                product.productName,
                maxLines: 1,
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  fontFamily: "Gruppo-Regular",
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    '₹ ${product.price}',
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 88, 58, 23),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
