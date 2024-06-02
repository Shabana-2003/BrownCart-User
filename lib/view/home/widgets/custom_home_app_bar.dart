import 'package:browncart_user/view/menu/menu_page.dart';
import 'package:flutter/material.dart';

class CustomHomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final Color backgroundColor;

  const CustomHomeAppBar(
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
              icon: const Icon(Icons.menu),
              onPressed: () {
                 Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) =>const MenuPage()),
                );
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
                  icon: Icon(Icons.search_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, '/search');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: IconButton(
                  icon: Icon(Icons.person_outline_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, '/profile');
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: IconButton(
                  icon: Icon(Icons.shopping_cart_outlined),
                  onPressed: () {
                    Navigator.pushNamed(context, '/cart');
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
