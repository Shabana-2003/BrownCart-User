import 'package:browncart_user/view/bag/bag.dart';
import 'package:browncart_user/view/home/home_screen.dart';
import 'package:browncart_user/view/profile/profile_screen.dart';
import 'package:browncart_user/view/utils/colors/app_colors.dart';
import 'package:browncart_user/view/wishlist/wishlist_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  bool _isBottomNavBarVisible = true;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NotificationListener<ScrollNotification>(
        onNotification: (scrollNotification) {
          if (scrollNotification is ScrollUpdateNotification) {
            if (scrollNotification.metrics.axis == Axis.vertical) {
              setState(() {
                _isBottomNavBarVisible = false;
              });
            } else {
              setState(() {
                _isBottomNavBarVisible = true;
              });
            }
          }
          return true;
        },
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          children: [
            const HomeScreenn(),
            WishlistScreen(),
            const ProfileScreen(),
            BagScreen(
              getQuantity: (p0) {},
            ),
          ],
        ),
      ),
      bottomNavigationBar: Visibility(
        visible: _isBottomNavBarVisible,
        child: Container(
          color: const Color.fromARGB(255, 236, 236, 236),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: GNav(
              backgroundColor: const Color.fromARGB(255, 236, 236, 236),
              activeColor: const Color.fromARGB(255, 113, 53, 15),
              tabBackgroundColor: const Color.fromARGB(255, 216, 210, 203),
              gap: 15,
              padding: const EdgeInsets.all(6),
              selectedIndex: _selectedIndex,
              onTabChange: _onItemTapped,
              tabs: [
                GButton(
                  icon: Icons.home,
                  text: "Home",
                  textStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w200,
                    color: kBlack,
                    fontFamily: "Gruppo-Regular",
                  ),
                ),
                GButton(
                  icon: Icons.favorite_border_outlined,
                  text: "Favorite",
                  textStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w200,
                    color: kBlack,
                    fontFamily: "Gruppo-Regular",
                  ),
                ),
                GButton(
                  icon: Icons.person,
                  text: "Profile",
                  textStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w200,
                    color: kBlack,
                    fontFamily: "Gruppo-Regular",
                  ),
                ),
                GButton(
                  icon: Icons.shopping_cart,
                  text: "Cart",
                  textStyle: TextStyle(
                    fontSize: 19,
                    fontWeight: FontWeight.w200,
                    color: kBlack,
                    fontFamily: "Gruppo-Regular",
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
