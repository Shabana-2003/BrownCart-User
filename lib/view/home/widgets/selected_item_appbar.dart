import 'package:browncart_user/view/bag/bag.dart';
import 'package:browncart_user/view/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';

class SelectedItemAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Color backgroundColor;

  const SelectedItemAppBar(
      {super.key,
      this.backgroundColor = const Color.fromARGB(126, 170, 114, 72)})
      : preferredSize = const Size.fromHeight(60.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      titleSpacing: 0,
      backgroundColor: backgroundColor,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
            alignment: Alignment.bottomRight,
            child: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          const SizedBox(
            width: 15,
          ),
          const Align(
            alignment: Alignment.center,
            child: Text(
              'BROWNCART',
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w100,
                  color: Color.fromARGB(255, 0, 0, 0),
                  fontFamily: "Gruppo-Regular"),
            ),
          ),
          const SizedBox(width: 10),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: EdgeInsets.zero,
                child: IconButton(
                  icon: const Icon(Icons.favorite_border_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => WishlistScreen()),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BagScreen(
                          getQuantity: (p0) {},
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
