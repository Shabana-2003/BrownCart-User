import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/model/wishlist_model.dart';
import 'package:browncart_user/view/wishlist/widgets/whishlist_container.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class WhishlistProductShow extends StatelessWidget {
   WhishlistProductShow({super.key});
final user = FirebaseAuth.instance.currentUser!.email;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 7,left: 7),
      child: StreamBuilder<List<Product>>(
        stream: WishList.getWishlist(user!),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return const Center(
              child: Text('Something went wrong'),
            );
          } else
          if (snapshot.hasData) {
           final wishlist = snapshot.data!;
            if (wishlist.isEmpty) {
              return const Center(child: Text('Product list is empty'));
            } else {
              return GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 10,
                  childAspectRatio: 0.5, 
                ),
                itemCount: wishlist.length,
                itemBuilder: (context, index) {
                  return WhishlistContainer(product: wishlist[index]);
                },
              );
            }
          } else {
            return const Center(child: Text("Something went wrong"));
          }
        },
      ),
    );
  }
}
