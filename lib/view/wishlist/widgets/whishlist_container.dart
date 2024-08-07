import 'package:browncart_user/controller/whishlist_bloc/whishlist_bloc.dart';
import 'package:browncart_user/controller/whishlist_bloc/whishlist_event.dart';
import 'package:browncart_user/controller/whishlist_bloc/whishlist_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:browncart_user/model/product_model.dart';
import 'package:browncart_user/view/home/selected_item_screen.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/utils/texts/show_snack_bar.dart';
import '../../utils/constants/size/sized_box.dart';

class WhishlistContainer extends StatelessWidget {
  const WhishlistContainer({
    super.key,
    required this.product,
  });

  final Product product;

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
            color: kBrown,
            width: 0.1,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius:
                  const BorderRadius.vertical(top: Radius.circular(5)),
              child: Stack(
                children: [
                  Image.network(
                    product.images[0],
                    height: 300,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: BlocBuilder<WishlistBloc, WishlistState>(
                      builder: (context, state) {
                        if (state is WishlistLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        } else if (state is WishlistLoaded) {
                          final wishlist = state.wishlist;
                          final isWishlisted = wishlist.any(
                              (element) => element.productName == product.productName);
                          return GestureDetector(
                            onTap: () {
                              if (isWishlisted) {
                                BlocProvider.of<WishlistBloc>(context).add(
                                  RemoveFromWishlist(product),
                                );
                                showSnackBar(
                                  context,
                                  'Product removed from wishlist',
                                  kBrown,
                                );
                              } else {
                                BlocProvider.of<WishlistBloc>(context).add(
                                  AddToWishlist(product),
                                );
                                showSnackBar(
                                  context,
                                  'Product added to wishlist',
                                  kBrown,
                                );
                              }
                            },
                            child: Icon(
                              isWishlisted
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: isWishlisted ? kRed : kBlack,
                            ),
                          );
                        } else {
                          return CircularProgressIndicator(
                            color: kBrown,
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
